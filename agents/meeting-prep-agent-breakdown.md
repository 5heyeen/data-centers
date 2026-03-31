# Breakdown: prep-meeting-agent

**Date:** 2026-03-31

## Context
Build a Claude Code agent (CLAUDE.md-based) that researches a data center operator from public sources (website, finn.no job ads, LinkedIn, news) and produces a structured meeting brief mapping their pain points to Metier's four service pillars. Key risks span research quality from public sources, correctly mapping operator situations to Metier services, and generalizability across very different operator profiles (PE-backed startups vs. state-backed consortiums vs. high-security plays). The Metier service catalog is documented in Notion and covers physical project management, strategy & business development, digital initiatives, and competence development.

## Subtasks

1. **Define Metier's DC-specific service catalog** — Distill the Notion context into a concise `metier/services.md` that maps Metier's four pillars to data-center-specific value propositions (e.g., "Contract & Procurement Strategy" for helping operators without construction DNA select EPC contractors). Done when each relevant service has a 1-2 sentence DC-specific framing.

2. **Create the operator profile template** — Design the structured markdown template (`templates/operator-profile.md`) that the agent fills in during research: company snapshot, ownership & funding, strategy/market segment, key people, org capability assessment, job ad analysis, pain points, comparable operators. Done when the template covers all research dimensions from the Fossefall and Skygard examples.

3. **Create the meeting brief output template** — Design the final deliverable template (`templates/meeting-brief.md`): company overview, identified pain points ranked by urgency, Metier service fit per pain point, talking points, open questions. Done when the template is clear enough that a human could fill it in manually.

4. **Build the pain-point-to-service mapping logic** — Create `metier/pain-point-mapping.md` with a decision-tree or matrix: "if operator lacks X capability, suggest Y service", "if PE-backed, emphasize execution speed, suggest Z". Cover at least the Fossefall pattern (finance background, no execution capability) and Skygard pattern (high-security, contractor clearance needs). Done when 5-6 common DC operator pain points are mapped to specific Metier services.

5. **Define the operator input format** — Create `research/operators/_template/operator.md` specifying what the user provides per operator: company name, website URL, known context/notes, market segment hint, meeting date. Done when the minimal input needed to start research is clear.

6. **Build the research pipeline in CLAUDE.md** — Write the master `CLAUDE.md` with step-by-step instructions for the agent: (a) read operator config, (b) search company website, (c) search finn.no for job ads, (d) search LinkedIn/news for org structure and announcements, (e) identify strategic positioning, (f) find comparable operators, (g) synthesize pain points, (h) map to Metier services, (i) generate brief. Done when the CLAUDE.md can be followed as a runnable workflow by Claude.

7. **Create the first operator config: Fossefall** — Populate `research/operators/fossefall/operator.md` with known context (500MW AI target, Rollag site, finance background, no execution capability, VP Construction hired, need engineering manager). Done when the config captures all known seed information.

8. **Create placeholder operator configs** — Set up stub folders for Skygard (high-security, Hafslund/Telenor/HitecVision), Kitebrook, and Bifrost Edge with minimal known context. Done when each has a folder with a skeleton `operator.md`.

9. **Test and iterate the agent on Fossefall** — Run the agent end-to-end for Fossefall, review the output brief, and refine the CLAUDE.md prompts and templates based on what works and what doesn't. Done when the Fossefall brief is useful enough to bring to a real meeting.
