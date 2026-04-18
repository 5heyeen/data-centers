# Prompt 17: failure-given-misrepresentations-validation-steps

> **Prompt:** Given these common misrepresentations, what validation steps would you take to sense-check a portfolio catalogue produced from website content alone?

---

## Validation Steps for a Website-Derived Portfolio Catalogue

Building on the misrepresentation patterns identified (prompts 15, 16), here is a structured validation protocol:

**Step 1: Cross-reference service claims with hiring data**
For every service listed on the website, check whether the firm has hired for specialist roles in that area within the past 24 months. If a service appears on the website but the firm has zero relevant job postings over that period, downgrade its status from "confirmed" to "marketed."

**Step 2: Stress-test each case study**
For every case study cited as evidence of a service capability: Is the client named or nameable? Is the outcome quantified? Is the project type genuinely analogous to DC work (capital-intensive, complex MEP, fast-track, multi-contractor)? Vague case studies should not count as evidence.

**Step 3: Match service claims to staff profiles**
For each claimed service, can you identify at least 3–5 employees on LinkedIn with specific, verifiable experience in that domain? If the service is staffed by one or two individuals, flag it as key-person dependent, not institutional.

**Step 4: Check temporal consistency**
When were service pages last updated? Does the "about us" narrative match current market positioning? Look for inconsistencies — a firm claiming DC expertise but with no news, no hiring, and no published content in that area in the past 12 months.

**Step 5: Verify accreditations independently**
Check certification bodies directly (PMI, AXELOS for PRINCE2, ISO certification registries) to confirm accreditations are current, not lapsed.

**Step 6: Flag for reference validation**
Any service line that is (a) prominent in marketing, (b) lacks substantive case studies, and (c) has thin staffing should be explicitly marked as "requires reference validation before inclusion in confirmed catalogue."

**Output:** Two-tier catalogue — Confirmed (passes steps 1–5) vs. Asserted (website claim only).

---
*Executed: 2026-04-18 | Mode: sequential (builds on prompts 15, 16)*
