# Prompt 05: full-power-chain

> **Prompt:** [See prompt chain for full text]

---

# The Complete Data Center Power Chain: From Utility Grid to Server Chip

## Overview

The power chain in a data center is a carefully engineered cascade of voltage transformation, switching, protection, and conditioning stages. Each stage introduces redundancy and fault isolation to achieve the 99.999%+ uptime targets that modern facilities demand. Below is a comprehensive mapping of every component from the utility grid connection down to the server processor.

---

## 1. Utility Grid Connection (High Voltage)

**Voltage levels:** 110 kV – 400 kV (transmission), typically stepping to 33 kV or 11 kV at the distribution level.

- **Key components:** HV overhead line or underground cable termination, metering (revenue-grade CTs/VTs), lightning arresters, disconnectors.
- **Design parameters:**
  - Fault current rating: 25–40 kA at transmission level
  - Multiple utility feeds (diverse substations) for Tier III/IV designs
  - Power factor correction obligations per grid code (typically >0.95)
- **Typical capacity:** 20–100+ MW per utility feed for hyperscale; 5–20 MW for colocation/enterprise

**Source:** Schneider Electric White Paper 1 ("Electrical Efficiency Modeling of Data Centers") and White Paper 66 establish the baseline architectures. Uptime Institute Tier Standard describes redundancy requirements at the utility interface.

---

## 2. HV/MV Switchgear

**Voltage levels:** 33 kV or 11 kV (medium voltage, MV)

- **Key components:** SF6 or vacuum circuit breakers, bus-section switches, protection relays (overcurrent, differential, distance), bus-tie breakers for redundancy.
- **Design parameters:**
  - Fault current withstand: 20–31.5 kA for 1 second (typical MV ratings)
  - Bus rating: 1,250–3,150 A at 11 kV
  - Arc flash containment: IEC 62271-200 class IAC AFL
  - Typical configurations: Single bus with bus-section (Tier II), dual bus with tie (Tier III), dual bus dual feed (Tier IV)
- **Scaling:** A 10 MW data center at 11 kV draws approximately 525 A per feed. At 50 MW, dual 33 kV feeds each carrying roughly 875 A are more common to reduce cable sizing.

---

## 3. Step-Down Transformers (HV/MV → MV or MV → LV)

### Stage A: HV to MV (if utility delivers at HV)

- **Typical sizes:** 20–63 MVA (ONAN/ONAF), oil-immersed
- **Voltage:** 132 kV/33 kV or 132 kV/11 kV
- **Impedance:** 8–15% (limits fault current downstream)

### Stage B: MV to LV (the workhorse transformer)

- **Voltage:** 11 kV or 33 kV → 400 V (Europe/Nordic) or 480 V (North America)
- **Typical sizes:**
  - Enterprise/colo: 1.5–2.5 MVA dry-type (cast resin, IEC class F)
  - Hyperscale: 2.5–3.15 MVA per transformer, deployed in N+1 groups
  - Large campus: 5 MVA units becoming common for high-density deployments
- **Design parameters:**
  - Impedance: 5–6% (standard), sometimes specified at 8% to limit LV fault current
  - K-factor: K-13 or K-20 rated for harmonic-rich IT loads (per IEEE C57.110)
  - Winding configuration: Dyn11 (Europe) or Delta-Wye (NA) — provides neutral for single-phase loads and blocks triplen harmonics
  - Efficiency: >99% at rated load (DOE 2016 / EU Tier 2 eco-design)
  - Temperature rise: 80 K (class F insulation, operated at class B rise for longevity)
- **Scaling note:** Schneider Electric White Paper 101 ("Selecting an Efficient UPS") and Vertiv's "Data Center Power Sizing" guide recommend matching transformer capacity to UPS module groups — typically one transformer per UPS system to simplify protection coordination.

---

## 4. Main Low-Voltage Switchboard (MSB / Main Distribution Board)

**Voltage:** 400 V (Europe) or 480 V (North America)

