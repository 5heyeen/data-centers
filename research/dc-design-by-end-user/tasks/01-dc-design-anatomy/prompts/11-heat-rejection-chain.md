# Prompt 11: heat-rejection-chain

> **Prompt:** [See prompt chain for full text]

---

# Heat Rejection Chain for Data Center Cooling Systems

## Overview

The heat rejection chain in a data center moves thermal energy from the IT load (servers) through successive loops to the ambient environment. The number of loops, working fluids, and rejection equipment vary by cooling architecture. Below is a comprehensive mapping from rack to atmosphere for each major cooling type.

---

## 1. Air-Cooled IT (Traditional Raised Floor / Row-Based)

### Heat Rejection Chain

**Rack (server fans) → Room air → CRAH/CRAC unit → Chilled water loop → Chiller → Ambient air**

| Stage | Medium | Typical Delta-T | Key Parameters |
|-------|--------|-----------------|----------------|
| Server → Room | Air | 10–15 °C (supply 18–27 °C per ASHRAE A1, return 30–40 °C) | Airflow: 150–250 CFM per kW |
| CRAH coil | Air-to-water HX | Air side ΔT ~12–15 °C | Face velocity 2.0–2.5 m/s |
| Chilled water loop | Water | **7 °C supply / 12 °C return (ΔT = 5 °C)** — widened to 7–8 °C in modern high-efficiency plants | Flow: ~2.4 L/min per kW at ΔT 5 °C (Q = ṁ·Cp·ΔT) |
| Chiller → Condenser | Refrigerant | Evaporator ~5–6 °C, condenser ~35–45 °C | COP varies by type (see below) |
| Condenser heat rejection | Air or water to atmosphere | Condenser water: 30 °C supply / 35 °C return typical | Cooling tower approach: 3–5 °C to wet-bulb |

### Chilled Water Pipe Sizing

| Pipe Diameter (nominal) | Max Velocity | Pressure Drop Target |
|--------------------------|-------------|---------------------|
| DN50–DN100 | 1.5–2.5 m/s | 200–400 Pa/m (20–40 mmWC per 100 m) |
| DN150–DN300 | 2.5–3.0 m/s | 150–300 Pa/m |
| DN350+ | 3.0–3.5 m/s | 100–250 Pa/m |

*General rule: keep velocity below 3 m/s to limit noise and erosion; pressure drop target of 200–400 Pa/m for economical pump sizing.* [ASHRAE Fundamentals Handbook, Ch. 22]

---

## 2. Direct Liquid Cooling (DLC) — Warm Water / Hot Water

### Heat Rejection Chain

**CPU/GPU cold plate → CDU (Coolant Distribution Unit) → Facility water loop → Dry cooler / Adiabatic cooler → Ambient**

This architecture can often **eliminate chillers entirely** because the supply temperatures (35–45 °C) are above ambient for much of the year in Nordic/temperate climates.

| Stage | Medium | Typical Delta-T | Key Parameters |
|-------|--------|-----------------|----------------|
| Cold plate → CDU primary | Propylene glycol/water or treated water | Server inlet 35–45 °C, outlet 45–55 °C (**ΔT = 10–15 °C**) | Flow per server: 1.0–2.5 L/min; per rack (8–12 GPUs): 15–30 L/min |
| CDU heat exchanger | Plate HX (liquid-to-liquid) | Primary-to-secondary approach: 2–3 °C | CDU capacity: 40–120 kW typical |
| Facility water (secondary) loop | Treated water | **40 °C supply / 50 °C return (ΔT = 10 °C)** typical | Flow: ~1.4 L/min per kW at ΔT 10 °C |
| Heat rejection (dry cooler) | Water-to-air | Approach to ambient: 8–15 °C (dry), 5–8 °C (adiabatic) | Dry cooler capacity derated at high ambient |

### Key Advantage — Elevated Return Temperatures

With 45–55 °C return water, free cooling is available year-round in climates with ambient temperatures below ~35 °C. This is a primary reason Nordic data centers (Norway, Sweden, Finland) favor DLC — **PUE contributions from cooling can drop to 0.02–0.05** vs. 0.15–0.30 for chilled water systems. [The Green Grid; Open Compute Project Rack & Power specifications]

---

## 3. Rear-Door Heat Exchangers (RDHx)

### Heat Rejection Chain

**Rack (server fans push hot air) → Rear-door water coil → Facility water loop → Chiller or dry cooler → Ambient**

| Stage | Typical Delta-T | Notes |
|-------|-----------------|-------|
| Air across RDHx coil | Neutralizes 60–100% of rack heat | Passive (no fans in door) or active (fans assisted) |
| Facility water | **15–21 °C supply / 25–30 °C return (ΔT = 8–12 °C)** | Higher supply temp than CHW enables economizer hours |
| Heat rejection | Per chiller/dry cooler specs below | Can use same plant as CHW but at elevated setpoint |

