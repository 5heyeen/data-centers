# /create-prompts — Socratic Prompt Chain Generator

> **FORMAT CONTRACT:** This skill's output is consumed by `/run-prompt-chain`. Every prompt MUST be a single `- \`[tag]\` <text>` bullet line. Do NOT use `###` headers for individual prompts. Do NOT split prompts across multiple lines. See **Output Format Specification** below.

This skill generates exhaustive Socratic prompt chains — structured sequences of research questions designed for use with any AI tool or with `/run-prompt-chain`.

## Core Function

**Prompt generation only.** Does not conduct research, summarise content, or search the web. Creates multi-layered question sequences that activate expert-level reasoning.

---

## Citation Requirement (embed in every generated chain)

Every prompt chain produced by this skill MUST carry a Citation Constraint block so the downstream researcher (`/run-prompt-chain` and its sub-agents) knows to return verifiable sources. This is non-negotiable.

Insert this block verbatim immediately after the `**Task:**` / `**Generated:**` header lines and before Section 1:

```markdown
## Citation & Claim Classification (applies to every prompt in this chain)

Every claim in your answer falls into exactly one of three buckets. Label it accordingly:

**Bucket 1 — Cited Finding (default):**
Format: `"<exact quoted text>" — [Source](<URL>)`
- Direct quote wrapped in quotation marks + clickable source URL.
- Do not paraphrase inside quotes. AI training knowledge is NOT a source — use WebSearch / WebFetch.

**Bucket 2 — Inferred Finding (allowed if sourced facts combine to support it):**
Format:
```
**Inferred:** <claim>
**Based on:** "<quote 1>" — [Source](<URL>); "<quote 2>" — [Source](<URL>)
**Reasoning:** <1–3 sentence explanation of how the cited facts combine — name the logical step (deduction, triangulation, trend extrapolation, analogy, etc.)>
```
- Requires at least TWO based-on citations (each with quote + URL).
- Reasoning must state the logical move explicitly. "Seems likely" is not sufficient.
- If the inference rests on a single source, it is not an inference — it is either a Cited Finding (if the source says it) or an Unverified Observation.

**Bucket 3 — Unverified Observation:**
Put the claim in the `## Unverified Observations` section at the end. Do not mix with cited or inferred findings.

Global rules:
- Never fabricate a quote. Never invent a URL.
- Never dress an inference up as a citation.
- Each prompt answer MUST end with a `## Unverified Observations` section (or "None.") AND a `## Sources` section listing every URL cited (deduplicated).
```

Additionally, each individual prompt's text should end with the sentence:

> *Answer using the three-bucket classification above: prefer Cited Findings, use Inferred Findings (with ≥2 based-on citations + Reasoning) only when no single source states the claim directly, and park anything else under Unverified Observations.*

---

## Step 1: Input Parsing

Accepts three input types: Notion URLs (fetched via MCP), local file paths (read directly), or free-text topics. Extracts the core task or topic from each.

## Step 2: Clarification

If input is vague, missing context, or consists of a single keyword, ask clarifying questions before proceeding. Questions cover: specific research angle, contextual constraints, and desired outcomes.

## Step 3: Chain Generation

Produce an exhaustive prompt chain organised into structured sections:
- **Principles**: foundational truths and what separates excellence
- **Framework**: core components, tradeoffs, metrics, and sequencing
- **Expert Simulation**: what experts would ask, prioritise, and overlook
- **Failure Analysis**: common pitfalls, underestimated factors, and backfiring shortcuts
- **Objection Pre-Empt**: skeptical challenges and counterarguments
- **Additional sections** as warranted by topic
- **Application**: context-specific synthesis prompts

Each prompt receives a dependency tag:
- `[independent]` — answerable in isolation
- `[sequential]` — builds on preceding answers

---

## Output Format Specification

The output file MUST use this exact format. This is a contract with `/run-prompt-chain` which parses these lines mechanically.

```markdown
# Prompt Chain: <Topic Title>

**Task:** <one-line task description from the input>
**Generated:** <timestamp>

## Citation & Claim Classification (applies to every prompt in this chain)

Every claim in your answer is classified into one of three buckets:

**Cited Finding** — `"<exact quoted text>" — [Source](<URL>)` (preferred).

**Inferred Finding:**
```
**Inferred:** <claim>
**Based on:** "<quote 1>" — [Source](<URL>); "<quote 2>" — [Source](<URL>)
**Reasoning:** <explain the logical step combining the cited facts>
```
Requires ≥2 based-on citations + an explicit Reasoning line.

**Unverified Observation** — no source, no inference; goes into the `## Unverified Observations` section at the end.

AI training knowledge is NOT a source. Never fabricate quotes or URLs. Never dress an inference up as a citation. Every prompt answer MUST end with a `## Unverified Observations` section (or "None.") and a `## Sources` section listing every URL cited.

## Section 1 — <Section Name>

### Prompt 1 `[independent]`
<Full prompt text. Can be multi-line for readability, but the prompt
is everything between this ### header and the next ### header or ## section.>

### Prompt 2 `[independent]`
<Full prompt text>

### Prompt 3 `[sequential]`
<Full prompt text>

## Section 2 — <Section Name>

### Prompt 4 `[sequential]`
<Full prompt text>
```

### Format Rules

1. **Section headers** use `## Section N — <Name>` format
2. **Prompt headers** use `### Prompt N \`[tag]\`` where tag is `[independent]` or `[sequential]`
3. **Prompt text** is everything between one `### Prompt` header and the next `### Prompt` header (or next `## Section` header)
4. **`**Task:**` header line** is mandatory — provides topic context for sub-agents in `/run-prompt-chain`
5. **Prompts should be substantive** — each prompt should be a compound research question that warrants 300-800 words of answer

## Step 4: Save and Report

Save the prompt chain file to the path specified by the caller. If no path specified, save to the current working directory as `prompt-chain.md`.

Report: file path and prompt count (N independent, M sequential).

**Note:** Do NOT save to Notion or `~/.claude/research/`. The orchestrator (`/researcher-agent`) handles all Notion saves and workspace path routing.

---

## Key Constraints

- No independent research, no answer provision, no web searches
- Exhaustive coverage of relevant angles
- All Application section prompts must be topic-specific, never generic
- Every prompt must have a dependency tag (`[independent]` or `[sequential]`)
- Every prompt chain MUST include the Citation Constraint block verbatim between the header and Section 1
- Every individual prompt's text must end with the reminder sentence: *Answer with direct quotes + source URLs per the Citation Constraint above.*
