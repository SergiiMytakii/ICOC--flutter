import {createHash} from "crypto";
import {Request, Response} from "express";
import {setGlobalOptions} from "firebase-functions";
import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";

setGlobalOptions({maxInstances: 10, region: "europe-central2"});
admin.initializeApp();

const allowedBaseTopics = new Set([
  "songbook",
  "insights",
  "biblestudy",
  "video",
  "general",
]);
const allowedLangs = new Set([
  "en", "uk", "ru",
  "de", "fr", "it",
  "lt", "lv", "et",
  "no", "pl", "ro",
  "sv", "bg",
]);

const envAllowed = (process.env.ALLOWED_ADMIN_EMAILS || "")
  .split(",")
  .map((e) => e.trim())
  .filter((e) => e.length > 0);
const allowedAdminEmails: string[] =
  envAllowed.length > 0 ? envAllowed : ["serjmitaki@gmail.com"];

const allowOrigin = process.env.CORS_ALLOW_ORIGIN || "*";
const insightsCommentCooldownMs = 20 * 1000;
const insightsCollection = "Insights";
const insightsDevicesCollection = "InsightsDevices";

/**
 * Applies CORS headers and handles preflight.
 * @param {Request} req request
 * @param {Response} res response
 * @return {boolean} true if preflight handled
 */
function applyCors(req: Request, res: Response): boolean {
  res.set("Access-Control-Allow-Origin", allowOrigin);
  res.set("Access-Control-Allow-Methods", "GET,POST,OPTIONS");
  res.set(
    "Access-Control-Allow-Headers",
    "Content-Type, Authorization",
  );
  res.set("Access-Control-Max-Age", "3600");
  if (req.method === "OPTIONS") {
    res.status(204).end();
    return true;
  }
  return false;
}

/**
 * Checks whether an email belongs to allowed admin list.
 * @param {string|null|undefined} email admin email to check
 * @return {boolean} true if allowed
 */
function isAllowed(email?: string | null): boolean {
  if (!email) return false;
  return allowedAdminEmails.includes(email);
}

/**
 * Verifies Firebase Auth ID token from Authorization header.
 * @param {string|undefined} authHeader Authorization header
 * @return {Promise<object|null>} decoded token or null
 */
async function verifyIdToken(authHeader?: string) {
  if (!authHeader) return null;
  const parts = authHeader.split(" ");
  if (parts.length !== 2 || parts[0] !== "Bearer") return null;
  const idToken = parts[1];
  try {
    return await admin.auth().verifyIdToken(idToken);
  } catch {
    return null;
  }
}

/**
 * Normalizes an unknown value into a trimmed string.
 * @param {unknown} value raw input
 * @return {string} trimmed string or empty string
 */
function normalizedString(value: unknown): string {
  return typeof value === "string" ? value.trim() : "";
}

/**
 * Creates a stable SHA-256 hash for a device identifier.
 * @param {string} deviceId raw device id
 * @return {string} hex digest
 */
function hashDeviceId(deviceId: string): string {
  return createHash("sha256").update(deviceId).digest("hex");
}

/**
 * Checks whether an insight document is published.
 * @param {admin.firestore.DocumentData|undefined} data insight document data
 * @return {boolean} true when the document is published or missing status
 */
function isPublishedInsight(data?: admin.firestore.DocumentData): boolean {
  return !data || !("status" in data) || data.status === "published";
}

/** Sends a notification to a single FCM topic */
export const sendTopic = onRequest(
  {cors: true, region: "europe-central2"},
  async (req, res) => {
    if (applyCors(req, res)) return;
    if (req.method !== "POST") {
      res.status(405).end();
      return;
    }
    const decoded = await verifyIdToken(
      req.headers.authorization as string,
    );
    if (!decoded || !isAllowed(decoded.email || null)) {
      res.status(403).json({error: "unauthorized"});
      return;
    }
    const {topic, title, body, data} = req.body ?? {};
    if (!topic || !title || !body) {
      res.status(400).json({error: "missing_fields"});
      return;
    }
    const message: admin.messaging.Message = {
      topic,
      notification: {title, body},
      data: data ?? {},
      android: {priority: "high"},
      apns: {headers: {"apns-priority": "10"}, payload: {aps: {}}},
    };
    try {
      const id = await admin.messaging().send(message);
      res.json({messageId: id, topic});
    } catch (e: unknown) {
      res.status(400).json({error: String(e)});
    }
  },
);