*RDHx is often a transition technology — it captures heat at the rack without modifying servers, useful for 15–30 kW/rack densities.* [Motivair, CoolIT Systems product literature]

---

## 4. Two-Phase Immersion Cooling

### Heat Rejection Chain

**Server submerged in dielectric fluid → Boiling at chip surface → Vapor condenses on condenser coils → Facility water loop → Dry cooler / Cooling tower → Ambient**

| Stage | Medium | Typical Temperatures |
|-------|--------|---------------------|
| Chip → Fluid boiling | Engineered dielectric (e.g., Novec 7100, boiling point ~61 °C) | Fluid bath: 49–55 °C |
| Vapor → Condenser | Condensation HX (vapor-to-liquid) | Condenser water in: 35–40 °C, out: 45–50 °C |
| Facility water | Water | **ΔT = 8–10 °C** |
| Heat rejection | Dry cooler or adiabatic | Free cooling viable year-round in temperate climates |

*Single-phase immersion uses similar chains but without phase change — fluid is pumped through a CDU-like heat exchanger at 35–45 °C, analogous to DLC warm water.* [GRC, LiquidCool Solutions, Submer documentation]

---

## 5. Heat Rejection Equipment — Detailed Comparison

### 5.1 Chillers

| Type | Compressor | Typical COP (Full Load) | EER (kW/kW) | Capacity Range | Best Application |
|------|-----------|------------------------|-------------|----------------|------------------|
| **Air-cooled screw** | Screw | 2.8–3.5 | 10–12 | 200–1,500 kW | Small-medium DC, no water access |
| **Air-cooled scroll** | Scroll | 2.5–3.2 | 9–11 | 50–500 kW | Edge, small DC |
| **Water-cooled screw** | Screw | 4.5–5.5 | 16–19 | 300–2,000 kW | Medium DC with cooling towers |
| **Water-cooled centrifugal** | Centrifugal (oil-free magnetic bearing) | 5.5–7.0 | 19–24 | 1,000–10,000+ kW | Large-scale DC, highest efficiency |
| **Water-cooled centrifugal (variable speed)** | Centrifugal VFD | 6.0–10.0+ (at part load) | 20–35+ | 2,000–15,000 kW | Hyperscale, IPLV-optimized |

*IPLV (Integrated Part Load Value) is more relevant than full-load COP for DC applications — typical IT loads run at 40–70% of design.* Water-cooled centrifugal chillers with VFDs can achieve IPLV of 8.0–10.0+ COP. [Trane, Carrier, Johnson Controls published AHRI-certified data]

### 5.2 Cooling Towers

| Type | Mechanism | Approach to Wet-Bulb | Water Consumption | Water Quality Concern |
|------|-----------|----------------------|-------------------|-----------------------|
| **Open circuit (crossflow/counterflow)** | Direct evaporative — water contacts air | 3–5 °C | 2.5–3.5 L/kWh rejected | **High** — Legionella risk, biological growth, scale, corrosion; requires chemical treatment, blowdown, conductivity monitoring |
| **Closed circuit (fluid cooler)** | Evaporative spray over closed coil | 5–8 °C | 1.5–2.5 L/kWh | **Medium** — spray water needs treatment, but process fluid is isolated |

*Typical condenser water temperatures: 30 °C supply to chiller condenser, 35 °C return to tower (ΔT = 5 °C). Cycles of concentration: 3–6 for open towers. Blowdown = evaporation / (cycles – 1).*

### 5.3 Dry Coolers (Sensible Cooling Only)

| Parameter | Typical Value |
|-----------|--------------|
| Approach to dry-bulb | 8–15 °C |
| Fluid ΔT | 5–10 °C |
| No water consumption | Zero — no evaporative loss |
| Footprint | Large (1.5–2× cooling tower for same capacity) |
| Best suited for | DLC warm water loops (40 °C+), Nordic climates |
| Limitation | Cannot reject heat when ambient approaches fluid supply temp |

### 5.4 Adiabatic Hybrid Coolers

| Parameter | Typical Value |
|-----------|--------------|
| Approach to wet-bulb | 5–10 °C (when adiabatic pads activated) |
| Dry mode approach to dry-bulb | 10–15 °C |
| Water consumption | 60–80% less than open cooling tower (spray only on hot days) |
| Operation | Dry below ~25 °C ambient; adiabatic spray above threshold |
| Water quality | Pre-treatment for spray pads (softening to prevent scale), but **closed process loop** — no Legionella risk in process water |

*Adiabatic coolers (e.g., BAC TrilliumSeries, Güntner Hydrospray) are increasingly favored for Nordic and European DCs — they provide near-cooling-tower performance with minimal water use and no open-loop water treatment burden.* [BAC, Güntner, Airedale product data]

---

## 6. Water Quality Requirements

