# Prompt 04: critical-vs-mechanical-load

> **Prompt:** What is the "critical load" vs "mechanical load" vs "total facility load" distinction, and why does this matter for sizing every system in the building?

---

# Critical Load vs. Mechanical Load vs. Total Facility Load

Understanding the hierarchy of electrical loads in a data center is fundamental to correctly sizing every system in the building — from utility transformers down to branch circuit breakers. Getting these distinctions wrong leads either to stranded capacity (overbuilt infrastructure that never earns revenue) or undersized infrastructure (bottlenecks that cap revenue or cause failures).

---

## The Load Hierarchy

### 1. Critical IT Load (the Revenue-Generating Load)

This is the power actually consumed by servers, storage arrays, and networking equipment — the workload that generates revenue. It is the **baseline from which everything else is sized**.

- Measured at the IT equipment power supply input
- Typically expressed in MW for wholesale facilities or kW per rack/cabinet
- Example reference point: **10 MW critical IT load**

### 2. Mechanical / Cooling Load

Cooling is the single largest parasitic load in a data center. It includes:

- **Chillers** (or dry coolers / evaporative coolers depending on climate and design)
- **Chilled water pumps** (primary, secondary, and sometimes tertiary loops)
- **Computer Room Air Handlers (CRAHs)** or in-row / rear-door cooling units
- **Cooling tower fans** and condenser water pumps
- **Humidification / dehumidification** systems

**Typical magnitude:** For a conventional chilled-water facility, the mechanical load runs **30–40% of the IT load**. With a 10 MW IT load, expect **3–4 MW** of mechanical load. More efficient designs using free cooling in cold climates (such as Norway) can push this down to 15–25%, while older or hot-climate facilities may reach 50% or more.

Mechanical systems are sized not for average conditions but for **design day conditions** — typically the hottest 0.4% or 1% of annual hours (ASHRAE design temperatures). In Tromsø, the design day might be 26°C; in Singapore, 35°C with extreme humidity. This means the installed chiller capacity may be 20–40% larger than what's needed on an average operating day.

### 3. Electrical Overhead / Losses

Every component in the power chain consumes or wastes energy:

| Component | Typical Loss |
|-----------|-------------|
| Medium-voltage transformer | 1–2% of throughput |
| UPS system (double conversion) | 3–8% of throughput (modern units ~3–4%) |
| UPS system (eco-mode / line-interactive) | 1–2% |
| Static Transfer Switch (STS) | 0.5–1% |
| Power Distribution Units (PDUs) | 1–2% |
| Lighting, security, fire suppression, BMS | 1–3% of total facility load |

**Cumulative electrical overhead** typically adds **10–15%** on top of the IT load. For a 10 MW IT facility: approximately **1–1.5 MW** in electrical losses and ancillary building loads.

### 4. Total Facility Load

This is the sum drawn at the utility meter:

**Total Facility Load = IT Load + Mechanical Load + Electrical Losses/Overhead**

For the 10 MW IT load example:

| Component | MW | % of Total |
|-----------|-----|-----------|
| Critical IT load | 10.0 | 63–71% |
| Mechanical/cooling | 3.0–4.0 | 21–25% |
| Electrical overhead | 1.0–1.5 | 7–11% |
| **Total facility load** | **14.0–15.5** | **100%** |

This gives a **Power Usage Effectiveness (PUE)** of **1.40–1.55**, which aligns with the global average of approximately 1.55–1.60 reported by the Uptime Institute's annual surveys (Uptime Institute, *Global Data Center Survey*, 2023). Best-in-class hyperscale facilities achieve PUEs of 1.10–1.20, while older enterprise facilities may exceed 2.0.

---

## Why This Matters for Sizing Every System

### Upstream Infrastructure

The **utility connection, medium-voltage switchgear, and transformers** must be sized for the total facility load — not just the IT load. A common error is securing only 10 MW of utility power for a "10 MW data center" and discovering that the facility actually needs 14–16 MW at the meter.

### Generators

Backup generators must cover the total facility load (or at least all critical and cooling loads). Generators are typically oversized by an additional **15–25%** above total facility load to allow for:

- Block loading transients during transfer
- Future growth headroom
- Engine derating at altitude or high ambient temperatures

For our 10 MW IT example, generator capacity might be **18–20 MW** nameplate across N+1 or 2N configurations.

### UPS Systems

UPS only needs to carry the **critical IT load plus essential cooling** during the transition to generator power (typically 10–15 seconds for diesel, longer for rotary systems). UPS is therefore sized to the IT load plus a margin — generally **10–20%** above the planned IT load — yielding approximately **11–12 MW UPS** for the 10 MW example.

### Cooling Plant

The cooling plant must reject the full IT heat load **plus** the heat added by electrical losses in the power chain within the data halls. This means the cooling system rejects more than just the IT load — typically **105–110%** of the IT power as thermal load. Combined with design-day sizing and redundancy (N+1 chillers), the installed cooling capacity is often **40–60%** larger than the average operating requirement.

### Distribution (Busway, PDUs, Panels)

Electrical distribution within the data hall is sized to the critical IT load at planned rack densities, with safety margins typically mandated by electrical codes (NEC in the US, NEK 400 in Norway) — usually requiring conductors and breakers rated for **125%** of continuous load.

---

## Design Margins and Growth Allowances

Prudent design applies margins at multiple levels, which compound:

| Margin Type | Typical Range | Purpose |
|-------------|--------------|---------|
| Day-1 vs. ultimate load | 30–50% spare | Phased deployment of IT |
| Design-day weather | 10–20% above average | Peak ambient conditions |
| Code-required continuous load margin | 25% (NEC 645) | Electrical safety |
| Redundancy (N+1 or 2N) | 50–100% | Fault tolerance |
| Future technology allowance | 10–20% | Higher-density IT equipment |

These margins **multiply**, not add. A facility designed for 10 MW ultimate IT load might have 20+ MW of transformer and generator nameplate capacity installed from day one if 2N redundancy and full growth headroom are built in upfront.

---

## Consequences of Getting It Wrong

**Stranded capacity** occurs when operators overbuild one part of the chain relative to another. Common examples:

- Installing 10 MW of UPS but only 6 MW of cooling: the facility is cooling-limited and 4 MW of UPS capacity earns no revenue.
- Securing 20 MW of utility power but deploying IT slowly: the operator pays demand charges and connection fees on unused capacity for years.
- Overbuilding generators for a load that never materializes.

**Undersized infrastructure** is often more damaging:

- Insufficient cooling causes thermal throttling or equipment shutdowns — immediate revenue impact and potential SLA penalties.
- Undersized utility feed creates a hard cap on growth that may take 12–24 months and significant capital to remedy (new substation, new grid connection).
- Undersized UPS means some IT load runs unprotected or the facility cannot sell its full rack capacity.

The Uptime Institute has documented that **mismatched capacity across subsystems** is one of the most common findings in Tier certification reviews, often requiring costly redesign (Uptime Institute, *Tier Standard: Topology*, 2018 edition).

---

## Key Takeaway

Every system in a data center is ultimately sized from the critical IT load, but each layer adds its own overhead and margin. A disciplined load analysis — clearly distinguishing IT load, mechanical load, electrical losses, and total facility load — is essential to avoid both waste and bottlenecks. For facility planning purposes, a useful rule of thumb: **plan for total facility power of 1.4–1.6× the IT load**, and size individual subsystems with explicit, documented margins for redundancy, growth, and peak conditions.

---
*Executed: 2026-04-03 | Mode: independent*
