# Data Center Engineering, Design Process & Delivery Models

## Key Findings Summary

- **DC design follows a 5-phase lifecycle** (Plan, Design, Build, Commission, Operate) with the design phase itself progressing through 30/60/90/100% milestones roughly analogous to RIBA Stages 2-4.
- **MEP engineering dominates DC design** -- unlike conventional buildings where architecture leads, data centers are MEP-driven projects where power and cooling determine the design.
- **Design-Build is the most common delivery model** for large-scale DCs, but EPC is gaining traction as owners seek to shift risk to contractors. EPCM offers a middle ground with lower cost but more owner involvement.
- **Hyperscalers increasingly self-perform**, maintaining large in-house design teams and standardized reference designs. Colocation operators typically use Design-Build or EPC. First-time developers benefit most from owner's representative services.
- **Equipment lead times (12-52 weeks for critical MEP items) are a primary schedule driver**, forcing early procurement decisions that constrain design flexibility.
- **Commissioning is a design discipline, not just a construction phase** -- it must be planned from concept design through 5 levels of testing culminating in Integrated Systems Testing (IST).

---

## 1. The Full DC Engineering & Design Lifecycle

### Standard Phases

The data center lifecycle consists of five fundamental phases ([DataXConnect](https://dataxconnect.com/insights-data-center-design-the-data-center-life-cycle/), [Cumulus Quality](https://cumulusquality.com/5-key-stages-of-data-center-development/)):

**Phase 1 -- Planning (3-12 months)**
Defines business requirements (demand/capacity), site selection, financial viability, regulatory compliance, and tier classification. Key decisions: power density targets, redundancy level (Tier I-IV), and growth strategy. Disciplines: business/strategy, real estate, legal, utility coordination.

**Phase 2 -- Design (6-18 months)**
Transforms the planning concept into site-specific schematics, detailed drawings, and specifications. Disciplines involved: data center architect, MEP engineers (electrical and mechanical), structural/civil engineers, IT/network consultants, energy consultants, commissioning agents, and facility operators ([DataXConnect](https://dataxconnect.com/insights-data-center-design-the-data-center-life-cycle/)).

Design progresses through percentage-based milestones ([Horst Construction](https://www.horstconstruction.com/cd-milestones-30-60-90/), [AACE International](https://source.aacei.org/2021/10/05/successful-design-scheduling/)):
- **30% Design (Concept/Schematic):** High-level layouts, single-line diagrams, preliminary equipment selections. Best time for value engineering since downstream impact is lowest. Different disciplines may be at different completion levels (e.g., structural at 60%, commissioning at 0%).
- **60% Design (Design Development):** Detailed coordination across disciplines. Preliminary construction schedule, phasing plan, and logistics plan drafted. Long-lead equipment procurement typically initiated.
- **90% Design (Construction Documents):** All plans and specifications included. Submitted for permitting review. Near-final coordination.
- **100% Design (Issued for Construction / IFC):** Final drawings released for construction.

**Phase 3 -- Construction/Build (18-30 months)**
Permitting, subcontractor management, equipment installation, network integration, and inspection. MEP installation is the most technically demanding component ([Broadstaff](https://broadstaffglobal.com/data-center-design-and-construction)).

**Phase 4 -- Commissioning (3-6 months)**
Validates that all systems function as designed before going live. Progresses through 5 levels ([CxPlanner](https://cxplanner.com/data-centers/resources/data-centers-level-testing), [ConstructAndCommission](https://constructandcommission.com/5-levels-of-commissioning-explained-data-center/)):
- **Level 1 (Red Tag):** Factory witness testing of components before delivery.
- **Level 2:** Installation verification and quality checks.
- **Level 3 (Green Tag):** Pre-commissioning -- individual component startup and functional checks.
- **Level 4 (Blue Tag):** Functional performance testing of individual systems against specifications.
- **Level 5 (White Tag / IST):** Integrated Systems Testing -- tests interoperability of all systems under simulated failure scenarios, verifying compliance with the Basis of Design and Owner's Project Requirements.

**Phase 5 -- Operations & Maintenance (10-25+ years)**
The longest phase. Continuous operation despite equipment aging and fluctuating IT/business demands.

**Total lifecycle: 3-6 years from planning to operations** depending on scale and power availability ([Broadstaff](https://broadstaffglobal.com/data-center-construction-timeline)).

### Mapping to RIBA Stages

The RIBA Plan of Work (Stages 0-7) maps approximately as follows ([Architecture for London](https://architectureforlondon.com/news/the-riba-plan-of-work/), [RIBA](https://www.riba.org/work/insights-and-resources/riba-plan-of-work/)):

| DC Phase | Approx. RIBA Stage | Description |
|---|---|---|
| Planning / Feasibility | Stage 0-1 (Strategic Definition, Preparation & Briefing) | Business case, site selection, brief |
| 30% / Concept Design | Stage 2 (Concept Design) | First visualizations, high-level layouts |
| 60% / Design Development | Stage 3 (Spatial Coordination) | Discipline coordination, system refinement |
| 90-100% / Construction Docs | Stage 4 (Technical Design) | Complete technical drawings, specifications |
| Construction | Stage 5 (Manufacturing & Construction) | Build phase |
| Commissioning | Stage 5-6 (Handover) | Testing and handover |
| Operations | Stage 7 (Use) | Ongoing facility management |

[Inference] In practice, DC projects often compress RIBA Stages 3 and 4 because MEP-dominant design is more sequential than the multi-discipline architectural coordination RIBA assumes. The 30/60/90 milestone system used in US practice (AIA-influenced) is more commonly referenced in DC industry literature than RIBA stages.

---

## 2. Delivery Models for DC Construction

### Design-Bid-Build (DBB)
The owner engages designers to produce 100% complete design documents, then separately bids construction. Phases are sequential -- design must be fully complete before construction begins ([King & Spalding](https://www.kslaw.com/news-and-insights/building-data-centers-key-considerations)).

**Pros:** Maximum owner control over design; competitive construction pricing; clear separation of responsibilities.
**Cons:** Slowest delivery method; owner bears risk of design-construction interface; disputes between designer and builder fall on the owner.
**DC usage:** Uncommon for large DCs due to speed-to-market pressure. May suit enterprise/private DCs where schedule is less critical.

### Design-Build (DB)
A single entity designs and builds. The owner provides a high-level design outline (often to 30% level), and the contractor refines and completes the design while constructing ([King & Spalding](https://www.kslaw.com/news-and-insights/building-data-centers-key-considerations), [Construction Dive](https://www.constructiondive.com/news/owners-contractors-tips-data-center-contracts/817235/)).

**Pros:** Single point of responsibility; faster delivery (design and construction overlap); reduced design-construction interface risk; value engineering opportunities; owner retains more design oversight than EPC.
**Cons:** Potentially higher final costs than initial estimates; owner may need strong internal team to manage design input; scheduling issues can still cause delays.
**DC usage:** **The most common delivery model for large-scale data centers to date.** Owners with some DC experience prefer it because they can retain procurement of key infrastructure (e.g., generators, UPS) while outsourcing the integrated design-build.

### EPC (Engineering, Procurement, Construction)
Turnkey delivery: the contractor provides performance guarantees for the completed facility. The owner provides output specifications and has limited input into design. Typically lump-sum turnkey pricing ([King & Spalding](https://www.kslaw.com/news-and-insights/building-data-centers-key-considerations)).

**Pros:** Maximum risk transfer to contractor; predictable costs; fastest delivery (better-defined deliverables, less collaborative design); single point of responsibility; reduced owner management burden.
**Cons:** Higher contract price (risk premium); less owner influence over design choices; contractor may optimize for their profit rather than owner's long-term operational needs; changes are expensive.
**DC usage:** **Growing in popularity**, especially among PE-backed operators and first-time developers who want to shift risk and lack in-house expertise. EPC providers in DC include Fluor, Turner & Townsend, and various specialized firms ([Fluor](https://www.fluor.com/market-reach/industries/technology), [DCNT Global](https://www.dcntglobal.com/dcnt-global-redefining-engineering-procurement-and-construction-for-mission-critical-infrastructure/)).

### EPCM (Engineering, Procurement, Construction Management)
The EPCM contractor provides engineering design, manages procurement, and oversees construction -- but the **owner retains direct contracts** with all subcontractors and suppliers. The EPCM firm acts as the owner's agent, not the principal contractor ([H+M EPC](https://www.hm-ec.com/blog-posts/epc-vs-epcm-projects-understanding-execution-models-hm)).

**Pros:** Lower cost than EPC (no contractor risk premium); owner contracts directly for best pricing; more flexibility for scope changes; allows parallel activities (design on some portions while constructing others); owner retains control.
**Cons:** Owner bears more risk (cost overruns, contractor performance); requires more owner involvement; more complex contractual structure.
**DC usage:** [Inference] Well-suited for experienced operators building multiple facilities who want cost optimization and flexibility. Also relevant for phased campus builds where scope evolves over time.

### CM at Risk (CMAR)
The Construction Manager acts as consultant during design, then assumes risk during construction by providing a Guaranteed Maximum Price (GMP). The CM holds all trade subcontracts ([Procore](https://www.procore.com/library/construction-project-delivery-methods), [Autodesk](https://www.autodesk.com/blogs/construction/construction-manager-at-risk-cmar-definition-and-best-practices/)).

**Pros:** Early CM involvement in constructability review; GMP provides cost certainty; collaborative design phase.
**Cons:** Potential conflicts of interest (CM advising on design they will build); GMP may include contingencies.
**DC usage:** [Inference] Less common in DC than Design-Build or EPC, but used by some institutional owners (e.g., universities, government) building private data centers.

### Integrated Project Delivery (IPD)
All project team members (owner, designer, builder) are bound by a single multiparty contract. Team is selected before design begins and collaborates throughout ([Procore](https://www.procore.com/library/construction-project-delivery-methods)).

**Pros:** Maximum collaboration; shared risk and reward; early input from all parties.
**Cons:** Requires high trust; complex contractual arrangements; few experienced teams.
**DC usage:** [Inference] Rare in DC construction. The speed-to-market pressure and the dominance of large EPC/DB contractors makes IPD impractical for most DC projects.

---

## 3. Which Delivery Model for Which DC Type?

| Operator Type | Typical Delivery Model | Rationale |
|---|---|---|
| **Hyperscale** (Google, Meta, Microsoft, AWS) | **Self-perform / hybrid Design-Build** | Maintain large in-house design teams with standardized reference designs. Self-build capacity reached 13,177 MW globally in 2022, with the top 4 representing ~78% ([Structure Research](https://www.structureresearch.net/product/2023-hyperscale-self-build-data-centre-report/)). They increasingly self-perform to maintain control, vendor reduction, customization, and access to renewables. Construction is contracted to large GCs (e.g., Holder, Fortis) working from the hyperscaler's design. |
| **Large colocation** (Equinix, Digital Realty, NTT) | **Design-Build** | Have experienced internal development teams but outsource design-build to specialist contractors. Use standardized/repeatable designs across campuses. |
| **Mid-size / new colocation** | **EPC or Design-Build** | EPC growing in popularity as PE-backed operators seek risk transfer and speed. Design-Build used when the operator has some in-house capability. |
| **Enterprise / private DC** | **Design-Bid-Build or CMAR** | Schedule pressure is lower; owner may want maximum design control. Traditional procurement routes more common. |
| **First-time developers** | **EPC + Owner's Representative** | Lack in-house expertise; EPC transfers risk; an owner's rep fills the knowledge gap on the owner's side. |

---

## 4. Owner's Team vs. Outsourced Services

### What the owner typically handles in-house:
- Business requirements and strategy
- Site selection and land acquisition
- Financing and investor relations
- Power procurement / utility negotiations
- Design standards and Basis of Design ownership
- Final approval decisions (design, equipment, vendor selection)
- Stakeholder and regulatory management

### What is commonly outsourced:
- Detailed engineering design (to A/E firm or design-build contractor)
- Construction management and site supervision
- Procurement execution (within DB/EPC contracts)
- Commissioning (to specialized Cx agents)
- Permitting and environmental consultancy
- Project controls (cost/schedule management)

### The Owner's Representative model
For lean owner teams, an **Owner's Representative (OR)** serves as the owner's fiduciary agent, providing end-to-end project management across planning, design, construction, and close-out. The OR considers the entire facility lifecycle -- not just timeline and budget -- and manages the complex web of architects, engineers, contractors, and suppliers ([J2H Partners](https://www.j2hpartners.com/news-ideas/data-center-owners-representation-the-j2h-difference), [Ascent](https://www.ascentcorp.com/the-role-of-the-mission-critical-owners-rep/)).

Key OR services include: design review and alignment with business requirements, competitive procurement management, long-lead item sourcing, value engineering, construction oversight, commissioning management, and senior leadership communication ([CPG Beyond the Cloud](https://www.cpgbeyondthecloud.com/solutions-overview/owners-rep-services/)).

[Inference] **A first-time DC developer can operate with as few as 3-5 internal staff** (a project sponsor/executive, a technical lead, a commercial/contracts lead, and 1-2 support roles) if they engage a strong owner's representative firm and use an EPC or Design-Build delivery model. The OR firm effectively becomes the owner's extended team. This is precisely the service gap Metier could fill for Norwegian DC operators.

---

## 5. Design Considerations Unique to Data Centers

### MEP-dominant design
Unlike conventional commercial buildings where the architect leads, **data centers are MEP-driven projects**. MEP systems (power, cooling, fire suppression) account for 60-70% of the build cost and are the primary determinant of uptime and reliability. The architect's role is subordinate -- providing the building envelope to house the MEP systems rather than driving the design ([GDI Engineering](https://gdiengdesign.com/the-key-role-of-mep-design-services-in-data-centers-ensuring-reliability-and-efficiency/), [Mintropy](https://www.mintropy.com/blog/why-mission-critical-data-centers-demand-integrated-mep-design/)). MEP engineering in DCs is "not just a technical service -- it is a risk management function" ([Mintropy](https://www.mintropy.com/blog/why-mission-critical-data-centers-demand-integrated-mep-design/)).

### Commissioning as a design discipline
Commissioning must be planned from concept design, not treated as a post-construction activity. Test scripts are developed and refined through every design stage. The commissioning agent should be engaged during design to verify that systems facilitate pre-commissioning and functional testing ([CxPlanner](https://cxplanner.com/data-centers/resources/data-centers-level-testing), [ConstructAndCommission](https://constructandcommission.com/5-levels-of-commissioning-explained-data-center/)).

### Equipment lead times driving design
Critical MEP equipment has long lead times that anchor the entire project schedule: switchgear (12-52 weeks), transformers (16-40 weeks), UPS systems (12-30 weeks), generators (20-40 weeks). This forces early procurement decisions that constrain later design flexibility. Cooling equipment is often on the critical path, requiring HVAC engineers to be engaged much earlier than in traditional commercial projects ([Broadstaff](https://broadstaffglobal.com/data-center-design-and-construction), [CMIC Global](https://cmicglobal.com/resources/article/data-center-construction-trends)).

### Phased construction / incremental capacity
Data centers are designed for phased delivery -- building out capacity in increments to match demand rather than building everything at once. This requires modular MEP infrastructure that supports efficient upgrades and minimizes downtime during expansions. Today, 100 MW builds are common, often delivered in phases ([Sprint Mechanical](https://sprint-mechanical.com/blog/inside-the-build-what-to-know-about-modern-data-center-construction/)).

### Redundancy as a design parameter
High redundancy (N+1, 2N, 2N+1) is built into all critical systems. Many data centers have more than double the required equipment to ensure zero downtime even during catastrophic failures. This fundamentally shapes spatial planning, routing, and cost ([GDI Engineering](https://gdiengdesign.com/the-key-role-of-mep-design-services-in-data-centers-ensuring-reliability-and-efficiency/)).

---

## Sources

- [DataXConnect - DC Life Cycle](https://dataxconnect.com/insights-data-center-design-the-data-center-life-cycle/)
- [Cumulus Quality - 5 Key Stages](https://cumulusquality.com/5-key-stages-of-data-center-development/)
- [Horst Construction - 30/60/90 Milestones](https://www.horstconstruction.com/cd-milestones-30-60-90/)
- [AACE International - Design Scheduling](https://source.aacei.org/2021/10/05/successful-design-scheduling/)
- [Broadstaff - DC Design and Construction](https://broadstaffglobal.com/data-center-design-and-construction)
- [Broadstaff - DC Construction Timeline](https://broadstaffglobal.com/data-center-construction-timeline)
- [CxPlanner - DC Level Testing](https://cxplanner.com/data-centers/resources/data-centers-level-testing)
- [ConstructAndCommission - 5 Levels of Commissioning](https://constructandcommission.com/5-levels-of-commissioning-explained-data-center/)
- [Architecture for London - RIBA Plan of Work](https://architectureforlondon.com/news/the-riba-plan-of-work/)
- [RIBA - Plan of Work](https://www.riba.org/work/insights-and-resources/riba-plan-of-work/)
- [King & Spalding - Building Data Centers](https://www.kslaw.com/news-and-insights/building-data-centers-key-considerations)
- [Construction Dive - DC Contracts](https://www.constructiondive.com/news/owners-contractors-tips-data-center-contracts/817235/)
- [H+M EPC - EPC vs EPCM](https://www.hm-ec.com/blog-posts/epc-vs-epcm-projects-understanding-execution-models-hm)
- [Procore - Project Delivery Methods](https://www.procore.com/library/construction-project-delivery-methods)
- [Autodesk - CMAR](https://www.autodesk.com/blogs/construction/construction-manager-at-risk-cmar-definition-and-best-practices/)
- [Structure Research - Hyperscale Self-Build Report](https://www.structureresearch.net/product/2023-hyperscale-self-build-data-centre-report/)
- [Fluor - Technology Markets](https://www.fluor.com/market-reach/industries/technology)
- [DCNT Global - EPC for Mission-Critical](https://www.dcntglobal.com/dcnt-global-redefining-engineering-procurement-and-construction-for-mission-critical-infrastructure/)
- [J2H Partners - DC Owner's Representation](https://www.j2hpartners.com/news-ideas/data-center-owners-representation-the-j2h-difference)
- [Ascent - Mission Critical Owner's Rep](https://www.ascentcorp.com/the-role-of-the-mission-critical-owners-rep/)
- [CPG Beyond the Cloud - Owner's Rep Services](https://www.cpgbeyondthecloud.com/solutions-overview/owners-rep-services/)
- [GDI Engineering - MEP Design for Data Centers](https://gdiengdesign.com/the-key-role-of-mep-design-services-in-data-centers-ensuring-reliability-and-efficiency/)
- [Mintropy - Integrated MEP Design](https://www.mintropy.com/blog/why-mission-critical-data-centers-demand-integrated-mep-design/)
- [CMIC Global - DC Construction Trends](https://cmicglobal.com/resources/article/data-center-construction-trends)
- [Sprint Mechanical - Modern DC Construction](https://sprint-mechanical.com/blog/inside-the-build-what-to-know-about-modern-data-center-construction/)
