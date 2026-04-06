# Prompt 14: cooling-mep-layout-comparison

> **Prompt:** [See prompt chain for full text]

---

# How Cooling Architecture Reshapes Data Center MEP Layout: Air-Cooled vs. Liquid-Cooled Facilities

## Overview

The shift from traditional air cooling to direct liquid cooling (DLC) represents the most significant MEP redesign in data center history. The differences are not incremental — they fundamentally alter the building form, mechanical plant sizing, piping topology, and operational profile.

---

## (A) Traditional Air-Cooled Facility: 10 kW/rack, 1,000 racks, 10 MW IT Load

### Data Hall Layout
The classic air-cooled data hall uses a **raised floor plenum** (typically 600–900 mm) as the primary air distribution pathway. CRAH units are positioned along the **perimeter walls or at end-of-row positions**, drawing hot return air from above the hot aisle and pushing chilled air into the underfloor plenum, where it emerges through perforated tiles in front of racks. Hot/cold aisle containment (curtains or rigid panels) is standard practice to prevent bypass airflow.

- **Data hall clear height:** 3.0–3.5 m above raised floor (total slab-to-slab ~3.6–4.2 m)
- **Typical footprint per MW of IT:** approximately 180–250 m² of white space, depending on rack density and containment effectiveness (Uptime Institute, 2020 estimates; Turner & Seader, *ASHRAE Datacom Series*)
- **Total white space for 10 MW:** roughly 1,800–2,500 m²
- **CRAH count:** At ~200–300 kW sensible cooling per CRAH, a 10 MW hall requires **35–50 CRAH units**, each occupying ~3–4 m² of floor space and consuming valuable rack positions along the perimeter

