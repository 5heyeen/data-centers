# Data Center Design by End User — Research Synthesis

**Scope:** What exactly needs to be designed in a data center, and how do those designs change depending on the end user? What drives engineering design, and why do standardized designs fail?

**Date:** 2026-04-04 | **Research files:** 44 across 9 subtasks

---

## 1. Executive Summary

**Rack power density is the master variable of data center engineering.** Every other design parameter — cooling architecture, structural loading, electrical distribution, cable pathway capacity, ceiling height, and even fire suppression approach — is a downstream consequence of how many kilowatts each rack consumes. A standard colocation design at 8–15 kW/rack is a fundamentally different building from an AI training facility at 60–150 kW/rack. The transition is not incremental — it triggers cascading redesign across every engineering domain simultaneously.

This is why standardized designs (CTS, Schneider, Vertiv modular) systematically fail when they meet real AI/hyperscaler/sovereign client specifications. The "standard" assumes air cooling, floor-standing PDUs, 3.0m ceilings, 8 kPa floors, and Ethernet cabling. Modern AI clients need liquid cooling, overhead busbar, 4.5m+ ceilings, 20+ kPa floors, and InfiniBand fabric. The gap between these two worlds is where engineering advisory and project management create value.

---

## 2. What Exactly Gets Designed in a Data Center

A data center has **8 engineering domains**, each with its own drawings, specifications, and calculations:

| # | Domain | What Must Be Designed |
|---|--------|----------------------|
| 1 | **Power Architecture** | Utility connection, HV/MV switchgear, transformers, UPS, generators, PDUs/busbar, rack power strips. Redundancy topology (N/N+1/2N). |
| 2 | **Cooling & Thermal** | Cooling architecture (air/liquid/immersion), heat rejection plant, piping, containment, controls. PUE target. |
| 3 | **Structural & Civil** | Floor loading capacity, raised floor vs slab, ceiling height, column grid, foundations, generator/transformer yards. |
| 4 | **Network & Cabling** | Structured cabling (copper/fiber), cable pathways, meet-me rooms, InfiniBand/Ethernet fabric topology. |
| 5 | **Fire Suppression** | Detection (VESDA), suppression (gas/water/mist), room integrity, code compliance. |
| 6 | **Physical Security** | Perimeter, access control, CCTV, cages/vaults, blast resistance, TEMPEST shielding. |
| 7 | **BMS & Controls** | DCIM, environmental monitoring, power metering, cooling plant controls. |
| 8 | **Site & External** | Grid connection, water supply, fiber routes, zoning, environmental permits. |

---

## 3. The Master Variable: How Power Density Drives Everything

When rack density changes, **everything changes**. Here is the cascade:

### Comparison: 10 kW/rack → 60 kW/rack → 120 kW/rack

| Parameter | 10 kW/rack (Enterprise) | 60 kW/rack (AI Training) | 120 kW/rack (NVIDIA GB200 NVL72) |
|-----------|------------------------|--------------------------|----------------------------------|
| **Cooling** | Air (CRAH + perforated tiles) | Direct liquid cooling (cold plates + CDUs) | Mandatory DLC, 25°C inlet, 2 L/s per rack |
| **Power distribution** | Floor PDUs, 16A circuits | Overhead busbar 800A, 63A/rack | Overhead busbar 1600A, 4×30kW power shelves |
| **Utility feed** | 10–20 kV single line | 33–132 kV dedicated substation | 132+ kV, grid reinforcement needed |
| **Transformers** | 2–3 × 2,000 kVA | 10–12 × 3,150–4,000 kVA | 15–20 × 4,000 kVA |
| **Floor loading** | 8–10 kPa (1,000 kg racks) | 15–20 kPa (1,500–2,500 kg racks) | 20–25 kPa (1,360 kg + CDU at 3,000 kg) |
| **Ceiling height** | 3.0–3.5 m (raised floor) | 4.5–5.0 m (slab-on-grade, overhead piping) | 5.0–5.5 m |
| **Floor type** | Raised floor (600mm) | Slab-on-grade | Slab-on-grade mandatory |
| **Network** | Ethernet, modest cable trays | InfiniBand NDR, 3–5× cable volume | InfiniBand XDR, 10,000+ fibers per cluster |
| **PUE** | 1.3–1.6 | 1.05–1.15 | 1.03–1.10 |
| **Electrical room** | 150–250 m² | 800–1,500 m² | 2,000–4,000 m² (distributed) |
| **Heat rejection** | Chillers + cooling towers | Dry coolers (warm water enables free cooling) | Dry coolers, possibly no chiller plant |

### Key Cascade Effects