/** Sends a notification to multiple FCM topics */
export const sendTopics = onRequest(
  {cors: true, region: "europe-central2"},
  async (req, res) => {
    if (applyCors(req, res)) return;
    if (req.method !== "POST") {
      res.status(405).end();
      return;
    }
    const decoded = await verifyIdToken(
      req.headers.authorization as string,
    );
    if (!decoded || !isAllowed(decoded.email || null)) {
      res.status(403).json({error: "unauthorized"});
      return;
    }
    const {topics, title, body, data} = req.body ?? {};
    if (!Array.isArray(topics) || topics.length === 0 || !title || !body) {
      res.status(400).json({error: "missing_fields"});
      return;
    }
    const results: Array<{
      topic: string; messageId?: string; error?: string;
    }> = [];
    for (const t of topics) {
      const message: admin.messaging.Message = {
        topic: t,
        notification: {title, body},
        data: data ?? {},
        android: {priority: "high"},
        apns: {headers: {"apns-priority": "10"}, payload: {aps: {}}},
      };
      try {
        const id = await admin.messaging().send(message);
        results.push({topic: t, messageId: id});
      } catch (e: unknown) {
        results.push({topic: t, error: String(e)});
      }
    }
    res.json({results});
  },
);

/** Sends to composite topic `${baseTopic}-lang-${lang}` */
export const sendTopicByLang = onRequest(
  {cors: true, region: "europe-central2"},
  async (req, res) => {
    if (applyCors(req, res)) return;
    if (req.method !== "POST") {
      res.status(405).end();
      return;
    }
    const decoded = await verifyIdToken(
      req.headers.authorization as string,
    );
    if (!decoded || !isAllowed(decoded.email || null)) {
      res.status(403).json({error: "unauthorized"});
      return;
    }
    const {baseTopic, lang, title, body, data} = req.body ?? {};
    if (!baseTopic || !lang || !title || !body) {
      res.status(400).json({error: "missing_fields"});
      return;
    }
    if (!allowedBaseTopics.has(String(baseTopic))) {
      res.status(400).json({error: "invalid_base_topic"});
      return;
    }
    if (!allowedLangs.has(String(lang))) {
      res.status(400).json({error: "invalid_lang"});
      return;
    }
    const topic = `${baseTopic}-lang-${lang}`;
    const message: admin.messaging.Message = {
      topic,
      notification: {title, body},
      data: data ?? {},
      android: {priority: "high"},
      apns: {headers: {"apns-priority": "10"}, payload: {aps: {}}},
    };
    try {
      const id = await admin.messaging().send(message);
      res.json({messageId: id, topic});
    } catch (e: unknown) {
      res.status(400).json({error: String(e)});
    }
  },
);

/** Sends to multiple composite `${baseTopic}-lang-<code>` topics in one call */
export const sendTopicForLangs = onRequest(
  {cors: true, region: "europe-central2"},
  async (req, res) => {
    if (applyCors(req, res)) return;
    if (req.method !== "POST") {
      res.status(405).end();
      return;
    }
    const decoded = await verifyIdToken(
      req.headers.authorization as string,
    );
    if (!decoded || !isAllowed(decoded.email || null)) {
      res.status(403).json({error: "unauthorized"});
      return;
    }
    const {baseTopic, langs, title, body, data} = req.body ?? {};
    const invalid = !baseTopic || !Array.isArray(langs) || langs.length === 0 ||
      !title || !body;
    if (invalid) {
      res.status(400).json({error: "missing_fields"});
      return;
    }
    if (!allowedBaseTopics.has(String(baseTopic))) {
      res.status(400).json({error: "invalid_base_topic"});
      return;
    }
    const results: Array<{
      topic: string; messageId?: string; error?: string;
    }> = [];
    for (const l of langs) {
      if (!allowedLangs.has(String(l))) {
        results.push({
          topic: `${baseTopic}-lang-${String(l)}`,
          error: "invalid_lang",
        });
        continue;
      }
      const t = `${baseTopic}-lang-${String(l)}`;
      const message: admin.messaging.Message = {
        topic: t,
        notification: {title, body},
        data: data ?? {},
        android: {priority: "high"},
        apns: {headers: {"apns-priority": "10"}, payload: {aps: {}}},
      };
      try {
        const id = await admin.messaging().send(message);
        results.push({topic: t, messageId: id});
      } catch (e: unknown) {
        results.push({topic: t, error: String(e)});
      }
    }
    res.json({results});
  },
);

