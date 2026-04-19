# Prompt 07: dc-ready-delivery-by-category

> **Prompt:** For each DC-transferable service category, what would "DC-ready delivery" look like vs. generic delivery? What adaptations are needed?

---

*Context from Chunk 03: HIGH transferability — Owner's Engineer/PMC, Project Execution & PM, Procurement & Contract Advisory, Portfolio Governance. MEDIUM — Strategy Advisory, Early-Phase Advisory, Competence Development. LOW — Digital Advisory.*

## HIGH Transferability — DC-Ready Delivery

### Owner's Engineer / PMC
**Generic delivery:** Technical representation for the owner during construction — reviewing contractor deliverables, managing interfaces, protecting the owner's interests.

**DC-ready adaptations required:**
- Must understand MEP hierarchy: power (HV/MV/LV), cooling (chillers, CRAHs, liquid cooling), and IT fit-out are distinct workstreams with complex interdependencies. A generic OE who reviews civil structures won't catch a cooling/power interface risk.
- Commissioning sequencing is critical and DC-specific: energisation, UPS testing, cooling commissioning, and IT load testing follow a strict order. OE must own the commissioning programme.
- Long-lead equipment tracking (52–80+ week lead times on transformers, generators, UPS) requires proactive monitoring from contract award, not just at delivery.
- Norwegian-specific: understanding of Statnett/local grid connection processes (nettilknytning), konsesjon requirements, and DSO engagement timelines.

**Credibility signals:** Prior OE experience on at least one DC or pharma cleanroom (analogous MEP complexity); staff with electrical/mechanical engineering backgrounds, not just civil PMs.

---

### Project Execution & PM
**Generic delivery:** Project managers, cost controllers, planners, and ITB coordinators embedded in the client team.

**DC-ready adaptations required:**
- DC construction schedules are 12–24 months and extremely sequential in the final 6 months (commissioning drives everything). Generic planners used to 5-year infrastructure programmes need recalibration.
- Phased delivery planning: data centers are typically built and commissioned in phases (e.g., 2MW live, 4MW, 8MW). Phase interfaces — where one phase is live while the next is under construction — are a unique DC scheduling challenge.
- Cost structure understanding: DC capex is ~40–50% equipment (not construction). A cost controller who tracks civil/structural only will miss the dominant cost driver.
- Understanding of critical path items driven by lead times, not construction progress — the schedule is constrained by equipment, not labour.

**Credibility signals:** Schedulers who understand commissioning-driven reverse planning; cost controllers with equipment-heavy capex experience (oil & gas, pharma).

---

### Procurement & Contract Advisory
**Generic delivery:** Contract strategy, tender process management, supplier qualification, risk allocation.

**DC-ready adaptations required:**
- Package strategy is fundamentally different: civil shell, MEP (often split: electrical vs. mechanical), IT fit-out, and sometimes a full EPC are the standard splits. A generic procurement advisor may default to full EPC, which is inappropriate for most DC operators.
- High-security operators (Skygard-type): entire contractor pool is filtered by sikkerhetsklarering. Standard supplier qualification processes don't accommodate this.
- Long-lead equipment procurement must run in parallel with (or ahead of) contractor procurement. Generic sequential procurement processes will miss this.
- Generator, transformer, and UPS procurement often requires direct manufacturer relationships — not just tendering.

**Credibility signals:** Experience with MEP package splitting; knowledge of Norwegian contractor market for cleared workers; understanding of generator/transformer lead time dynamics.

---

### Portfolio Governance
**Generic delivery:** Stage-gate frameworks, standardised reporting, board-level dashboards, investor reporting structures.

**DC-ready adaptations required:**
- Investor reporting for DC operators (especially PE-backed) must track MW commissioned and revenue-ready, not just traditional cost/schedule. Boards care about capacity milestones, not construction completion percentages.
- EU Taxonomy / ESG metrics are increasingly mandatory for institutional investors in DCs — PUE targets, renewable energy sourcing, and water usage effectiveness (WUE) must be embedded in reporting frameworks from day one.
- Multi-site operators need governance that handles interdependency: when Site A's power grid connection delay affects Site B's financing drawdown.
- CAPEX approval thresholds and board governance provisions (common in PE-backed structures) mean the governance framework must be designed around investor decision-making cadences, not just project milestones.

**Credibility signals:** Experience designing governance for PE-backed capital projects; familiarity with EU Taxonomy reporting requirements for infrastructure.

---

## MEDIUM Transferability — DC-Ready Adaptations

### Strategy Advisory
The core methodology transfers but DC sector credibility requires specific knowledge: understanding of hyperscaler demand dynamics, Scandinavian power market (NordPool, grid tariff structures), planning/regulatory processes for large-scale DCs, and the competitive landscape (who is building what, where, for whom). Without this knowledge, a strategy consultant will produce generic recommendations.

### Early-Phase Advisory (VPU/Concept Selection)
Metier's VPU/PDRI frameworks transfer well for the decision-making process. The adaptation required is embedding DC-specific technology choices into the concept selection: air vs. liquid cooling, Tier classification, redundancy architecture (2N, N+1), and power density per rack. These are consequential early decisions that require an engineering overlay Metier may need to source externally.

### Competence Development
PM methodology training (PRINCE2, PMI, agile) transfers directly. The DC-specific adaptation is developing training modules for DC project specifics: MEP package management, commissioning planning, equipment procurement, and security compliance — none of which exist in standard curricula.

---

## LOW Transferability — Digital Advisory
DC operators rarely need the type of digital advisory Metier offers (enterprise architecture, agile coaching, product development). The exception is DCIM (Data Center Infrastructure Management) and BIM-integrated construction management — but these are niche sub-services with strong specialist competitors.

---

*Executed: 2026-04-18 | Mode: sequential (builds on Chunk 03)*
