# Basis of Design (BoD) in Data Center Projects: Research Report

## Key Findings Summary

1. **A Basis of Design (BoD) is the foundational engineering document** that translates the owner's requirements into technical design solutions. For data centers it covers power architecture, cooling strategy, redundancy levels, and compliance with tier standards.
2. **The BoD is written by the design engineer/MEP consultant**, not the owner -- but it is driven by the Owner's Project Requirements (OPR), which the owner (often assisted by a PM consultant) prepares.
3. **Norconsult has proven DC capability**, including an EPCM contract for Bulk Infrastructure's N01 campus at Stoleheia (one of Europe's largest DC projects).
4. **A Metier + Norconsult partnership could credibly offer BoD as a packaged service**, with Metier managing the OPR process, stakeholder alignment, and project governance, while Norconsult delivers the engineering content. This mirrors the owner's engineer / PM consultant model used globally.

---

## 1. What Is a Basis of Design in Data Center Projects?

### Formal Definition

ASHRAE Standard 202 defines a BoD as "a document that records the concepts, calculations, decisions, and product selections used to meet the Owner's Project Requirements (OPR) and to satisfy applicable regulatory requirements, standards, and guidelines." ([ASHRAE Guideline 1.6 - ACHR News](https://www.achrnews.com/articles/163600-ashrae-guideline-16-data-center-commissioning))

In data center contexts specifically, the BoD serves as the "blueprint outlining the design intent, MEP topology, and performance criteria needed to meet the unique demands of a mission-critical facility." ([SiTESPAN - Basis of Design](https://sitespanllc.com/basis-of-design/))

### Typical Contents for a Data Center BoD

A data center BoD typically includes:

- **Power architecture**: Utility feed voltage, transformer configuration, UPS topology (N+1 vs. 2N), generator strategy, redundancy level per Uptime tier target ([GBC Engineers - DC Power Design](https://gbc-engineers.com/news/data-center-power-design))
- **Cooling strategy**: CRAC/CRAH units, chilled water systems, hot/cold aisle containment, free cooling potential, PUE targets ([GDI Engineering - MEP Design](https://gdiengdesign.com/the-key-role-of-mep-design-services-in-data-centers-ensuring-reliability-and-efficiency/))
- **Redundancy and tier target**: Concurrently maintainable (Tier III) vs. fault tolerant (Tier IV), with specific N+1 or 2N configurations per system
- **Site parameters**: Location constraints, grid capacity, climate data, seismic zone
- **Capacity planning**: Current and future power density (kW/rack), scalability and phasing strategy
- **Compliance requirements**: Which standards apply (EN 50600, TIA-942, Uptime Institute)
- **AMEFP scope**: Architectural, mechanical, electrical, fire protection, and plumbing systems
- **Infrastructure schematics**: Single-line diagrams, major equipment selections
- **Construction phasing and financial roadmap**

### Relationship to Other Design Phases

The BoD sits early in the project lifecycle:

1. **Owner's Project Requirements (OPR)** -- what the owner wants (functional, operational, sustainability goals)
2. **Basis of Design (BoD)** -- how the design will meet the OPR (technical strategies and criteria)
3. **Conceptual / Schematic Design** -- initial layouts and system configurations based on the BoD
4. **Design Development** -- detailed engineering
5. **Construction Documents** -- issued-for-construction drawings and specs

In the oil & gas analogy, the BoD corresponds to the **pre-FEED stage** output: "Pre-FEED adds more detail to the design concept, creates a design basis and scope of work for the FEED stage." ([Assai Software - Pre-FEED](https://assai-software.com/pre-feed-creating-the-design-basis/))

### BoD vs. Design Criteria vs. Design Brief

These terms are related but distinct. The **Basis of Design** is the overarching document encompassing the entire project's design rationale. **Design criteria** are the specific quantitative parameters within the BoD (e.g., "N+1 redundancy on all cooling loops"). A **design brief** is typically a shorter procedural document describing the design approach and tools to be used. ([ProjectManagement.com - Design Basis vs. Design Criteria](https://www.projectmanagement.com/discussion-topic/188971/design-basis-vs--design-criteria); [MECS Engineering](https://mecsengineering.com/design-basis-why-is-it-so-crucial-to-have-a-well-defined-design-basis-document-for-a-successful-project/))

---

## 2. Who Typically Produces the BoD?

Under ASHRAE Guideline 0, **the design engineer (MEP consultant) writes, manages, and maintains the BoD document**. The MEP designer's responsibility is to ensure the document is completed, reviewed, and accepted by the client and commissioning manager. ([Construct and Commission - How to Write a BoD](https://constructandcommission.com/how-to-write-a-basis-of-design/))

However, the **owner drives the inputs** via the OPR. In practice:

| Delivery Model | Who Writes the BoD | Owner's Role |
|---|---|---|
| **Design-Bid-Build** | Owner's design consultant (architect/MEP engineer) | Owner or PM consultant prepares OPR; reviews and approves BoD |
| **Design-Build / EPC** | D-B contractor's engineering team | Owner or owner's engineer prepares OPR and design criteria; BoD may become part of the contractor's scope |
| **EPCM** | EPCM consultant (e.g., Norconsult on Bulk N01) | Owner approves; PM consultant may coordinate |

In all models, the owner needs someone to translate business requirements into an OPR and then validate that the BoD correctly addresses them. This is the **owner's engineer** or **PM consultant** role. As noted by AIA: "A project manager or owner's representative coordinates all parties and manages design deliverables, with a project management consultant often filling this role on large data center programs." ([AIA Contracts - DC Delivery Methods](https://learn.aiacontracts.com/articles/6437663-building-data-centers-how-to-use-consultants-and-various-delivery-methods-for-data-center-projects/))

---

## 3. Norconsult's Data Center Capability

Norconsult has dedicated data center expertise and a major reference project:

- **Dedicated DC practice**: Norconsult states it has "gained knowledge in close collaboration with data centre suppliers and contractors in projects involving data centres and power-intensive facilities with strict requirements for secure power supply and cooling." ([Norconsult - Data Centres](https://norconsult.com/services/industry/data-centres/))
- **N01 Datacentercampus (Bulk Infrastructure)**: Norconsult holds the **EPCM contract** for Bulk's N01 campus at Stoleheia, Vennesla -- one of the largest DC campuses in the Nordics (up to 800,000 sqm, 600 MW capacity). Norconsult provides project management, engineering, procurement support, and construction oversight. The scope includes design of 420 kV/145 kV transformer stations and high-voltage cable infrastructure. ([Bygg.no - Norconsult fikk datasenter-kontrakt](https://www.bygg.no/norconsult-fikk-datasenter-kontrakt/1548271!/); [Norconsult - Gronn Kraftforsyning](https://norconsult.no/aktuelt/norconsult-soerger-for-groenn-kraftforsyning-til-bulk-infrastructure-groups-nye-datasenter-i-vennesla/))
- **Scale**: Approximately 7,200 employees across the Nordics, covering all MEP disciplines, structural, electrical, civil, and environmental engineering. ([Norconsult - About](https://norconsult.com/about-us/))

---

## 4. Could Metier + Norconsult Offer BoD as a Service?

### The Engagement Model

Yes -- this is a viable and well-precedented model. The logic is:

1. **Metier leads the OPR process**: Facilitates workshops with the DC operator/owner to define business requirements, tier targets, capacity needs, phasing strategy, and budget constraints. This is a classic PM/owner's advisory engagement.
2. **Norconsult produces the BoD**: Their MEP, electrical, and civil engineers translate the OPR into a technical Basis of Design document covering power, cooling, redundancy, and site infrastructure.
3. **Metier manages the process**: Reviews BoD for completeness and alignment with OPR, manages stakeholder sign-off, tracks the BoD as a living document through subsequent design phases.

### Precedent

This mirrors how firms like RPS, CBRE, and Faithful+Gould operate in the DC market -- PM/advisory firms that coordinate engineering subconsultants to deliver owner's engineer services. NS Nordics, for example, provides "project management services for four data centres ranging in size from 10MW to 150MW currently under construction in Norway." ([NS Nordics - Data Centre Projects](https://nsnordics.com/projects/data-centre-projects-in-norway/))

The FIDIC framework explicitly supports this: the consulting engineer under an owner's contract can function as "a technical advisor by providing procurement, design review, quality control during construction, payment verification, dispute resolution, and assistance during commissioning." ([FIDIC - Role of Consulting Engineer](https://fidic.org/node/747))

### Commercial Model

The BoD is typically a **separate, early-phase deliverable** paid on a fixed-fee or time-and-materials basis. It is not embedded in later design fees -- it precedes them. Common commercial structures:

- **Fixed fee for OPR + BoD package**: Typically 1-3% of estimated construction cost for the full pre-design/conceptual scope
- **Time and materials**: For less defined scopes, especially when the operator is still evaluating sites or technologies
- **The BoD then becomes a procurement tool**: It serves as the technical specification for tendering design-build or EPC contracts

[Inference] For a typical 10-50 MW Norwegian DC project (NOK 500M-2B construction value), the OPR + BoD engagement could be valued at NOK 5-30M, depending on scope and complexity.

---

## 5. Relevant Industry Standards

Four key standards/frameworks influence what goes into a DC Basis of Design:

| Standard | Scope | Relevance to BoD |
|---|---|---|
| **Uptime Institute Tier Standard** | Performance-based tier classification (I-IV) defining redundancy and fault tolerance outcomes | The tier target is the single most important BoD parameter -- it drives all power and cooling architecture decisions ([Uptime Institute](https://uptimeinstitute.com/about-ui/press-releases/uptime-tia)) |
| **EN 50600** | European standard covering construction, power, cooling, cabling, security, and operations using four availability classes | The most comprehensive standard for European DC projects; increasingly required by Nordic operators. Covers all BoD subsystems holistically. ([GBC Engineers - DC Design Standards](https://gbc-engineers.com/news/data-center-design-standards)) |
| **ANSI/TIA-942** | US standard covering site location, architecture, security, fire safety, telecom, electrical, and mechanical systems | Widely used globally; provides prescriptive design guidance per rated tier level ([DC My Network Insights](https://dc.mynetworkinsights.com/data-center-tier-rating-1-2-3-4/)) |
| **ASHRAE Guidelines (0, 1.6, 90.4)** | Commissioning process (Guideline 0), DC commissioning (Guideline 1.6), DC energy efficiency (90.4) | Guideline 0 formally defines the OPR-to-BoD process flow. Guideline 1.6 is DC-specific. Standard 90.4 sets energy efficiency requirements that must be reflected in the BoD. ([ASHRAE Guideline 1.6](https://www.achrnews.com/articles/163600-ashrae-guideline-16-data-center-commissioning)) |

For Norwegian projects, **EN 50600 is the most relevant** as the European standard, supplemented by Uptime Institute tier certification if the operator seeks that market credibility.

---

## Conclusion

A "Basis of Design" service is a well-defined, early-phase deliverable in data center projects that sits between the owner's requirements and detailed engineering. The natural division of labor -- Metier owning the OPR process, stakeholder management, and project governance; Norconsult delivering the engineering content -- maps cleanly onto established industry practice. Norconsult's EPCM role on Bulk's N01 campus demonstrates they have the DC-specific engineering depth, while Metier's PM expertise positions them to manage the owner-side process that drives the BoD. The key commercial insight is that the BoD is a standalone, separately billable deliverable -- not something buried in later design fees -- making it a natural entry-point service for new DC operator clients.

## Sources

- [SiTESPAN - Basis of Design for Data Centers](https://sitespanllc.com/basis-of-design/)
- [Construct and Commission - How to Write a BoD](https://constructandcommission.com/how-to-write-a-basis-of-design/)
- [MECS Engineering - Design Basis](https://mecsengineering.com/design-basis-why-is-it-so-crucial-to-have-a-well-defined-design-basis-document-for-a-successful-project/)
- [AIA Contracts - DC Delivery Methods and Consultant Roles](https://learn.aiacontracts.com/articles/6437663-building-data-centers-how-to-use-consultants-and-various-delivery-methods-for-data-center-projects/)
- [Norconsult - Data Centres](https://norconsult.com/services/industry/data-centres/)
- [Norconsult - Gronn kraftforsyning Bulk N01](https://norconsult.no/aktuelt/norconsult-soerger-for-groenn-kraftforsyning-til-bulk-infrastructure-groups-nye-datasenter-i-vennesla/)
- [Bygg.no - Norconsult fikk datasenter-kontrakt](https://www.bygg.no/norconsult-fikk-datasenter-kontrakt/1548271!/)
- [ASHRAE Guideline 1.6 - ACHR News](https://www.achrnews.com/articles/163600-ashrae-guideline-16-data-center-commissioning)
- [GBC Engineers - DC Design Standards](https://gbc-engineers.com/news/data-center-design-standards)
- [Assai Software - Pre-FEED](https://assai-software.com/pre-feed-creating-the-design-basis/)
- [ProjectManagement.com - Design Basis vs. Design Criteria](https://www.projectmanagement.com/discussion-topic/188971/design-basis-vs--design-criteria)
- [NS Nordics - Data Centre Projects in Norway](https://nsnordics.com/projects/data-centre-projects-in-norway/)
- [FIDIC - Role of the Consulting Engineer](https://fidic.org/node/747)
- [CBRE - Data Center Project Services](https://www.cbre.com/services/design-and-build/project-and-program-management/data-center-project-services)
- [Uptime Institute - TIA Agreement](https://uptimeinstitute.com/about-ui/press-releases/uptime-tia)
- [GBC Engineers - DC Power Design](https://gbc-engineers.com/news/data-center-power-design)
- [GDI Engineering - MEP Design for Data Centers](https://gdiengdesign.com/the-key-role-of-mep-design-services-in-data-centers-ensuring-reliability-and-efficiency/)