/** Sends a notification to specific device tokens */
export const sendTokens = onRequest(
  {cors: true, region: "europe-central2"},
  async (req, res) => {
    if (applyCors(req, res)) return;
    if (req.method !== "POST") {
      res.status(405).end();
      return;
    }
    const decoded = await verifyIdToken(
      req.headers.authorization as string,
    );
    if (!decoded || !isAllowed(decoded.email || null)) {
      res.status(403).json({error: "unauthorized"});
      return;
    }
    const {tokens, title, body, data} = req.body ?? {};
    if (!Array.isArray(tokens) || tokens.length === 0 || !title || !body) {
      res.status(400).json({error: "missing_fields"});
      return;
    }
    const response = await admin.messaging().sendEachForMulticast({
      tokens,
      notification: {title, body},
      data: data ?? {},
      android: {priority: "high"},
      apns: {headers: {"apns-priority": "10"}, payload: {aps: {}}},
    });
    const results = response.responses.map((r, i) => ({
      token: tokens[i],
      messageId: r.messageId,
      error: r.error ? String(r.error) : undefined,
    }));
    res.json({
      successCount: response.successCount,
      failureCount: response.failureCount,
      results,
    });
  },
);

export const toggleInsightLike = onRequest(
  {cors: true, region: "europe-central2"},
  async (req, res) => {
    if (applyCors(req, res)) return;
    if (req.method !== "POST") {
      res.status(405).end();
      return;
    }

    const postId = normalizedString(req.body?.postId);
    const deviceId = normalizedString(req.body?.deviceId);
    if (!postId || !deviceId) {
      res.status(400).json({error: "missing_fields"});
      return;
    }

    const db = admin.firestore();
    const postRef = db.collection(insightsCollection).doc(postId);
    const deviceHash = hashDeviceId(deviceId);
    const likeRef = postRef.collection("likes").doc(deviceHash);

    try {
      const result = await db.runTransaction(async (tx) => {
        const postSnap = await tx.get(postRef);
        if (!postSnap.exists) {
          throw new Error("not_found");
        }
        const postData = postSnap.data();
        if (!isPublishedInsight(postData)) {
          throw new Error("not_found");
        }

        const likeSnap = await tx.get(likeRef);
        const now = admin.firestore.Timestamp.now();
        let likes = Number(postData?.likes ?? 0);
        let liked = false;

        if (likeSnap.exists) {
          tx.delete(likeRef);
          likes = Math.max(0, likes - 1);
          liked = false;
        } else {
          tx.set(likeRef, {
            deviceHash,
            postId,
            createdAt: now,
            updatedAt: now,
          });
          likes += 1;
          liked = true;
        }

        tx.update(postRef, {
          likes,
          updatedAt: now,
        });

        return {liked, likes};
      });

      res.json(result);
    } catch (e: unknown) {
      const message = String(e);
      if (message.includes("not_found")) {
        res.status(404).json({error: "not_found"});
        return;
      }
      res.status(400).json({error: message});
    }
  },
);

export const getInsightLikedPosts = onRequest(
  {cors: true, region: "europe-central2"},
  async (req, res) => {
    if (applyCors(req, res)) return;
    if (req.method !== "POST") {
      res.status(405).end();
      return;
    }

    const deviceId = normalizedString(req.body?.deviceId);
    if (!deviceId) {
      res.status(400).json({error: "missing_fields"});
      return;
    }

    const deviceHash = hashDeviceId(deviceId);
    const db = admin.firestore();

    try {
      const likesQuery = await db
        .collectionGroup("likes")
        .where("deviceHash", "==", deviceHash)
        .get();

      const postIds = likesQuery.docs
        .map((doc) => doc.data()?.postId || doc.ref.parent.parent?.id)
        .filter(Boolean)
        .map((id) => String(id));

      res.json({postIds});
    } catch (e: unknown) {
      res.status(400).json({error: String(e)});
    }
  },
);

