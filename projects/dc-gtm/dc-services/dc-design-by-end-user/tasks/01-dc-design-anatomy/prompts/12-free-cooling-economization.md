# Prompt 12: free-cooling-economization

> **Prompt:** [See prompt chain for full text]

---

# Free Cooling & Economization in Data Center Design

## Overview

Free cooling (economization) exploits ambient conditions to reject heat without running mechanical refrigeration compressors, which are the single largest energy consumer in traditional data center cooling. The principle is simple: when outdoor conditions are cool or dry enough, you can bypass or supplement the chiller plant. The engineering differences between the three main approaches — airside, waterside, and indirect evaporative — determine capital cost, water consumption, air quality risk, and how many annual hours each strategy delivers usable cooling.

---

## Three Core Approaches

### 1. Airside Economization (Direct Outside Air)

Outside air is filtered and drawn directly into the data hall, displacing hot return air through exhaust paths. This is the simplest and cheapest form of free cooling, but it introduces several engineering challenges:

- **Filtration:** MERV 11–13 filters are typically required to protect IT equipment from particulates. In areas near highways, industrial zones, or wildfire risk, MERV 14+ or even gas-phase filtration (activated carbon) may be needed. Filter maintenance and pressure drop are ongoing costs.
- **Humidity control:** Direct outdoor air carries variable moisture. ASHRAE's *Thermal Guidelines for Data Processing Environments* (A1–A4 classes) recommend 20–80% RH for most equipment, with a dew-point limit of 15°C. Coastal or humid climates can push supply air above these limits, requiring dehumidification (energy penalty). Very cold, dry winter air may need humidification to prevent electrostatic discharge.
- **Contamination risk:** Gaseous contaminants (sulfur compounds, NOₓ) can corrode circuit boards. ASHRAE TC 9.9 *Gaseous and Particulate Contamination Guidelines* sets severity levels (G1/G2). This risk is a primary reason many operators avoid direct airside economization.
- **PUE impact:** When conditions are favorable, the only energy consumed is fan power. Achievable cooling PUE contribution can drop to **0.02–0.05** (fans only), pushing overall PUE below **1.10**. Google's early data centers in The Dalles, Oregon, and Hamina, Finland, famously used direct airside economization to achieve PUEs near 1.10–1.12 (Google Environmental Report, 2023).

### 2. Waterside Economization (Free Cooling via Heat Exchangers)

A plate-and-frame or shell-and-tube heat exchanger is placed in parallel with the chiller. When ambient wet-bulb (for cooling-tower-based systems) or dry-bulb temperature (for dry coolers) is low enough, chilled water is produced by the heat exchanger alone, and the compressor is bypassed entirely.

- **Partial and full economization:** Most systems define two thresholds. Below the "full economizer" switchover point (typically when ambient is 5–8°C below the chilled water return temperature), the chiller is completely off. In a transitional range, the economizer pre-cools and the chiller "trims" to setpoint. This is sometimes called *integrated* waterside economization.
- **Dry coolers vs. cooling towers:** Dry coolers (finned coils, fans, no water evaporation) reject heat to dry-bulb temperature — simpler, zero water consumption, but the switchover point is higher, yielding fewer free cooling hours. Cooling towers approach wet-bulb temperature, which is always lower, so they extend free cooling hours significantly but consume water (roughly 1.8 liters per kWh of heat rejected) and require water treatment.
- **Air quality advantage:** Because the cooling medium (water/glycol) is in a closed loop inside the data hall, there is **no introduction of outside air contaminants**. This makes waterside economization the preferred approach in polluted or industrial environments.
- **PUE impact:** Eliminates the largest single PUE contributor — the chiller compressor, which typically draws 0.2–0.3 of total facility power. Waterside economization can reduce cooling PUE contribution to **0.08–0.15** when fully engaged (pump + fan power only). Typical annualized PUE for well-designed waterside economizer plants: **1.15–1.25** depending on climate (Uptime Institute, 2023 Global Data Center Survey).

### 3. Indirect Evaporative Cooling (IEC)

IEC combines the best of both approaches. Outside air passes through a heat exchanger where it cools a secondary air stream (or water stream) without directly entering the data hall. Evaporative media on the outside-air side exploit the latent heat of vaporization to drop supply temperature well below dry-bulb.

- **How it works:** The unit has a primary (data center) air loop and a secondary (scavenger/outside) air loop separated by a polymer or aluminum plate heat exchanger. Water is sprayed or wicked onto the secondary side. Evaporation drops the secondary air temperature toward wet-bulb, and heat is transferred across the plates to cool the primary air — without adding moisture or contaminants to the data hall air.
- **Key manufacturers:** Munters Oasis series, EcoCooling, Nortek/Mammoth, Vertiv Liebert DSE, and the custom units used in Microsoft Azure data centers. Meta's (Facebook) Prineville and Luleå facilities use variations of IEC extensively.
- **Water consumption:** Lower than cooling towers per kWh rejected — typically **0.5–1.5 L/kWh** — because evaporation only occurs on the scavenger side and can be staged off in cold weather. In Nordic climates, water consumption drops to near zero for most of the year.
- **PUE impact:** Microsoft reported a PUE of **1.12** across Azure regions using IEC-based designs (Microsoft Sustainability Report, 2023). Meta's Luleå facility in Sweden (IEC + direct airside hybrid) operates at a PUE of approximately **1.07** (Meta Sustainability Report, 2022).

