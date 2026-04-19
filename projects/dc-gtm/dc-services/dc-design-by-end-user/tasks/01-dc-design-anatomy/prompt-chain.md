# Socratic Research Prompts: Data Center Design Anatomy

> **Topic:** Comprehensive mapping of every engineering/design domain in a data center facility — what must be designed, key parameters, decisions, and interdependencies — from a mechanical, electrical, and structural engineering perspective.
> **Use these prompts in sequence in any AI tool (ChatGPT, Claude, etc.) for deep, structured research.**

---

## Principles

- `[independent]` What are the foundational engineering principles that govern data center facility design? What physical laws and constraints (thermodynamics, electrical load theory, structural mechanics) shape every design decision?

- `[independent]` What does "Tier" mean in data center design (Uptime Institute Tier I–IV)? How does each tier level translate into specific engineering requirements for power, cooling, and structural redundancy? What are the exact redundancy topologies (N, N+1, 2N, 2N+1) and when is each used?

- `[independent]` What is the relationship between IT load (kW per rack) and the mechanical/electrical infrastructure required to support it? What is the typical ratio of IT load to total facility load, and how does PUE (Power Usage Effectiveness) quantify this?

- `[independent]` What is the "critical load" vs "mechanical load" vs "total facility load" distinction, and why does this matter for sizing every system in the building?

---

## Framework: Power Architecture & Electrical Distribution

- `[independent]` What is the full power chain in a data center, from utility grid connection to the server chip? Map every component: HV/MV switchgear → transformers → main switchboard → UPS → static transfer switch → PDU → busway/whip → rack PDU → server PSU. What are the key design parameters at each stage (voltage levels, amperage, fault current ratings)?

- `[independent]` What are the different UPS topologies used in data centers (double-conversion, line-interactive, rotary, DRUPS)? What are the engineering tradeoffs of each — efficiency, footprint, battery type (VRLA, Li-ion, flywheel), runtime, and maintenance burden?

- `[independent]` How are generators sized and configured in data centers? What determines the number of generators, fuel type (diesel, HVO, gas), fuel storage duration, and switchover time? What are the implications of N+1 vs 2N generator configurations on site layout and civil engineering?

- `[independent]` How does power density per rack (kW) drive upstream electrical design? Walk through the engineering impact of going from 6 kW/rack to 20 kW/rack to 50 kW/rack to 100+ kW/rack — what changes in transformer sizing, cable cross-sections, busbar ratings, PDU configurations, and switchgear?

- `[sequential]` Given the power chain components above, what are the most common single points of failure in data center electrical design, and how do different redundancy topologies (N+1, 2N, 2N+1, distributed redundant, catcher configurations) eliminate them?

---

## Framework: Cooling & Thermal Management

- `[independent]` What are the primary cooling architectures used in data centers today? Describe the engineering of each: (a) raised-floor CRAC/CRAH with perforated tiles, (b) in-row cooling, (c) rear-door heat exchangers, (d) direct liquid cooling (DLC) with cold plates, (e) single-phase immersion, (f) two-phase immersion. What kW/rack range does each support?

- `[independent]` What is the heat rejection chain for each cooling type? Map the engineering from rack → room/CDU → secondary loop → heat rejection plant (chillers, cooling towers, dry coolers, adiabatic coolers). What are the key parameters: delta-T, flow rates (L/min), pipe sizing, pump head pressure, water quality requirements?

- `[independent]` How does "free cooling" / economization work in data center design? What are the engineering differences between airside economization, waterside economization, and indirect evaporative cooling? How do climate zones (ASHRAE climate data) determine which approach is viable and how many hours/year of free cooling you get?

- `[independent]` What is the engineering of hot aisle / cold aisle containment? How does containment affect supply and return air temperatures, fan energy, and cooling efficiency? What are the design parameters (aisle width, blanking panels, containment material, pressure differential)?

- `[sequential]` How does the choice of cooling architecture fundamentally reshape the MEP layout of a data center? Compare the facility floor plan, piping runs, pump rooms, CDU placement, and roof/yard equipment footprint for: (a) a traditional air-cooled 10 kW/rack facility vs (b) a liquid-cooled 60 kW/rack AI facility.

---

## Framework: Structural & Civil Engineering

- `[independent]` What are the structural engineering requirements specific to data centers? Cover: floor loading capacity (typical ranges in kPa or kg/m² for different use cases), raised floor vs slab-on-grade design, ceiling/clear height requirements (and why they vary), column grid spacing, and how these interact with rack layout and cooling infrastructure.

- `[independent]` How do seismic design requirements affect data center engineering? What standards apply (e.g., ASCE 7, Eurocode 8)? How does seismic zone classification change structural design, rack anchoring, and piping bracing?

- `[independent]` What are the civil engineering considerations for data center sites? Cover: site grading and drainage, transformer pad and generator yard design, fuel tank placement, cooling tower/dry cooler footprint, security setback distances, and loading dock access for equipment delivery.

- `[independent]` What is the engineering of roof loading for data centers? Why do rooftop-mounted cooling plants (dry coolers, cooling towers) create specific structural demands, and how does this differ from ground-level heat rejection?

---

## Framework: Network & Cabling Infrastructure

- `[independent]` What must be designed in data center network cabling infrastructure? Cover: structured cabling systems (copper Cat6A vs Cat8 vs single-mode/multi-mode fiber), cable tray and pathway design (overhead vs under-floor), bend radius constraints, cable density per rack, and meet-me room / cross-connect design.

