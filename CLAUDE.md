# DC Operator Research Agent — Data Center Operator Research & Meeting Preparation

This repo supports Metier's go-to-market strategy targeting Norwegian data center operators. Each subfolder under `projects/operators/` represents one target operator.

## Purpose

When run inside an operator folder (`projects/operators/<name>/`), this agent researches the operator from public sources — including their **funding situation, investors, and investor-driven constraints** — and produces a structured meeting brief that maps their pain points to Metier's services.

## Available Tools

This agent uses **WebSearch** and **WebFetch** for research. All research is done from public sources:
- Company websites
- finn.no (job ads)
- LinkedIn (via search snippets — do not attempt to fetch LinkedIn pages directly)
- proff.no / brreg.no (Norwegian company registry and shareholder data)
- News sites (DCD, Computer Weekly, BeBeez, etc.)
- Industry reports
- Investor/PE firm websites and portfolio pages
- Project finance and funding news

## Key Reference Files

- `metier/services.md` — Metier's service catalog with DC-specific framing (8 services)
- `projects/dc-gtm/dc-services/dc_services_metier_pain_point.md` — Decision framework mapping pain points to services, including 4 operator archetype patterns and funding-driven pain points
- `templates/prompts/01-06` — Detailed instructions for each research phase
- `templates/meeting-brief.md` — Output template for the final brief (includes Funding & Investor Context section)

## Workflow

The agent runs 6 sequential research phases. Each phase saves its output to `research/` inside the operator folder. Run all phases in order, or run a specific phase.

### Phase 1: Company Research
Read `templates/prompts/01-company-research.md` and execute. Saves to `research/01-company.md`.

### Phase 2: Job Ads & Hiring Analysis
Read `templates/prompts/02-job-ads-analysis.md` and execute. Saves to `research/02-hiring.md`.

### Phase 3: News, Ownership & Funding Analysis
Read `templates/prompts/03-news-and-ownership.md` and execute. This is a critical phase — it covers ownership structure, **investor identity, funding rounds, capital structure, investor requirements and constraints** (IRR targets, exit horizons, milestone gates, ESG mandates, reporting burden, governance provisions). Saves to `research/03-news-ownership.md`.

### Phase 4: Competitive Landscape
Read `templates/prompts/04-competitive-landscape.md` and execute. Saves to `research/04-comparables.md`.

### Phase 5: Pain Point Mapping (no web research — synthesis only)
Read `templates/prompts/05-pain-point-mapping.md` and execute. Also read `metier/services.md` and `projects/dc-gtm/dc-services/dc_services_metier_pain_point.md`. **Pay special attention to the "Funding-Driven Pain Points" section** in the pain-point mapping — investor pressure, milestone-gated capital, ESG mandates, and reporting burden are often the most urgent pain points for PE-backed and fund-backed operators. Saves to `research/05-pain-points.md`.

### Phase 6: Meeting Brief Generation (no web research — synthesis only)
Read `templates/prompts/06-brief-generation.md` and execute. **Ensure the "Funding & Investor Context" section (Section 3) is fully populated** — this is often the most actionable section for Metier's pitch. Saves to `research/brief.md`.

## Commands

When the user says:
- **"Run all phases"** — Execute phases 1-6 sequentially, reading each prompt template and saving outputs.
- **"Run phase N"** — Execute only phase N. For phases 5-6, ensure prior phases have been completed (read their output files).
- **"Update brief"** — Re-run phases 5 and 6 only (re-synthesize from existing research).

## Language Guidance

- **Research** in both Norwegian and English. Many sources are in Norwegian.
- **Output** briefs in English.
- Key Norwegian search terms: "datasenter" (data center), "stilling" (job posting), "prosjektleder" (project manager), "innkjøp" (procurement), "byggeprosjekt" (construction project), "eiendom" (real estate), "styret" (board), "daglig leder" (CEO), "ansatte" (employees), "konsesjon" (concession), "regulering" (zoning), "sikkerhetsklarering" (security clearance), "investering" (investment), "finansiering" (financing), "aksjonærer" (shareholders), "eiere" (owners), "kapital" (capital), "emisjon" (share issue/capital raise), "egenkapital" (equity), "lån" (loan/debt).

## Quality Standards

- All factual claims must cite a source URL.
- Inferences must be clearly labeled as inferences, not presented as facts.
- Low-confidence assessments must be flagged.
- The final brief should be readable in under 15 minutes.

## Notion Sync Rules

When any of the following files are modified, **always sync the changes back to Notion**:

| Local File | Notion Target |
|------------|---------------|
| `projects/dc-gtm/customer-personas/dc-customer-personas.md` | [DC Customer Personas & Value Props](https://www.notion.so/32d64f448283806d8b8cf32572c4be43) |
| `projects/dc-gtm/dc-services/dc_services_all.md` | [DC Services](https://www.notion.so/964d4138914342c3a0ba78de77f5a030) |

To sync: after editing the local file, use the Notion MCP tools (`mcp__*__notion-update-page` or `mcp__*__notion-create-pages`) to push the updated content to the corresponding Notion page/database.

---

## Practical Notes

- **finn.no** may not allow direct page fetches — use WebSearch to get job ad summaries from search snippets.
- **LinkedIn** blocks automated access — rely on WebSearch snippets about the company rather than fetching pages directly.
- **proff.no** may have paywalls — use brreg.no as a free alternative for registry data.
- If an operator has very little public information, flag this explicitly and focus the brief on questions to ask in the meeting.