- **Key components:** Air circuit breakers (ACBs), moulded case circuit breakers (MCCBs), bus bars, metering, surge protective devices (SPDs Type 1+2).
- **Design parameters:**
  - Bus rating: 3,200–6,300 A (per section)
  - Fault current withstand: 50–100 kA at 400/480 V (1 second)
  - Form of separation: Form 4b (IEC 61439) for safe maintenance under power
  - IP rating: IP31 minimum (indoor), IP54 if in semi-outdoor enclosure
- **Configuration patterns:**
  - **2N:** Two independent MSBs, each fed by its own transformer. Full redundancy.
  - **N+1 with bus-tie:** Single MSB with bus-section and tie breaker; one reserve transformer.
  - Automatic transfer between sources via interlocking or ATS at this level.

---

## 5. Uninterruptible Power Supply (UPS)

**Input voltage:** 400 V or 480 V 3-phase | **Output voltage:** 400 V or 480 V 3-phase

- **Topology:** Double-conversion online (VFI per IEC 62040-3) is the industry standard. Vertiv, Schneider (APC), and Eaton all offer this.
- **Typical module sizes:**
  - Schneider Galaxy VX: 500–1,500 kW per frame
  - Vertiv Trinergy Cube: 200–3,600 kW scalable
  - Eaton 93PM: 30–200 kW modular
  - Modular UPS (e.g., Schneider Galaxy VM): 25–50 kW per module, up to 225 kW per frame
- **Design parameters:**
  - Efficiency: 96–97% in double-conversion mode; 99%+ in eco-mode (bypass)
  - Input power factor: >0.99
  - Output THD: <1% (linear load), <5% (non-linear load)
  - Battery autonomy: 5–15 minutes (bridge to generator start and load transfer)
  - Overload capability: 125% for 10 minutes, 150% for 1 minute (typical)
- **Battery systems:**
  - VRLA: 5–10 year design life, flooded cells for larger installations (15–20 year life)
  - Li-ion (increasingly common): smaller footprint, longer cycle life, higher cost
  - Battery string voltage: typically 384–480 VDC
- **Scaling:** A 10 MW IT load data center might deploy 12 × 1 MW UPS modules in an N+1 configuration (6 per bus in a 2N architecture). Per Schneider White Paper 75 ("Quantitative Analysis of UPS System Configurations"), 2N provides the highest availability but at the cost of ~50% stranded capacity.

---

## 6. Static Transfer Switch (STS)

**Voltage:** 400 V or 480 V | **Rating:** 100–4,000 A

- **Function:** Transfers load between two independent UPS feeds in <4 ms (less than half a cycle) — fast enough that server PSUs ride through on their internal bulk capacitors.
- **Design parameters:**
  - Transfer time: <4 ms (break-before-make) or 0 ms (make-before-break if sources are synchronised)
  - Fault current withstand: 65–100 kA
  - Used primarily in N+1 or distributed-redundant architectures (Tier III)
  - Not required in 2N architectures where dual-corded servers provide redundancy at the IT level
- **Key vendors:** Schneider (APC), Vertiv, ABB, Eaton
- **Schneider White Paper 48** ("Comparing Centralized and Decentralized Critical Power Strategies") discusses STS placement relative to PDUs.

---

## 7. Power Distribution Unit (Floor PDU / Remote Power Panel)

**Input voltage:** 400–480 V 3-phase | **Output voltage:** 230 V single-phase (Europe) or 208 V single-phase (NA), sometimes 415 V 3-phase for high-density

- **Types:**
  - **Floor-standing PDU:** Transformer-based (step-down from 480 V to 208/120 V in NA) or transformer-free (in 400 V European systems where 230 V is available phase-to-neutral)
  - **Remote Power Panel (RPP):** Panel-board style, no transformer, used when voltage transformation is not needed
- **Typical sizes:**
  - 75 kVA, 112.5 kVA, 150 kVA, 225 kVA (common NA sizes with transformer)
  - 250–400 A panel boards (RPPs in European 400 V systems)