### Mechanical Plant & Piping
- **Chilled water piping:** Large-diameter headers (200–350 mm / 8–14") run beneath the raised floor or overhead to feed CRAHs. Supply temperature is typically **7–12°C**, which is too cold for economizer operation in most climates for much of the year.
- **Chiller plant room:** Houses centrifugal or screw chillers in a **primary/secondary or variable-primary pumping** arrangement. For 10 MW IT at a PUE of ~1.4, the cooling plant must reject approximately **14 MW total**. The chiller plant room typically requires **400–600 m²**, housing 3–5 large chillers (with N+1 redundancy), primary pumps, secondary pumps, buffer tanks, and water treatment.
- **Roof/yard equipment:** Cooling towers (for water-cooled chillers) or air-cooled condensers occupy significant area — typically **0.8–1.2 m² of condenser/tower footprint per kW of heat rejected** at the condenser, translating to **1,500–3,000 m²** of roof or yard space for a 10 MW facility (Schneider Electric White Paper 25; Munters technical references).
- **Mechanical plant as % of total building footprint:** Typically **40–55%** of the total building is devoted to mechanical/electrical plant, corridors, and support space — only 45–60% is usable white space.

### Maintenance Access
- CRAH units require front and rear service clearance (600–900 mm each side)
- Raised floor tiles must be liftable for underfloor plenum inspection and cleaning
- Chiller plant rooms need crane access or roll-in paths for compressor/motor replacement

---

## (B) Liquid-Cooled AI Facility: 60 kW/rack, 500 racks, 30 MW IT Load

### Data Hall Layout
A DLC-first facility eliminates the raised floor entirely in favor of **slab-on-grade construction** with overhead services. There are no CRAHs, no perforated tiles, and no underfloor plenum. Instead, **Coolant Distribution Units (CDUs)** are placed within the data hall — typically one CDU serving **8–16 racks** — positioned at end-of-row or in a dedicated mid-row service corridor.

- **Data hall clear height:** 4.0–5.0 m (slab-to-slab may reach 5.5–6.0 m) to accommodate **overhead piping manifolds, cable trays, and busway** stacked vertically
- **Typical footprint per MW of IT:** approximately **40–80 m²** of white space — a **3–5× reduction** compared to air-cooled designs, because racks are denser, there are no CRAHs consuming floor space, and no hot/cold aisle spacing constraints driven by airflow dynamics (extrapolated from published NVIDIA DGX SuperPOD reference architectures and GRC/Motivair CDU deployment guides)
- **Total white space for 30 MW:** roughly **1,200–2,400 m²** — comparable to or smaller than the 10 MW air-cooled hall, despite carrying **3× the IT load**
- **CDU count:** At 250–500 kW per CDU, a 30 MW hall requires **60–120 CDUs**, each approximately the size of a small refrigerator (~0.6 × 0.8 m footprint)

### Mechanical Plant & Piping
- **Facility water loop:** The CDUs act as a heat exchanger boundary between the **IT-side coolant loop** (typically propylene glycol or engineered dielectric fluid, supply 35–45°C) and the **facility water loop** (supply ~30–40°C). This warm-water regime is transformative.
- **No or minimal chiller plant:** Because the facility water returns at **40–55°C**, dry coolers can reject this heat to ambient in virtually **any climate where ambient is below ~35°C** — meaning **year-round free cooling in Norway and most of Northern Europe**. The chiller plant is either eliminated entirely or reduced to a small trim chiller for supplemental air conditioning of the hall environment (lighting load, personnel comfort, residual server fan heat — typically only 5–10% of total load). This can shrink the mechanical plant room to **50–150 m²**.
- **Piping density and topology:** This is where complexity shifts dramatically. Instead of a few large headers feeding perimeter CRAHs, the liquid-cooled facility has **dense manifold piping running overhead to every single rack**. Each rack has **quick-disconnect (dripless) fittings** on supply and return lines (typically 19–25 mm / ¾–1" per rack). Row-level manifolds (50–100 mm / 2–4") feed from CDUs. The total number of pipe joints and fittings increases by an order of magnitude — a 500-rack hall may have **1,000+ quick-disconnect points**, each a potential leak site.
- **Roof/yard equipment:** Dry coolers replace cooling towers. Because the approach temperature is favorable (rejecting 45–55°C water to, say, 20°C ambient), the **dry cooler footprint is significantly smaller** — roughly **800–1,500 m²** for 30 MW, despite the 3× higher heat load. No water treatment for cooling tower blowdown; no legionella risk; no plume. (Vertiv, Motivair, and CoolIT technical documentation)
- **Mechanical plant as % of total building:** Drops to **20–35%**, with far more of the building dedicated to productive IT space.

### Maintenance Access
- CDUs require service clearance but are modular and rack-scale — no large crane lifts
- Overhead piping requires **accessible catwalks or maintenance platforms** at height, changing the building's structural requirements
- Leak detection systems (cable-based sensors along every pipe run and under every CDU) are **critical and extensive** — a single leak at 60 kW/rack affects far more compute than at 10 kW/rack
- Quick-disconnect fittings enable **hot-swappable rack maintenance** without draining the loop, a significant operational advantage

---

## Comparative Summary

| Parameter | Air-Cooled 10 MW | Liquid-Cooled 30 MW | Ratio / Note |
|---|---|---|---|
| **IT load** | 10 MW | 30 MW | 3× more IT in liquid |
| **Rack count** | 1,000 | 500 | Half the racks |
| **White space footprint** | 1,800–2,500 m² | 1,200–2,400 m² | Similar area, 3× the power |
| **White space per MW** | 180–250 m²/MW | 40–80 m²/MW | **3–5× more efficient** |
| **Chiller plant room** | 400–600 m² | 50–150 m² (trim only) | **75–85% reduction** |
| **Roof/yard cooling** | 1,500–3,000 m² (towers) | 800–1,500 m² (dry coolers) | Smaller despite 3× load |
| **Mechanical % of building** | 40–55% | 20–35% | Major shift to IT space |
| **Data hall clear height** | 3.0–3.5 m + raised floor | 4.0–5.0 m slab-on-grade | Taller building, no raised floor |
| **Piping joints/fittings** | ~100–200 (CRAH connections) | ~1,000–2,000+ (rack manifolds) | **10× more connection points** |
| **Free cooling hours (Norway)** | ~5,000–7,000 hrs/yr (economizer) | ~8,760 hrs/yr (year-round) | Warm water enables full free cooling |
| **PUE (typical)** | 1.3–1.5 | 1.05–1.15 | Significant energy savings |

---

## Key Takeaway for Facility Design

The liquid-cooled facility is a **fundamentally different building type**. It is taller, has a smaller footprint per MW, has minimal central plant, but has vastly more complex in-hall piping with thousands of connection points requiring rigorous leak detection and quality-controlled installation. The MEP design challenge shifts from "large centralized mechanical systems" to "distributed, high-density plumbing with surgical precision." This has profound implications for project delivery — the piping contractor scope becomes the critical path, commissioning complexity increases, and the skill set required shifts from traditional HVAC toward precision plumbing and process piping.

**Sources:** ASHRAE TC 9.9 *Liquid Cooling Guidelines for Datacom Equipment* (2023); Uptime Institute *Annual Data Center Survey* (2023); Schneider Electric White Papers 25 & 135; Vertiv *Liquid Cooling Reference Architectures*; CoolIT Systems and Motivair CDU deployment documentation; NVIDIA DGX SuperPOD infrastructure guides.

---
*Executed: 2026-04-03 | Mode: sequential*
