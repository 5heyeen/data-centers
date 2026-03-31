# prep-meeting-agent — Data Center Meeting Preparation

This repo supports Metier's go-to-market strategy targeting Norwegian data center operators. Each subfolder under `operators/` represents one target operator.

## Purpose

When run inside an operator folder (`operators/<name>/`), this agent researches the operator from public sources and produces a structured meeting brief that maps their pain points to Metier's services.

## Available Tools

This agent uses **WebSearch** and **WebFetch** for research. All research is done from public sources:
- Company websites
- finn.no (job ads)
- LinkedIn (via search snippets — do not attempt to fetch LinkedIn pages directly)
- proff.no / brreg.no (Norwegian company registry)
- News sites (DCD, Computer Weekly, BeBeez, etc.)
- Industry reports

## Key Reference Files

- `metier/services.md` — Metier's service catalog with DC-specific framing (8 services)
- `metier/pain-point-mapping.md` — Decision framework mapping pain points to services, including 4 operator archetype patterns
- `templates/prompts/01-06` — Detailed instructions for each research phase
- `templates/meeting-brief.md` — Output template for the final brief

## Workflow

The agent runs 6 sequential research phases. Each phase saves its output to `research/` inside the operator folder. Run all phases in order, or run a specific phase.

### Phase 1: Company Research
Read `templates/prompts/01-company-research.md` and execute. Saves to `research/01-company.md`.

### Phase 2: Job Ads & Hiring Analysis
Read `templates/prompts/02-job-ads-analysis.md` and execute. Saves to `research/02-hiring.md`.

### Phase 3: News & Ownership Analysis
Read `templates/prompts/03-news-and-ownership.md` and execute. Saves to `research/03-news-ownership.md`.

### Phase 4: Competitive Landscape
Read `templates/prompts/04-competitive-landscape.md` and execute. Saves to `research/04-comparables.md`.

### Phase 5: Pain Point Mapping (no web research — synthesis only)
Read `templates/prompts/05-pain-point-mapping.md` and execute. Also read `metier/services.md` and `metier/pain-point-mapping.md`. Saves to `research/05-pain-points.md`.

### Phase 6: Meeting Brief Generation (no web research — synthesis only)
Read `templates/prompts/06-brief-generation.md` and execute. Saves to `research/brief.md`.

## Commands

When the user says:
- **"Run all phases"** — Execute phases 1-6 sequentially, reading each prompt template and saving outputs.
- **"Run phase N"** — Execute only phase N. For phases 5-6, ensure prior phases have been completed (read their output files).
- **"Update brief"** — Re-run phases 5 and 6 only (re-synthesize from existing research).

## Language Guidance

- **Research** in both Norwegian and English. Many sources are in Norwegian.
- **Output** briefs in English.
- Key Norwegian search terms: "datasenter" (data center), "stilling" (job posting), "prosjektleder" (project manager), "innkjøp" (procurement), "byggeprosjekt" (construction project), "eiendom" (real estate), "styret" (board), "daglig leder" (CEO), "ansatte" (employees), "konsesjon" (concession), "regulering" (zoning), "sikkerhetsklarering" (security clearance).

## Quality Standards

- All factual claims must cite a source URL.
- Inferences must be clearly labeled as inferences, not presented as facts.
- Low-confidence assessments must be flagged.
- The final brief should be readable in under 15 minutes.

## Practical Notes

- **finn.no** may not allow direct page fetches — use WebSearch to get job ad summaries from search snippets.
- **LinkedIn** blocks automated access — rely on WebSearch snippets about the company rather than fetching pages directly.
- **proff.no** may have paywalls — use brreg.no as a free alternative for registry data.
- If an operator has very little public information, flag this explicitly and focus the brief on questions to ask in the meeting.
