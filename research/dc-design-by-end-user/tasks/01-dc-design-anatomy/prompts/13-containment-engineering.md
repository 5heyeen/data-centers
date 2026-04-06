# Prompt 13: containment-engineering

> **Prompt:** What is the engineering of hot aisle / cold aisle containment? How does containment affect supply and return air temperatures, fan energy, and cooling efficiency? What are the design parameters (aisle width, blanking panels, containment material, pressure differential)?

---

# Hot Aisle / Cold Aisle Containment Engineering

## Fundamental Principle

Airflow containment in data centers physically separates the cold supply air from the hot exhaust air to prevent mixing — the single largest source of cooling inefficiency in raised-floor and slab-floor environments. Without containment, recirculation and bypass airflow can waste 50–60% of delivered cooling capacity.

## Without Containment: The Mixing Problem

In an open hot aisle / cold aisle layout, supply air is delivered at **18–20°C** (per traditional ASHRAE recommendations) and returns to CRAH/CRAC units at **30–35°C**. However, significant mixing occurs:

- **Bypass airflow** — cold air that never reaches server inlets (escaping through cable cutouts, gaps in tiles, and over cabinet tops)
- **Recirculation** — hot exhaust re-entering cold aisles due to pressure imbalances
- Supply temperatures must be kept conservatively low to compensate, increasing chiller energy

Studies have shown that without containment, the temperature differential (ΔT) across the rack averages only **10–12°C** due to mixing, far below the theoretical potential.

## Cold Aisle Containment (CAC)

CAC encloses the cold aisle with a roof and end-of-row doors, creating a pressurized plenum of cold supply air in front of server inlets.

**Design parameters:**
- **Aisle width:** Typically 1.0–1.2 m (standard), though some designs use up to 1.5 m for maintenance access
- **Containment material:** Rigid polycarbonate panels, strip curtains (flexible PVC), or aluminum-framed acrylic — must meet fire rating requirements (UL 94 V-0 or equivalent)
- **Pressure differential:** Maintain **1–3 Pa positive pressure** inside the cold aisle relative to the room to prevent hot air infiltration. Pressure sensors with variable-speed fan control are essential
- **Blanking panels:** Every unused U-space in racks must be sealed. Open rack spaces can degrade containment effectiveness by **5–15%** per ASHRAE research

**Engineering tradeoffs of CAC:**
- The hot return air mixes freely with room air, which becomes the effective return plenum — the room ambient temperature rises to 35–40°C
- Fire suppression systems interact normally with the open room space
- Comfortable for operations staff working outside the contained aisle
- If a CRAC unit fails, the contained aisle can overheat quickly — requires emergency venting (drop-away roof panels or motorized dampers)

## Hot Aisle Containment (HAC)

HAC encloses the hot aisle, ducting exhaust air directly back to cooling units. The room itself becomes the cold air supply plenum.

**Engineering tradeoffs of HAC:**
- Room ambient stays at supply temperature (~20–27°C), more comfortable for staff
- **Higher return air temperatures** achievable: **35–45°C**, enabling economizer hours and more efficient chiller operation
- Superior energy performance — ASHRAE TC 9.9 data indicates HAC typically delivers **5–10% better cooling efficiency** than CAC
- More complex to implement with ceiling return plenums or chimney cabinets
- Fire suppression must account for the enclosed hot volume

## Impact on Supply Temperatures and Efficiency

With containment (either type), operators can safely raise supply air temperatures to **24–27°C**, within ASHRAE Class A1 allowable envelope (15–32°C inlet). This has cascading benefits:

| Parameter | Without Containment | With Containment |
|-----------|-------------------|------------------|
| Supply air temp | 18–20°C | 24–27°C |
| Return air temp | 30–35°C | 35–45°C |
| ΔT across rack | 10–12°C | 15–20°C |
| Fan energy reduction | Baseline | 20–30% (lower airflow needed at higher ΔT) |
| Chiller COP improvement | Baseline | 15–40% (higher chilled water setpoints) |
| **PUE improvement** | **1.6–2.0 typical** | **0.1–0.3 PUE reduction**, achieving 1.3–1.5 |

The fan energy savings follow the **cube law** — reducing airflow volume by 20% reduces fan power by approximately 50%.

## Blanking Panel Discipline

Blanking panels are arguably the highest-ROI intervention in data center cooling. The Uptime Institute has documented that **unsealed rack openings of just 1U can allow 30–40% of cold air to short-circuit** through an empty rack space. Full blanking panel compliance is a prerequisite for any containment strategy to perform as designed.

## Summary

Containment is a well-proven, relatively low-cost mechanical intervention that directly reduces cooling energy by eliminating air mixing, enabling higher supply temperatures, increasing ΔT, and reducing required airflow volume. HAC generally outperforms CAC thermodynamically but requires more design integration. Either approach, combined with blanking panel discipline and pressure management, typically delivers **0.1–0.3 PUE improvement** — often the single most impactful efficiency measure available in an existing facility.

---
*Executed: 2026-04-03 | Mode: independent*
