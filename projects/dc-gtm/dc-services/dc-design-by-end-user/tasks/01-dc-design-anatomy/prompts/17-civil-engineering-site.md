# Prompt 17: civil-engineering-site

> **Prompt:** [See prompt chain for full text]

---

# Civil Engineering Considerations for Data Center Sites

## Site Grading and Drainage

Proper site grading is fundamental to data center reliability. Sites are typically graded to achieve a minimum 2% slope away from building foundations, with stormwater management systems designed to handle at least a 100-year flood event. Detention/retention ponds are sized based on local regulations and impervious surface ratios — a large campus with 70–80% impervious coverage requires substantial stormwater infrastructure.

Cut-and-fill balancing is a priority during early civil design: importing or exporting large volumes of earth is costly, so sites with relatively flat topography (1–3% natural grade) are preferred. Subgrade bearing capacity must support not only the building (floor loads of 12–25 kPa for data halls) but also the heavy outdoor equipment pads. Geotechnical investigations typically require borings to 15–20m depth given the concentrated point loads from transformers and generators.

## Transformer Pads and Fire Separation

Medium-voltage transformers (typically 20/33 kV to 400/480V) are installed on reinforced concrete housekeeping pads, usually 200–300mm above finished grade. Each pad includes an **oil containment basin** sized to hold 110% of the transformer's oil volume (large units contain 10,000–20,000 liters of mineral oil). Containment is achieved via a sump pit with oil-water separator or a lined gravel-filled basin beneath the transformer.

**Fire walls between transformers** are a critical safety requirement. Industry practice and standards such as NFPA 850 and FM Global Data Sheet 5-4 call for:

- **Minimum spacing of 5–8m** between adjacent transformers, or
- **2-hour fire-rated barrier walls** (typically reinforced concrete or masonry, 3–4.5m tall) where spacing cannot be achieved
- **7.6m (25 ft) minimum** clearance from building walls per FM Global recommendations, unless a fire-rated barrier is provided

A typical 40 MVA transformer pad measures approximately 5m × 6m, with the containment basin extending 1–2m beyond the transformer footprint on all sides.

## Generator Yards

Standby diesel generators are mounted on **reinforced concrete pads with integrated vibration isolation** — commonly spring isolators or neoprene mounts achieving 95%+ vibration isolation efficiency. Key design parameters include:

- **Concrete pad thickness**: 300–600mm, often with a mass block 2–3× the generator weight for inertia
- **Exhaust stacks**: Routed vertically to 3–5m above roofline, with silencers achieving 25–35 dB attenuation
- **Fuel day tanks**: Located within 15m of each generator (gravity or pumped feed), typically 1,000–4,000 liters, with secondary containment
- **Bulk fuel storage**: Underground or above-ground tanks sized for 24–72 hours of runtime at full load; a 2N configuration for a 20 MW facility may require 200,000+ liters of diesel storage, subject to ATEX/DSEAR zoning and environmental permitting

Generator yards for a 20 MW facility can occupy **1,500–3,000 m²** depending on N+1 or 2N redundancy configuration.

## Cooling Infrastructure Footprint

The cooling plant — whether cooling towers, dry coolers, or adiabatic units — is one of the largest site consumers:

- **Cooling tower footprints can reach 30–50% of the data hall building footprint** for large air-cooled facilities. A 20 MW IT load facility with dry coolers may require 4,000–6,000 m² of outdoor cooling equipment area.
- Clearance requirements between cooling units are typically **2–3m minimum** for airflow recirculation prevention, with some manufacturers recommending 1.5× unit height.
- Acoustic setback distances of **30–50m** from property boundaries may be required to meet nighttime noise limits (commonly 40–45 dB(A) at the boundary in European jurisdictions).

## Security Setbacks and Blast Protection

Physical security design follows standards such as the Uptime Institute's guidance and various national frameworks:

- **10–30m setback from public roads** for vehicle-borne improvised explosive device (VBIED) standoff protection
- **15m minimum** is a common baseline for Tier III/IV facilities, with hostile vehicle mitigation (HVM) bollards or berms at the perimeter
- Anti-ram barriers rated to **PAS 68 / IWA 14-1** standards at vehicle entry points
- A clear **6m sterile zone** between the perimeter fence and the building envelope is standard practice

These setbacks significantly increase the required site area — a building footprint of 5,000 m² may require a total site of 20,000–40,000 m² once all setbacks, equipment yards, and access roads are included.

## Loading Dock and Vehicle Access

Equipment delivery drives many site layout decisions:

- **Turning radii**: Articulated delivery trucks (16.5m EU standard) require an **outer turning radius of 12.5m** and an inner radius of 6.5m. This means access roads must be at least 7–8m wide with generous turning aprons.
- **Heavy transport**: Transformers and generators arrive on low-loaders with gross vehicle weights of 60–100+ tonnes, requiring pavement design to handle these axle loads (often 350–450mm reinforced concrete access roads).
- **Loading docks**: Typically located at grade (not depressed docks) with overhead clearance of 5–6m for tall equipment. A clear laydown area of 15m × 30m adjacent to the dock is standard for staging.
- **Crane access**: Hard-standing areas rated for mobile cranes (up to 500-tonne capacity for large transformer lifts) must be pre-planned adjacent to equipment pads.

## How Site Layout Constrains Building Orientation and Expansion

The interplay of these requirements creates significant constraints:

1. **Building orientation** is often dictated by prevailing wind direction (for cooling efficiency and exhaust dispersion), road access points, and utility easement corridors for incoming HV power.
2. **Expansion sequencing** must be planned from Day 1 — transformer yards, generator pads, and cooling plants must be expandable without disrupting live operations. This typically means arranging equipment yards along one or two building edges, leaving the opposite edge(s) free for building extension.
3. **Utility corridors** (HV cable routes, chilled water piping, fuel lines) should run along a "spine" that can be extended, avoiding routing under future building phases.
4. A common pattern is an **east-west building orientation** with equipment yards on the north side (reducing solar gain on cooling plant) and expansion to the south or east, with the main vehicle access and security checkpoint on the west or road-facing side.

Failure to properly master-plan the site from the outset is one of the most common — and costly — mistakes in data center development, often resulting in stranded capacity or expensive retrofits when later phases cannot physically fit within the remaining site envelope.

---
*Executed: 2026-04-03 | Mode: independent*
