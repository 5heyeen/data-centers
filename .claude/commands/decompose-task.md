# Task Decomposition Skill Overview

The `/decompose-task` skill is a structured framework for breaking large, unclear tasks into actionable subtasks through guided interviews.

## Core Process

The workflow follows eight sequential steps:

1. **Resolve input** — Accept Notion URLs, file paths, or free text descriptions
2. **Vagueness check** — Reject descriptions under ~20 words or lacking clear goals
3. **One-at-a-time interview** — Ask about constraints, success criteria, dependencies, and risks
4. **Generate breakdown** — Produce 4–10 ordered, self-contained subtasks
5. **Request save locations** — Collect directory path and Notion parent page URL
6. **Save markdown** — Write structured file to user-specified directory
7. **Create Notion page** — Mirror the breakdown as a Notion database entry
8. **Optional tracking** — Add subtasks to conversation task list via TodoWrite

## Key Requirements

The instructions emphasize: asking interview questions individually, never combining multiple in one turn; never estimating time or assigning ownership; degrading gracefully if Notion fails; and always running interactively in the foreground rather than as a background process.

Each subtask must include a short imperative title and one-line completion description, ordered by dependency.

## Output Format

When saving the breakdown as markdown, use this format for each subtask:

```markdown
### Task NN: <Imperative title>
<One-paragraph description of what this task covers, what sources or methods to use, and what completion looks like.>
```

This format is consumed by the `/researcher-agent` orchestrator, which classifies each task as `[independent]` or `[sequential]` after the breakdown is produced.
