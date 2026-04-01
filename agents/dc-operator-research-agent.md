# Breakdown: DC Operator Research Agent

**Date:** 2026-03-31

## Context
Build a Claude Code agent (CLAUDE.md-based) that researches data center operators from public sources (website, finn.no job ads, LinkedIn, news, company registries, investor databases) and produces structured meeting briefs mapping their pain points to Metier's service pillars. A critical dimension is **funding & investor research** — understanding who backs each operator, how much capital they have, what constraints investors place on them (IRR targets, exit timelines, milestone gates, ESG mandates), and how these investor dynamics create specific consulting needs. Key risks span research quality from public sources, correctly mapping operator situations to Metier services, and generalizability across very different operator profiles (PE-backed startups vs. state-backed consortiums vs. high-security plays vs. infrastructure fund portfolios). The Metier service catalog covers physical project management, strategy & business development, digital initiatives, and competence development.

## Subtasks

1. **Define Metier's DC-specific service catalog** — Distill the Notion context into a concise `metier/services.md` that maps Metier's four pillars to data-center-specific value propositions (e.g., "Contract & Procurement Strategy" for helping operators without construction DNA select EPC contractors). Done when each relevant service has a 1-2 sentence DC-specific framing.

2. **Create the operator profile template** — Design the structured markdown template (`templates/operator-profile.md`) that the agent fills in during research: company snapshot, ownership & funding (investor identity, fund type, capital amount, deployment timeline, investor requirements, exit horizon), strategy/market segment, key people, org capability assessment, job ad analysis, pain points, comparable operators. Done when the template covers all research dimensions including comprehensive funding fields.

3. **Create the meeting brief output template** — Design the final deliverable template (`templates/meeting-brief.md`): company overview, **funding & investor context** (who's behind the money, what constraints it creates, how Metier addresses investor-driven needs), identified pain points ranked by urgency, Metier service fit per pain point, talking points, open questions. Done when the template is clear enough that a human could fill it in manually.

4. **Build the pain-point-to-service mapping logic** — Create `projects/dc-gtm/dc-services/dc_services_metier_pain_point.md` with a decision-tree or matrix: "if operator lacks X capability, suggest Y service", "if PE-backed, emphasize execution speed, suggest Z". Include investor-pressure-driven pain points: timeline pressure from PE exit horizons, milestone-gated capital requiring professional PM, ESG compliance for institutional investors, reporting burden requiring portfolio governance. Done when common DC operator pain points — including funding-driven ones — are mapped to specific Metier services.

5. **Define the operator input format** — Create `projects/operators/_template/operator.md` specifying what the user provides per operator: company name, website URL, known context/notes, market segment hint, meeting date, known investors/funding context. Done when the minimal input needed to start research is clear.

6. **Build the research pipeline in CLAUDE.md** — Write the master `CLAUDE.md` with step-by-step instructions for the agent: (a) read operator config, (b) search company website, (c) search finn.no for job ads, (d) search LinkedIn/news for org structure and announcements, **(e) research funding situation — investor identity, capital structure, funding rounds, investor requirements and constraints**, (f) identify strategic positioning, (g) find comparable operators, (h) synthesize pain points (including funding-driven ones), (i) map to Metier services, (j) generate brief. Done when the CLAUDE.md can be followed as a runnable workflow by Claude.

7. **Create the first operator config: Fossefall** — Populate `projects/operators/fossefall/operator.md` with known context (500MW AI target, Rollag site, finance background, no execution capability, VP Construction hired, need engineering manager). Done when the config captures all known seed information.

8. **Create placeholder operator configs** — Set up stub folders for Skygard (high-security, Hafslund/Telenor/HitecVision), Kitebrook, and Bifrost Edge with minimal known context. Done when each has a folder with a skeleton `operator.md`.

9. **Test and iterate the agent on Fossefall** — Run the agent end-to-end for Fossefall, review the output brief, and refine the CLAUDE.md prompts and templates based on what works and what doesn't. Done when the Fossefall brief is useful enough to bring to a real meeting.
