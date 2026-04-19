# Prompt 10: cooling-architectures

> **Prompt:** [See prompt chain for full text]

---

# Data Center Cooling Architectures: Engineering Deep Dive

## Overview

Data center cooling has evolved from simple raised-floor air distribution to sophisticated liquid cooling systems capable of handling rack densities exceeding 100 kW. ASHRAE Technical Committee 9.9 defines the recommended environmental envelope for data centers: supply air temperature of 18–27°C (Class A1), with allowable ranges extending to 15–32°C. Each cooling architecture addresses a different density tier and brings distinct engineering requirements.

---

## (a) Raised-Floor CRAC/CRAH with Perforated Tiles

**Supported density: ~3–15 kW/rack**

The traditional approach uses a raised floor plenum (typically 600–900 mm / 24–36 inches deep) as a pressurized air distribution chamber. Computer Room Air Conditioning (CRAC) units use direct expansion (DX) refrigerant, while Computer Room Air Handling (CRAH) units use chilled water coils.

**Engineering specifics:**
- **Airflow:** Each CRAH unit delivers roughly 5,700–14,200 CFM (2,700–6,700 L/s). A typical 25% open perforated tile delivers approximately 350–500 CFM depending on plenum pressure (typically 0.05–0.10 inches water gauge).
- **Supply temperatures:** Chilled water supply at 7–12°C, producing supply air at 13–18°C (though modern practice trends toward 18–22°C per ASHRAE recommendations for economizer hours).
- **Delta-T:** Air-side delta-T of 10–15°C across the rack; water-side delta-T of 5–6°C across the CRAH coil.
- **Infrastructure:** Requires hot-aisle/cold-aisle layout. Containment (cold aisle or hot aisle) improves effectiveness by 30–40%, pushing the upper bound toward 15 kW/rack. Without containment, bypass air mixing limits practical density to ~5–8 kW/rack.

**Limitations:** Airflow becomes turbulent and inefficient at higher densities. Schneider Electric White Paper 135 ("Impact of Hot and Cold Aisle Containment on Data Center Temperature and Efficiency") documents that uncontained raised-floor environments waste 50–60% of cooling capacity to bypass airflow.

---

## (b) In-Row Cooling

**Supported density: ~15–25 kW/rack**

In-row cooling units sit between server racks within the row, drawing hot exhaust air directly from the hot aisle and delivering cooled air into the cold aisle. This eliminates the raised floor plenum entirely and dramatically shortens the air path.

**Engineering specifics:**
- **Airflow:** Each in-row unit delivers 2,500–5,500 CFM. Units are typically 300 mm (12 in) wide, occupying one rack slot per 3–5 server racks.
- **Water flow:** Chilled water at 7–15°C, flow rates of 15–40 GPM per unit depending on capacity (30–60 kW per unit typical).
- **Delta-T:** Air-side delta-T of 15–20°C; water-side delta-T of 5–10°C.
- **Infrastructure:** Hot-aisle containment is essentially mandatory. No raised floor required. Supply and return piping runs overhead or under-slab.

Schneider Electric's CoolRow and Vertiv's Liebert CRV are representative products. This architecture is common in colocation facilities targeting 15–25 kW/rack, and has been widely deployed by operators like Equinix in their IBX facilities.

---

## (c) Rear-Door Heat Exchangers (RDHx)

**Supported density: ~15–40 kW/rack**

A passive or active heat exchanger replaces the standard rear door of the server rack. Hot exhaust air passes through a chilled-water coil before entering the room, neutralizing or eliminating the rack's heat output at source.

**Engineering specifics:**
- **Passive RDHx:** No fans; relies on server fans to push air through the coil. Removes 60–80% of rack heat load. Adds 0.05–0.15 inches WG of static pressure to server fans.
- **Active RDHx:** Includes fans to augment airflow, achieving near-100% heat removal at the rack.
- **Water flow:** 5–15 GPM per door depending on load, chilled water or warm water (up to 35–45°C supply) depending on design. Warm-water variants enable free cooling for most of the year.
- **Delta-T:** Water-side delta-T of 8–15°C.
- **Infrastructure:** Requires piping to every rack position — flexible hoses with quick-disconnect dripless couplings. Leak detection under every cabinet is standard practice. Weight adds approximately 35–55 kg to the rear of each rack.

CoolIT Systems and Motivair are prominent vendors. The approach is popular in HPC retrofits — the University of Notre Dame and NREL have deployed RDHx solutions at 30–40 kW/rack. The key advantage is that RDHx can be retrofitted into existing air-cooled rooms without altering room-level cooling infrastructure.

---

## (d) Direct Liquid Cooling (DLC) with Cold Plates

**Supported density: ~40–150+ kW/rack**

Cold plates are attached directly to CPUs, GPUs, and other high-heat components. Liquid (typically treated water or water-glycol mix) circulates through micro-channel or fin-type cold plates, removing 70–80% of server heat directly to liquid. Residual heat (DIMMs, storage, VRMs) is still handled by air.

**Engineering specifics:**
- **Coolant supply temperature:** 30–45°C (warm water), enabling free cooling year-round in most climates. ASHRAE W3/W4 classes define liquid supply temperatures for data centers.
- **Flow rates:** 1.0–2.5 LPM per cold plate; 15–40 LPM per rack-level manifold (Coolant Distribution Unit, or CDU).
- **Delta-T:** Liquid-side delta-T of 10–20°C across the cold plate.
- **Pressure:** Facility water loop operates at 2–4 bar; secondary (server-side) loop at 1–2 bar, separated by the CDU heat exchanger to isolate server-grade coolant from facility water.
- **Infrastructure:** CDUs are deployed per row or per rack (rack-mount CDUs in some configurations). Drip-free blind-mate connectors (e.g., Stäubli or Eaton) at the server and manifold level. Server-side plumbing uses flexible hoses rated for 10+ year service life.