| Loop Type | Conductivity | pH | Treatment | Biocide | Glycol |
|-----------|-------------|-----|-----------|---------|--------|
| **Closed chilled water** | < 100 µS/cm | 8.0–10.0 | Corrosion inhibitor (molybdate/nitrite) | Biocide annually or as needed | Optional (if freeze risk; typically 25–35% PG) |
| **Open condenser water (cooling tower)** | Monitored; blowdown at 1,500–3,000 µS/cm | 7.5–9.0 | Scale inhibitor, dispersant, corrosion inhibitor | Continuous (oxidizing + non-oxidizing) | None |
| **DLC facility water (closed)** | < 50 µS/cm preferred; some specs < 10 µS/cm | 7.0–9.0 | Deionization or RO makeup; corrosion inhibitor | Biocide as needed | Rare in warm-water loops |
| **DLC server-side (primary)** | Often deionized < 1 µS/cm for direct chip contact | 6.5–8.5 | DI or distilled water; oxygen scavenger | None typically | Per vendor spec |
| **Immersion dielectric** | N/A (non-conductive fluid) | N/A | Filtration for particulates; fluid top-up for evaporative loss | None | N/A |

*Closed-loop water quality is governed by VDI 2035 (Germany), BS 8552 (UK), or ASHRAE guidelines depending on jurisdiction. In Norway, district heating/cooling connection standards (NS-EN 14336) may also apply.* [ASHRAE Handbook — HVAC Systems and Equipment, Ch. 48; VDI 2035]

---

## 7. Pump Head Pressure & Flow Rates — Summary Table

| System | Typical Flow Rate | Total Pump Head | Notes |
|--------|------------------|-----------------|-------|
| Chilled water (primary) | 2.4 L/min per kW (ΔT 5 °C) | 150–250 kPa (15–25 m) | Constant flow in primary loop |
| Chilled water (secondary) | Variable — matches load | 200–400 kPa (20–40 m) | VFD-driven; longest run determines head |
| Condenser water | 3.0 L/min per kW (ΔT 5 °C) | 100–200 kPa (10–20 m) | Open tower adds static head |
| DLC facility water | 1.4 L/min per kW (ΔT 10 °C) | 150–350 kPa (15–35 m) | Higher ΔT = lower flow = smaller pipes |
| DLC server-side (per rack) | 15–30 L/min (80–200 kW rack) | 50–150 kPa (CDU internal) | Managed by CDU pumps |

---

## 8. Typical System Configurations by Operator Archetype

| Archetype | Primary Cooling | Heat Rejection | Typical PUE |
|-----------|----------------|----------------|-------------|
| **Legacy colo / enterprise** | CRAH + chilled water 7/12 °C | Air-cooled chiller or water-cooled chiller + cooling tower | 1.4–1.6 |
| **Modern hyperscale** | Warm water economizer + DLC | Adiabatic cooler, chiller only for peak trim | 1.1–1.25 |
| **Nordic / cold climate** | DLC warm water or chilled water with free cooling | Dry cooler (free cooling >95% of hours in Norway) | 1.05–1.15 |
| **AI/HPC (>50 kW/rack)** | Direct liquid cooling mandatory for GPU | CDU → dry cooler or adiabatic; supplemental CRAH for auxiliary heat | 1.08–1.20 |

---

## Key Design Relationships

**Flow rate formula:**
$$\dot{V} = \frac{Q}{\rho \cdot c_p \cdot \Delta T}$$

Where Q = heat load (kW), ρ = water density (~1.0 kg/L), c_p = specific heat (4.18 kJ/kg·K), ΔT in °C.

- At **ΔT 5 °C** (chilled water): ~2.87 L/min per kW
- At **ΔT 10 °C** (DLC warm water): ~1.44 L/min per kW
- At **ΔT 15 °C** (aggressive DLC): ~0.96 L/min per kW

**Doubling ΔT halves flow rate, halves pipe cross-section area, and reduces pump energy by approximately 75%** (pump power scales with cube of flow at constant system resistance). This is the fundamental economic argument for warm-water DLC over chilled water.

---

### Sources & References

- ASHRAE TC 9.9, *Thermal Guidelines for Data Processing Environments*, 5th Edition (2021)
- ASHRAE Handbook — HVAC Systems and Equipment (2020), Chapters 22, 39, 40, 48
- The Green Grid, *PUE: A Comprehensive Examination of the Metric* (WP#49)
- Open Compute Project, *Advanced Cooling Solutions* specification (2023)
- VDI 2035, *Prevention of Damage in Water Heating Installations*
- Trane Engineers Newsletter, *Chiller Plant Design* (Vol. 48, No. 2)
- Güntner Product Selection Software — Adiabatic Cooler Performance Data
- BAC TrilliumSeries Technical Documentation
- CoolIT Systems CDU specifications; GRC immersion cooling datasheets

---
*Executed: 2026-04-03 | Mode: independent*
