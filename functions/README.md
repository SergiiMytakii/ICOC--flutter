# Cloud Functions for Notifications

This folder contains Firebase Cloud Functions used to send push notifications to the mobile app. It supports base topics and per-topic, per-language composite topics.

## Endpoints

- `sendTopic`
  - Sends to a single FCM topic.
  - Body: `{ topic, title, body, data? }`

- `sendTopics`
  - Sends to multiple FCM topics.
  - Body: `{ topics: string[], title, body, data? }`

- `sendTokens`
  - Sends to specific device tokens.
  - Body: `{ tokens: string[], title, body, data? }`

- `sendTopicByLang`
  - Sends to a composite topic that combines feature and language.
  - Body: `{ baseTopic: 'songbook'|'insights'|'biblestudy'|'general', lang, title, body, data? }`
  - Topic format: `${baseTopic}-lang-${lang}` (e.g., `insights-lang-uk`).

- `sendTopicForLangs`
  - Sends to multiple composite topics for a feature.
  - Body: `{ baseTopic: 'songbook'|'insights'|'biblestudy'|'general', langs: string[], title, body, data? }`

## Topic Naming

- Base topics: `songbook`, `insights`, `biblestudy`, `general`.
- Composite topics: `${baseTopic}-lang-${lang}`.
- Supported languages: `en, uk, ru, de, fr, it, lt, lv, et, no, pl, ro, sv, bg`.

## Auth and CORS

- All endpoints require Firebase Auth ID token via `Authorization: Bearer <ID_TOKEN>`.
- Allowed admin emails are enforced in code:
  - `ALLOWED_ADMIN_EMAILS` environment variable (comma-separated).
  - Default allowed: `serjmitaki@gmail.com` if env not set.
- CORS:
  - `CORS_ALLOW_ORIGIN` environment variable (default `*`).

## Region and Runtime

- Global options set to `region: europe-central2`.
- Node runtime: `22` (see `functions/package.json`).

## Build, Lint, Serve, Deploy

From the project root, using npm scripts defined in `functions/package.json`:

- Build TypeScript:
  - `npm --prefix functions run build`

- Lint TypeScript:
  - `npm --prefix functions run lint`

- Serve locally (emulators):
  - `npm --prefix functions run serve`
  - Requires Firebase CLI configured for the project.

- Deploy to Firebase:
  - `npm --prefix functions run deploy`
  - Alternatively: `firebase deploy --only functions`

- View logs:
  - `npm --prefix functions run logs`

## Example Requests

- Send to a single composite topic (Insights in Ukrainian):

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ID_TOKEN" \
  https://<REGION>-<PROJECT>.cloudfunctions.net/sendTopicByLang \
  -d '{
    "baseTopic": "insights",
    "lang": "uk",
    "title": "New Insights",
    "body": "A new article in Ukrainian",
    "data": {"link": "/insights", "topic": "insights", "lang": "uk"}
  }'
```

- Send to multiple composite topics (Songbook in EN and RU):

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ID_TOKEN" \
  https://<REGION>-<PROJECT>.cloudfunctions.net/sendTopicForLangs \
  -d '{
    "baseTopic": "songbook",
    "langs": ["en", "ru"],
    "title": "New Song",
    "body": "Check out the new song",
    "data": {"link": "/songbook", "topic": "songbook"}
  }'
```

- Send to a base topic (language-agnostic announcement):

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ID_TOKEN" \
  https://<REGION>-<PROJECT>.cloudfunctions.net/sendTopic \
  -d '{
    "topic": "insights",
    "title": "Announcement",
    "body": "General announcement for Insights",
    "data": {"link": "/insights"}
  }'
```

- Send to specific device tokens:

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ID_TOKEN" \
  https://<REGION>-<PROJECT>.cloudfunctions.net/sendTokens \
  -d '{
    "tokens": ["token1", "token2"],
    "title": "Direct",
    "body": "Direct message",
    "data": {"link": "/notifications"}
  }'
```

## Admin Panel Integration Notes

- For content that has language variants, publish to the corresponding composite topic.
- Include `data.link` with a route (e.g., `/insights`) so the app navigates and refreshes the feature’s content.
- Use `sendTopicForLangs` to broadcast the same content to multiple languages for one feature.

## Troubleshooting

- Unauthorized:
  - Ensure the caller is signed in to Firebase Auth and the email is included in `ALLOWED_ADMIN_EMAILS`.
- Invalid topic/lang:
  - The function validates `baseTopic` and `lang` against internal allow-lists.
- Emulator use:
  - Start emulators with `npm --prefix functions run serve` and point your requests to the emulator host.
