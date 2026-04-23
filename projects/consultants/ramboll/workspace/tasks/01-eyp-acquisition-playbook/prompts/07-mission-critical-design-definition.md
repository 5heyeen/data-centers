# Prompt 07: mission-critical-design-definition

> **Prompt:** What does "mission-critical design" mean in the context of EYP/Ramboll — how does it differ from standard commercial building design?

---

"Mission-critical" refers to facilities where system downtime has direct, severe, and quantifiable consequences — financial loss, service disruption, reputational damage, or safety impact. This changes the design philosophy at a fundamental level.

**Redundancy as a primary design driver**
Standard commercial buildings are designed to code minimum for most systems. Mission-critical facilities are designed around failure scenarios: what happens when any single component fails, is taken offline for maintenance, or is hit by a supply chain event? Redundancy levels (N, N+1, 2N, 2N+1) are not upgrades — they are the baseline design question. This adds 30–50% capital cost premium over equivalent non-redundant systems.

**Concurrency of maintenance**
For higher-tier facilities, maintenance can be performed on any system component without taking IT load offline. This requires isolation switching, bypass paths, and physical separation.

**Power density and floor loading**
A standard office building might carry 2–4 kW/rack equivalent load. An AI compute cluster might require 80–150 kW/rack with liquid cooling. The structural, electrical, and thermal implications are categorically different.

**Commissioning rigor**
Standard buildings are commissioned at component level. Mission-critical facilities require integrated systems testing (IST) — simulating utility failure, generator failure, cooling failure, and combined failure scenarios under full IT load before handover. This requires a commissioning plan written into the design from the start.

**Documentation permanence**
Mission-critical operators need as-built documentation that is accurate, complete, and maintained over the life of the facility. Change management during construction is more rigorous because an undocumented change can create a hidden single point of failure.

**Security integration**
Physical security (access control zones, mantrap design, blast resistance, anti-vehicle measures) is integrated into the architecture from the start.

The practitioner who has only designed commercial offices or hospitals will not intuitively understand these requirements — which is why the talent in a specialist firm like EYP MCF is genuinely hard to replicate.

---
*Executed: 2026-04-17 | Mode: independent*