- `[independent]` How does the choice of network fabric (Ethernet vs InfiniBand vs proprietary interconnect) change the physical cabling infrastructure? What are the differences in cable type, connector type, maximum run length, fiber count per link, and total cable mass/volume for a 1,000-rack GPU cluster?

- `[independent]` What is the engineering of fiber optic infrastructure in a data center? Cover: fiber trunk design, MTP/MPO connector systems, fiber density (fibers per rack for different workloads), splice enclosures, and how fiber infrastructure scales differently than copper.

---

## Framework: Fire Suppression & Life Safety

- `[independent]` What are the engineering options for fire suppression in data centers? Compare: (a) clean agent gas systems (Novec 1230, FM-200, IG-541), (b) pre-action sprinkler systems, (c) water mist systems. For each: how do they work, what are the design parameters (agent quantity, pipe sizing, discharge time, room sealing requirements), and what drives the choice between them?

- `[independent]` What is VESDA (Very Early Smoke Detection Apparatus) and how is it engineered into a data center? How does it integrate with suppression systems? What other detection methods exist (spot detectors, beam detectors, aspirating systems)?

- `[independent]` How do insurance requirements and local fire codes influence fire suppression design choices? What is the tension between gas-based suppression (preferred for equipment protection) and water-based systems (required by some codes/insurers)?

---

## Framework: Physical Security

- `[independent]` What are the physical security engineering requirements for data centers at different security tiers? Map: perimeter (fencing, bollards, vehicle barriers), building shell (blast resistance ratings, ballistic glazing), access control (mantraps, biometrics, anti-tailgating), and internal zones (cage partitions, vault rooms, CCTV coverage).

- `[independent]` What is TEMPEST/EMSEC shielding and when is it required in data center design? What are the engineering implications — shielded rooms, signal attenuation requirements, filtered power lines, waveguide ventilation penetrations?

---

## Framework: BMS, Controls & Monitoring

- `[independent]` What building management and control systems must be designed for a data center? Cover: DCIM (Data Center Infrastructure Management), BMS/BAS integration, environmental monitoring (temperature, humidity, differential pressure, leak detection), power monitoring and metering (per-circuit, per-rack), and how these integrate with cooling plant controls.

- `[independent]` What is the engineering of electrical metering and power quality monitoring in a data center? What gets metered (utility feed, UPS output, PDU, rack, server), at what granularity, and what power quality parameters matter (THD, power factor, voltage stability)?

---

## Framework: Site Selection & External Infrastructure

- `[independent]` What external infrastructure must be designed or secured for a data center site? Cover: utility grid connection (HV/MV, dedicated substation vs shared), power availability and redundancy (dual feed, ring main), water supply (volume and quality for evaporative cooling), fiber connectivity (diverse fiber routes, dark fiber availability), and how these constrain or enable facility design.

- `[independent]` What zoning, permitting, and regulatory approvals are required for data center construction? How do these vary by jurisdiction, and what design constraints do they impose (noise limits, emissions, visual screening, water discharge, backup generator permits)?

---

## Expert Simulation

- `[independent]` If a senior MEP (Mechanical, Electrical, Plumbing) engineer were starting a data center design from scratch, what would be their first 10 questions to the client before putting pen to paper? What information do they absolutely need to begin?

- `[sequential]` Based on those questions, what are the "long-lead" design decisions — the ones that, if changed later, cause the most expensive redesign and project delays? Rank them by cost-of-change.

- `[independent]` What would an experienced data center commissioning engineer say are the most common design flaws they encounter during Cx (commissioning)? What gets designed on paper but fails in practice?

---

## Failure Analysis

- `[independent]` What are the most common engineering design failures in data centers? Cover: undersized cooling, single points of failure in power distribution, inadequate cable pathway capacity, floor loading exceedance, insufficient ceiling height for containment + cable trays, and poor coordination between electrical and mechanical trades.

- `[independent]` What happens when a data center is designed for one workload type but then asked to support a different workload? What physical constraints cannot be changed post-construction (floor loading, ceiling height, power density at transformer level, cooling plant capacity)?

- `[independent]` What are the most expensive design changes to make after construction has started? Why do late changes to power density, cooling architecture, or redundancy topology cascade through the entire facility design?

---

## Interdependencies

- `[sequential]` Map the critical interdependencies between design domains. How does a change in rack power density (kW/rack) cascade through: (a) electrical distribution sizing, (b) cooling capacity and architecture, (c) floor loading, (d) cable density, (e) fire suppression approach, and (f) structural requirements? Provide a specific example: what changes across ALL domains when you go from 10 kW/rack air-cooled to 60 kW/rack liquid-cooled?

- `[sequential]` What is the design coordination process between disciplines (architectural, structural, mechanical, electrical, fire protection, security, IT/network)? At what stages must they align, and what happens when one discipline changes a parameter without informing the others?

---

## Application

- `[sequential]` Now apply all of the above to produce a comprehensive "Data Center Design Anatomy" reference document. For each of the 8 engineering domains identified:
  - **What must be designed** (deliverables: drawings, specifications, calculations)
  - **Key design parameters** (the numbers that define the design — kW, kPa, L/min, dB, lux, etc.)
  - **Critical decisions** (the choices that lock in downstream constraints)
  - **Interactions with other domains** (what changes here forces changes there)
  - **Typical value ranges** (what is standard for enterprise colo vs hyperscale vs AI/HPC)
  
  Format as an engineering reference table where possible. Cite specific standards (ASHRAE, Uptime Institute, EN 50600, BICSI, NFPA) where applicable.
