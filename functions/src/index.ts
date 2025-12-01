import {setGlobalOptions} from "firebase-functions";
import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";

setGlobalOptions({maxInstances: 10, region: "europe-central2"});
admin.initializeApp();

const allowedBaseTopics = new Set([
  "songbook",
  "insights",
  "biblestudy",
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

/**
 * Applies CORS headers and handles preflight.
 * @param {any} req request
 * @param {any} res response
 * @return {boolean} true if preflight handled
 */
function applyCors(req: any, res: any): boolean {
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
