# Prompt 29: external-infrastructure

> **Prompt:** [See prompt chain for full text]

---

# External Infrastructure for Data Center Sites: Design Constraints and Enablers

## 1. Utility Grid Connection

The electrical grid connection is typically the most critical — and most time-consuming — external infrastructure decision for a data center.

### Voltage Levels and Substation Design

Large-scale facilities (50 MW+) connect at **high voltage (HV): 66–132 kV**, stepping down through a dedicated on-site substation to medium voltage (11–33 kV) for distribution within the facility. Smaller or edge deployments connect at **medium voltage (MV): 11–33 kV** directly. The on-site substation includes HV switchgear, power transformers, MV switchgear, protection relays, and metering — representing a significant capital investment (often $10–30M+ for large sites) and requiring specialized civil and electrical engineering.

### Redundancy: Dual Feed and Ring Main

Tier III and IV facilities typically require **dual utility feeds from independent substations**, ensuring that a single point of failure in the upstream grid does not take down the site. This can be achieved through:

- **Dual radial feeds** from two separate grid substations
- **Ring main configurations** where the site sits on a looped distribution network
- **Diverse routing** of incoming HV cables through physically separated paths

The choice between these topologies depends on utility infrastructure availability and cost. In practice, securing a genuinely independent second feed — routed from a different primary substation and along a different physical path — is often difficult and expensive.

### Grid Capacity Constraints

Grid capacity is increasingly the binding constraint on data center development. In **Dublin**, a moratorium on new data center grid connections was effectively in place from 2022, with EirGrid reporting that new large-load connections could take **5–7 years** to energize due to transmission reinforcement requirements (EirGrid, "Shaping Our Electricity Future," 2023). **Amsterdam** imposed a similar pause in 2022, with grid operator Liander unable to guarantee new capacity in the region (Dutch Government / Liander public statements, 2022). Even in less constrained markets, securing 50–100 MW+ of firm grid capacity routinely takes **2–5 years** from initial application to energization, driven by planning approvals, equipment lead times for transformers, and upstream reinforcement works.

**Nordic advantage:** Norway and Sweden benefit from strong, uncongested grids backed by abundant **hydroelectric generation** (Norway generates ~98% of electricity from hydro). Statnett (Norway's TSO) and Svenska Kraftnät (Sweden) have historically been able to offer large power allocations with shorter lead times than Western European peers, though northern Norway and Sweden are now seeing increasing competition for grid capacity from industrial electrification and green hydrogen projects (Statnett, "System Development Plan," 2024).

## 2. Water Supply

Water is essential for **evaporative cooling systems** (cooling towers, adiabatic coolers, swamp coolers), which remain the most energy-efficient heat rejection method for large facilities.

### Volume and Quality Requirements

Evaporative cooling typically consumes **1.0–2.0 liters per kWh of rejected heat**, depending on climate and cycles of concentration. For a **50 MW IT load facility** with a PUE of ~1.3 (i.e., ~65 MW total, with ~15 MW of heat rejected through cooling), water consumption can reach **500,000–1,000,000 liters per day** during peak summer conditions (Uptime Institute, "Data Center Water Usage," 2023). Water quality matters: high mineral content increases blowdown rates, scaling, and chemical treatment costs. Many operators require municipal potable water or on-site reverse osmosis treatment.

### Water as a Constraint

In water-stressed regions, permitting for this volume of consumption is increasingly difficult. Some operators (notably Microsoft and Google) have committed to becoming "water positive" and are investing in **air-cooled or liquid-cooled alternatives** that eliminate evaporative water use — at the cost of higher energy consumption or capital expenditure (Google Environmental Report, 2024). **Nordic facilities** benefit from cold ambient temperatures that allow **free air cooling (economization)** for 8,000+ hours per year, dramatically reducing or eliminating water consumption for cooling — a significant design and permitting advantage.

## 3. Fiber Connectivity

### Diverse Entry Paths

Carrier-neutral data centers require a **minimum of two physically diverse fiber entry points** from different directions into the building, connecting to separate meet-me rooms. Best practice for Tier III+ calls for:

- Fiber routes from **at least two independent carriers**
- **Physically diverse paths** (different streets, ducts, manholes) to avoid single-point-of-failure from a fiber cut (e.g., construction dig-up)
- Connection to **multiple carrier hotels or internet exchanges** in the metro area

### Dark Fiber vs. Lit Services

Operators choose between **dark fiber IRUs** (Indefeasible Rights of Use — long-term leases of unlit fiber pairs, typically 15–25 years) and **lit wavelength/ethernet services** from carriers. Hyperscalers and large colocation providers overwhelmingly prefer dark fiber for cost control and capacity flexibility. In the Nordics, providers like GlobalConnect, Bulk Infrastructure, and Telia offer extensive dark fiber networks connecting data center clusters in Oslo, Stockholm, and northern locations to continental Europe.

## 4. How External Infrastructure Constrains Facility Design

| Infrastructure | Constraint | Design Impact |
|---|---|---|
| Grid capacity | MW ceiling, lead time | Phases site buildout; may require on-site generation |
| Dual feed availability | Redundancy tier achievable | Determines if N+1 or 2N utility architecture is feasible |
| Water availability | Cooling technology choice | Forces air-cooled or liquid-cooled if water is scarce |
| Fiber diversity | Carrier neutrality, latency | Dictates building orientation, MER placement, campus layout |
| Nordic climate | Cold air, hydro grid | Enables free cooling, low PUE, low-carbon power sourcing |

**In summary**, external infrastructure is not merely a procurement task — it fundamentally shapes the facility's power density, cooling architecture, redundancy tier, phasing strategy, and time-to-market. In the Nordic context, strong grids, cold climates, and available renewable power provide structural advantages, though grid congestion is an emerging risk even in these historically favorable markets.

---
*Executed: 2026-04-03 | Mode: independent*