- **Design parameters:**
  - Output breakers: 20–63 A single-pole or 3-pole
  - Monitoring: Branch circuit monitoring (per-breaker kW, kWh, current) — increasingly mandatory
  - Efficiency: 97–99% (transformer-based lose 1–3% in transformation)
  - Subfeed breakers for each row or rack group

**Source:** Schneider White Paper 129 ("Critical Power Distribution System Design") maps out PDU configurations in detail.

---

## 8. Busway (Busbar Trunking) and Whips

**Voltage:** 230/400 V (Europe) or 208/480 V (NA)

- **Key components:** Overhead or underfloor busway (busbar trunking), tap-off boxes, flexible whips (power cables from tap-off to rack).
- **Design parameters:**
  - Busway ratings: 250 A, 400 A, 630 A, 800 A, 1,000 A (common sizes)
  - Tap-off boxes: Fused or with MCB, typically 32–63 A per tap (Europe), 30–60 A (NA)
  - Whip length: 1.5–3 m typical (to reach rack from overhead busway)
  - Voltage drop: <1% from PDU to rack (critical for efficiency)
- **Advantages over cable-based distribution:** Faster deployment, easier reconfiguration, better airflow (overhead), reduced copper weight.
- **Vendors:** Schneider (Canalis), Starline, E+I Engineering (now Vertiv), Siemens

---

## 9. Rack Power Distribution Unit (Rack PDU / In-Rack PDU)

**Input voltage:** 230 V 1-phase, 400 V 3-phase (Europe) or 208 V 1-phase, 208 V 3-phase (NA) | **Output:** IEC C13 (10 A) and IEC C19 (16 A) outlets

- **Types:**
  - Basic: Power strip with no monitoring
  - Metered: Total current/power display per PDU
  - Metered-by-outlet: Per-outlet power measurement
  - Switched: Remote on/off per outlet (for remote hands operations)
- **Typical ratings:**
  - Single-phase: 16 A or 32 A (Europe), 24 A or 30 A (NA) — derate to 80% for continuous load
  - Three-phase: 16 A/phase or 32 A/phase — delivering 11 kW to 22 kW per PDU
- **Design parameters:**
  - Number of outlets: 24–48 per PDU
  - Mounting: 0U vertical (most common), 1U horizontal
  - Typical deployment: 2 PDUs per rack (A+B feeds for dual-corded equipment)
  - Rack power capacity: 5–30 kW typical; AI/GPU racks now 40–100+ kW
  - Environmental sensors: Temperature, humidity, door contacts (integrated into intelligent PDUs)
- **Vendors:** Schneider (APC), Vertiv (Geist), Raritan, Server Technology, CPI

---

## 10. Server Power Supply Unit (PSU)

**Input voltage:** 200–240 V AC (most efficient range) or 100–127 V AC (NA legacy) | **Output:** 12 VDC (primary rail), 5 V and 3.3 V (auxiliary/standby)

- **Key parameters:**
  - Efficiency: 80 PLUS Titanium (96% at 50% load at 230 V) is the current top tier
  - Power factor: >0.99 (active PFC is standard)
  - Typical wattage: 800 W – 3,000 W per PSU (enterprise servers); GPU servers may have 2–4 × 3,000 W PSUs
  - Redundancy: 1+1 or 2+1 within the server chassis
  - Holdup time: 10–20 ms (enables STS transfer ride-through)
  - Hot-swappable: Standard in enterprise servers
  - Input connector: IEC C14 (up to 10 A) or IEC C20 (up to 16 A)
- **Emerging trends:**
  - 48 VDC distribution (Open Compute Project / Google): eliminates PSU AC-DC conversion, moves to rack-level 48 VDC bus with point-of-load converters. Increases efficiency by 1–2%.
  - 240 V DC (used by some Chinese hyperscalers): Single conversion from AC to DC at the facility level.
  - High-voltage DC (HVDC at 380 V): Standardized in ETSI EN 300 132-3-1; eliminates multiple conversion stages.

---

## 11. Voltage Regulation Modules (VRM) → The Chip

**Input:** 12 V or 48 VDC from PSU | **Output:** 0.6–1.8 VDC at extremely high current (100–1,000+ A for modern CPUs/GPUs)

