# Prompt 07: generator-sizing-configuration

> **Prompt:** How are generators sized and configured in data centers? What determines the number of generators, fuel type (diesel, HVO, gas), fuel storage duration, and switchover time? What are the implications of N+1 vs 2N generator configurations on site layout and civil engineering?

---

# Generator Sizing and Configuration in Data Centers

## Generator Sizing Fundamentals

Data center backup generators are typically diesel gensets in the **1–3 MW range**, with the most common unit sizes being **2.0–2.5 MW (2,500–3,000 kVA at 0.8 power factor)**. Tier IV facilities from manufacturers like Caterpillar, MTU/Rolls-Royce, and Cummins dominate this space. The choice of unit size is driven by:

- **Electrical distribution architecture**: Generators must match the downstream switchgear and transformer ratings. A 2 MW genset pairs naturally with medium-voltage (11/15 kV) distribution via step-up transformers or low-voltage (480V) paralleling buses.
- **Modularity and maintenance**: Smaller units (1.5–2 MW) allow more granular N+1 coverage and easier rolling maintenance, while larger units (2.5–3 MW) reduce total unit count and footprint for a given capacity.
- **Transport and installation constraints**: A 2 MW diesel genset with enclosure weighs approximately 15–20 tonnes, requiring adequate crane access, foundation design, and site access roads during construction and future replacement.

## Redundancy Configurations: N+1 vs 2N

The redundancy model is the single largest driver of generator yard footprint and civil engineering scope.

**N+1 configuration** provides one additional generator beyond the minimum needed to serve full IT load. For example, a 10 MW facility using 2 MW gensets requires 5 units for load plus 1 spare = **6 generators total**. This is typical of Tier III / Uptime Institute Tier III designs and represents the industry baseline for colocation and enterprise facilities.

**2N configuration** fully duplicates the entire generator plant. That same 10 MW facility would require **12 generators** (two independent sets of 6, each capable of serving full load independently). This is standard for Tier IV designs and hyperscale deployments where concurrent maintainability and fault tolerance are non-negotiable. The implications are significant:

| Aspect | N+1 (6 × 2 MW) | 2N (12 × 2 MW) |
|--------|----------------|-----------------|
| Generator pad footprint | ~500 m² | ~1,000 m² |
| Fuel storage (48h at full load) | ~120,000 litres | ~240,000 litres |
| Exhaust stacks | 6 | 12 |
| Paralleling switchgear lineups | 1 bus | 2 independent buses |
| ATS/transfer switches | Single path | Dual path |
| Civil foundations | 6 isolated vibration pads | 12 isolated vibration pads |

A 2N generator yard therefore requires **roughly double the outdoor footprint**, double the concrete foundations (typically 300–500 mm reinforced concrete pads with vibration isolation), double the fuel piping runs, and double the exhaust stack penetrations — which in turn affects site layout, acoustic enclosure planning, and planning permission (Uptime Institute, *Tier Standard: Topology*, 2018).

## Switchover and Transfer Equipment

**Automatic Transfer Switches (ATS)** detect utility failure and initiate generator start. Modern gensets achieve **start-to-rated-load in 8–12 seconds**, with the full transfer sequence (detection → start → synchronization → load transfer) completing in **10–15 seconds** for well-maintained systems. Paralleling switchgear synchronizes multiple gensets onto a common bus, enabling load sharing and staged loading to avoid thermal shock.

**Load bank testing** is performed quarterly or semi-annually, running generators at 75–100% rated load for 2–4 hours to prevent "wet stacking" (unburned fuel accumulation). This requires permanent or mobile resistive/reactive load banks and affects site electrical and ventilation design.

## Fuel Type and Storage

**Diesel** remains dominant due to energy density (~10.5 kWh/litre), long shelf life with fuel polishing, and mature supply chains. Typical fuel storage requirements:

- **24 hours**: Minimum for most Tier III designs
- **48–72 hours**: Standard for Tier III+ and Tier IV; most operators target 48 hours at full load as the baseline (Uptime Institute guidance)
- **96+ hours**: Required by some hyperscalers and government/defence clients, or in locations with unreliable fuel resupply

A 10 MW facility at 48 hours full load consumes approximately **120,000 litres of diesel**, requiring bulk storage tanks that trigger **environmental regulations**: bunding (110% containment), DSEAR/ATEX compliance in Europe, Pollution Prevention and Control permits, and spill response planning. In Norway, DSB (Direktoratet for samfunnssikkerhet og beredskap) regulates storage above 10,000 litres.

**HVO (Hydrotreated Vegetable Oil)** is a drop-in diesel replacement achieving **up to 90% lifecycle CO₂ reduction**. It is chemically identical to paraffinic diesel (EN 15940), requires no engine modification, and has superior cold-weather performance to FAME biodiesel. Major operators like Equinix and Digital Realty have committed to HVO transitions across European portfolios (Equinix sustainability report, 2023). The key constraints are **cost (20–40% premium over diesel)** and **supply chain maturity**, particularly for 96+ hour storage scenarios.

**Natural gas generators** eliminate on-site fuel storage entirely but introduce **grid dependency** — if gas supply is disrupted simultaneously with electrical utility failure, there is no backup. Gas gensets also have **slower ramp rates** and lower power density than diesel equivalents. They are most viable where dual-utility gas feeds or LNG micro-storage exist, but remain uncommon for mission-critical Tier III/IV data centers. Emissions regulations (particularly NOx) can also be more complex for gas turbines.

## Civil Engineering Implications

Generator installations require:
- **Reinforced concrete plinths** with anti-vibration mountings (spring or rubber isolators)
- **Acoustic enclosures** rated to 75–85 dB(A) at 1 metre (planning conditions often require ≤45 dB(A) at site boundary)
- **Exhaust stacks** sized for dispersion modelling compliance, typically 3–6 metres above roof level
- **Fuel infrastructure**: buried or above-ground tanks, day tanks at each genset, fuel transfer pumps, leak detection, and bunded areas
- **Access roads** rated for fuel tanker deliveries (40+ tonne gross vehicle weight)

For 2N configurations, all of these elements essentially double, making the generator yard one of the largest consumers of site area after the data halls themselves — a critical factor in site master planning and land acquisition decisions.

---
*Executed: 2026-04-03 | Mode: independent*
