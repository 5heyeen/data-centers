# DC Engineering & Design: Research Synthesis

**Scope:** How data center engineering and design works, with focus on standardized designs (CTS), basis of design services (Norconsult), vendor reference designs (Schneider), leverandor relationships, and delivery models — all positioned for Metier's GTM strategy.

**Date:** 2026-04-16

---

## Answers to the Five Original Questions

### Q1: How has CTS managed to offer standardized designs? Is this something we can do?

**How CTS does it:** CTS Nordics is a vertically integrated design-build contractor (1,400+ employees, 27 years DC-only experience). Their standardization rests on four pillars: (1) they control the full chain from design through construction and commissioning; (2) they manufacture standardized 2MW power modules (NordicEPOD) in a 12,000 sqm factory near Oslo, with Eaton as technology/investment partner; (3) they focus exclusively on data centers, accumulating reusable design IP; (4) they use digitalized commissioning with factory-completed L1-L3 testing and digital passports.

**Can Metier replicate this?** No. CTS's model requires owning design IP, manufacturing facilities, and a construction workforce. It is a design-build contractor, not a consultancy. Metier would need to become a fundamentally different company.

**What Metier CAN do:** The growth of standardized design-build in the Nordic DC market actually *increases* the need for independent owner-side advisors. When an operator engages CTS (or any design-build contractor), they face information asymmetry — the contractor controls both design and build. Metier can sit on the owner's side as **owner's engineer / design management advisor**, providing: requirements validation, design review, vendor-independent quality assurance, and multi-vendor coordination for large campuses.

---

### Q2: Can we offer basis of design service via Norconsult?

**Yes — this is a viable and well-precedented model.**

A Basis of Design (BoD) is the foundational engineering document that translates the owner's requirements into technical solutions — power architecture, cooling strategy, redundancy levels, tier targets, compliance (EN 50600, Uptime Institute). Under ASHRAE Guideline 0, the MEP consultant writes the BoD, but the owner drives the inputs via the Owner's Project Requirements (OPR).

**The partnership model:**
1. **Metier leads the OPR process** — facilitates workshops, defines business requirements, tier targets, capacity needs, phasing strategy, budget constraints
2. **Norconsult produces the BoD** — their MEP, electrical, and civil engineers translate the OPR into technical design parameters
3. **Metier manages the process** — reviews BoD for completeness, manages stakeholder sign-off, tracks it as a living document

**Norconsult has proven DC capability:** They hold the EPCM contract for Bulk Infrastructure's N01 campus at Stoleheia (up to 600 MW, NOK 3B+ investment), including engineering leadership, procurement, and construction management.

**Commercial model:** The BoD is a separately billable, early-phase deliverable (not embedded in later design fees). Typically 1-3% of estimated construction cost. For a 10-50 MW project (NOK 500M-2B), this is NOK 5-30M. The BoD then becomes the procurement document for tendering design-build or EPC contracts — giving Metier a natural pathway into the next phase.

---

### Q3: Can we take a design from Schneider and just do detailed engineering from there?

**Yes, but significant work remains.** Schneider's reference designs are schematic-level starting points, not construction-ready documents.

**What Schneider provides:** EcoStruxure reference designs including CAD drawings (electrical one-line diagrams, piping diagrams, dimensioned floor layouts), equipment lists, and increasingly ETAP/CFD digital twin models for AI configurations (9 reference designs developed with NVIDIA). Their TradeOff Tools and Capital Cost Calculator provide +/- 20% cost estimates. Prefab modules ship factory-tested.

**What Schneider does NOT provide (the gap):**
- Civil/structural engineering (foundations, site grading, drainage)
- Grid connection engineering (HV/MV substation, utility interconnection)
- Local building code compliance (TEK17, plan- og bygningsloven)
- Environmental impact assessment (konsekvensutredning)
- Fire safety engineering (local brannvesen requirements)
- Snow load, lightning protection, security infrastructure
- Network/fiber connectivity
- Permitting packages