- **Components:** Multi-phase buck converters (VRMs) on the motherboard or GPU board
- **Design parameters:**
  - Phases: 8–16+ phases for high-end server CPUs; 16–24+ for data center GPUs (e.g., NVIDIA H100 uses ~70 A per phase × 20 phases)
  - Transient response: Must respond to load steps of 100+ A in microseconds
  - Efficiency: 90–95% at this final conversion stage
  - Voltage accuracy: ±0.5% under all load conditions

---

## Summary Voltage Cascade

| Stage | Typical Voltage (Europe) | Typical Voltage (NA) |
|-------|------------------------|---------------------|
| Utility transmission | 132 kV / 33 kV | 138 kV / 34.5 kV |
| MV switchgear | 11 kV or 33 kV | 12.47 kV or 34.5 kV |
| MV/LV transformer output | 400 V 3-phase | 480 V 3-phase |
| UPS input/output | 400 V | 480 V |
| Floor PDU output | 230 V (phase-neutral) | 208 V (phase-phase) or 120 V |
| Rack PDU output | 230 V | 208 V or 120 V |
| Server PSU output | 12 VDC | 12 VDC |
| VRM to CPU/GPU | 0.6–1.8 VDC | 0.6–1.8 VDC |

---

## Efficiency Cascade

Each conversion stage introduces losses. A typical chain:

| Stage | Efficiency | Cumulative |
|-------|-----------|-----------|
| MV/LV transformer | 99.2% | 99.2% |
| UPS (double-conversion) | 96.0% | 95.2% |
| PDU (transformer-based) | 98.0% | 93.3% |
| Busway + cabling | 99.5% | 92.8% |
| Server PSU | 94.0% (Titanium at 230 V: 96%) | 87.3–89.1% |
| VRM | 92.0% | 80.3–82.0% |

This means roughly **18–20% of the power** drawn from the grid is lost in the electrical distribution chain before reaching the silicon. This is why PUE (Power Usage Effectiveness) and the electrical distribution contribute significantly to operating costs. Schneider Electric White Paper 113 ("Electrical Efficiency Measurement for Data Centers") provides detailed measurement methodology.

---

## Scaling by Facility Size

| Facility Class | IT Load | Transformer Size | UPS Configuration | PDU Count |
|---------------|---------|------------------|-------------------|-----------|
| Edge / micro DC | 50–500 kW | 500–1,000 kVA | 1 × modular (N+1 modules) | 2–10 |
| Enterprise | 1–5 MW | 2–3 × 2,500 kVA | 2–4 × 750–1,000 kW (2N) | 20–80 |
| Colocation | 5–20 MW | 6–10 × 2,500 kVA | 8–16 × 1,000 kW (2N) | 80–300 |
| Hyperscale | 50–300+ MW | 20–60+ × 3,150 kVA | Distributed UPS or rotary | 500–5,000+ |

---

## Key References

1. **Schneider Electric White Paper 1** — "Electrical Efficiency Modeling of Data Centers"
2. **Schneider Electric White Paper 66** — "Selecting an Efficient Power Distribution Architecture"
3. **Schneider Electric White Paper 75** — "Quantitative Analysis of UPS System Configurations"
4. **Schneider Electric White Paper 101** — "Selecting an Efficient UPS"
5. **Schneider Electric White Paper 113** — "Electrical Efficiency Measurement for Data Centers"
6. **Schneider Electric White Paper 129** — "Critical Power Distribution System Design"
7. **Vertiv Technical Guide** — "Data Center Power Equipment Overview"
8. **Uptime Institute Tier Standard** — Topology definitions (Tier I–IV)
9. **IEEE C57.110** — Recommended Practice for Transformers Supplying Nonsinusoidal Load Currents
10. **ETSI EN 300 132-3-1** — 400 VDC Power Distribution Standard
11. **80 PLUS Certification** — PSU efficiency tiers (Bronze through Titanium)

---
*Executed: 2026-04-03 | Mode: independent*
