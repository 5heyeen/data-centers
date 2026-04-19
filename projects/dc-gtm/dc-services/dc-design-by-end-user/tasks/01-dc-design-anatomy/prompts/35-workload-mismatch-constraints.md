# Prompt 35: workload-mismatch-constraints

> **Prompt:** [See prompt chain for full text]

---

# When Data Center Design Meets Workload Mismatch: Physical Constraints and Retrofit Realities

## The Core Problem: Immovable Physical Constraints

A data center's fundamental physical parameters are set during design and construction. Once concrete is poured and steel is erected, several constraints become economically or physically impossible to change:

- **Floor loading capacity**: Typically designed at 1,200–2,400 kg/m² for standard IT. Structural slabs cannot be retroactively strengthened without major underpinning work.
- **Ceiling/plenum height**: Floor-to-ceiling heights of 3.0–3.6 m are common in enterprise/colo; AI facilities need 3.6–4.5 m+ for tall racks, overhead busway, and liquid cooling distribution.
- **Utility power infrastructure**: The incoming HV transformer capacity, switchgear ratings, and busduct sizing are fixed at construction. Upgrading from 20 MW to 80 MW means new utility feeds, new substations, and often new utility agreements — a 12–24 month process.
- **Cooling plant capacity and architecture**: A chilled-water plant sized for 8 kW/rack air cooling cannot serve 40+ kW/rack loads without wholesale replacement of chillers, pumps, piping, and heat rejection.
- **Building envelope and structural shell**: Blast resistance, TEMPEST shielding, and multi-layer physical security must be designed into the structure from day one.

---

## Scenario 1: Standard 8 kW/Rack Colo → AI Training at 40+ kW/Rack

This is the most common mismatch today. A facility designed for traditional enterprise colocation at 6–8 kW per rack faces cascading failures when asked to host dense GPU clusters at 40–120 kW per rack:

**What fails:**

| System | Design Basis (8 kW) | AI Requirement (40–80 kW) | Failure Mode |
|--------|---------------------|---------------------------|--------------|
| **Cooling** | ~250 W/m² air-cooled CRAH | 1,000–2,500 W/m² requiring direct liquid cooling | CRAHs cannot deliver sufficient CFM; hot spots cause thermal shutdowns. Airflow at 8 kW/rack ~800 CFM/rack; at 60 kW/rack ~6,000 CFM — physically impossible in a standard raised-floor environment. |
| **Power distribution** | 20–30A whips per rack, RPPs sized for 200 kW/row | 60–100A circuits, busway at 500+ kW/row | Existing PDUs, RPPs, and branch circuits are undersized by 5–10×. Upstream switchgear and transformer taps may also be at capacity. |
| **Floor loading** | 1,200 kg/m² (standard) | 2,000–3,500 kg/m² for liquid-cooled racks with CDUs (a single DGX B200 rack weighs ~1,500 kg before coolant) | Structural slab cracking or deflection risk. Cannot be fixed without building new structure. |
| **Cable pathways** | Designed for copper + moderate fiber | Massive fiber counts (800G optics, thousands of strands per cluster) plus liquid cooling piping in overhead or underfloor space | Pathway congestion; insufficient tray capacity; no routing for coolant piping. |
| **Raised floor** | 600 mm plenum for air distribution | Insufficient for high-CFM air delivery; liquid cooling piping needs different routing entirely | Raised floor becomes an obstacle rather than an asset. |

**Cost reality**: Retrofitting even a portion of a 10 MW colo hall to support AI density typically costs 60–80% of a purpose-built facility, while delivering only 30–50% of the performance envelope. Industry estimates from Turner & Townsend and Cushman & Wakefield (2024–2025) put purpose-built AI-ready facilities at $10–14M per MW, while deep retrofits of standard colo run $7–10M per MW but yield a compromised facility with lower PUE and operational constraints.

---

## Scenario 2: Hyperscale Cloud Compute → Liquid-Cooled GPU Clusters

Hyperscale facilities are better starting points — they have robust power infrastructure, higher floor loads, and taller ceilings — but still require significant retrofit:

**What needs to change:**

1. **Piping infrastructure**: Air-cooled hyperscale halls have no chilled water or warm water distribution to the rack row. Installing facility water piping (supply/return) throughout the data hall requires new penetrations, pipe runs, and isolation valves. Estimated cost: $500K–$1.5M per MW of liquid-cooled capacity for piping alone.

