# Prompt 36: expensive-late-changes

> **Prompt:** [See prompt chain for full text]

---

# The Cost of Late Design Changes in Data Center Construction

## The "Cost of Change" Curve

The construction industry has long recognized that the cost of implementing changes escalates exponentially as a project progresses through its lifecycle. This principle, well-documented in construction management literature and formalized in models like the MacLeamy Curve, follows a rough multiplier pattern:

- **During schematic design:** 1x (baseline cost)
- **During detailed design / construction documents:** 3-5x
- **During active construction:** 5-10x
- **After commissioning / handover:** 50-100x

Patrick MacLeamy, former CEO of HOK, articulated this in his influential 2004 curve showing that the ability to influence cost and performance drops rapidly once construction begins, while the cost of making changes rises steeply. In data centers — among the most systems-integrated buildings ever constructed — this curve is even steeper because of the extreme interdependency between mechanical, electrical, structural, and IT systems.

As Turner & Townsend noted in their 2023 Data Centre Cost Index, the average cost of a hyperscale data center ranges from $7-12 million per MW, meaning even small percentage overruns translate into enormous absolute costs.

## Cascade Effect: Why DC Changes Are Never Isolated

Data centers are unique in that **every major system touches every other system**. Power feeds cooling, cooling constrains IT layout, IT layout determines structural loading, structural loading affects civil works, and civil works define the building envelope. A change to any one domain cascades through all others.

### Example 1: Switching from Air Cooling to Liquid Cooling Mid-Construction

This is arguably the most disruptive mid-construction change possible. What appears to be a "cooling swap" actually triggers redesign across nearly every discipline:

| Discipline | Impact |
|---|---|
| **Mechanical / Piping** | Entirely new chilled water or coolant distribution piping runs to each rack row; new Coolant Distribution Units (CDUs) requiring dedicated floor space; leak detection systems throughout |
| **Structural** | Liquid-cooled racks and piping impose different (often higher) floor loading — up to 2-3x the weight of air-cooled equivalents. Structural slabs and raised floor systems may need reinforcement |
| **Architectural / Space Planning** | CDU rooms, pipe risers, and valve stations consume whitespace previously allocated to IT. Rear-door heat exchangers or direct-to-chip manifolds require different rack clearances |
| **Civil / Floor Penetrations** | New floor penetrations for piping runs, containment trenches for leak management, and potentially modified drainage systems |
| **Heat Rejection Plant** | Air-cooled chillers may need to be replaced or supplemented with cooling towers or dry coolers rated for higher delta-T liquid loops. This affects rooftop or yard structural loading, water treatment, and local permitting |
| **Electrical** | Pump power, CDU power, and reduced fan power change the electrical load profile, potentially requiring redistribution of panel capacity |
| **Controls / BMS** | Entirely new control sequences for liquid flow, temperature, pressure, and leak response |

Industry estimates suggest this kind of mid-construction pivot can **add 20-40% to total project cost and 6-12 months of delay**. A well-documented example is the wave of retrofits triggered when hyperscalers began adopting liquid cooling for AI/GPU clusters in 2023-2024. Vertiv's 2024 analysis noted that facilities originally designed for 10-15 kW/rack air cooling required near-complete mechanical redesigns to support 40-100+ kW/rack liquid-cooled deployments. JLL's 2024 Data Center Outlook reported that retrofit costs for liquid cooling readiness in existing shells averaged 25-35% above original mechanical budgets.

### Example 2: Changing from N+1 to 2N Redundancy

Upgrading redundancy topology mid-build is effectively **redesigning the entire electrical backbone**:

- **UPS systems** double in count (or capacity), requiring additional floor space, structural support, and battery rooms
- **Generators** double, requiring larger fuel systems, exhaust routing, acoustic treatment, and potentially new planning permissions for emissions
- **Switchgear and distribution** must be replicated with fully independent paths — A and B feeds with no single point of failure — requiring new bus risers, cable trays, and distribution boards
- **Physical routing** of redundant paths demands spatial separation (often on different sides of the building), which may conflict with the already-constructed cable tray layout and structural penetrations

The Uptime Institute has documented that moving from Tier II (N+1) to Tier IV (2N) topology typically increases electrical infrastructure costs by **60-90%** and mechanical costs by 40-60%. Attempting this after construction has begun — when cable trays are hung, slabs are poured, and switchgear rooms are sized — multiplies this further with demolition, rework, and delay costs.

### Example 3: Increasing Power Density from 10 kW to 40 kW per Rack

A 4x increase in rack power density triggers:

- **Transformer upgrades** — medium-voltage transformers sized for the original load are now undersized; replacements have 30-52 week lead times (Eaton and Schneider Electric both reported extended lead times through 2024-2025)
- **Cable upsizing** — higher amperage requires larger conductor cross-sections, which may not fit existing cable trays or conduit runs
- **Switchgear re-rating** — bus bars, breakers, and panelboards rated for original loads must be replaced
- **Cooling plant expansion** — 4x the heat load requires proportionally larger cooling capacity, potentially exceeding the heat rejection capacity of the site
- **Floor loading** — denser IT equipment is heavier; structural verification is required

## Why This Matters for Project Governance

These cascade dynamics are why the **front-end loading (FEL)** methodology — investing heavily in early-stage design validation before committing to construction — delivers outsized returns in data center projects. The Construction Industry Institute (CII) research demonstrates that projects with high FEL maturity (FEL 3 / "fully defined") achieve cost predictability within ±10%, while poorly defined projects routinely overrun by 30-50%.

For data center operators, this means that engaging experienced project management, owner's engineering, and commissioning expertise during the design phase — not after construction is underway — is the single highest-ROI decision in the entire project lifecycle. Every dollar spent on rigorous design validation can avoid five to ten dollars in construction rework and fifty or more in post-handover remediation.

---
*Executed: 2026-04-03 | Mode: independent*
