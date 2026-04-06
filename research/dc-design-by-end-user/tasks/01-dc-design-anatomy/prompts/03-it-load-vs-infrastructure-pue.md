# Prompt 03: it-load-vs-infrastructure-pue

> **Prompt:** What is the relationship between IT load (kW per rack) and the mechanical/electrical infrastructure required to support it? What is the typical ratio of IT load to total facility load, and how does PUE (Power Usage Effectiveness) quantify this?

---

# IT Load vs. Total Facility Load: PUE and Infrastructure Overhead

## The Fundamental Relationship

Every kilowatt of IT load deployed in a rack requires additional power to support it — cooling to remove heat, power conversion to transform and distribute electricity, and ancillary systems (lighting, security, fire suppression). The ratio between total facility power and the IT load it supports is captured by **Power Usage Effectiveness (PUE)**.

## PUE: Definition and Calculation

PUE was developed by **The Green Grid** (now part of the iMasons Climate Accord) and formalized in ISO/IEC 30134-2. The formula is straightforward:

```
PUE = Total Facility Energy / IT Equipment Energy
```

A PUE of 1.0 would mean every watt entering the facility goes directly to IT equipment — physically impossible due to thermodynamic and electrical losses. The reciprocal metric, **Data Center infrastructure Efficiency (DCiE)**, is expressed as a percentage: `DCiE = 1/PUE × 100%`.

The Green Grid's methodology specifies measurement at the utility meter (total) and at the output of the last power conversion device before IT equipment (IT load). It recommends annualized measurement (PUE over 12 months) rather than spot checks, since cooling loads vary seasonally.

## What Contributes to Overhead

The gap between PUE 1.0 and actual PUE is driven by:

| Overhead Category | Typical Share of Non-IT Load | Key Drivers |
|---|---|---|
| **Cooling** | 50–60% | Chillers, CRAHs, pumps, cooling towers, fans |
| **Power conversion losses** | 25–35% | UPS inefficiency (4–10% loss), transformer losses, PDU losses, switchgear |
| **Lighting & security** | 5–10% | Building lighting, CCTV, access control |
| **Other** | 5–10% | Fire suppression, humidification, office areas |

At higher rack densities (20–50+ kW per rack), cooling becomes the dominant overhead driver, which is why liquid cooling and direct-to-chip solutions are critical for keeping PUE low at high densities.

## PUE Ranges: Legacy to Hyperscale

| Era / Type | Typical PUE | IT Load as % of Total |
|---|---|---|
| Legacy enterprise (pre-2010) | 2.0–2.5 | 40–50% |
| Modern colocation | 1.3–1.5 | 67–77% |
| Purpose-built efficient facilities | 1.2–1.4 | 71–83% |
| Hyperscale (best-in-class) | 1.05–1.12 | 89–95% |

The **Uptime Institute's 2023 Global Data Center Survey** reported the industry average PUE at approximately **1.58**, largely unchanged from prior years, reflecting the large installed base of older facilities dragging the average up.

## Real-World Examples

**Google** reports a fleet-wide trailing twelve-month PUE of **1.10** (2023 Environmental Report). Their facility in Hamina, Finland, achieves PUE as low as **1.07** using seawater cooling from the Gulf of Finland. Google publishes real-time PUE dashboards for transparency.

**Microsoft** targets PUE of **1.12** or lower for new Azure regions. Their facilities in Sweden and Finland leverage free-air cooling. Microsoft has also explored underwater data centers (Project Natick), which demonstrated PUE benefits from direct ocean cooling.

**Meta (Facebook)** designed their Prineville, Oregon facility to achieve PUE of approximately **1.08** using an evaporative cooling system with outside air. Their Luleå, Sweden facility similarly benefits from Nordic climate, reporting PUE near **1.07**.

**Equinix**, as the largest colocation provider, reports a global average PUE of approximately **1.42** (2023 Sustainability Report), with a target to reach **1.20** by 2030. Colocation operators face inherently higher PUE because they cannot optimize IT workloads — they must provision cooling for worst-case customer deployments.

## How PUE Targets Drive Design Decisions

A PUE target cascades into nearly every engineering domain:

- **PUE < 1.4** → Requires efficient UPS (double-conversion with eco-mode or modular UPS at 97%+ efficiency), free cooling for significant annual hours, hot/cold aisle containment
- **PUE < 1.2** → Demands direct/indirect evaporative cooling, raised supply temperatures (ASHRAE A2/A3 envelopes), elimination of traditional chillers, high-efficiency transformers
- **PUE < 1.1** → Necessitates direct liquid cooling or rear-door heat exchangers for high-density racks, waste heat recapture, minimal power conversion stages, and climate-favorable locations (Nordics, Pacific Northwest)

Each 0.1 improvement in PUE at a 100 MW facility saves roughly **10 MW of overhead power** — at $0.05/kWh, that is approximately **$4.4 million annually** in energy costs, making PUE a direct financial lever for operators and a key metric for investors evaluating capital efficiency.

---

*Sources: The Green Grid PUE methodology (ISO/IEC 30134-2); Google 2023 Environmental Report; Microsoft Sustainability Report 2023; Meta Sustainability Report 2023; Equinix 2023 Sustainability Report; Uptime Institute 2023 Global Data Center Survey.*

---
*Executed: 2026-04-03 | Mode: independent*