- **Power density → Cooling architecture:** Above ~40 kW/rack, air cooling is physically impossible. Liquid cooling requires piping to every rack, CDUs, different heat rejection, and warm water loops.
- **Cooling architecture → Structural:** Liquid cooling eliminates raised floor (no under-floor plenum needed) but demands taller ceilings for overhead piping + busbar + cable trays. Floor loading increases due to heavier racks + CDUs + water-filled pipes.
- **Power density → Electrical:** Higher amperage per rack requires busbar instead of cables, larger transformers, different switchgear, more distribution paths. At 100+ kW/rack, indoor air-cooled electrical equipment hits thermal limits.
- **Power density → Network:** AI workloads at 60+ kW need InfiniBand with strict cable length limits (copper DAC <3m, AOC <100m), constraining rack placement geometry and row layout.
- **All of the above → Fire suppression:** Liquid coolant in the white space changes the fire risk profile. Gas suppression must account for CDUs and piping. Leak detection becomes mandatory.

---

## 4. How Designs Change by End-User Type

| Parameter | Enterprise Colo (5–15 kW) | AI Inference (15–40 kW) | AI Training (50–150 kW) | Hyperscaler | Sovereign/Defense |
|-----------|--------------------------|------------------------|------------------------|-------------|-------------------|
| **Power density** | 5–15 kW/rack | 15–40 kW/rack | 50–150 kW/rack | 10–80 kW (varies) | 10–30 kW/rack |
| **Cooling** | Air (CRAH, containment) | Air or hybrid (RDHx) | Liquid cooling mandatory | Custom (proprietary) | Air + TEMPEST-compliant |
| **Redundancy** | N+1 (Tier III) | N+1 (Tier III) | 2N (Tier III/IV) | Varies (some use rack-level battery) | 2N or higher (Tier IV) |
| **Network fabric** | Ethernet 10/25/100G | Ethernet 100/400G | InfiniBand NDR/XDR | Proprietary (Google ICI, etc.) | Air-gapped, fiber only |
| **Rack type** | Standard 19" 42U | Standard 19" 42-48U | OCP ORv3 / custom wider | Custom (21" OCP, proprietary) | Standard + shielded |
| **Floor loading** | 8–12 kPa | 10–15 kPa | 15–25+ kPa | 15–20+ kPa | 8–12 kPa |
| **Ceiling height** | 3.0–3.5 m | 3.5–4.0 m | 4.5–5.5 m | 4.5–5.0+ m | 3.0–4.0 m |
| **Power distribution** | Floor PDUs, rack strips | Floor PDUs or busbar | Overhead busbar mandatory | Custom (48VDC, rack-level) | Filtered power entry |
| **Security** | Cages, biometrics, SOC 2 | Similar to enterprise | Physical access, ISO 27001 | Fenced campus, proprietary | TEMPEST, blast resistance, cleared staff |
| **Compliance** | ISO 27001, SOC 2, PCI DSS | Same + SLA-driven | ISO 27001 | Proprietary standards | NATO SDIP-27, national classified standards |
| **Typical facility size** | 5–30 MW campus, multi-tenant | 1–10 MW distributed | 50–500+ MW single campus | 50–300+ MW campus | 1–20 MW purpose-built |
| **Standardized design fit** | Good (this is what templates are built for) | Moderate (needs density upgrades) | Poor (requires purpose-built) | Poor (hyperscaler provides specs) | None (requires purpose-built) |

---

## 5. What Specifically Doesn't Suit in Standardized Designs

CTS and similar operators offer modular designs built around these assumptions:
- **8–15 kW/rack**, air-cooled, N+1 redundancy, 42U racks at ~1,000 kg, 3.0–3.5m ceiling, Ethernet cabling

When a real client arrives, here is what breaks:

### The Seven Friction Points

| Friction Point | Standard Design | AI/Hyperscaler Client Needs | Gap |
|----------------|----------------|----------------------------|-----|
| **1. Cooling** | Air (CRAH, 8–15 kW/rack) | Liquid cooling (40–150 kW/rack) | Entirely different architecture — not a modification |
| **2. Power distribution** | Floor PDUs, 16–32A/rack | Overhead busbar 800–1600A, 63–100A/rack | Complete electrical redesign |
| **3. Floor loading** | 8–12 kPa | 15–25 kPa | Thicker slab, different foundation — structural change |
| **4. Ceiling height** | 3.0–3.5 m | 4.5–5.5 m | Cannot change after construction |
| **5. Network/cabling** | Ethernet, standard cable trays | InfiniBand, 10× fiber count, strict distance limits | Rack layout redesign, 3–5× cable tray |
| **6. Redundancy** | N+1 (cost-optimized) | 2N or 2(N+1) | Doubles all MEP systems |
| **7. Compliance** | ISO 27001 / SOC 2 | TEMPEST, air-gap, security clearance | Purpose-built only |

### The Cascade Cost

- Design modification cycle: **4–12 weeks** of re-engineering
- What was a **6-month modular deployment** becomes a **12–18 month custom build**
- AI facilities cost **$20M+/MW** vs **$10–12M/MW** for standard designs
- Transformer lead times: **60–128+ weeks** for large power transformers
- Revenue loss from delay: **$14.2M/month** per delayed 60 MW project (per industry estimates)
- IRR impact: drops from **17.1% to 8.8%** at 6 months delay

---

## 6. The Hardware Factor: GPU vs TPU vs ASIC

The compute hardware choice locks in facility requirements:

| Platform | Power/Rack | Cooling | Rack Standard | Network | Deployable in 3rd-Party DC? |
|----------|-----------|---------|---------------|---------|----------------------------|
| **AMD MI350** | 40–80 kW (air or liquid) | Air OR liquid | Standard 19" OCP | Ethernet or InfiniBand | **Yes** — most portable |
| **NVIDIA GB200 NVL72** | 120 kW | Mandatory liquid | 600mm wide (wider than 19") | InfiniBand mandatory | **Yes, with major upgrades** |
| **NVIDIA Vera Rubin NVL144** | 190–230 kW (2026) | Mandatory liquid | Custom | InfiniBand/NVLink | Requires purpose-built |
| **Google TPU v7 Ironwood** | ~1.1 kW/chip, 10 MW/pod | Mandatory liquid | Custom (OCP cooling, proprietary power) | Proprietary ICI | **No** — Google-only |
| **AWS Trainium3** | Custom | Mandatory liquid | Custom | Custom | **No** — AWS-only |
| **Microsoft Maia** | Custom | Liquid ("Sidekick") | Custom (wider) | Custom | **No** — Azure-only |

**The portability spectrum:** AMD (most portable, standard racks) → NVIDIA (portable with upgrades) → Google/AWS/Microsoft (captive, purpose-built only)

**Key insight:** NVIDIA hardware can be deployed by third-party DC operators (CTS, Equinix, etc.) but requires significant facility upgrades. Google/AWS/Microsoft custom silicon can ONLY run in their own purpose-built facilities — creating two distinct market segments.

### Bursty Power Profile

GPU training loads are distinctively bursty — power can swing from 30–40% to 150% of rated load in milliseconds (Uptime Institute). This strains UPS systems and requires oversized branch circuits, Li-ion UPS with fast response, and potentially software power capping (nvidia-smi). Standardized UPS sizing based on steady-state load is insufficient.

---

## 7. Long-Lead Decisions — Ranked by Cost of Change

| Rank | Decision | Cost to Change | Typical Delay |
|------|----------|---------------|---------------|
| 1 | **Utility power capacity (MW)** | New substation, grid reinforcement | 12–24 months |
| 2 | **Cooling architecture (air vs liquid)** | New piping, CDU rooms, heat rejection plant | 6–12 months, +20–40% cost |
| 3 | **Structural (floor loading, ceiling height)** | Cannot change post-construction | N/A — requires new building |
| 4 | **Redundancy topology (N+1 vs 2N)** | Doubles all MEP systems | 6–12 months, +50–100% cost |
| 5 | **Power density per rack** | Cascades through electrical + cooling | 3–6 months |
| 6 | **Security tier (TEMPEST, blast)** | Structural — cannot retrofit | N/A — requires purpose-built |
| 7 | **Fire suppression approach** | Room sealing, agent storage, different piping | 2–4 months |
| 8 | **Network fabric (InfiniBand vs Ethernet)** | Cable pathway capacity, rack spacing | 2–4 months |
| 9 | **BMS/DCIM platform** | Software — can be changed | 1–2 months |

**The "cost of change" curve:** Changes during design cost 1×, during construction 5–10×, after handover 50–100×.

---

## 8. Nordic Advantages and Implications

### Why Nordic Locations Are Advantageous
- **Climate:** Free cooling viable 8,000+ hours/year (vs <2,000 in hot climates) — dramatic PUE advantage
- **Hydro power:** Abundant, renewable, cost-competitive grid electricity
- **Grid stability:** Strong transmission grid, reliable power
- **Political stability:** Low geopolitical risk for sovereign cloud
- **Fiber connectivity:** Well-connected to European backbone networks

### Implications for DC Operators (CTS, Green Mountain, Digiplex, etc.)
1. **Every major deployment involves translating client specs to facility design** — this translation is the core engineering challenge
2. **The gap between standardized and purpose-built is where PM/engineering advisory creates value** — scope definition, design review, procurement management, commissioning oversight
3. **AI-ready standardized designs are emerging** but still cannot match hyperscaler custom specs or sovereign requirements
4. **The two-speed market:** (a) standardized for enterprise colo/inference, (b) purpose-built for AI training/hyperscaler/sovereign — operators must decide which segment to serve
5. **Speed is the competitive weapon** — but speed requires getting the design right the first time, not redesigning mid-construction

---

## Sources & References

Key standards: ASHRAE TC 9.9 (thermal), Uptime Institute Tier Standard (redundancy), EN 50600 (European DC standard), NFPA 75/76 (fire), TIA-942/BICSI-002 (cabling), IEEE 519 (power quality), NATO SDIP-27 (TEMPEST).

Key vendor references: Schneider Electric White Papers (1, 66, 75, 101, 113, 129, 135), Vertiv technical guides, NVIDIA DGX SuperPOD Design Guide, CoolIT Systems, Uptime Institute Annual Survey and Abnormal Incident Reports.

Industry data: Google/Microsoft/Meta sustainability reports, Equinix sustainability report, CTS Nordics/Eaton NordicEPOD documentation.

*Full source URLs are included in individual research files under `/research/dc-design-by-end-user/tasks/`*
