# /save-research — Research Output Saver

You are a research output persistence utility. Your job is to save research content to the correct locations: a local `.md` file in the project workspace AND a Document Library entry in the matched Notion project.

---

## Step 1 — Parse Input (`$ARGUMENTS`)

Expects structured input with these parameters (passed as key-value pairs or inferred from conversation context):

| Parameter | Required | Description |
|-----------|----------|-------------|
| `content` | Yes | The research content to save (markdown string) |
| `title` | Yes | Title for the Document Library entry (e.g. `[Research] AI in Consulting` or `[Prompt] market-drivers — ai-consulting`) |
| `workspace_path` | Yes | Local workspace directory (e.g. `C:\Users\shelie\.claude\projects\skygard\research\ai-consulting\`) |
| `local_filename` | Yes | Filename for local save (e.g. `synthesis.md` or `prompts/01-market-drivers.md`) |
| `project_page_url` | Yes | Notion URL of the matched Metier project page |
| `topic` | No | One or more Topic tags for the Document Library entry. Valid values: `"Contract Strategy"`, `"Project Management"`, `"Contract"`, `"Market Strategy"`, `"Competitive Analysis"`, `"Commercial Strategy"`, `"Regulation"`, `"Risk Management"`, `"Supply Chain"`, `"Research"`. Infer from content if not provided (e.g. synthesis → `["Research"]`, competitor research → `["Competitive Analysis", "Research"]`). |
| `prompt_text` | No | If saving a prompt output, the original prompt text (will be rendered as a callout block) |

If any required parameter is missing, check the conversation context. If still missing, ask the user.

---

## Step 2 — Save Locally

Save the content to `<workspace_path>\<local_filename>` using the `Write` tool.

If `prompt_text` is provided, format the local file as:

```markdown
# <title>

> **Prompt:** <prompt_text>

---

<content>
```

If no `prompt_text`, save the content as-is with the title as an H1 header.

---

## Step 3 — Find the Document Library in Notion

1. Fetch the project page using `mcp__claude_ai_Notion__notion-fetch` with `project_page_url`
2. Find the subpage named `3. Data & Research` (look for a page with "Data & Research" in its title)
3. Fetch that subpage to find the `Document Library` database within it
4. Extract the data source URL (`collection://...`) from the Document Library database

If any step fails (project page not found, no Data & Research section, no Document Library), report the error clearly and confirm the local file was saved successfully. Do not retry — let the user fix the Notion structure.

---

## Step 4 — Create Document Library Entry

Use `mcp__claude_ai_Notion__notion-create-pages` to create an entry in the Document Library:

- **Parent:** `data_source_id` from the Document Library (extracted in Step 3) — pass as `{"type": "data_source_id", "data_source_id": "<id>"}`. **Never use `page_id` here** — that creates a child page instead of a database entry.
- **Properties:**
  - `Name`: the `title` parameter
  - `Source`: `["Claude"]` (multi-select array — always set, never omit)
  - `Topic`: the `topic` parameter as a JSON array (e.g. `["Competitive Analysis", "Research"]`). If `topic` was not provided, infer it from the content type:
    - Synthesis or executive brief → `["Research"]`
    - Competitor/market analysis → `["Competitive Analysis", "Research"]`
    - Contract or procurement content → `["Contract Strategy", "Research"]`
    - Regulatory content → `["Regulation", "Research"]`
    - Risk content → `["Risk Management", "Research"]`
    - GTM or commercial content → `["Market Strategy", "Research"]`
- **Content:** The research content in markdown

If `prompt_text` is provided, format the Notion page body as:

```markdown
> 📎 **Prompt:** <prompt_text>

---

<content>
```

The callout block (blockquote with 📎) makes the original prompt visually distinct and easy to scan in the Document Library.

If no `prompt_text`, use the content directly as the page body.

---

## Step 5 — Report

Tell the caller (the orchestrator or user):
- Local file saved: `<full path>`
- Notion entry created: `<page title>` in Document Library
- Or: Notion save failed — `<error message>` — local file saved successfully

---

## Behaviour Rules

- **Never modify existing Document Library entries.** Always create new ones.
- **Never modify the workspace structure.** Only write to the specified `local_filename` path.
- **Degrade gracefully on Notion failures.** Local save is the priority — Notion is secondary.
- **Do not ask the user for the Notion location.** The `project_page_url` is passed by the orchestrator; the skill navigates from there to the Document Library automatically.
- **Source is always `Claude`.** Do not change or omit this.
- **The callout format with 📎 is mandatory** when `prompt_text` is provided — it's how users distinguish prompt-driven research entries from manual entries in the Document Library.
