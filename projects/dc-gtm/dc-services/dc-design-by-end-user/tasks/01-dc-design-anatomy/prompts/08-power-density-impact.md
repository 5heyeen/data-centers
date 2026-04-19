# Prompt 08: power-density-impact

> **Prompt:** [See prompt chain for full text]

---

# Power Density Per Rack: How kW/Rack Drives Upstream Electrical Design

## The Fundamental Relationship

Power density per rack is the single most consequential design input for a data center's electrical infrastructure. Every doubling of rack density triggers non-linear changes upstream — larger transformers, heavier conductors, different distribution architectures, and ultimately a completely different facility topology. Below is a detailed walk-through across four density tiers.

---

## Tier 1: 6 kW/rack — Traditional Enterprise (3 MW IT Load with 500 Racks)

This is the baseline that dominated enterprise data centers from roughly 2005–2018.

**Transformer sizing:** With a 3 MW IT load and typical PUE of 1.4–1.5, the total facility load is approximately 4.2–4.5 MW. This is commonly served by 2–3 dry-type transformers rated at 2,000–2,500 kVA each (medium voltage 10/20 kV to 400/415V), with N+1 redundancy. Medium-voltage utility feed is typically 10–20 kV on a single incoming line.

**Cable cross-sections:** At 6 kW per rack on a 400V three-phase circuit, each rack draws roughly 8.7A. A single 32A circuit (using 6 mm² copper) can serve 2–3 racks. Floor-level distribution uses standard 3-phase whips from floor-mount or row-mount PDUs. Feeder cables from transformer to PDU are typically 240–300 mm² copper per phase for 800–1,000A feeds.

**PDU configurations:** Conventional floor-standing PDUs rated 100–200 kVA each, with output breakers feeding rack-mount power strips (intelligent rack PDUs). A 3 MW hall might have 20–30 floor PDUs. Each rack PDU is typically a metered or switched strip with C13/C19 outlets.

**Switchgear:** Standard low-voltage switchgear (LV main distribution boards) rated 3,200–4,000A, commonly air-insulated. Main switchboards, automatic transfer switches (ATS), and static transfer switches (STS) are all commodity items at this scale.

**Electrical room footprint:** Relatively modest — roughly 150–250 m² for the main electrical room serving a 3 MW IT hall.

---

## Tier 2: 20 kW/rack — Modern High-Density (10 MW IT Load with 500 Racks)

This tier represents GPU-accelerated workloads (NVIDIA A100 clusters, dense HPC), and became the "new normal" target for hyperscalers around 2020–2023.

**Transformer sizing:** At 10 MW IT load (approximately 13–14 MW total at PUE 1.3–1.4), the facility now requires dedicated medium-voltage switchgear — typically 33/36 kV or 20 kV ring main units feeding 4–6 transformers of 2,500–3,150 kVA each. Redundancy architecture shifts to 2N or distributed redundant configurations.

**Cable cross-sections:** Each rack now draws approximately 29A at 400V 3-phase. Dedicated 32A or 63A circuits per rack become necessary. Feeder cables from transformers to power distribution increase to 400–630 mm² per phase, or parallel runs. Cable tray volume roughly triples compared to the 6 kW scenario — a major space claim in risers and under raised floors.

**PDU configurations:** Floor PDUs scale to 250–400 kVA units. Some operators begin evaluating overhead busbar-tap systems (Starline, E+I Engineering) to eliminate the spaghetti of whip cables under raised floor or in overhead trays. The economic crossover point for busbar vs. cable is typically around 15–20 kW/rack, where the volume of individual cables becomes unmanageable.

**Switchgear:** LV switchboards jump to 5,000–6,300A ratings. Multiple parallel boards or distributed switchgear rooms emerge. This is the density where air-cooled LV switchgear begins to approach thermal limits in compact rooms, requiring careful HVAC design for electrical spaces or larger rooms with greater clearances.

**Electrical room footprint:** Expands to 400–600 m² — roughly 2.5x the 6 kW scenario despite only being a 3.3x power increase, because of redundancy paths and cable routing requirements.

