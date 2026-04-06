# Prompt 06: ups-topologies

> **Prompt:** What are the different UPS topologies used in data centers (double-conversion, line-interactive, rotary, DRUPS)? What are the engineering tradeoffs of each — efficiency, footprint, battery type (VRLA, Li-ion, flywheel), runtime, and maintenance burden?

---

# UPS Topologies in Data Center Facilities

## 1. Double-Conversion Online UPS (Most Common)

The double-conversion online topology is the dominant UPS architecture in mission-critical data centers. Incoming AC power is rectified to DC, which charges the battery bank and feeds an inverter that regenerates clean AC output. The load is **always** powered through the inverter, providing complete isolation from mains disturbances.

**Efficiency:** Traditional double-conversion units operate at **94–96% efficiency** at full load. Modern designs have pushed this to **96–97.5%**. Schneider Electric's **Galaxy VX** (up to 1500 kW) achieves up to **99% in ECO mode** and approximately **97% in double-conversion mode**. Vertiv's **Liebert EXL S1** similarly claims up to **97% in double-conversion** and **99% in dynamic online mode**.

**Tradeoffs:** The topology provides the highest power quality and seamless transfer to battery, but efficiency losses generate significant waste heat — a 10 MW facility at 96% efficiency dissipates **400 kW** as heat, increasing cooling costs. Footprint is moderate; modern modular units allow N+1 redundancy configurations (2N being the gold standard for Tier IV facilities).

## 2. ECO-Mode Operation

ECO mode (also called "high-efficiency mode" or "dynamic online mode") bypasses the double-conversion path during normal operation, routing power directly through a static bypass while keeping the inverter on standby. Efficiency reaches **98.5–99%+**, saving substantial energy costs at scale.

**Tradeoff:** The load is exposed to raw mains power during normal operation. Transfer to inverter upon disturbance takes **2–4 milliseconds** — within the ITIC curve tolerance for IT equipment, but some operators consider this an unacceptable risk for Tier III/IV facilities. Schneider's **ECOnversion** mode on the Galaxy VX claims less than 2 ms transfer time. Adoption has increased as operators prioritize PUE reduction, but many hyperscalers still avoid it for the most critical loads.

## 3. Rotary UPS / DRUPS

**Rotary UPS** systems use a spinning flywheel mass coupled to a motor-generator set rather than static power electronics. **DRUPS (Diesel Rotary UPS)** integrates the diesel generator, flywheel, and motor-generator into a single unit, eliminating the need for separate UPS and generator systems.

**Key products:**
- **Piller UNIBLOCK** — a well-known rotary UPS, available up to approximately 2.8 MW per unit
- **Hitec PowerProtection UNIBLOCK** — offers DRUPS solutions up to **3 MW+ per unit**
- **Euro-Diesel** (now Rolls-Royce Solutions) — DRUPS units popular in European colocation facilities

**Efficiency:** DRUPS systems achieve **94–96%** in normal operation. They eliminate the efficiency losses of battery charging/discharging cycles but have mechanical losses from the rotating mass.

**Tradeoffs:**
- **Footprint:** Larger and heavier than static UPS — a single DRUPS unit can weigh **15–25 tonnes** and requires reinforced flooring and vibration isolation
- **No battery dependency:** The flywheel provides **8–15 seconds of ride-through**, during which the diesel engine starts and takes over. This eliminates battery replacement cycles entirely
- **Maintenance:** Requires mechanical maintenance (bearings, fuel system, engine servicing) but avoids battery replacement costs. Typical maintenance intervals include annual engine servicing and bearing inspections
- **Noise and vibration:** Significantly higher than static UPS — requires acoustic enclosures and dedicated plant rooms

DRUPS is favored by several European colocation providers (e.g., Equinix in some facilities, Global Switch historically) due to reduced component count and elimination of battery rooms.

## 4. Flywheel UPS (Short Ride-Through)

Standalone flywheel systems such as those from **Beacon Power**, **Active Power CleanSource** (now Piller/Langley Holdings), and **Calnetix/Vycon** provide **10–30 seconds** of ride-through energy stored in a high-speed spinning mass (typically 20,000–40,000 RPM in a vacuum enclosure).

**Tradeoffs:**
- **No chemical batteries** — eliminates thermal runaway risk, toxic materials, and degradation over time
- **Cycle life:** Essentially unlimited charge/discharge cycles vs. 300–1,500 for VRLA batteries
- **Footprint:** Compact per unit but limited energy storage — suited only as bridge power until generators start
- **Maintenance:** Low — bearing replacement every 5–10 years; no battery swaps
- **Risk:** If the generator fails to start within the flywheel's ride-through window, there is no extended runtime

## 5. Battery Technology Comparison: VRLA vs. Li-ion

| Parameter | VRLA (Lead-Acid) | Li-ion (LFP / NMC) |
|---|---|---|
| **Energy density** | ~30–40 Wh/kg | ~150–250 Wh/kg (4–6× higher) |
| **Footprint** | Large — often requires dedicated battery rooms | **60–80% smaller** footprint for equivalent capacity |
| **Weight** | Heavy | **60–70% lighter** |
| **Cycle life** | 200–400 cycles (typical VRLA) | **3,000–5,000+ cycles** (LFP) |
| **Calendar life** | 5–7 years (standard), 10 years (long-life) | **10–15 years** |
| **Cost (CapEx)** | Lower upfront (~$150–200/kWh) | Higher upfront (~$300–500/kWh), but **lower TCO** over 10–15 years due to fewer replacements |
| **Thermal sensitivity** | Requires 20–25°C; life halves for every 10°C increase | Wider operating range but still requires cooling; **BMS (Battery Management System)** is mandatory |
| **Thermal runaway risk** | Low (lead-acid is inherently stable) | Higher for NMC chemistry; **LFP (lithium iron phosphate) is strongly preferred** in DC applications for safety |
| **Monitoring** | Basic; limited cell-level visibility | Advanced BMS with cell-level monitoring, SOH tracking |

**Industry trend:** Li-ion adoption has accelerated sharply since 2020. Schneider Electric's Galaxy VX and Vertiv's Liebert EXL S1 both offer Li-ion battery cabinet options. According to the Uptime Institute's 2023 survey, approximately **35–40%** of new UPS deployments now specify Li-ion, up from under 10% in 2018.

## Summary of Engineering Tradeoffs

| Topology | Efficiency | Footprint | Runtime | Maintenance | Best For |
|---|---|---|---|---|---|
| **Double-conversion** | 96–97.5% | Moderate | 5–30 min (battery dependent) | Battery replacement every 5–10 yr | Tier III/IV facilities, most deployments |
| **ECO-mode** | 98.5–99%+ | Same as above | Same as above | Same + bypass monitoring | PUE-sensitive hyperscale |
| **DRUPS** | 94–96% | Large, heavy | 8–15 sec flywheel + diesel takeover | Mechanical engine service | Large European colocation |
| **Flywheel** | ~98% (low losses) | Compact per unit | 10–30 sec only | Bearings every 5–10 yr | Generator bridge, battery-free designs |

The choice of UPS topology is ultimately driven by the operator's **risk tolerance, efficiency targets (PUE), facility space constraints, and capital structure** — PE-backed operators under pressure to minimize CapEx may lean toward VRLA despite higher TCO, while hyperscalers with longer investment horizons increasingly prefer Li-ion and even flywheel-augmented architectures.

---
*Executed: 2026-04-03 | Mode: independent*