---

## Climate Zone Determination: ASHRAE Climate Data

ASHRAE Standard 90.4 (*Energy Standard for Data Centers*) and the underlying ASHRAE climate zone classification (Zones 1–8, with moisture subtypes A/B/C) drive economizer viability analysis. The critical metric is the number of annual hours below key temperature thresholds.

### Key Thresholds

| Condition | Enables |
|---|---|
| Dry-bulb < 18°C (64°F) | Full airside economization (typical) |
| Dry-bulb < 13°C (55°F) | Full waterside economization via dry coolers |
| Wet-bulb < 13°C (55°F) | Full waterside economization via cooling towers |
| Wet-bulb < 22°C (72°F) | IEC can meet full load without mechanical trim |

### Free Cooling Hours by Climate Zone

| Location | ASHRAE Zone | Approx. Annual Hours DB < 18°C | Free Cooling Category |
|---|---|---|---|
| **Luleå, Sweden** | 7 (Very Cold) | **~8,400** | Near-total free cooling |
| **Oslo, Norway** | 6A (Cold–Humid) | **~7,800–8,200** | Extensive free cooling |
| **Helsinki, Finland** | 6A–7 | **~8,000–8,400** | Extensive free cooling |
| **Dublin, Ireland** | 5A (Cool–Humid) | **~7,500** | High free cooling |
| **Amsterdam, Netherlands** | 5A | **~7,000** | High free cooling |
| **Ashburn, Virginia (US)** | 4A (Mixed–Humid) | **~5,000–5,500** | Moderate free cooling |
| **Phoenix, Arizona (US)** | 2B (Hot–Dry) | **~2,000–2,500** | Limited free cooling |
| **Singapore** | 1A (Very Hot–Humid) | **<500** | Negligible free cooling |

*Data derived from TMY3 (Typical Meteorological Year) weather files and ASHRAE Fundamentals Handbook climate data.*

### Nordic Climate Advantage

Norway, Sweden, and Finland sit in ASHRAE Zones 6–8, providing an outsized free-cooling advantage:

- **8,000+ hours/year** where dry-bulb alone supports full economization — meaning mechanical cooling is needed only during brief summer peaks.
- Cold winter temperatures (often -10 to -20°C) allow waterside economizer systems to produce chilled water at setpoints as low as 7°C without any compressor, using simple dry coolers.
- Low humidity (especially in inland Scandinavia) reduces dehumidification energy and water consumption for IEC systems.
- Meta's **Luleå, Sweden** facility and Google's **Hamina, Finland** facility both exploit this to run at PUEs near **1.07–1.10**.
- Norway adds a further advantage: nearly 100% renewable hydropower electricity, so the remaining mechanical cooling that is needed runs on zero-carbon energy.

### Hot Climate Limitations

In ASHRAE Zone 1A–2A (Singapore, parts of India, Middle East):

- Dry-bulb temperatures exceed 30°C for most of the year; free cooling hours drop below **1,000–2,000**.
- High wet-bulb temperatures (>25°C) limit even IEC performance.
- Operators must rely primarily on mechanical chiller plants (centrifugal or screw compressors), yielding PUEs of **1.3–1.6** even with modern designs.
- Emerging alternatives include **seawater cooling** (e.g., Verne Global/Keppel DC Singapore concepts) and liquid-to-chip cooling to bypass air-based economization entirely.

---

## PUE Impact Comparison

| Approach | Typical Annualized PUE (Nordic) | Typical Annualized PUE (Temperate, Zone 4–5) | Typical Annualized PUE (Hot, Zone 1–2) |
|---|---|---|---|
| Airside Economizer | **1.05–1.10** | 1.15–1.25 | 1.30+ (limited hours) |
| Waterside Economizer (dry coolers) | **1.08–1.12** | 1.18–1.28 | 1.35+ |
| Waterside Economizer (cooling towers) | **1.08–1.12** | 1.12–1.20 | 1.25–1.35 |
| Indirect Evaporative Cooling | **1.06–1.10** | 1.10–1.18 | 1.20–1.30 |
| Mechanical Chiller Only (baseline) | 1.30–1.50 | 1.35–1.60 | 1.40–1.70 |

*Sources: Uptime Institute 2023 Survey; Google/Meta/Microsoft sustainability reports; ASHRAE TC 9.9 publications.*

---

## Regulatory Reference: ASHRAE 90.4

ASHRAE Standard 90.4-2019 (*Energy Standard for Data Centers*) mandates economizer use for most climate zones. Key provisions:

- **Section 6.5.1** requires airside or waterside economizers for data centers with IT loads above defined thresholds in ASHRAE climate zones 3–8.
- The standard provides a **cooling-mode efficiency metric (DCCP)** that effectively penalizes designs that run compressors when ambient conditions support economization.
- European equivalents (EN 50600-2-3) and the EU Energy Efficiency Directive similarly push toward free-cooling-first design.

---

## Summary

The choice between airside, waterside, and indirect evaporative economization is driven by climate zone, air quality, water availability, and risk tolerance. Nordic locations (Norway, Sweden, Finland) represent the global optimum for free cooling — delivering 8,000+ hours/year and enabling PUEs at or below 1.10 with relatively simple systems. This climate advantage is a significant factor in the ongoing migration of hyperscale and enterprise data center capacity to the Nordics.

---
*Executed: 2026-04-03 | Mode: independent*