---

## Tier 3: 50 kW/rack — AI/GPU-Dense (25 MW IT Load with 500 Racks)

This is the domain of NVIDIA DGX H100 SuperPOD deployments, CoreWeave GPU clusters, and large-scale AI training. A single DGX H100 system draws approximately 10.2 kW, and a standard 42U rack packed with networking and supporting infrastructure commonly lands at 40–60 kW.

**Transformer sizing:** 25 MW IT load translates to 30–35 MW total facility load (PUE 1.2–1.3 with liquid cooling). This requires dedicated high-voltage utility substations — typically 110/132 kV to 33 kV outdoor substations with 40–50 MVA power transformers, then step-down to 400V via multiple indoor 3,150–4,000 kVA dry-type units. You may need 10–12 distribution transformers. Many operators adopt a "transformer per row" or "transformer per pod" architecture to keep cable runs short.

**Cable cross-sections:** At 50 kW per rack, each rack draws approximately 72A at 400V 3-phase. Individual rack feeds require 16 mm² or 25 mm² copper whips. But the real challenge is the feeders: main bus risers or cable runs now demand 800–1,200A per distribution path. This is where **traditional cabling hits practical limits** — the volume, weight, and bend radius of parallel 630 mm² cables becomes untenable. Overhead busbar becomes effectively mandatory.

**PDU/busbar shift:** The industry consensus at 50 kW/rack is that **overhead busbar with tap-off boxes replaces traditional rack-mount PDU architecture**. Busbar trunking rated at 800–1,600A runs above the rows, with plug-in tap-off units dropping power to each rack. This eliminates thousands of individual cable runs and enables rapid reconfiguration. Companies like Legrand (Starline), Schneider Electric (Canalis), and Siemens (LDA/LDC busbar) dominate this space. Floor-standing PDUs are eliminated or reduced to transformer-rectifier units for 48VDC distribution.

**Switchgear:** Medium-voltage switchgear moves closer to the IT hall — "close-coupled" MV/LV substations positioned adjacent to or within the data hall envelope. LV switchgear at 6,300A ratings becomes standard on each distribution path. Gas-insulated switchgear (GIS) may replace air-insulated switchgear (AIS) where footprint is constrained.

**Practical limit of air-cooled electrical equipment:** At this density, **dry-type transformers at 3,150+ kVA generate substantial waste heat** (typically 1–2% losses, so 30–70 kW per transformer). With 10+ transformers, the electrical room itself can produce 400–700 kW of heat, requiring dedicated mechanical cooling. Conventional air-cooled LV switchgear is rated for 40°C ambient; in rooms packed with heat-producing equipment, derating occurs or active cooling is required. This is the inflection point where some operators adopt **liquid-cooled transformers** or move outdoor (oil-filled units) to avoid the indoor thermal problem.

**Electrical room footprint:** 800–1,500 m² — potentially larger than the IT hall itself if not carefully designed. Many operators move to a **distributed electrical architecture** with multiple smaller electrical rooms flanking the IT halls to reduce cable distances and footprint concentration.

---

## Tier 4: 100+ kW/rack — Liquid-Cooled AI Supercomputing (50+ MW IT Load with 500 Racks)

This is the frontier tier: NVIDIA GB200 NVL72 racks at 120+ kW, next-generation AI training clusters deployed by CoreWeave, Microsoft, xAI (the Memphis Gigafactory), and Oracle. CoreWeave's 2024–2025 deployments with Blackwell-architecture GPUs are specified at 100–132 kW per rack.

**Transformer sizing:** 50 MW IT at PUE 1.1–1.15 (direct liquid cooling eliminates most mechanical cooling load) yields 55–58 MW total. This requires **dedicated utility-grade substations** — often 132/220 kV grid connections with 60–100 MVA power transformers, frequently requiring utility reinforcement and new transmission infrastructure (12–24 month lead time). Step-down is commonly 132 kV → 33 kV → 400V in two stages, with 15–20 distribution transformers of 4,000 kVA.