2. **Coolant Distribution Unit (CDU) space**: CDUs (rear-door or in-row) need floor space and clearance. A typical CDU serves 200–500 kW and occupies 1–2 rack positions. For a 10 MW liquid-cooled deployment, 20–50 CDU positions are needed — consuming 5–10% of the white space.

3. **Heat rejection plant upgrade**: Existing air-cooled chillers or evaporative coolers must be supplemented or replaced with systems rated for higher return water temperatures (40–45°C from GPU loops). Many operators add dry coolers for the liquid loop, which requires roof or yard space, structural loading verification, and new electrical feeds. A cooling plant upgrade for 10 MW of liquid cooling runs $3–6M.

4. **Structural reinforcement**: Liquid-cooled GPU racks with coolant can weigh 1,800–2,500 kg per rack position. If the slab was designed for 1,500 kg/m², reinforcement or load-spreading frames are required — if even possible.

5. **Electrical redistribution**: Moving from 10–15 kW/rack cloud compute to 60–100 kW/rack GPU means replacing overhead busway or adding new feeds. Upstream transformer taps may need reconfiguration.

**Timeline**: A major hyperscale retrofit takes 9–18 months versus 14–24 months for a new-build, but the retrofit delivers a facility with inherent compromises in density, PUE, and operational flexibility.

---

## Scenario 3: Enterprise DC → Sovereign/Defense Requirements

This is the hardest retrofit — and in many cases, impossible:

**What cannot be retrofitted (economically or physically):**

- **TEMPEST/EMSEC shielding**: Electromagnetic emanation protection requires a continuous conductive envelope (welded copper or steel) around the entire secure zone, including all penetrations, doors, and HVAC ducts. Retrofitting TEMPEST shielding into an existing building requires stripping interior finishes down to structure and installing a new shielded room-within-a-room. Cost: $2,000–$5,000 per m² of shielded area — often exceeding the original build cost of the data hall.

- **Blast resistance**: Structural hardening against explosive threats (vehicle-borne IED, standoff weapons) requires reinforced concrete walls (300–600 mm), blast-rated doors and windows, and progressive-collapse-resistant framing. These are integral to the structural design and cannot be meaningfully added post-construction.

- **Physical security layers**: Defense-grade facilities require multiple concentric security perimeters, vehicle barriers (crash-rated bollards/planters at the property line), man-traps, anti-climb measures, and compartmentalized access zones. Retrofitting these into a standard office-park data center is often physically impossible due to site constraints (setbacks, neighboring buildings).

- **Redundant and diverse utility feeds**: Sovereign facilities typically require N+1 or 2N utility feeds from diverse substations and diverse physical routes. If the original site has a single utility entry point, adding a second diverse feed is a utility infrastructure project that can take 2–5 years and cost millions, depending on grid proximity.

- **Classification requirements**: Facilities handling classified data must meet national standards (e.g., NSM's requirements in Norway, or equivalents under NATO COSMIC). These mandate specific construction standards that inspectors verify during construction — post-hoc compliance is rarely accepted.

**Cost comparison**: A purpose-built sovereign/defense facility costs 2–4× a standard commercial data center per MW ($18–30M/MW vs. $8–12M/MW). Attempting to retrofit an enterprise facility to sovereign standards typically costs 70–90% of a new-build while achieving inferior security posture and operational compromises.

---

## Summary: Retrofit vs. Purpose-Built Economics

| Scenario | Retrofit Cost (% of new-build) | Usable Capacity (% of purpose-built) | Practical Verdict |
|----------|-------------------------------|--------------------------------------|-------------------|
| Colo → AI Training | 60–80% | 30–50% | Rarely viable beyond small pilot zones |
| Hyperscale → Liquid-Cooled GPU | 40–60% | 70–85% | Viable for partial conversion; best starting point |
| Enterprise → Sovereign/Defense | 70–90% | 50–70% (with security compromises) | Generally not viable; build purpose-built |

The fundamental lesson: **the cheapest time to design for flexibility is at the start**. Facilities being designed today should assume workload uncertainty and build in structural, power, and cooling headroom — even if the initial tenant is traditional compute. The marginal cost of designing a slab for 2,500 kg/m² instead of 1,200 kg/m² at construction is roughly 5–10% of structural cost; doing it post-construction can be impossible at any price.

---
*Executed: 2026-04-03 | Mode: independent*