**The reference design corresponds to roughly RIBA Stage 2/3 for the internal MEP systems only.** A full Stage 4 (Technical Design) and construction document set across all disciplines is still required.

**The process:** Operator selects reference design → engages local engineering firm (Norconsult) for site adaptation and detailed engineering → vendor provides factory engineering for modules → site construction proceeds in parallel → modules installed and connected → integrated commissioning.

**Metier's role:** Owner's engineer bridging the gap between Schneider's reference design and site-specific detailed engineering. Specifically: validating vendor design against requirements, coordinating between module vendor and local engineers, managing TEK17/PBL compliance, overseeing grid connection process.

**Key message to operators:** "A Schneider reference design gives you a 3-month head start on MEP concept design. But you still need 6-12 months of site-specific engineering, permitting, civil works, and grid connection. That is where we come in."

---

### Q4: How does it work with leverandorer? Norconsult is normally a sub-supplier to MEP contractors?

**In traditional Norwegian construction, yes — but DC projects are changing this dynamic.**

**Traditional model (totalentreprise / NS 8407):** The totalentreprenor (e.g., HENT, Skanska, Bravida) assumes responsibility for both design and execution. They hire engineering consultants (Norconsult, Ramboll) as sub-suppliers under NS 8417. The owner has no direct contract with the engineer. Example: on UNN Narvik hospital, HENT hired Norconsult as sub-supplier for HVAC, electrical, ICT, fire safety.

**The "tiltransport" mechanism** is also common: the owner initially hires an engineer for early-phase design, then "transfers" that contract to the total contractor when construction begins. After transfer, the contractor has full instruction rights over the engineer.

**DC projects are shifting to owner-side engineering:**
- **Bulk N01:** Norconsult holds an EPCM contract directly with the owner (Bulk). Construction contractors work under Norconsult's management. The engineer works FOR the owner, not under a contractor.
- **Skygard Oslo:** COWI contracted directly with the owner as "total advisor" for design of data centres, sustainable energy, and architecture.
- **Google Skien:** Multi-prime contracting — Google contracted Skanska separately for groundwork (NOK 1.1B) and core/shell (NOK 569M). Engineering sits on the owner's side.

**Why DC projects are different:** DC owners need to control critical design parameters (power density, cooling, redundancy) that can't be delegated to a general contractor. Phased build-out requires ongoing engineering. Long-lead equipment requires owner-direct procurement. Few general contractors have in-house DC design competence.

**Two competing models (simplified):**

```
Model A — Contractor-Led (traditional):
  Owner → Total Contractor → Engineer (sub-supplier)

Model B — Owner-Led (DC trend):
  Owner → Engineer/EPCM (direct) + Owner → Contractors (direct)
```

**For Metier:** When Norconsult is EPCM (Model B), they absorb PM — less room for Metier. Metier's strongest position is: (1) before any delivery model is chosen (advisory), (2) when the owner uses Design-Build/EPC and needs independent oversight, (3) when the engineer is design-only and PM is separate, or (4) as independent assurance overlay for PE-backed investors.

---

### Q5: What is the engineering and design process for a data center? What are the different ways of doing it?

**The DC lifecycle has 5 phases:**

| Phase | Duration | Key Activities |
|---|---|---|
| **1. Planning** | 3-12 months | Business requirements, site selection, financial viability, tier classification |
| **2. Design** | 6-18 months | Concept → schematic → detailed → construction docs (30/60/90/100% milestones) |
| **3. Construction** | 18-30 months | Civil works, MEP installation, equipment delivery, network integration |
| **4. Commissioning** | 3-6 months | 5-level testing: L1 factory witness → L2 installation → L3 pre-Cx → L4 functional → L5 IST |
| **5. Operations** | 10-25+ years | Continuous operation, maintenance, capacity expansion |

