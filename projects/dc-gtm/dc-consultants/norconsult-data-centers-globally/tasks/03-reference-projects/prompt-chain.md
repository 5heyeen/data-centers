# Subtask 03: Audit Global DC Reference Projects

**Goal:** Identify ≥5 named Norconsult DC reference projects with client, location, scale, scope, and source URL. Map the geographic spread and project types.

## Prompt Chain

### Batch 1 — Independent (run in parallel)

**Prompt 01** [independent]
What DC reference projects has Norconsult publicly disclosed? Search for: norconsult.com DC case studies/references, Norwegian press releases about Norconsult DC contracts, bygg.no/anbud365.no contract announcements naming Norconsult + datasenter, and any project databases (buildpilot.com, prosjekt.no). List every named project with client, location, MW/scale if known, scope, year, and source URL.

**Prompt 02** [independent]
Research Norconsult's involvement in the Bulk Infrastructure N01 / Støleheia campus specifically. What is the full scope? What phase(s) are they engaged on? What is the contract value and duration? Who is the client contact? Cite all sources.

**Prompt 03** [independent]
Research any Norconsult DC projects beyond Bulk/Støleheia — specifically: Google/Statkraft Telemark (Skien) project (where Norconsult did planning/regulatory work), any Green Mountain references, any hyperscaler campus planning references in Norway, and any DC-adjacent projects (large UPS facilities, HPC clusters, government secure facilities). Search Norwegian-language sources.

### Batch 2 — Sequential (run after Batch 1)

**Prompt 04** [sequential]
Based on the projects identified above, build a structured reference project table: project name | client | location | scale (MW/m²) | Norconsult scope | phase(s) | year | source URL. Flag any projects where scope is inferred vs. confirmed. Assess geographic spread — is Norconsult's DC reference base exclusively Norwegian, or are there projects in Denmark, Sweden, or other countries?

**Prompt 05** [sequential, Application]
Given the reference project audit above, assess: (1) How strong is Norconsult's DC reference portfolio vs. COWI, Sweco, and Ramboll? (2) What project types are over-represented (infrastructure/civil) vs. absent (MEP design, commissioning, owner's advisory)? (3) What does the reference portfolio imply about Norconsult's credible bid scope for future Norwegian DC projects?