**Real deployments:** Lenovo's Neptune DLC platform is deployed in numerous HPC centers. NVIDIA's GB200 NVL72 racks (70+ kW per rack) use DLC as the reference cooling architecture. The Frontier supercomputer at Oak Ridge National Laboratory uses HPE Cray EX cold-plate liquid cooling for its AMD MI250X GPUs, operating at roughly 60–80 kW per cabinet.

---

## (e) Single-Phase Immersion Cooling

**Supported density: ~50–200 kW/rack (tank)**

Servers are submerged in a dielectric fluid (engineered fluids from 3M Novec, Shell Immersion, or Engineered Fluids' ElectroCool) that remains liquid throughout the cooling cycle. Heat is transferred from components to the fluid, then removed via a heat exchanger (fluid-to-water) within or adjacent to the tank.

**Engineering specifics:**
- **Fluid properties:** Dielectric strength >25 kV, specific heat ~1.5–2.1 kJ/kg·K (roughly half of water), density ~0.8–0.85 kg/L. Thermal conductivity ~0.06–0.14 W/m·K.
- **Supply temperatures:** Coolant supply at 35–45°C; fluid temperature in the tank maintained at 40–55°C.
- **Flow:** Fluid is circulated via pumps at 50–200 LPM per tank through an external heat exchanger, or natural convection is used in lower-density deployments. Facility-side water delta-T of 10–15°C.
- **Tank design:** Tanks are typically 2–3 server racks wide, holding 500–1,500 liters of fluid. Fluid cost is $15–30 per liter depending on chemistry. Floor loading is significant — 1,500–3,000 kg per tank fully loaded.
- **Infrastructure:** No fans in servers (fan-less motherboards), no raised floor, no air handling. Dramatically simplified mechanical plant. PUE values of 1.02–1.06 are achievable.

**Real deployments:** GRC (Green Revolution Cooling) has deployed single-phase immersion for Bitcoin mining operations and hyperscale edge. Microsoft's Project Natick explored immersion-adjacent approaches. LiquidCool Solutions deployed single-phase systems at the DoD and commercial data centers.

---

## (f) Two-Phase Immersion Cooling

**Supported density: ~100–250+ kW/rack (tank)**

Components are submerged in a low-boiling-point dielectric fluid (boiling point ~34–60°C, typically 3M Novec 7100 or similar fluorocarbon). Heat causes the fluid to boil at the component surface; vapor rises, condenses on a water-cooled condenser coil at the top of the tank, and drips back down. This leverages latent heat of vaporization, which is far more efficient per unit mass than sensible heat transfer.

**Engineering specifics:**
- **Latent heat:** ~88–128 kJ/kg (Novec 7100: 112 kJ/kg). Though lower than water's 2,260 kJ/kg, the boiling occurs directly at the heat source with extremely high heat transfer coefficients (5,000–20,000 W/m²·K vs. 500–2,000 for single-phase forced convection).
- **Condenser:** Water-cooled condensing coils at the top of the sealed tank, operating at 20–40°C coolant supply. Condensate returns by gravity — no pumps needed for the dielectric fluid loop.
- **Supply temperatures:** Facility water at 25–40°C to the condenser; compatible with free cooling for much of the year.
- **Tank design:** Sealed or semi-sealed to limit fluid vapor loss (fluorocarbons have GWP concerns — Novec 7100 GWP ~320; newer fluids target GWP <10). Tank pressures near atmospheric.
- **Infrastructure:** Zero moving parts on the fluid side (no pumps, no fans). Very high heat flux capability — can cool individual components generating >1,000 W/cm² with enhanced surfaces.

**Real deployments:** LiquidCool Solutions (now Midas Green Tech) demonstrated two-phase systems. BitFury was an early adopter for cryptocurrency mining. GIGABYTE and others have shown two-phase immersion-cooled GPU servers for AI workloads. Allied Control (now acquired by Vertiv) pioneered commercial two-phase immersion in Hong Kong.

**Challenges:** Fluid cost ($50–300+ per liter for engineered fluorocarbons), environmental regulations (EU F-gas regulation targeting high-GWP fluids), serviceability (components must be removed from fluid, allowed to dry), and supply chain constraints on specialty fluids.

---

## Summary Comparison

| Architecture | kW/Rack | PUE Range | Coolant Supply Temp | Key Infrastructure |
|---|---|---|---|---|
| Raised-floor CRAC/CRAH | 3–15 | 1.4–2.0 | 7–12°C (chilled water) | Raised floor, containment |
| In-row cooling | 15–25 | 1.3–1.5 | 7–15°C | Containment, overhead piping |
| Rear-door HX | 15–40 | 1.2–1.4 | 15–45°C | Per-rack piping, leak detection |
| DLC cold plates | 40–150+ | 1.1–1.25 | 30–45°C (warm water) | CDUs, blind-mate connectors |
| Single-phase immersion | 50–200 | 1.02–1.06 | 35–45°C | Tanks, fan-less servers, high floor loading |
| Two-phase immersion | 100–250+ | 1.02–1.05 | 25–40°C | Sealed tanks, condensers, specialty fluid |

---

**Key references:** ASHRAE TC 9.9 *Thermal Guidelines for Data Processing Environments* (5th ed., 2021); Schneider Electric White Papers 135 and 59 ("The Different Types of Cooling Systems for Data Centers"); Uptime Institute intelligence reports on liquid cooling adoption; U.S. DOE *Data Center Cooling Best Practices* (LBNL); deployment documentation from Oak Ridge National Laboratory (Frontier), NREL, and Microsoft Project Natick.

---
*Executed: 2026-04-03 | Mode: independent*
