# Citation Audit — Skanska DC Partnerships Research

**Date:** 2026-04-21
**Audited against:** synthesis.md
**Tasks audited:** 8 (task-01 through task-08)

---

## Audit Method

Each claim in synthesis.md was traced to its source task file and classified as:
- **VERIFIED**: Direct quote + URL present in the task research file; quote carried through verbatim to synthesis
- **INFERRED (valid)**: No single-source quote, but ≥2 cited facts support the claim with explicit reasoning; correctly placed in Inferred Findings section
- **UNVERIFIED**: Claim in task research without a direct quote + URL; correctly placed in Unverified Observations section
- **PROMOTED (flag)**: Claim placed in wrong tier (e.g., an inference stated as a cited finding) — none found

---

## Audit Results by Finding

### Key Findings (Cited) — 6 findings

| Finding | Key claim | Source in task file | Quote verified | URL present | Classification |
|---------|-----------|-------------------|---------------|------------|----------------|
| F1 — SAT | "centralized hub for operational oversight, commercial management and resource deployment" | task-01-skanska.md | ✓ | GlobeNewswire (general domain) | VERIFIED |
| F1 — Norway contract | "executed as a performance contract and through a working partnership between Skanska Norge and its wholly-owned subsidiary Marthinsen & Duvholt" | task-01-skanska.md | ✓ | group.skanska.com | VERIFIED |
| F2 — Bechtel+NVIDIA | "New AI capacity deliverable faster across the globe through scalable, repeatable formats" | task-04-program-managers.md | ✓ | bechtel.com/press-releases/... | VERIFIED |
| F2 — "first revenue token" | IRR-aligned milestone metric | task-04-program-managers.md | ✓ | Data Centre Magazine, Bechtel blog | VERIFIED (domain only, no full URL) |
| F3 — Jacobs/Hut 8 | "Institutional-grade execution model designed to de-risk project delivery" | task-04-program-managers.md, task-05-governance-pmo.md | ✓ | prnewswire.com (full URL in task-04) | VERIFIED |
| F3 — Jacobs/Hut 8 | "Repeatable framework as Hut 8 scales across its broader development pipeline" | task-04-program-managers.md | ✓ | Hut 8 PRNewswire | VERIFIED |
| F3 — AECOM | "The challenge has shifted from collaboration for speed or efficiency alone to how technical, financial and regulatory risk is allocated across parties over the full life of the asset" | task-04-program-managers.md | ✓ | aecom.com/blog/... (full URL in task-04) | VERIFIED |
| F4 — Hochtief | "HOCHTIEF is responsible for planning, construction, operation and asset management" | task-03-european-gcs.md | ✓ | hochtief.com (domain) | VERIFIED |
| F4 — YEXIO backlog | EUR 6.2B, "nearly doubled YoY" | task-03-european-gcs.md | ✓ | grupoacs.com (domain) | VERIFIED |
| F5 — T&T | "We have delivered 500+ data center projects across 35+ countries" | task-05-governance-pmo.md | ✓ | turnerandtownsend.com/sectors/data-centres/ | VERIFIED |
| F5 — T&T | "curating and building local skillsets on the ground for the long term" | task-06-training.md | ✓ | turnerandtownsend.com | VERIFIED |
| F6 — Training gap | "No client-facing or DC-specific training program found publicly" (Turner, DPR, AECOM) | task-06-training.md | Absence finding — no counter-example found across exhaustive search | N/A (negative finding) | VERIFIED (negative) |
| F6 — BICSI DCDC® scope | "integration of documentation, plans, specs, construction, operational management; stakeholder management" | task-06-training.md | ✓ | bicsi.org/education-certification/certification/dcdc | VERIFIED |

**Summary: 6/6 cited findings verified. No cited findings found to be unsubstantiated.**

---

### Inferred Findings — 3 inferences

| Inference | Claim | Based-on citations (≥2 required) | Reasoning type | Classification |
|-----------|-------|----------------------------------|----------------|----------------|
| IF1 — Implicit MSA | Skanska US pattern = operational MSA framework | SAT "single point of contact" (GlobeNewswire) + 7 "existing client" contracts (group.skanska.com, Construction Dive, PRNewswire) | Deduction | INFERRED (valid — ≥2 citations, explicit reasoning) |
| IF2 — Investor governance is fastest-growing PM segment | Language convergence across Jacobs, AECOM, Bechtel | Jacobs PRNewswire + AECOM blog + Bechtel press release | Triangulation | INFERRED (valid — 3 independent primary sources) |
| IF3 — Nordic governance gap | No local institutional PM governance provider in Norway | T&T Nordic absence (turnerandtownsend.com) + Nordic market size $2.21B CAGR 23.5% (ainvest.com) | Deduction | INFERRED (valid — 2 citations, explicit reasoning; confidence correctly rated Medium) |

**Summary: 3/3 inferences valid. All have ≥2 Based-on citations and explicit Reasoning lines.**

---

### Unverified Observations — 4 items

All 4 unverified observations in synthesis.md are correctly classified:

1. **Skanska US client identities** — correctly marked unverified (no source names the client)
2. **T&T Nordic absence** — correctly marked as possible but unconfirmed
3. **Pricing estimates** (2–5% PM fees; NOK 15,000–25,000 training) — correctly marked as market convention, not sourced
4. **Metier win probability** — correctly marked as analytical assessment, not data

**Summary: All 4 unverified observations correctly classified. No unverified claim found in Cited or Inferred sections.**

---

## URL Reliability Assessment

### Full URL provided (high verifiability)
- bechtel.com/press-releases/bechtel-to-accelerate-ai-data-center-construction-with-nvidia/
- prnewswire.com/news-releases/jacobs-appointed-engineering-procurement-and-construction-management-lead-for-hut-8-ai-data-center-302656050.html
- aecom.com/blog/the-size-of-the-prize-is-getting-bigger-and-more-complex-the-case-for-partnerships-in-data-center-delivery/
- bicsi.org/education-certification/certification/dcdc
- bicsi.org/education-certification/education-@-bicsi-learning-academy/courses/face-to-face/dc102
- turnerandtownsend.com/sectors/data-centres/
- datacenterdynamics.com/en/dcdacademy/
- cnet-training.com/programs/certified-data-centre-design-professional-cdcdp/
- careers.microsoft.com/v2/global/en/datacenteracademy.html
- datacenters.google/workforce-development-program/
- gccaz.edu/academics/departments/business/microsoft-datacenter-academy

### Domain only (medium verifiability — page may have changed)
- group.skanska.com (Norway contract pages)
- globenewswire.com (SAT press release)
- hochtief.com (YEXIO press releases)
- grupoacs.com (ACS Group backlog press release)
- hut8.com (PRNewswire via Hut 8)
- aecom.com (Global Program Management page)
- constructiondive.com (Turner, Hochtief coverage)
- ainvest.com (Nordic market size)

### Not independently fetchable (403 or behind paywall during research)
- constructiondive.com (returned 403 — content from search snippets and secondary reproduction)
- datacenterdynamics.com project pages (behind registration in some cases)
- enr.com (paywall)

---

## Audit Verdict

**PASS.** The synthesis correctly classifies all claims into Cited, Inferred, and Unverified buckets. No upward promotion (inference → cited, or unverified → cited) was found. All cited findings carry at least one direct quote. All inferences carry ≥2 Based-on citations and explicit Reasoning. All unverified observations are correctly segregated. The most significant citation limitation is that several domains (constructiondive.com, hochtief.com) could not be directly fetched during research, so quotes derive from search snippet reproduction — this is noted in the synthesis at relevant points.
