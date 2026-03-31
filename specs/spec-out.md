# Plan: `/spec-out` Skill

## Context
The user wants a Claude Code skill that guides them through a structured, SDD-aligned interview to produce a complete specification for any Claude artifact (Skill, Agent, Workflow, Memory). The problem it solves: jumping straight into building without a spec leads to ambiguous instructions, rework, and poor results. This skill enforces a "spec before code" discipline using the AskUserQuestionTool interview pattern described by Thariq (@trq212) and the full SDD methodology from Julián's article (Specify → Plan → Tasks → Implement).

---

## What to Build

**File:** `~/.claude/commands/spec-out.md`

A Claude Code slash command skill that:
1. Detects (or asks for) the artifact type: Skill | Agent | Workflow | Memory
2. Conducts an adaptive, exhaustive one-question-at-a-time interview using `AskUserQuestionTool`
3. Generates a full SDD blueprint: Functional Spec → Technical Plan → Task List → Examples
4. Saves the spec as `~/.claude/specs/<artifact-name>.md`
5. Creates a Notion page in the Specifications Work database
6. Offers to hand off immediately to implementation

---

## Output Spec Format (SDD Blueprint)

Each generated spec file follows this structure:

```markdown
# Spec: <Artifact Name>

## Overview
- **Type:** Skill | Agent | Workflow | Memory
- **Trigger / Invocation:** e.g., `/foo`, subagent_type, cron
- **Author:** <from user>
- **Date:** <today>

## 1. Functional Spec (What)
### Purpose
### Use Cases
### Inputs & Arguments
### Expected Outputs
### Edge Cases & Error Handling
### Acceptance Criteria (Given/When/Then)

## 2. Technical Plan (How)
### Architecture & Approach
### Tools / MCPs Required
### Files to Create or Modify
### Patterns to Reuse
### Constraints & Non-Goals

## 3. Task Breakdown
- [ ] Task 1: <self-contained, testable>
- [ ] Task 2: ...
(each task completable in a single agent session)

## 4. Examples
### Example Invocation
### Example Output
```

---

## Interview Question Tracks (Artifact-Specific)

### Universal opening questions
1. What artifact type? (Skill / Agent / Workflow / Memory)
2. What's the name / trigger?
3. What problem does it solve — when would you use it?

### Skill track
- What arguments/inputs does it accept?
- What tools or MCPs should it use?
- What does a successful output look like?
- Should it be interactive (uses AskUserQuestionTool) or fully automated?
- What are failure/edge cases?
- Are there existing skills or patterns in `~/.claude/commands/` to build on?
- Who is the intended user — you only, or shareable?

### Agent track
- What is the agent's specialization and scope?
- Which tools should be available to it (list)?
- Does it run in foreground or background?
- Should it use `isolation: worktree`?
- What does it return to the parent conversation?
- What are the failure modes?

### Workflow track
- What triggers the workflow?
- What are the steps/stages in order?
- Which agents/skills/tools are involved at each step?
- Are there human checkpoints (approval gates)?
- How should errors at individual steps be handled?
- What is the final deliverable?

### Memory track
- Which memory type: user / feedback / project / reference?
- What specific information needs to persist?
- How should future conversations retrieve and apply it?
- When should this memory be updated or expire?
- Is this a new memory file or an update to an existing one?

### Universal closing questions (all tracks)
- What are the acceptance criteria? (try to elicit Given/When/Then)
- Are there constraints, non-goals, or things it explicitly should NOT do?
- Any examples of input → output you can describe?
- Should it reference or reuse any existing code/skills/agents you know of?

---

## Implementation Steps

### Step 1: Create the skill file
**File:** `~/.claude/commands/spec-out.md`

The skill prompt should instruct Claude to:
1. Parse any argument passed (e.g., `/spec-out skill` pre-selects artifact type)
2. Use `AskUserQuestionTool` with `one question at a time` — adaptive depth, stop when confident all spec sections can be filled
3. Follow the artifact-specific question track above
4. Always close with acceptance criteria + non-goals questions
5. Assemble the SDD blueprint from answers
6. Write the spec file to `~/.claude/specs/<kebab-case-name>.md`
7. Create a Notion page under the Specifications Work database (ID: `33264f44828380b99048ce9db743a0b5`)
8. Print a summary of what was saved
9. Ask: "Ready to implement now, or review the spec first?"

### Step 2: Create the specs directory (on first run)
The skill should check/create `~/.claude/specs/` before writing.

### Step 3: Notion integration
Use `mcp__claude_ai_Notion__notion-create-pages` to create the page under:
- Parent: `https://www.notion.so/Specifications-Work-33264f44828380b99048ce9db743a0b5`
- Title: `[Type] <Artifact Name> Spec`
- Content: the full SDD blueprint (converted to Notion blocks)

---

## Critical Files
- **Create:** `~/.claude/commands/spec-out.md` — the skill definition
- **Runtime output:** `~/.claude/specs/<name>.md` — generated spec files
- **Notion destination:** `https://www.notion.so/Specifications-Work-33264f44828380b99048ce9db743a0b5`

---

## Verification
1. Invoke `/spec-out` with no args → should ask artifact type first
2. Invoke `/spec-out skill` → should skip artifact type question, go straight to name/purpose
3. Complete the interview → spec file appears at `~/.claude/specs/<name>.md`
4. Notion page created in Specifications Work database
5. Offered implementation handoff at the end
6. Run `/spec-out` for each artifact type (Skill, Agent, Workflow, Memory) and verify different question tracks are used
