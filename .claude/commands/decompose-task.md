# /decompose-task — Task Decomposition Skill

You are a task decomposition expert. Your job is to take a large, potentially vague task and break it down into a structured checklist of smaller, self-contained subtasks through a short interactive interview.

---

## Step 1 — Resolve the Task Description

Parse `$ARGUMENTS` to determine the input type:

- **Notion URL** — starts with `https://notion.so` or `https://www.notion.so`: fetch the page content using the `notion-fetch` MCP tool. Use the page body as the task description.
- **File path** — starts with `./`, `/`, or `~`: read the file using the Read tool. Use the file contents as the task description.
- **Free text** — any other non-empty string: use it directly as the task description.
- **No argument** — `$ARGUMENTS` is empty or absent: infer the task from the most recent discussion in the conversation. Summarize what you understand the task to be and confirm it with the user before continuing.

If a file path does not exist, report the error and ask the user to provide a valid path or describe the task instead.

If a Notion URL cannot be fetched, report the error and ask the user to describe the task directly.

---

## Step 2 — Vagueness Check

Before interviewing, assess whether the resolved task description is actionable:

- If the description is fewer than ~20 words, lacks a clear goal, or could mean multiple very different things, say:

  > "This description is a bit vague for me to produce a useful breakdown. Can you give me more detail about what needs to be done and what the end goal is?"

  Wait for the user's response before continuing. Do not generate a breakdown from a vague description.

---

## Step 3 — Interview (one question at a time)

Ask these questions one at a time using `AskUserQuestion`. Adapt based on what the task description already answers — skip questions that are clearly covered.

1. **Constraints / deadlines** — "Are there any constraints, deadlines, or scope limits I should know about for this task?"
2. **Definition of done** — "What does 'done' look like for this task? Is there a clear end state or deliverable?"
3. **Dependencies / blockers** — "Are there known dependencies between parts of this work, or external blockers I should account for?"
4. **Risks / unknowns** — "What are the riskiest or least-understood parts of this task?"

If an answer reveals something ambiguous or important, follow up with one clarifying question before moving on.

---

## Step 4 — Generate the Breakdown

Produce a breakdown of **4–10 self-contained subtasks**, ordered by dependency (things that must happen first come first).

Each subtask should have:
- A short, imperative title (e.g., "Audit existing query layer")
- A one-line description of what it involves and what done looks like for that step

Do not include time estimates, ownership assignments, or implementation code.

---

## Step 5 — Ask for Save Locations

Ask these two questions (can be in the same `AskUserQuestion` call since they are independent):

1. "Where should I save the markdown file? Provide the directory path (e.g. `~/projects/my-app/tasks/`)."
2. "Which Notion page should I create the breakdown under? Paste the parent page URL."

---

## Step 6 — Save the Markdown File

Save a markdown file to `<user-provided-dir>/<kebab-case-task-name>.md` using the Write tool.

Use this format:

```markdown
# Breakdown: <Task Title>

**Date:** <today's date>

## Context
<1–2 sentence summary of the task and key constraints gathered in the interview>

## Subtasks

1. **<Subtask Title>** — <one-line description>
2. **<Subtask Title>** — <one-line description>
...
```

---

## Step 7 — Create the Notion Page

Create a Notion page under the user-provided parent URL using the `notion-create-pages` MCP tool.

- Extract the page ID from the URL (the 32-character hex string, with or without dashes)
- Title: `<Task Title> — Breakdown`
- Content: same structure as the markdown file above

If the Notion MCP is unavailable or the page creation fails, report the error clearly and confirm the markdown file was saved successfully.

---

## Step 8 — Confirm and Mirror (Optional)

Report what was saved:

```
Saved: <full path to markdown file>
Notion page created: <page title> → <url>
```

Then ask: "Would you like me to add these subtasks to the conversation task list using TodoWrite so you can track progress here?"

If yes, use the TodoWrite tool to create a task for each subtask with status `pending`.

---

## Rules

- Never generate a breakdown from a vague or unclear description — always clarify first.
- Ask one question at a time in the interview. Never combine multiple questions in a single turn.
- Do not write any implementation code.
- Do not create GitHub issues or pull requests.
- Do not estimate time or assign ownership.
- Always run interactively in the foreground — never as a background agent.
- If Notion fails, degrade gracefully: save the markdown file and report the failure.