export const createInsightComment = onRequest(
  {cors: true, region: "europe-central2"},
  async (req, res) => {
    if (applyCors(req, res)) return;
    if (req.method !== "POST") {
      res.status(405).end();
      return;
    }

    const postId = normalizedString(req.body?.postId);
    const deviceId = normalizedString(req.body?.deviceId);
    const displayName = normalizedString(req.body?.displayName);
    const text = normalizedString(req.body?.text);
    if (!postId || !deviceId || !displayName || !text) {
      res.status(400).json({error: "missing_fields"});
      return;
    }
    if (displayName.length > 60 || text.length > 800) {
      res.status(400).json({error: "invalid_length"});
      return;
    }

    const db = admin.firestore();
    const postRef = db.collection(insightsCollection).doc(postId);
    const deviceHash = hashDeviceId(deviceId);
    const deviceRef = db.collection(insightsDevicesCollection).doc(deviceHash);
    const commentRef = postRef.collection("comments").doc();

    try {
      const result = await db.runTransaction(async (tx) => {
        const postSnap = await tx.get(postRef);
        if (!postSnap.exists) {
          throw new Error("not_found");
        }
        const postData = postSnap.data();
        if (!isPublishedInsight(postData)) {
          throw new Error("not_found");
        }
        if (postData?.allowComments === false) {
          throw new Error("comments_disabled");
        }

        const deviceSnap = await tx.get(deviceRef);
        const now = admin.firestore.Timestamp.now();
        const lastCommentAt = deviceSnap.data()?.lastCommentAt;
        if (lastCommentAt instanceof admin.firestore.Timestamp) {
          const elapsedMs = now.toMillis() - lastCommentAt.toMillis();
          if (elapsedMs < insightsCommentCooldownMs) {
            throw new Error("rate_limited");
          }
        }

        const commentsCount = Number(postData?.commentsCount ?? 0) + 1;
        const commentPayload = {
          id: commentRef.id,
          postId,
          displayName,
          text,
          status: "published",
          deviceHash,
          createdAt: now,
          updatedAt: now,
        };

        tx.set(commentRef, commentPayload);
        tx.set(deviceRef, {
          lastCommentAt: now,
          lastSeenAt: now,
          lastUsedDisplayName: displayName,
        }, {merge: true});
        tx.update(postRef, {
          commentsCount,
          updatedAt: now,
        });

        return {
          comment: {
            ...commentPayload,
            createdAt: now.toMillis(),
            updatedAt: now.toMillis(),
          },
          commentsCount,
        };
      });

      res.json(result);
    } catch (e: unknown) {
      const message = String(e);
      if (message.includes("not_found")) {
        res.status(404).json({error: "not_found"});
        return;
      }
      if (message.includes("rate_limited")) {
        res.status(429).json({error: "rate_limited"});
        return;
      }
      if (message.includes("comments_disabled")) {
        res.status(400).json({error: "comments_disabled"});
        return;
      }
      res.status(400).json({error: message});
    }
  },
);

export const incrementInsightShare = onRequest(
  {cors: true, region: "europe-central2"},
  async (req, res) => {
    if (applyCors(req, res)) return;
    if (req.method !== "POST") {
      res.status(405).end();
      return;
    }

    const postId = normalizedString(req.body?.postId);
    const deviceId = normalizedString(req.body?.deviceId);
    if (!postId || !deviceId) {
      res.status(400).json({error: "missing_fields"});
      return;
    }

    const db = admin.firestore();
    const postRef = db.collection(insightsCollection).doc(postId);
    const deviceHash = hashDeviceId(deviceId);
    const deviceRef = db.collection(insightsDevicesCollection).doc(deviceHash);

    try {
      const result = await db.runTransaction(async (tx) => {
        const postSnap = await tx.get(postRef);
        if (!postSnap.exists) {
          throw new Error("not_found");
        }
        const postData = postSnap.data();
        if (!isPublishedInsight(postData)) {
          throw new Error("not_found");
        }

        const now = admin.firestore.Timestamp.now();
        const shares = Number(postData?.shares ?? 0) + 1;

        tx.update(postRef, {
          shares,
          updatedAt: now,
        });
        tx.set(deviceRef, {
          lastSeenAt: now,
        }, {merge: true});

        return {shares};
      });

      res.json(result);
    } catch (e: unknown) {
      const message = String(e);
      if (message.includes("not_found")) {
        res.status(404).json({error: "not_found"});
        return;
      }
      res.status(400).json({error: message});
    }
  },
);