**DC design is MEP-dominant** — unlike conventional buildings where the architect leads, DCs are driven by power and cooling engineering. MEP accounts for 60-70% of build cost. The architect provides the envelope; the MEP engineer determines the design.

**Equipment lead times drive the schedule:** Transformers (16-40 weeks), generators (20-40 weeks), UPS (12-30 weeks), switchgear (12-52 weeks). Early procurement decisions constrain design flexibility.

**Commissioning is a design discipline, not just a construction phase.** It must be planned from concept design through 5 levels of testing. The commissioning agent should be engaged during design.

**Six delivery models:**

| Model | Description | DC Usage | Best For |
|---|---|---|---|
| **Design-Bid-Build** | Owner designs 100%, then bids construction | Uncommon for large DC | Enterprise/private DC, low schedule pressure |
| **Design-Build** | Single entity designs and builds | **Most common** for large-scale DC | Operators with some in-house experience |
| **EPC** | Turnkey, lump-sum, performance guarantees | **Growing fast**, especially PE-backed | First-time developers, risk-averse operators |
| **EPCM** | Consultant manages on owner's behalf, owner holds contracts | Used by experienced operators | Phased campuses, cost optimization |
| **CM at Risk** | CM advises during design, gives GMP for construction | Less common in DC | Institutional owners |
| **IPD** | Multi-party contract, shared risk/reward | Rare in DC | Not practical for most DC projects |

**Which model for which operator:**
- **Hyperscalers** (Google, Meta): Self-perform with in-house design teams, contract construction to GCs
- **Large colocation** (Equinix, NTT): Design-Build with experienced internal development teams
- **PE-backed / new operators**: EPC + Owner's Representative (maximum risk transfer)
- **Experienced multi-site operators**: EPCM (cost optimization, flexibility)

---

## Key Implications for Metier

### The Five Service Opportunities

1. **OPR + Delivery Model Advisory** (Planning phase) — Help operators define requirements and choose the right contract model. Metier-only, no engineering partner needed.

2. **Basis of Design Management** (Planning→Design) — Package with Norconsult. Metier manages OPR process, Norconsult delivers engineering. Fixed fee, 1-3% of CAPEX.

3. **Design Review & Management** (Design phase, 30/60/90% gates) — Independent design review for operators using Design-Build or EPC. Ensure design meets OPR/BoD.

4. **Procurement & Long-Lead Item Management** (Design→Construction) — Manage procurement strategy, supplier qualification, and equipment tracking. Biggest single schedule risk.

5. **Multi-Vendor Program Management** (Construction→Commissioning) — Coordinate multiple contractors and vendors on campus builds. Manage 5-level commissioning.

### The Critical Timing Insight

**Metier must engage early — before the EPCM consultant or Design-Build contractor is selected.** Once an EPCM firm (like Norconsult) is engaged, they absorb the PM function. Once a Design-Build contractor (like CTS) is engaged, they control the design. Metier's highest-value entry point is the planning phase, when the operator is making the foundational decisions about delivery model, engineering partners, and contractor selection.

### Competitive Positioning

- **vs. CTS Nordics:** Not competitors — Metier sits on the owner's side, CTS on the contractor side
- **vs. Norconsult:** Complementary when Norconsult is design-only; potential overlap when Norconsult is EPCM
- **vs. NS Nordics:** Closest competitor. Metier differentiates with broader services (procurement, governance, early-phase advisory) and larger organizational scale
- **vs. Schneider/Vertiv:** Not competitors — Metier helps operators evaluate and adapt vendor designs

---

## Sources

All sources are cited in the individual subtask research files:
- `tasks/01-cts-standardized-design/research.md`
- `tasks/02-basis-of-design/research.md`
- `tasks/03-vendor-reference-designs/research.md`
- `tasks/04-leverandor-relationships/research.md`
- `tasks/05-dc-design-process/research.md`
- `tasks/06-metier-positioning/research.md`
