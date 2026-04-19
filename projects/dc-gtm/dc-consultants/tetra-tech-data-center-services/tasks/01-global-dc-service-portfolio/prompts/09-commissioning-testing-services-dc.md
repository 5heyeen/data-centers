# Prompt 09: commissioning-testing-services-dc

> **Prompt:** What commissioning and testing services are standard for hyperscale vs. enterprise data centers — Cx, IST, ITIL-aligned handover?

---

Data center commissioning is the systematic process of verifying that all installed systems — power, cooling, fire suppression, security, and ICT infrastructure — perform in accordance with the design intent. It encompasses pre-functional checks, functional testing, integrated systems verification, documentation of baseline performance, and formal handover to operations staff. Commissioning is not a single event; it is a multi-month, multi-level program that runs alongside and after construction.

## The Five-Level IST Framework

The data center industry uses a structured five-level integrated systems testing (IST) model, derived from ASHRAE Guideline 0 and widely adopted by hyperscale and enterprise operators alike:

- **Level 1 — Component Verification:** Individual equipment is checked against factory specifications before energization. Includes verification of nameplate data, physical installation, control wiring, and pre-functional checklists. Applies to UPS units, generators, PDUs, CRAHs, chillers, and switchgear.
- **Level 2 — Subsystem Testing:** Individual systems are tested in isolation with simulated inputs. Power: sequence-of-operations tests for ATS/STS, UPS bypass, and generator start. Cooling: pump rotation, flow balance, cooling tower basin levels. Each subsystem is signed off independently before integration.
- **Level 3 — System Integration Testing:** Systems are tested together to verify that control interfaces, interlocks, and alarm sequences work across subsystem boundaries — for example, verifying that a utility power failure triggers generator start, ATS transfer, UPS ride-through, and BMS alarm notifications in the correct sequence.
- **Level 4 — Integrated Systems Test (Full Facility):** Full-load testing of the complete facility under simulated IT load (load banks). Redundancy paths are validated by deliberately forcing failures — pulling a utility feed, tripping a chiller, tripping a generator. PUE is measured at design load. This level is the most resource-intensive and is often the formal acceptance threshold for hyperscale operators.
- **Level 5 — Operational Readiness Review (ORR):** Confirmation that operations staff are trained, O&M procedures are documented and approved, spare parts (attic stock) are on-site, DCIM or BMS monitoring is live, and the facility is ready for IT load introduction. Uptime Institute's M&O Stamp program evaluates similar criteria.

## Hyperscale Commissioning Approach

Hyperscale operators (AWS, Microsoft, Google, Meta, and their colocation partners) treat commissioning as a time-to-revenue problem. Key characteristics:

- **Rolling commissioning:** Cx activities run concurrently with construction rather than sequentially. A completed electrical room is commissioned while structure is still being erected elsewhere. This compresses overall program schedules by weeks or months.
- **Highly templated protocols:** Hyperscale operators maintain standardized commissioning playbooks that are applied identically across global campuses. Deviation requires formal variance approval. This reduces variability but demands that third-party Cx providers conform precisely to operator standards.
- **Dedicated embedded Cx teams:** Cx engineers are embedded in the construction delivery team from mobilization, not brought in at practical completion. This enables proactive deficiency identification during installation rather than remediation after the fact.
- **Factory Acceptance Testing (FAT):** Critical long-lead equipment — generators, modular UPS systems, prefabricated switchgear — is tested at the manufacturer's facility before shipment. FAT failures caught early are far less costly than site rework. Site Acceptance Testing (SAT) then validates that equipment survived shipping and installation.
- **Parallel IST streams:** Multiple Level 2 and Level 3 test streams run simultaneously across different power and cooling zones to compress the commissioning schedule.

## Enterprise Commissioning Approach

Enterprise data centers — corporate owned and operated, or colocation facilities serving mid-market clients — follow a more traditional sequential commissioning model:

- **Sequential phasing:** Commissioning follows substantial completion of construction. The pace is slower, reflecting smaller dedicated Cx teams and more limited schedule pressure.
- **Owner's Independent Commissioning Authority (CxA):** Third-party CxAs are common in government, regulated industries, and institutional clients (universities, hospitals). The CxA validates the contractor's own commissioning rather than replacing it — providing independent attestation to the owner that installed systems meet design intent. This role is explicitly distinct from the contractor's self-commissioning. Tetra Tech performs CxA services for data center clients.
- **ITIL-aligned handover documentation:** Enterprise environments frequently operate within an IT service management framework (ITIL). Commissioning handover must therefore bridge physical infrastructure and service management — linking critical load circuits to the configuration management database (CMDB), documenting infrastructure as configuration items (CIs), and aligning incident and change management procedures to the physical systems just commissioned. This handover package is more extensive than a simple O&M manual compilation.
- **Operations Readiness Review (ORR):** The ORR formally closes commissioning by confirming that operations staff have completed training, run-books are approved, escalation paths are documented, and monitoring thresholds are configured. For enterprise clients subject to ISO 27001 or SOC 2 audits, ORR documentation feeds directly into evidence of operational controls.

## Key Standards Governing DC Commissioning

- **ASHRAE Guideline 0-2019:** The foundational commissioning process standard; Annex G addresses data center specifics.
- **ASHRAE Guideline 1.8:** Commissioning of data center cooling infrastructure.
- **TIA-942:** Data center infrastructure standard; includes commissioning requirements for Rated 1–4 facilities.
- **BICSI 002:** Addresses commissioning for ICT and low-voltage systems within data centers.
- **Uptime Institute M&O Stamp:** Operational maturity certification that evaluates commissioning quality and ongoing operational procedures.

## Tetra Tech's Commissioning Capabilities

Tetra Tech identifies commissioning as a core data center practice area. Their services include design review for constructability and commissionability, development of Cx plans and test scripts, FAT and SAT management, Level 1–5 IST execution, punch list management, and handover documentation packages. They also offer the independent CxA role — a valuable differentiator for government and regulated enterprise clients who require third-party validation of contractor-led commissioning. Their project management wrapper — schedule tracking, RFI and deficiency management, reporting — positions them to serve as the owner's single point of accountability across a complex multi-contractor commissioning program.

---
*Executed: 2026-04-18 | Mode: independent*
