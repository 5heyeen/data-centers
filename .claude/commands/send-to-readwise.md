# `/send-to-readwise` — Send a Markdown File to Readwise Reader

> You are `/send-to-readwise`. If context has been compacted and you are reading this, you may have been invoked by `/researcher-agent` Stage 6e or directly by the user. Proceed with the steps below using whichever arguments are available; if `file_path` is genuinely unavailable, ask for it once rather than guessing.

You are a utility that uploads a local markdown file to **Readwise Reader** (https://read.readwise.io/home) so the user can read, highlight, and annotate it inside Reader.

Reader's Save Document API accepts **HTML**, not markdown, so this skill converts the markdown to HTML before POSTing.

---

## Step 1 — Parse Input (`$ARGUMENTS`)

Expects one required argument plus optional flags. Accept any of these argument shapes:

- **Positional single path**: `/send-to-readwise /abs/path/to/file.md`
- **Key-value pairs** (space- or newline-separated, orchestrator-friendly):
  ```
  file_path: /abs/path/to/file.md
  title: [Research] AI in Consulting
  tags: research,ai-consulting
  location: new
  ```
- **Mixed**: positional path first, followed by key-value overrides

When called by another skill (e.g. `/researcher-agent` Stage 6e), expect the key-value form. When called by a human, either form may appear. Parse whichever is present; do not require a specific shape.

| Parameter | Required | Description |
|-----------|----------|-------------|
| `file_path` | Yes | Absolute or repo-relative path to the `.md` file to send |
| `title` | No | Title shown in Reader. Defaults to the first `#` H1 in the file, else the filename stem |
| `author` | No | Author shown in Reader. Defaults to `Claude` |
| `url` | No | Source URL to associate. Defaults to a synthetic `https://claude.local/<slug>-<timestamp>` so Reader accepts the upload |
| `summary` | No | Short summary string |
| `tags` | No | Comma-separated list, e.g. `research,ai-consulting` |
| `location` | No | One of `new`, `later`, `archive`, `feed`. Defaults to `new` |
| `category` | No | One of `article`, `email`, `rss`, `highlight`, `note`, `pdf`, `epub`, `tweet`, `video`. Defaults to `article` |
| `published_date` | No | ISO 8601 date (e.g. `2026-04-17`) |

If `file_path` is missing, ask the user for it. Do not guess.

---

## Step 2 — Read the Markdown

Use the `Read` tool to load the file contents.

Derive a default `title` if none was supplied:
1. First `# ` heading in the file (strip the `# ` prefix), else
2. The filename without extension, with dashes/underscores replaced by spaces and title-cased.

---

## Step 3 — Convert Markdown to HTML

Reader's API takes HTML in the `html` field. Convert the markdown to HTML **before** sending.

Prefer a local converter in this order:
1. `python3 -c "import markdown, sys; print(markdown.markdown(sys.stdin.read(), extensions=['extra','sane_lists','tables','fenced_code']))"` piped from the markdown file
2. `pandoc -f markdown -t html <file>` if `python3 -m markdown` is unavailable
3. `npx -y marked <file>` as a last resort

Run the chosen command via `Bash`, capturing stdout. If all three fail, stop and tell the user which converter to install. Do **not** fall back to sending raw markdown as HTML.

Wrap the converted HTML in a minimal document so Reader renders spacing reliably:

```html
<article>
  <h1>{{title}}</h1>
  <!-- converted HTML here -->
</article>
```

**Deduplicate the H1.** Reader shows the API `title` field as the document title and also renders any `<h1>` inside the body, so two H1s look duplicated. Apply this rule when wrapping:

- If the markdown's first non-empty line is an H1 (`# ...`), **drop that H1 from the converted HTML before wrapping** — the outer `<h1>{{title}}</h1>` replaces it. This is true whether or not the existing H1 text matches `title`; the caller's `title` wins.
- If the markdown does not start with an H1, just prepend `<h1>{{title}}</h1>` before the converted HTML.

Do the H1 strip at the HTML level by removing the first `<h1>...</h1>` element if it appears before any other content — not on the markdown source — so formatting inside the heading is preserved if it needs to be reused.

---

## Step 4 — Resolve the Auth Token

Readwise Reader requires a token. Look for it in this order:

1. `$READWISE_TOKEN` environment variable (`echo "${READWISE_TOKEN}"` via `Bash`)
2. `~/.config/readwise/token` file contents
3. Ask the user: _"Paste your Readwise token (get one at https://readwise.io/access_token). I will not store it."_

If the token is empty, stop. Never hardcode a token, never commit it to the repo, and never echo it in the final response.

---

## Step 5 — POST to the Reader API

Send a single `POST` to `https://readwise.io/api/v3/save/` with:

- Header: `Authorization: Token <READWISE_TOKEN>`
- Header: `Content-Type: application/json`
- JSON body:

```json
{
  "url": "<url>",
  "html": "<converted html>",
  "should_clean_html": false,
  "title": "<title>",
  "author": "<author>",
  "summary": "<summary or omitted>",
  "published_date": "<published_date or omitted>",
  "location": "<location>",
  "category": "<category>",
  "saved_using": "claude-code",
  "tags": ["tag1", "tag2"]
}
```

Use `curl` via `Bash`, writing the JSON body to a temp file with `Write` to avoid shell-escaping the HTML. Example:

```bash
curl -sS -o /tmp/readwise-response.json -w "%{http_code}" \
  -X POST https://readwise.io/api/v3/save/ \
  -H "Authorization: Token ${READWISE_TOKEN}" \
  -H "Content-Type: application/json" \
  --data-binary @/tmp/readwise-payload.json
```

Delete `/tmp/readwise-payload.json` after the call so the token-adjacent payload isn't left on disk.

Rate limit: **50 requests/minute** per token. If the response is `429`, wait the number of seconds in the `Retry-After` header (default 60) and retry once.

---

## Step 6 — Interpret the Response

| Status | Meaning | Action |
|--------|---------|--------|
| `201` | Document created | Report success + the `url` field from the response (Reader's web link) |
| `200` | Document already exists (same URL) | Report "already in Reader" + include the existing `id`/`url` |
| `400` | Bad request | Show the response body; most often a missing `url` or invalid `location`/`category` |
| `401` | Bad token | Tell user to regenerate at https://readwise.io/access_token |
| `429` | Rate limited | Retry once after `Retry-After` seconds, then fail cleanly |
| other | Unexpected | Surface status code + body verbatim |

---

## Step 7 — Report

Return one short block:

```
Sent to Readwise Reader
  Title:    <title>
  Location: <location>
  Reader:   <response.url or https://read.readwise.io/home>
```

Never print the token. Never print the full HTML payload back to the user — it's already in the file they sent.

---

## Behaviour Rules

- **Convert first, send once.** No retries on 2xx. Retry only on transient 429/5xx, max one retry.
- **One file per invocation.** If the user passes a directory or glob, ask them to pick a single file or call the skill repeatedly.
- **Do not modify the source markdown file.** Read only.
- **Do not write the converted HTML to the repo.** Keep it in `/tmp` and delete after the POST.
- **Respect the user's `location`/`category` overrides literally.** Don't "correct" them.
- **Tokens are secrets.** Never log, commit, or include them in tool-call arguments that appear in the transcript more than necessary.
