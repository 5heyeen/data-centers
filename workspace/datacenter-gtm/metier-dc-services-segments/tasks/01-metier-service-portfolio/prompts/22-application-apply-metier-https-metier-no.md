# Prompt 22: application-apply-metier-https-metier-no

> **Prompt:** Apply all of the above to Metier (https://metier.no/): fetch and analyse metier.no, cross-reference with internal service catalogue, identify gaps, produce a structured catalogue with DC relevance ratings, and flag peripheral services.

---

## Application: Metier Complete Service Portfolio Catalogue

**Research sources:**
- Web searches of metier.no (direct fetch blocked — 403 on all page attempts; data gathered via Google-indexed content and search snippets)
- Internal service catalogue: `/home/user/data-centers/projects/dc-gtm/dc-services/dc_services_metier.md`
- LinkedIn and company registry data

---

### Company Context

| Fact | Value |
|---|---|
| Full name | Metier AS |
| Parent | Tetra Tech, Inc. (acquired April 24, 2025; ~27,000 employees globally) |
| Employees | ~250 |
| Annual revenue | ~NOK 800M |
| Projects managed | 300+ physical and digital projects; >NOK 1,000bn combined CAPEX |
| Founded | 40+ years ago |
| Headquarters | Oslo, Norway |
| Related entity | Metier OEC (training and project management, separately branded) |

**Positioning statement (from website):** "Metier has delivered expertise in projects, business development and transformation for over 40 years, and has been an important contributor to critical societal projects."

---

### Step 1: Service Lines from metier.no (website structure)

The website organises services into four top-level categories:

#### A. Ledelse og styring av fysiske prosjekter (Management and governance of physical projects)
URL: metier.no/tjenester/fysiske-prosjekter/

Sub-services explicitly confirmed:
- **Tidligfase** (Early phase) — strategic planning, needs assessment (behovskartlegging), Pre-FEED, FEED, contract strategy
- **Prosjektledelse** (Project management) — cost control, progress tracking, risk management in implementation phase; PMI, AACE, Project Excellence frameworks
- **Eierrådgivning** (Owner advisory) — owner-side advisory, frameworks grounded in best practices and research
- **Innkjøp** (Procurement) — supplier development and management, contract administration, warranty handling, EPC experience
- **Bygglogistikk** (Construction logistics) — management and control of digitalized construction logistics
- **Verdistyrt prosjektutvikling (VPU)** — proprietary methodology (Value-Driven Project Development); concept selection, early-phase optimization; certification program exists

Sectors explicitly named: healthcare buildings, construction, energy and industry, infrastructure and transport.

#### B. Ledelse og styring av digitale initiativer (Management and governance of digital initiatives)
URL: metier.no/tjenester/digitale-initiativer/

Sub-services (inferred from website structure and search):
- IT/digital project management
- Agile methods and governance
- IKT project management (also marketed under Metier OEC brand at metieroec.no/iktprosjekter/)
- Change management for digital transformations

#### C. Strategi- og forretningsutvikling (Strategy and business development)
URL: metier.no/tjenester/strategi-og-forretningsutvikling/

Sub-services:
- Strategic advisory (at intersection of strategy, organisation, and project investment)
- Business case development
- Organisational design
- Market entry analysis
- Management consulting (MC practice described as "working strategically with the right societal development")

Sectors named: renewable energy & green tech, industry, healthcare, defense, public administration, banking and finance, transport, real estate and infrastructure.

#### D. Kompetanseutvikling (Competence development)
Sub-services:
- Open and customised courses in project management
- Agile methods and leadership training
- PRINCE2, PMI/PMP certification programs
- Team development workshops
- Metier OEC is the largest provider of PM courses and certifications in the Nordic region

#### E. Prosjektsystemer (Project systems)
URL: metier.no/prosjektsystemer/

- Implementation of project management information systems
- Proprietary tools and frameworks (Project Excellence model)
- Digital project control platforms

---

### Step 2: Cross-Reference with Internal Service Catalogue (dc_services_metier.md)

The internal doc lists 8 DC-framed services. Mapping to website:

| Internal Service | Website Equivalent | Gap / Alignment |
|---|---|---|
| 1. Contract, Procurement & Equipment Planning | Innkjøp (Procurement) under Fysiske prosjekter | **ALIGNED** — website confirms procurement/EPC experience. Internal doc adds DC-specific framing: long-lead equipment, security clearance for contractors. |
| 2. Project Execution & PM | Prosjektledelse under Fysiske prosjekter | **ALIGNED** — website confirms 1,000bn NOK supervised. Internal doc adds DC-specific framing: fast-track 12-18 month builds, MEP interface management. |
| 3. Early-Phase Advisory (VPU/Concept Selection) | Tidligfase + VPU proprietary methodology | **STRONGLY ALIGNED** — VPU is a proprietary, certifiable methodology; website confirms. Internal doc adds DC framing: site selection, power capacity planning, phasing strategy. |
| 4. Owner's Engineer / PMC | Eierrådgivning (Owner Advisory) | **PARTIAL ALIGNMENT** — website uses "eierrådgivning" (advisory framing), not "owner's engineer" (technical representation framing). Internal doc is more explicit about representing the owner against contractors. Gap: the technical/engineering depth of OE role is not clearly signalled on website. |
| 5. Portfolio & Project Owner Governance | Prosjekteierstyring (mentioned in searches, not prominent on website) | **WEAK WEBSITE PRESENCE** — portfolio governance exists as a concept in Metier's methodology (Project Excellence includes governance frameworks), but is not prominently named as a standalone service line. Strong in internal framing; poorly communicated externally. |
| 6. Strategy & Business Development Advisory | Strategi- og forretningsutvikling | **ALIGNED** — named service line with dedicated page. Internal doc adds DC framing: market positioning, EU Taxonomy, organisational design for DC operators. |
| 7. Competence Development & Training | Kompetanseutvikling (+ Metier OEC) | **STRONGLY ALIGNED** — largest PM training provider in Nordics is a credible, verifiable claim. Internal doc adds DC-specific framing: rapid onboarding for fast-growing DC operators. |
| 8. Digital Initiatives & Technology Advisory | Ledelse og styring av digitale initiativer | **ALIGNED but LESS RELEVANT** — website has a full service category for this; internal doc correctly notes it is less directly relevant to physical DC construction. |

---

### Step 3: Gap Analysis

**Services on internal doc not clearly on website:**
- Portfolio governance as a named service (exists methodologically but not as a named offering)
- Owner's Engineer as a distinct technical role (website uses softer "owner advisory" language)
- ESG and sustainability advisory (not mentioned in any service page; sectors mention "green tech" but no ESG service line)
- Security clearance management (high-security DC operators — not mentioned anywhere publicly)

**Services on website not in internal doc:**
- Construction logistics management (Bygglogistikk) — directly relevant for DC construction site management
- Project systems / PMIS implementation (Prosjektsystemer) — relevant for DC operators building internal project controls
- IT/digital project management (IKT) — peripheral for physical DC build but relevant for DC operators building customer platforms

---

### Step 4: Confirmed Service Catalogue with DC Relevance Ratings

| Service | DC Relevance | Confirmed? | Notes |
|---|---|---|---|
| Project Management / PMO | ⭐⭐⭐ HIGH | ✅ Confirmed | Core capability; 1,000bn NOK supervised; fast-track construction experience needed |
| Early-Phase Advisory (VPU) | ⭐⭐⭐ HIGH | ✅ Confirmed | Proprietary methodology; site selection and concept optimisation directly applicable |
| Procurement & Contract Management | ⭐⭐⭐ HIGH | ✅ Confirmed | EPC experience confirmed; needs DC-specific long-lead equipment adaptation |
| Owner's Engineer / Owner Advisory | ⭐⭐⭐ HIGH | ✅ Confirmed (partial) | Eierrådgivning confirmed; technical depth of OE role needs stronger signalling |
| Portfolio & Project Owner Governance | ⭐⭐ MEDIUM-HIGH | ⚠️ Asserted | Strong in methodology; weak as named service externally |
| Strategy & Business Development | ⭐⭐ MEDIUM | ✅ Confirmed | Named service; DC framing needs explicit positioning work |
| Competence Development & Training | ⭐⭐ MEDIUM | ✅ Confirmed | Strong; Nordic's largest PM training provider; DC-specific content not yet developed |
| Construction Logistics Management | ⭐⭐ MEDIUM | ✅ Confirmed | Directly applicable to DC construction site management; not in internal doc |
| Project Systems / PMIS | ⭐ LOW-MEDIUM | ✅ Confirmed | Relevant for operators building project control infrastructure |
| Digital Initiatives Advisory | ⭐ LOW | ✅ Confirmed | Less relevant to physical DC build; relevant for DCIM platforms |

---

### Step 5: Peripheral / Under-Evidenced Services

**Flag — Portfolio Governance:** Methodologically strong but not commercially packaged as a named service. Risk: DC operators looking for "portfolio governance" or "multi-site PMO" won't find it in Metier's marketing.

**Flag — Owner's Engineer:** The distinction between "owner advisory" and "owner's engineer" matters to DC operators. The latter implies technical authority to challenge contractor designs; the former implies strategic support. Metier needs to clarify and evidence the technical depth of this role.

**Flag — ESG/Sustainability Advisory:** No service line exists publicly. As EU Taxonomy compliance becomes a mandatory element of PE-backed DC financing, this gap becomes commercially significant.

**Flag — Security Clearance Expertise:** Not mentioned publicly. For high-security DC operators (defense, government), this is a critical procurement differentiator.

---

### Summary Assessment

Metier's core PM and project delivery capabilities are genuine, confirmed, and scale-proven. The DC-specific framing developed in internal documents is directionally correct but not yet externally visible — the website does not signal DC relevance at all. The most immediate commercial opportunity is to:

1. Make the Owner's Engineer / PMC positioning explicit and technical (not just advisory)
2. Package Portfolio Governance as a named service
3. Develop and publish DC-specific case studies or methodology documentation
4. Enter the market through concrete, bounded engagements (procurement strategy, schedule risk analysis) rather than leading with advisory

**Sources:**
- [Metier - Ledelse og styring av fysiske prosjekter](https://metier.no/tjenester/fysiske-prosjekter/)
- [Metier - Strategi- og forretningsutvikling](https://metier.no/tjenester/strategi-og-forretningsutvikling/)
- [Metier OEC - Tjenester](https://www.metieroec.no/Tjenester/)
- [Metier - Verdistyrt prosjektutvikling](https://www.metier.no/virksomhetsutvikling/verdistyrt-prosjektutvikling/)
- [Metier LinkedIn](https://no.linkedin.com/company/metier-norge)
- [RPS / Metier OEC background](https://www.rpsgroup.com/about-us/news/rps-expands-its-capabilities-in-norway/)

---
*Executed: 2026-04-18 | Mode: sequential (builds on all prior prompts) | Research: web search + internal docs*