**Cable cross-sections and busbar:** At 100 kW per rack, each rack draws ~145A at 400V 3-phase (or ~120A at 480V in North America). Individual rack feeds require 35–50 mm² cables. Main distribution busbars must be rated at 2,000–4,000A. **Overhead busbar is the only viable distribution method** — cable-based distribution is physically impossible at this density due to volume, weight (copper density is 8,900 kg/m³), and fire load. Some operators are moving to **415V or 480V distribution** (up from 400V) to reduce current and conductor size by roughly 20%.

**48VDC distribution emerging:** At extreme densities, some hyperscalers (Google, Microsoft) are evaluating **48VDC power distribution to the rack**, eliminating AC-DC conversion at the rack level and reducing distribution losses. This requires DC busbars and DC power shelves instead of traditional AC PDUs.

**Switchgear:** Full medium-voltage distribution within the building. Some designs eliminate LV distribution entirely, using MV-to-rack power conversion (e.g., 33 kV directly to rack-level power supplies via small embedded transformers). Switchgear rooms require rated fire walls, arc-flash containment, and substantial safety clearances mandated by IEC 61439 and local codes.

**Electrical room footprint:** At 50+ MW, the electrical infrastructure can consume **2,000–4,000 m²** across multiple distributed rooms. The ratio of electrical space to IT space can reach 1:1 or higher. This is why many 100+ MW campuses adopt an **outdoor substation model** with weatherproof MV/LV equipment, freeing indoor space for IT.

---

## Summary Table

| Parameter | 6 kW/rack (3 MW) | 20 kW/rack (10 MW) | 50 kW/rack (25 MW) | 100 kW/rack (50 MW) |
|---|---|---|---|---|
| **Utility feed** | 10–20 kV single line | 20–33 kV, dual feed | 33–132 kV, dedicated sub | 132–220 kV, grid reinforcement |
| **Distribution transformers** | 2–3 × 2,000 kVA | 4–6 × 2,500–3,150 kVA | 10–12 × 3,150–4,000 kVA | 15–20 × 4,000 kVA |
| **Rack circuit current** | ~9A (3ph 400V) | ~29A | ~72A | ~145A |
| **Rack feed cable** | 4–6 mm² | 10–16 mm² | 16–25 mm² | 35–50 mm² |
| **Main feeder/bus rating** | 800–1,000A | 1,600–2,500A | 2,500–4,000A | 4,000–6,300A |
| **Distribution method** | Floor PDU + rack strips | Floor PDU or busbar | Overhead busbar mandatory | Overhead busbar / DC bus |
| **Electrical room footprint** | 150–250 m² | 400–600 m² | 800–1,500 m² | 2,000–4,000 m² (distributed) |
| **Air-cooled equipment** | Standard | Manageable with HVAC | At thermal limits | Impractical indoors at scale |
| **Reference deployment** | Enterprise private DC | Hyperscale circa 2020 | DGX H100 SuperPOD | GB200 NVL72 / CoreWeave |

---

## Key Engineering Takeaways

1. **The 20 kW/rack threshold** is where cable-based distribution starts becoming impractical and busbar should be evaluated. Above 40 kW/rack, busbar is effectively mandatory.

2. **The 50 kW/rack threshold** is where indoor air-cooled electrical equipment hits thermal limits, MV switchgear must move closer to the IT load, and the electrical room footprint becomes a dominant building design constraint.

3. **Above 100 kW/rack**, the electrical plant fundamentally changes character — it resembles industrial power distribution (steel mills, smelters) more than traditional IT infrastructure. Utility grid reinforcement, dedicated substations, and potentially DC distribution become standard design features.

4. **Lead times scale non-linearly**: a 3 MW facility can be energized in 6–9 months; a 50 MW facility with dedicated HV substation may require 18–36 months due to transformer procurement (currently 60–80 week lead times for large power transformers globally) and utility interconnection work.

---
*Executed: 2026-04-03 | Mode: independent*
