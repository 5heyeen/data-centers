# Prompt 17: service-lines-claimed-but-poorly-executed

> **Prompt:** What service lines do generalist engineering firms typically claim but execute poorly in DC contexts (e.g., ICT design, low-voltage, DCIM integration)?

---

## Answer

A persistent gap in the data center market is the distance between what generalist engineering firms claim on capability statements and what they can actually deliver. The following service lines are the most commonly overclaimed and underdelivered.

### 1. ICT and Structured Cabling Design

Most MEP (mechanical, electrical, plumbing) firms include "telecommunications" or "low-voltage systems" in their capability matrix. In practice, this means they can locate cable trays on a drawing and coordinate pathway routing with other disciplines. Genuine ICT design for a data center — the design of structured cabling infrastructure, fiber plant, patch panel architecture, horizontal and vertical pathway design, and MDA/HDA/EDA topology — requires BICSI-certified professionals (RCDD: Registered Communications Distribution Designer) who understand TIA-942, ISO/IEC 11801, and the operational workflow of cabling a live environment in phases. Firms without RCDD staff on the delivery team routinely produce cabling designs that are technically compliant but operationally unworkable: insufficient slack management, wrong bend radius allowances, inadequate labeling specifications, and pathway densities that cannot be maintained without service interruptions.

### 2. DCIM Integration

Data Center Infrastructure Management (DCIM) software integration sits at the intersection of IT, OT, and building management systems — a convergence zone that most engineering firms are structurally unprepared to operate in. Claims to "DCIM integration" often mean "we can specify a DCIM platform and interface with the vendor." Genuine DCIM integration involves: defining asset, capacity, and power data models; establishing data feeds from BMS, EPMS, and environmental monitoring systems; configuring workflow engines for change management; and handing over a populated, calibrated system to the operations team. This requires staff who understand both the engineering systems being monitored and the IT data management layer — a skill set that sits in very few engineering firms. The usual failure mode is delivery of a DCIM platform with incomplete integration, poor data quality, and no operational training, which the owner's team then ignores in favor of spreadsheets.

### 3. Advanced Cooling Design — Liquid Cooling, DTC, Immersion

The transition from air-cooled facilities to high-density liquid cooling is a genuine technological discontinuity, not an incremental upgrade. Firms that have designed air-cooled data centers for decades do not automatically possess the competencies to design direct-to-chip (DTC) cooling loops, rear-door heat exchangers, or single-phase/two-phase immersion systems. The engineering challenges are distinct: secondary coolant loop hydraulics, dielectric fluid selection and compatibility, leak detection system design, materials compatibility across the entire wetted pathway, and integration with IT vendor cooling distribution units (CDUs). Most large engineering firms list liquid cooling as a service line because they have attended vendor briefings and issued a few concept designs. The number of firms that have actually commissioned a live DTC or immersion deployment is a small fraction of those making the claim. The failure mode is a design that is theoretically sound but cannot be built or maintained by the available contractor base.

### 4. Commissioning Authority Services

The gap between "we do commissioning" and "we operate as a rigorous, independent Commissioning Authority" is large. Many engineering firms include commissioning in their MEP scope as a QA activity — they verify that equipment runs, check set points, and produce a punch list. A genuine CxA program runs from design review through to operational acceptance: reviewing sequences of operation for correctness before construction, developing integrated test procedures, executing a 5-level IST framework, and maintaining independence from the construction manager so that failures are reported without institutional pressure to minimize them. ASHRAE 0-2019, ASHRAE 1-2007, and Uptime Institute guidelines define what rigorous commissioning looks like. Most generalist firms do not follow these frameworks and do not maintain CxA independence from their own design and construction teams, which means commissioning becomes a formality rather than a verification process.

### 5. Physical Security Systems Integration

Physical security in a data center is not a standard access control and CCTV specification. It involves multi-layer access control (perimeter, building, floor, suite, cage, rack), integration with the operator's Security Operations Center (SOC), PSIM (Physical Security Information Management) platform configuration, mantrap and airlock design with anti-tailgating logic, biometric system integration, and visitor management workflows tied to change control. It also requires understanding the compliance requirements of clients operating under ISO 27001, SOC 2, PCI-DSS, or government security standards. Generalist firms routinely specify off-the-shelf access control and CCTV systems without integrating them into a coherent security architecture, leaving the operator to resolve gaps during fit-out.

### 6. Operational Consulting and O&M Advisory

Engineering design firms are trained to produce a building that meets specification at handover. They are rarely trained to think about what it costs to operate that building over a 20-year asset life, or how operational constraints should shape design decisions. Services labeled "operational consulting" or "O&M advisory" from design firms often amount to producing maintenance manuals and spare parts schedules — both of which are contractual deliverables rather than advisory services. Genuine operational consulting — staffing model design, incident response procedure development, maintenance strategy optimization, operator training program development — requires staff with hands-on data center operations experience (shift leads, critical environment engineers, operations managers). This profile almost never exists in a design firm's talent base.

### 7. BIM-to-Operations Handover and Digital Twin Delivery

Building Information Modeling (BIM) is now a standard design tool. The claim that a firm delivers a "digital twin" or "BIM for FM" often means they will hand over a completed Revit model at project close. A model that is useful for facility management requires a different standard of completeness: all asset data populated to agreed LOD (Level of Development/Detail), COBie data export aligned with the CMMS platform, maintenance-relevant asset attributes included (not just geometry), and a handover process that transfers the model into a live FM workflow rather than an archive. The gap between "we deliver BIM" and "we deliver a model that the FM team actually uses" is wide, and most firms fall on the wrong side of it.

---
*Executed: 2026-04-18 | Mode: independent*
