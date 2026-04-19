# Prompt 31: mep-engineer-first-questions

> **Prompt:** [See prompt chain for full text]

---

# The 10 Essential Questions a Senior MEP Engineer Asks Before Designing a Data Center

*Perspective of a principal engineer at a tier-one consultancy (Arup, WSP, HDR, Jacobs)*

---

## 1. What is the total IT load at full build-out, and what is the Day 1 load?

**Why it matters:** The IT load in megawatts is the single most consequential number in the entire design. Every downstream system — switchgear, transformers, generators, UPS, cooling plant, pipe sizing, structural loads — is derived from it. A 5 MW facility and a 50 MW facility are fundamentally different buildings. Knowing the Day 1 vs. full build-out split determines whether you design a monolithic plant or a modular, phased infrastructure. Getting this wrong means either stranded capital (overbuilt) or costly retrofit (underbuilt). Industry benchmarks from the Uptime Institute's 2024 Global Data Center Survey show average planned densities continuing to climb, making early load definition critical.

## 2. What is the target power density per rack (kW/rack), and what is the density distribution?

**Why it matters:** A facility with uniform 8 kW racks is a completely different thermal problem than one with a mix of 6 kW general-compute racks and 80-120 kW GPU racks. Density drives row spacing, floor loading (structural), cooling distribution architecture, and cable pathway sizing. ASHRAE's *Thermal Guidelines for Data Processing Environments* (TC 9.9, 5th edition) defines recommended operating envelopes, but those envelopes are meaningless until you know whether you are rejecting 8 kW or 120 kW per cabinet. High-density AI clusters (such as NVIDIA GB200 NVL72 racks at 120+ kW) demand direct liquid cooling — this question directly feeds into Question 4.

## 3. What redundancy and availability level is required?

**Why it matters:** This determines the entire topology of the electrical and mechanical systems. An Uptime Institute Tier II facility (N+1 redundancy, single distribution path) requires roughly 30-40% less capital than a Tier IV facility (2N+1 redundancy, two simultaneous active distribution paths, fault-tolerant). The choice cascades into: number of utility feeds, number of generators, UPS configuration (N+1 vs. 2N), number of chiller plants, automatic transfer switch schemes, and maintenance bypass provisions. According to Uptime Institute's Tier Standard: Topology (2024), the concurrently maintainable requirement of Tier III alone adds a second distribution path for every critical system. If the client says "Tier III equivalent but not certified," you still need to know whether they want genuine concurrent maintainability or just a marketing label.

## 4. What is the cooling strategy preference: air-cooled, liquid-cooled, or hybrid?

**Why it matters:** This is arguably the question that has changed the most in the last three years due to the AI/GPU boom. Traditional air-cooled facilities use raised floors or hot/cold aisle containment with CRAH/CRAC units. But above approximately 40-50 kW per rack, air cooling becomes impractical — you simply cannot move enough air through a cabinet economically. Liquid cooling options include rear-door heat exchangers (RDHx), direct-to-chip cold plates (as used in HPE Cray EX and NVIDIA DGX systems), and full immersion cooling (single-phase or two-phase). Each choice has radically different implications for: piping infrastructure (chilled water vs. warm-water loops vs. dielectric fluid), floor loading, leak detection strategy, maintenance procedures, and PUE. The choice also determines whether you need a cooling tower/dry cooler farm, an evaporative system (which consumes water — relevant in water-scarce regions), or a heat-rejection loop that can operate on 100% free cooling for significant portions of the year.

## 5. What workload types will the facility support?

**Why it matters:** General-purpose enterprise compute, hyperscale cloud, AI/ML training, AI inference, high-frequency trading, and cold storage each have different MEP signatures. AI training clusters (GPU-heavy) produce extreme, sustained thermal loads with very little load variability — the power draw is essentially flat at 95%+ utilization for days or weeks. By contrast, enterprise workloads fluctuate significantly, meaning the cooling plant must handle high turn-down ratios. HFT (high-frequency trading) demands ultra-low latency, which constrains cable lengths and thus floor layouts. Storage-heavy facilities have lower power density but higher floor-area requirements. Knowing the workload lets the MEP engineer right-size diversity factors and avoid over- or under-provisioning.

## 6. What is the phasing and growth plan?

