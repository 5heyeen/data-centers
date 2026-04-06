# Cooling Architecture Deep Dive: Air vs Liquid vs Immersion

## 1. Air Cooling Engineering

### CRAC/CRAH Sizing and Airflow

Computer Room Air Conditioning (CRAC) units use a direct expansion (DX) refrigerant cycle with an integral compressor, while Computer Room Air Handlers (CRAH) units use chilled water from a central plant. CRAC units are typically sized for facilities under 200 kW electrical load, while CRAH units serve larger deployments above 200 kW. Individual CRAC units commonly range from 20 to 200 kW sensible cooling capacity, delivering roughly 5,000 to 30,000 CFM depending on model and configuration. CRAH units in large facilities can reach 300+ kW per unit. Airflow (CFM) is set based on the per-rack heat load -- if density rises, airflow must increase proportionally. A standard 42U rack at 10 kW requires approximately 1,400 CFM of supply air at a typical 20 degF (11 degC) delta-T across the rack ([Uptime Institute](https://journal.uptimeinstitute.com/data-center-cooling-redundancy-capacity-selection-metrics/); [Computer Weekly](https://www.computerweekly.com/tip/CRAC-unit-sizing-Dos-and-donts)).

### Hot/Cold Aisle Containment

ASHRAE TC9.9 recommends the hot aisle/cold aisle layout, with cold aisles at approximately 1,200 mm width and hot aisles at 1,000 mm. Without containment, maintaining adequate server inlet temperatures is feasible up to roughly 5-6 kW per rack but requires excessive fan energy. Cold aisle containment (CAC) becomes effective above 6 kW per enclosure when combined with blanking panels. Hot aisle containment (HAC) is thermally superior because it isolates the smaller volume of hot exhaust, allowing the remainder of the room to serve as a cold air plenum -- but it creates a less comfortable working environment for technicians in the hot aisle. Full containment enables deployments of 15-20 kW per rack with air cooling, though practical density ceilings are typically cited at approximately 15 kW/rack ([Data Center Frontier](https://www.datacenterfrontier.com/special-reports/article/11427230/containment-strategies-in-high-density-data-centers); [Enterprise Control Systems](https://www.datacenterexperts.com/products/data-center-cooling-efficiency-and-containment)).

### Why Air Hits a Wall at ~15 kW/Rack

The fundamental constraint is the low specific heat capacity of air (1.006 kJ/kg-K) and its low density. Removing 15 kW from a rack requires roughly 2,100 CFM at a 20 degF delta-T. At 30+ kW, the required airflow volume becomes impractical: perforated floor tiles cannot deliver sufficient CFM, fan energy consumption rises sharply, and air mixing defeats containment strategies. The result is that air-cooled systems hit a hard wall where the parasitic energy cost of moving enough air undermines the entire efficiency proposition ([Mitsubishi Electric](https://mitsubishicritical.com/resources/blog/types-of-data-center-cooling-technology/)).

### Infrastructure Requirements

Air-cooled facilities typically require a raised floor (600-900 mm) serving as a supply air plenum, chilled water piping to CRAH units or refrigerant piping to CRAC units, a central chiller plant (for CRAH systems), humidification/dehumidification systems, and extensive ductwork or tile management. The chiller plant alone can consume 30-40% of total cooling energy in conventional facilities ([DOE Best Practices Guide](https://www.energy.gov/sites/default/files/2024-07/best-practice-guide-data-center-design_0.pdf)).

---

## 2. Direct Liquid Cooling (DLC) Engineering

### Cold Plate Design

Cold plates mount directly onto CPUs, GPUs, and in advanced implementations, DIMMs and VRMs. Two primary designs dominate: **micro-channel** cold plates (channel widths under 500 um) offering the highest heat transfer coefficient but greater sensitivity to particulate contamination, and **fin-type** cold plates providing a balance between performance and reliability. Contact pressure and thermal interface material (TIM) selection are critical -- poor contact or degraded TIM can add 0.1-0.3 degC/W to thermal resistance. CoolIT recently announced a 4,000 W-capable single-phase cold plate that captures over 97% of heat from a 4 kW thermal test vehicle at 6 liters per minute flow rate, more than doubling previously accepted single-phase DLC limits ([CoolIT / Tom's Hardware](https://www.tomshardware.com/pc-components/liquid-cooling/coolit-unleashes-4kw-single-phase-dlc-cold-plate-seemingly-timed-for-nvidia-blackwell-ultra-chips); [DCD](https://www.datacenterdynamics.com/en/news/coolit-details-liquid-cooling-coldplate-able-to-cool-4000w-chips/)).

### Coolant Distribution Units (CDUs)

The CDU is the central heat exchange hub, transferring heat from the secondary (server-side) coolant loop to the facility chilled water or warm water supply while maintaining precise temperature, pressure, and flow control. CDUs come in two primary form factors: **in-rack** (e.g., Motivair's 4U design or Asetek's InRackCDU at up to 80 kW) and **end-of-row** (handling multiple racks, ranging from 100 kW to multi-MW). DCX Liquid Cooling Systems announced an 8 MW CDU optimized for 45 degC warm-water cooling targeting NVIDIA Vera Rubin deployments. Supermicro's in-rack CDU features 1+1 redundant hot-swappable pumps for resilience. CDU heat exchangers are typically liquid-to-liquid plate or shell-and-tube designs ([Boyd Corp](https://www.boydcorp.com/thermal/liquid-cooling-systems/coolant-distribution-unit-cdu.html); [Vertiv](https://www.vertiv.com/en-us/about/news-and-insights/articles/educational-articles/understanding-coolant-distribution-units-cdus-for-liquid-cooling/); [Motivair](https://www.motivaircorp.com/products/in-rack-cdu/); [BusinessWire/DCX](https://www.businesswire.com/news/home/20260123068139/en/DCX-Liquid-Cooling-Systems-Announces-New-8MW-Coolant-Distribution-Unit-Optimized-for-45C-Warm-Water-Cooling-in-Next-Gen-NVIDIA-Vera-Rubin-AI-Deployments)).

### Piping Infrastructure and Connectors

Facility-side piping uses standard copper or stainless steel manifolds distributing chilled or warm water to CDUs. The critical engineering challenge is at the rack level: **blind-mate quick-disconnect connectors** (from vendors like Staubli and Eaton) enable servers to be hot-swapped without draining the loop. CoolIT's rack manifolds combined with Staubli dry-break, dripless quick disconnects allow server insertion/removal with zero fluid loss. Misalignment compensation in the couplings accommodates the imprecision inherent in blind rack insertion. Leak detection systems (rope-type sensors along manifolds and drip trays under overhead piping) are mandatory ([Staubli](https://www.staubli.com/us/en/fluid-connectors/industries/it-cooling.html); [CoolIT](https://www.coolitsystems.com/technology/)).

### Warm Water Loops (35-45 degC) and Free Cooling

ASHRAE's 5th Edition thermal guidelines define liquid temperature classes: W17, W27, W32, W40, W45, and W+. Operating at W40-W45 (supply water at 40-45 degC) is transformative because it enables **year-round free cooling via dry coolers** in most climates -- the facility water return temperature (typically 50-55 degC) is high enough to reject heat to ambient air without compressor-based chillers in all but the hottest conditions. NVIDIA's reference architectures for GB200 and Vera Rubin specify 45 degC facility water supply, explicitly targeting chiller-free operation. However, CoolIT cautions that truly chiller-free operation requires ambient conditions that reliably support 45 degC water; extended heat waves above 35 degC ambient still require supplementary mechanical cooling ([DCD](https://www.datacenterdynamics.com/en/analysis/hot-water-cold-water/); [CoolIT](https://www.coolitsystems.com/resources/news/warm-water-cooling-and-ai-the-future-is-here-but-its-not-chiller-free/); [NREL](https://www.nrel.gov/computational-science/warm-water-liquid-cooling); [ASHRAE](https://www.ashrae.org/file%20library/technical%20resources/bookstore/emergence-and-expansion-of-liquid-cooling-in-mainstream-data-centers_wp.pdf)).

### Heat Split: Liquid vs Air

In a hybrid DLC deployment (cold plates on CPUs/GPUs only), **typically 60-80% of total server heat is captured by liquid**, with the remaining 20-40% dissipated by reduced-speed fans cooling DIMMs, NVMe drives, and networking components. GIGABYTE reports over 92% capture in their full-coverage DLC servers, while Supermicro's latest systems with DIMM cold plates push capture to 95-98%. The Chilldyne/Intel testing found 56% capture with CPU-only cold plates, rising to 64% when prototype DIMM cooling was added. The residual air-side heat must still be managed, typically with reduced-capacity CRAH units or in-row coolers operating at much lower fan speeds ([GIGABYTE](https://www.gigabyte.com/Solutions/gigabyte-dlc); [Chilldyne](https://chilldyne.com/simplifying-the-thermal-qualification-process-with-direct-liquid-cooling-for-data-center-servers/); [ToneCooling](https://tonecooling.com/direct-liquid-cooling-data-center/)).

### Server-Side Plumbing

Flexible hoses (typically braided EPDM or silicone) connect cold plates within the server chassis. Operating pressures range from 1-3 bar. Water quality is critical: deionized water with corrosion inhibitors (propylene glycol-based) is standard; micro-channel cold plates with sub-500 um channels are particularly sensitive to particulate contamination, requiring filtration to 5-10 um and continuous water quality monitoring ([XD Thermal](https://www.xdthermal.com/engineering-liquid-cooling-a-guide-to-direct-to-chip-cold-plate-operations-in-data-centers/); [ToneCooling CDU Guide](https://tonecooling.com/coolant-distribution-unit-cdu-data-center/)).

---

## 3. Immersion Cooling Engineering

### Single-Phase Systems

In single-phase immersion, servers are submerged in a dielectric fluid that remains liquid throughout. Common fluids include **mineral oils** (low cost at ~$5-10/liter, specific heat ~1.7 kJ/kg-K, viscosity ~15-30 cSt at 40 degC, flash point >220 degC) and **synthetic hydrocarbons** (higher cost but better long-term stability). Dielectric strength must exceed 30 kV/mm. Tank designs vary but a typical configuration holds 4-12 servers oriented vertically or horizontally. Pump sizing depends on flow rate requirements to maintain adequate fluid velocity across all server surfaces. Heat exchangers (liquid-to-liquid) transfer heat from the dielectric loop to facility water. GRC's ICEraQ system supports up to 200 kW per rack in this configuration ([GRC](https://www.grcooling.com/iceraq/); [Data Center Frontier](https://www.datacenterfrontier.com/cooling/article/11428163/grc-pushes-density-limits-with-support-for-200-kw-immersion-racks); [Standard Fluids](https://standardfluids.com/single-phase-vs-two-phase-immersion-cooling-understanding-the-technical-differences-that-matter/); [Dynalene](https://www.dynalene.com/immersion-coolants-for-data-centers-selection-criteria/)).

### Two-Phase Systems

Two-phase immersion cooling exploits the **latent heat of vaporization** -- the phase change from liquid to vapor absorbs approximately 50-160 kJ/kg for engineered fluorocarbons (compared to 2,260 kJ/kg for water). Fluids are selected for boiling points matched to chip thermal design points, typically 34-60 degC. Vapor rises from the boiling surface to a condenser (typically finned coils at the top of the tank or a separate condenser unit), where it re-liquefies and drains back. ZutaCore's HyperCool system uses a **closed-loop direct-to-chip** two-phase approach rather than full immersion: the fluids (HFO-1336mzz-Z and R-1233zd) have a GWP of approximately 1-2, ODP of zero, and a 100 kW rack uses less than 4 gallons of fluid. Critically, ZutaCore's closed-loop design has effectively zero fluid loss to atmosphere, compared to open-tank two-phase immersion systems that can lose approximately 10% of fluid volume (tens of liters per rack) annually through evaporation during maintenance events ([ZutaCore](https://zutacore.com/solutions); [ZutaCore blog](https://blog.zutacore.com/zutacore-blog/two-phase-dlc-not-immersion-liquid-cooling); [StorageReview](https://www.storagereview.com/review/breaking-thermal-barriers-testing-zutacores-two-phase-server-cooling)).

### Floor Loading

Immersion tanks impose significant structural loads. A fully loaded single-phase immersion tank with fluid and servers can weigh **2,000-3,000 kg** (2-3 tonnes), far exceeding the typical data center floor loading specification of 1,000-1,500 kg/m2 for raised floors. Because immersion tanks are oriented horizontally, the weight is distributed over a larger footprint than vertical racks, partially mitigating point-load concerns. Any retrofit or new build must include a structural analysis by a licensed engineer. GRC notes that their systems can be installed on both raised and slab floors, but structural verification is mandatory ([GRC](https://www.gr-cooling.com/blog/immersion-cooling-readiness-a-checklist-for-data-center-efficiency); [GIGABYTE/GRC](https://www.gigabyte.com/Solutions/grc-single-phase)).

### Serviceability Challenges

Servicing immersion-cooled equipment requires removing the entire server board from fluid, allowing it to drain (dielectric fluid is slippery and must be contained), performing the repair, and re-submerging. This process is slower and messier than hot-swapping an air-cooled server. Lifting devices are needed because horizontal orientation means servers cannot simply slide out as they would from a vertical rack. Specialized training is required, and fluid handling protocols (spill containment, PPE, fluid reclamation) add operational complexity. These factors increase mean-time-to-repair (MTTR) and are a frequently cited barrier to adoption ([DCD](https://www.datacenterdynamics.com/en/opinions/immersion-cooling-safety-in-a-data-center/); [GRC/Datamation](https://www.datamation.com/data-center/grc-latest-immersion-cooling/)).

---

## 4. Retrofit Complexity

### Air-Cooled to DLC

Retrofitting an existing air-cooled facility for DLC requires: (1) installing facility-side chilled/warm water piping to each row or rack position; (2) placing CDUs (end-of-row or in-rack); (3) running secondary coolant manifolds and blind-mate connections to each rack; (4) potentially reinforcing ceiling grids for overhead manifold support; and (5) maintaining residual air cooling capacity (at reduced scale) for the 20-30% heat still dissipated to air. Raised-floor environments need careful CFD modeling for piping routing; slab-floor facilities typically use overhead piping with drip pans. Budget estimates: **$100,000-150,000 per rack** for a DLC retrofit, or approximately **$2-3 million per MW**. A detailed 20-rack GPU cluster retrofit (assessment, equipment, installation, power upgrades, structural mods, PM, and 20% contingency) was estimated at **$3.3 million total**. Complete retrofit projects typically take **6 months** from assessment to production, with per-rack downtime of 2-4 hours during cutover ([Introl](https://introl.com/blog/retrofitting-legacy-data-centers-ai-liquid-cooling-integration); [Tate](https://www.tateglobal.com/emea/insights-resources/knowledge-hub/retrofitting-liquid-cooling-for-ai-data-centers/); [Energy Solutions Intelligence](https://energy-solutions.co/articles/sub/data-center-cooling-liquid-immersion-vs-air)).

### Air-Cooled to Immersion

Immersion retrofits are more disruptive: existing racks are removed entirely and replaced with tanks; floor loading must be verified and potentially upgraded (slab thickening, additional structural support); fluid storage and handling infrastructure is required; electrical distribution may need reconfiguration for horizontal tank orientation; and HVAC can be substantially reduced but not eliminated (building ventilation, UPS cooling). Initial immersion deployments in retrofit scenarios have taken **14 weeks for first-tank commissioning** (extended from 8-week plans due to firmware compatibility), with subsequent tanks at 3-4 weeks each ([Introl](https://introl.com/blog/retrofitting-legacy-data-centers-ai-liquid-cooling-integration)).

### Cost and Timeline: Retrofit vs Purpose-Built

Purpose-built liquid-cooled facilities avoid the structural reinforcement, piping retrofit, and operational disruption costs. While specific comparative figures vary widely, the operational savings from liquid cooling (estimated at **$1.37 million annually** for a mid-scale deployment) yield a **2.4-year payback period** on retrofit capital expenditure. Purpose-built facilities realize savings from day one ([CIBSE Journal](https://www.cibsejournal.com/general/cost-model-data-centre-cooling/); [Schneider Electric](https://blog.se.com/datacenter/architecture/2020/02/24/liquid-vs-air-cooling-which-is-the-capex-winner/)).

---

## 5. PUE Impact by Cooling Type

| Cooling Technology | Typical PUE Range | Key Parasitic Loads |
|---|---|---|
| Air-cooled with chiller | **1.3 - 1.6** | Compressor-based chillers, high-speed fans, humidification |
| Air-cooled with free cooling (Nordic) | **1.1 - 1.3** | Fans (reduced compressor hours, economizer-dominant) |
| DLC warm water (W40-W45) | **1.03 - 1.15** | Low-speed pumps, dry coolers, reduced fans for residual air |
| Immersion (single-phase) | **1.02 - 1.06** | Low-speed pumps, minimal/no fans, dry coolers |

### Why the Differences

The PUE gap is driven almost entirely by **parasitic loads**:

- **Compressors** are the largest energy consumers in air-cooled systems. Chillers typically consume 0.5-0.7 kW per kW of cooling. Eliminating compressors (via warm water DLC or immersion) immediately cuts cooling energy by 40-60%.
- **Fans** are the second-largest consumer. Air cooling requires high-velocity, high-volume airflow; fan power scales with the cube of flow velocity. DLC systems reduce fan requirements by 70-90% (only cooling residual air-side heat). Immersion eliminates server fans entirely.
- **Pumps** consume far less energy than fans for equivalent heat transfer because liquid has ~3,000x the volumetric heat capacity of air. CDU pumps typically consume 2-5% of the heat load they service.
- **Free cooling** in Nordic climates reduces air-cooled PUE to 1.1-1.3 by using ambient air directly, but fan energy remains substantial. Warm water DLC achieves lower PUE even in warm climates because dry coolers rejecting 50 degC water are effective up to 35+ degC ambient.

Moving from a PUE of 1.50 (typical air-cooled) to 1.05 (optimized immersion) translates to a **30% reduction in total facility energy** for the same IT load. At hyperscale, this difference equates to tens of millions of dollars annually ([McKinsey](https://www.mckinsey.com/capabilities/operations/our-insights/operations-blog/keeping-cool-in-the-data-age); [Park Place Technologies](https://www.parkplacetechnologies.com/blog/data-center-liquid-cooling-vs-air-cooling/); [Anderson Power](https://www.andersonpower.com/us/en/about-us/news-and-events/air-cooling-vs--liquid-cooling--the-future-of-data-center-therma.html); [DOE/LBNL](https://datacenters.lbl.gov/liquid-cooling)).

---

## Vendor Landscape Summary

| Vendor | Technology | Notable Capability |
|---|---|---|
| **CoolIT** | DLC cold plates + CDUs | 4 kW single cold plate; Staubli blind-mate integration |
| **Asetek** | DLC InRackCDU | 80 kW in-rack CDU; NREL warm-water deployment |
| **Motivair** (now Schneider) | DLC CDUs + manifolds | 5 MW single-site deployment in Northern Virginia |
| **GRC** | Single-phase immersion | ICEraQ at 200 kW/rack |
| **ZutaCore** | Two-phase DLC (closed loop) | GWP ~1-2, zero fluid loss, waterless operation |
| **LiquidCool Solutions** | Single-phase immersion | Sealed chassis approach for edge deployments |
| **Vertiv** (acquired CoolTera) | DLC CDUs | Integrated with Vertiv power/thermal ecosystem |

---

## Key Takeaways

1. **Air cooling is viable up to ~15 kW/rack** with full containment but hits fundamental physics limits beyond that.
2. **DLC is the mainstream path** for AI/HPC racks at 40-100+ kW, with the DLC market growing 156% YoY. Warm water (W40-W45) loops are the key enabler for eliminating chillers.
3. **Immersion cooling achieves the lowest PUE** but faces adoption barriers: serviceability, floor loading, fluid costs ($50-90/liter for engineered fluorocarbons), and operational unfamiliarity.
4. **Retrofits are feasible but expensive** ($2-3M/MW for DLC, more for immersion) with 6-month timelines. Purpose-built facilities are significantly more cost-effective.
5. **Hybrid cooling persists**: even in DLC deployments, 5-30% of heat remains air-side, requiring residual CRAH/fan infrastructure.

---

Sources:
- [Uptime Institute - CRAC/CRAH Redundancy & Capacity](https://journal.uptimeinstitute.com/data-center-cooling-redundancy-capacity-selection-metrics/)
- [Computer Weekly - CRAC Unit Sizing](https://www.computerweekly.com/tip/CRAC-unit-sizing-Dos-and-donts)
- [Data Center Frontier - Containment Strategies](https://www.datacenterfrontier.com/special-reports/article/11427230/containment-strategies-in-high-density-data-centers)
- [Mitsubishi Electric - Cooling Technology Types](https://mitsubishicritical.com/resources/blog/types-of-data-center-cooling-technology/)
- [CoolIT - 4kW Cold Plate (Tom's Hardware)](https://www.tomshardware.com/pc-components/liquid-cooling/coolit-unleashes-4kw-single-phase-dlc-cold-plate-seemingly-timed-for-nvidia-blackwell-ultra-chips)
- [Staubli - IT Cooling Connectors](https://www.staubli.com/us/en/fluid-connectors/industries/it-cooling.html)
- [Boyd Corp - CDU Overview](https://www.boydcorp.com/thermal/liquid-cooling-systems/coolant-distribution-unit-cdu.html)
- [Vertiv - CDU Guide](https://www.vertiv.com/en-us/about/news-and-insights/articles/educational-articles/understanding-coolant-distribution-units-cdus-for-liquid-cooling/)
- [DCD - Hot Water Cold Water Temperature Analysis](https://www.datacenterdynamics.com/en/analysis/hot-water-cold-water/)
- [CoolIT - Warm Water Cooling and AI](https://www.coolitsystems.com/resources/news/warm-water-cooling-and-ai-the-future-is-here-but-its-not-chiller-free/)
- [NREL - Warm Water Liquid Cooling](https://www.nrel.gov/computational-science/warm-water-liquid-cooling)
- [ASHRAE - Liquid Cooling White Paper](https://www.ashrae.org/file%20library/technical%20resources/bookstore/emergence-and-expansion-of-liquid-cooling-in-mainstream-data-centers_wp.pdf)
- [ASHRAE - 5th Edition Thermal Guidelines Reference Card](https://www.ashrae.org/file%20library/technical%20resources/bookstore/supplemental%20files/therm-gdlns-5th-r-e-refcard.pdf)
- [DCX/BusinessWire - 8MW CDU for 45C Warm Water](https://www.businesswire.com/news/home/20260123068139/en/DCX-Liquid-Cooling-Systems-Announces-New-8MW-Coolant-Distribution-Unit-Optimized-for-45C-Warm-Water-Cooling-in-Next-Gen-NVIDIA-Vera-Rubin-AI-Deployments)
- [GIGABYTE - DLC Solution](https://www.gigabyte.com/Solutions/gigabyte-dlc)
- [GRC - ICEraQ Immersion Cooling](https://www.grcooling.com/iceraq/)
- [GRC - 200kW Immersion Racks (Data Center Frontier)](https://www.datacenterfrontier.com/cooling/article/11428163/grc-pushes-density-limits-with-support-for-200-kw-immersion-racks)
- [ZutaCore - HyperCool Solutions](https://zutacore.com/solutions)
- [ZutaCore - Two-Phase vs Immersion](https://blog.zutacore.com/zutacore-blog/two-phase-dlc-not-immersion-liquid-cooling)
- [StorageReview - ZutaCore Two-Phase Testing](https://www.storagereview.com/review/breaking-thermal-barriers-testing-zutacores-two-phase-server-cooling)
- [Motivair - In-Rack CDU](https://www.motivaircorp.com/products/in-rack-cdu/)
- [Asetek - InRackCDU](https://www.asetek.com/company/about-asetek/asetek-heritage-technology/data-center/technology-for-data-centers/inrackcdu/)
- [Introl - Retrofitting Legacy Data Centers](https://introl.com/blog/retrofitting-legacy-data-centers-ai-liquid-cooling-integration)
- [Tate - Retrofitting Liquid Cooling](https://www.tateglobal.com/emea/insights-resources/knowledge-hub/retrofitting-liquid-cooling-for-ai-data-centers/)
- [McKinsey - Keeping Cool in the Data Age](https://www.mckinsey.com/capabilities/operations/our-insights/operations-blog/keeping-cool-in-the-data-age)
- [Park Place Technologies - Liquid vs Air Cooling](https://www.parkplacetechnologies.com/blog/data-center-liquid-cooling-vs-air-cooling/)
- [DOE - Best Practices Guide for Data Center Design](https://www.energy.gov/sites/default/files/2024-07/best-practice-guide-data-center-design_0.pdf)
- [DOE/LBNL - Liquid Cooling](https://datacenters.lbl.gov/liquid-cooling)
- [Dynalene - Immersion Coolant Selection](https://www.dynalene.com/immersion-coolants-for-data-centers-selection-criteria/)
- [DCD - Immersion Cooling Safety](https://www.datacenterdynamics.com/en/opinions/immersion-cooling-safety-in-a-data-center/)
- [XD Thermal - Engineering Liquid Cooling Guide](https://www.xdthermal.com/engineering-liquid-cooling-a-guide-to-direct-to-chip-cold-plate-operations-in-data-centers/)
- [ToneCooling - CDU Sizing Guide](https://tonecooling.com/coolant-distribution-unit-cdu-data-center/)
- [Energy Solutions Intelligence - Liquid vs Air 2026 Analysis](https://energy-solutions.co/articles/sub/data-center-cooling-liquid-immersion-vs-air)
