# Breakdown: Research Operator Agent — Rename & Funding Research Integration

**Date:** 2026-03-31

## Context
Rename `agents/meeting-prep-agent-breakdown.md` to `agents/research-operator-agent.md` and integrate funding/investor research as a first-class dimension across the entire operator investigation workflow. The agent is not a skill but an agent that uses a set of reusable skills. Funding research covers investor identity, capital amounts, deployment timelines, and investor requirements/constraints on operators — covering both Norwegian and international investors. Research into typical investor requirements (PE, infrastructure funds, sovereign wealth) informs what fields and prompts to add. All related templates, prompts, pain-point mappings, and the master CLAUDE.md are updated to incorporate this dimension.

## Subtasks

1. **Rename agent breakdown file** — Move `agents/meeting-prep-agent-breakdown.md` to `agents/research-operator-agent.md`. Update references in README.md. Update title and context in the breakdown file itself. Done when no references to old filename remain.

2. **Research typical DC investor requirements** — Web research into what PE firms, infrastructure funds, and sovereign wealth funds typically require from DC operators: IRR targets (PE: 15-25%, infra: 8-12%), exit timelines (PE: 3-7 yrs, infra: 10-15+), milestone-gated capital deployment, ESG/EU Taxonomy mandates, quarterly reporting burden, governance provisions (board seats, CAPEX thresholds), debt covenants. Done when findings are captured and used to inform template/prompt updates.

3. **Update operator profile template with funding fields** — Expand `templates/operator-profile.md` "Ownership & Funding" section: add investor details table (investor, fund type, amount, date), capital deployment section (total funding, stage, timeline, remaining need), investor requirements section (IRR targets, exit horizon, milestone gates, reporting, ESG mandates, governance, debt constraints). Done when template captures all funding dimensions.

4. **Update Phase 3 prompt with funding research steps** — Expand `templates/prompts/03-news-and-ownership.md` to include: funding & investor research searches (brreg.no shareholders, funding round news, PE firm portfolios), per-investor profile research (fund type, thesis, portfolio, return targets, hold period), investor requirements research (milestone gates, reporting, ESG, governance, debt covenants), capital deployment status assessment. Update output format to include Investor Profiles table and Investor Requirements section. Done when Phase 3 comprehensively covers funding.

5. **Update pain-point-mapping.md with funding-driven pain points** — Add "Funding-Driven Pain Points" section to `projects/dc-gtm/dc-services/dc_services_metier_pain_point.md`: PE exit timeline pressure, milestone-gated capital risk, ESG mandates, reporting burden, governance provisions, capital raise credibility, debt covenant pressure, multi-investor reporting complexity. Add corresponding entries to Signal-to-Service Quick Reference table. Done when funding signals are mapped to Metier services.

6. **Update meeting-brief template** — Add "Funding & Investor Context" as Section 3 in `templates/meeting-brief.md`: capital structure, key investors, fund type & implications, investor-driven constraints (timeline, governance, ESG, milestones), and what this means for Metier. Renumber subsequent sections. Done when brief template includes funding section.

7. **Update CLAUDE.md workflow** — Rename agent to `research-operator-agent`. Add investor/PE firm websites to Available Tools. Update Phase 3 description to emphasize funding research. Add emphasis on Funding-Driven Pain Points in Phase 5. Ensure Phase 6 calls out Funding & Investor Context section. Add Norwegian funding search terms. Done when CLAUDE.md reflects the full funding-integrated workflow.

8. **Validate against existing operator data** — Cross-check new funding fields against existing operator research (Fossefall PE-backed profile, Skygard consortium, Nscale/Aker partnership) to ensure the framework captures real-world patterns. Done when at least 2 existing operator profiles are checked.