**Why it matters:** Very few operators build out full capacity on Day 1. A phased deployment strategy means the MEP engineer must design shared infrastructure (main switchgear, central plant, piping mains, cable risers) for ultimate capacity while deploying modular capacity in increments. This affects: sizing of main electrical bus, chiller plant staging, generator yard layout and fuel storage, and building structure (pre-provisioned penetrations, stub-outs, and structural pads). Poor phasing design is one of the most common sources of costly change orders. The engineer needs to know: how many phases, what MW increment per phase, and over what timeline.

## 7. What compliance, certification, and regulatory requirements apply?

**Why it matters:** This question covers a wide spectrum:
- **Uptime Tier Certification** (Tier I-IV) — requires design review and construction audit by Uptime Institute, imposing specific topology constraints.
- **ISO 27001** (information security) — may require physical security zones, mantrap entries, CCTV, and access control that affect architectural and electrical layouts.
- **Government/military clearance** (e.g., NATO RESTRICTED, Norwegian NSM security clearance) — adds TEMPEST shielding, Faraday cage requirements, and restricted access zones that profoundly affect the MEP design.
- **EN 50600** (European data center standard series) — covers availability classes, protection classes, and energy efficiency.
- **Local building codes and environmental permits** — noise limits (generator and cooling tower acoustic treatment), emissions limits (diesel generator run-hour caps, as seen in EU F-gas regulations and Norwegian municipal permits), and energy efficiency requirements (e.g., EU Energy Efficiency Directive recast, 2023, requiring PUE reporting for facilities above 500 kW).

Each requirement adds design constraints, cost, and schedule.

## 8. What are the site-specific constraints: grid power availability, water supply, fiber connectivity, and physical site boundaries?

**Why it matters:** The site dictates what is physically possible. Key parameters include:
- **Grid power:** Is there a nearby substation? What voltage (e.g., 66 kV, 132 kV in Norway)? What is the utility's available capacity and lead time for a new feed? In Norway, Statnett and regional grid companies (e.g., Elvia, Glitre Nett) may have multi-year queues for new grid connections — this can be the single longest lead-time item in the entire project.
- **Water:** Evaporative cooling and two-phase immersion systems consume significant water. In water-stressed areas, the design may need to shift to air-cooled chillers or dry coolers, which are less efficient but eliminate water use.
- **Fiber:** Proximity to carrier-neutral meet-me rooms or subsea cable landing stations (critical in Norway for connectivity to continental Europe and the UK).
- **Site boundaries:** Plot size, setbacks, flood zones, seismic zone, soil bearing capacity (affects structural design for heavy generator and UPS loads), and access roads for heavy equipment delivery.

## 9. What is the target timeline from design start to first IT load?

**Why it matters:** Timeline determines the design approach. A 24-month timeline may permit a bespoke, site-built facility with optimized efficiency. A 12-month timeline almost certainly requires prefabricated modular solutions (e.g., modular power skids, prefab electrical rooms, containerized cooling plant). The timeline also drives the procurement strategy: long-lead items like HV transformers (currently 52-80+ week lead times globally, per Wood Mackenzie's 2024 transformer market report), generators, and medium-voltage switchgear must be identified and ordered in the first weeks of the project. The engineer needs to back-plan from the go-live date to determine whether the design schedule is feasible.

## 10. What is the budget envelope or target cost per MW?

**Why it matters:** While engineers design to performance specifications, budget reality determines trade-offs at every level. A Tier IV facility with 2N mechanical and electrical costs roughly $10-15M per MW (industry benchmark, 2024 dollars, per Turner & Townsend's Data Centre Cost Index 2024), while a more efficient Tier III facility might be $7-10M per MW. Budget constrains choices like: generator fuel type (diesel vs. gas turbine vs. battery BESS hybrid), UPS technology (rotary vs. static), cooling efficiency level, and architectural finish quality. Knowing the budget early prevents wasted design effort on solutions the client cannot fund. It also enables value engineering: the engineer can present options with clear cost-performance trade-offs rather than a single gold-plated design.

---

## Summary

These 10 questions form the **basis of design (BoD)** document — the foundational reference that every engineering discipline (electrical, mechanical, plumbing, fire protection, structural, controls) will work from. Without clear answers, design cannot begin in any meaningful way. A principal engineer's first meeting with a client is essentially structured around extracting these answers, because ambiguity in any of them propagates uncertainty — and cost — through the entire project lifecycle.

---
*Executed: 2026-04-03 | Mode: independent*
