# Pain Point to Service Mapping — Data Center Operators

This file provides a decision framework for mapping observed operator pain points to relevant Metier services. The agent uses this during Phase 5 (Pain Point Mapping) to systematically connect research findings to service recommendations.

---

## Operator Archetype Patterns

### Pattern A: "Finance-First Developer" (e.g., Fossefall)

**Profile:** Founded by financial/investment professionals. Ambitious capacity targets. Likely PE-backed or seeking PE investment. Strong on deal-making and capital raising, weak on execution.

**Typical signals:**
- Founders/leadership from finance, consulting, or real estate backgrounds
- Aggressive MW targets announced publicly
- Very small team relative to ambition
- Hiring for senior construction/engineering roles (VP Construction, Engineering Manager)
- No visible project management or procurement function

**Priority Metier services:**
1. **Contract, Procurement & Equipment Planning** (HIGH) — They will need to select EPC contractors without internal expertise to evaluate bids
2. **Owner's Engineer / PMC** (HIGH) — They need technical representation when dealing with contractors
3. **Project Execution & PM** (HIGH) — They lack project management capability entirely
4. **Early-Phase Advisory** (MEDIUM) — May need help with concept optimization before committing capital
5. **Portfolio Governance** (MEDIUM) — If planning multiple sites, they'll need governance frameworks for investors

**Key talking point:** "You have the vision and capital, but execution is where DC projects succeed or fail. We bridge that gap."

---

### Pattern B: "High-Security Operator" (e.g., Skygard)

**Profile:** Targeting government, defense, or critical infrastructure clients. Must meet strict security requirements (NSM, NATO, sikkerhetsklarering). Often backed by state-adjacent entities or utilities.

**Typical signals:**
- Strategy mentions "høysikkerhet" (high security), government clients, or critical infrastructure
- Owners include state-owned enterprises, defense-adjacent companies
- Location choices driven by security considerations (not just power/connectivity)
- Job ads mentioning security clearance requirements

**Priority Metier services:**
1. **Contract, Procurement & Equipment Planning** (HIGH) — Contractors and suppliers must have security clearance; procurement process is complex and constrained
2. **Project Execution & PM** (HIGH) — Security requirements add complexity to construction (cleared workers, secure supply chains, access control during build)
3. **Strategy Advisory** (MEDIUM) — Positioning in the high-security segment requires understanding comparable international operators
4. **Portfolio Governance** (MEDIUM) — Institutional owners/investors need structured reporting

**Key talking point:** "High-security data centers have unique procurement challenges — your contractor pool is limited by clearance requirements, which changes your entire contract strategy."

**Research questions to explore:**
- Which contractor categories require security clearance? (civil works? MEP? IT fit-out? all?)
- What security certification is targeted? (NSM, NATO COSMIC TOP SECRET, etc.)
- How do comparable high-security DCs (e.g., in Sweden, UK) handle procurement?
- What are the implications for construction scheduling (clearance processing times)?

---

### Pattern C: "Utility Spin-off" (e.g., energy company entering DC)

**Profile:** Established energy/infrastructure company leveraging existing assets (power, land, grid connections) to enter the DC market. Strong on infrastructure, weak on DC-specific operations and commercial strategy.

**Typical signals:**
- Parent company is an energy utility, grid operator, or industrial company
- Access to significant power capacity or renewable energy
- Team has energy/infrastructure backgrounds but limited DC experience
- Focus on sustainability and energy efficiency as differentiators

**Priority Metier services:**
1. **Early-Phase Advisory** (HIGH) — Need help translating power/land assets into viable DC concepts
2. **Strategy Advisory** (HIGH) — Need to define DC market positioning and go-to-market
3. **Project Execution & PM** (MEDIUM) — May have construction capability from parent, but DC-specific knowledge gaps
4. **Competence Development** (MEDIUM) — Need to upskill existing staff on DC project specifics

**Key talking point:** "You have the infrastructure advantage. We help you convert that into a competitive DC operation."

---

### Pattern D: "Established Operator Scaling Up"

**Profile:** Existing DC operator with operational facilities now planning significant expansion (new sites, higher MW). Has experience but may be stretching their organization.

**Typical signals:**
- Existing operational data centers
- Announced expansion plans (new sites or significant capacity additions)
- Hiring across multiple functions simultaneously
- May be taking on external investment for the first time

**Priority Metier services:**
1. **Portfolio Governance** (HIGH) — Moving from single-project to multi-project management
2. **Contract, Procurement & Equipment Planning** (HIGH) — Scaling procurement for larger/multiple builds
3. **Competence Development** (MEDIUM) — Training new hires to maintain quality as org grows
4. **Project Execution & PM** (MEDIUM) — May need additional PM capacity for parallel builds

**Key talking point:** "Going from one site to many changes everything — governance, procurement, and team structure all need to scale with you."

---

---

### Funding-Driven Pain Points

These pain points arise specifically from investor requirements and capital structure constraints. They cut across all archetypes but are strongest for PE-backed and infrastructure-fund-backed operators.

| Funding Signal | Pain Point | Primary Metier Service | Why |
|---|---|---|---|
| PE exit horizon (3-7 yrs) | Timeline pressure — must reach revenue/commissioning fast to hit exit window | Project Execution & PM | Professional PM accelerates delivery, reduces delay risk that erodes IRR |
| Milestone-gated capital | Risk of capital freeze if milestones slip — project controls essential | Portfolio Governance | Structured milestone tracking and reporting unlocks next funding tranche |
| Institutional investor ESG mandates | Must demonstrate EU Taxonomy alignment, PUE targets, renewable sourcing | Strategy Advisory | ESG strategy and compliance framework for investor reporting |
| High reporting burden (quarterly+) | Operators lack capacity to produce investor-grade project reports | Portfolio Governance | Standardized dashboards, cost/schedule reporting, variance analysis |
| Board governance provisions | Investors hold board seats, require CAPEX approval above thresholds | Owner's Engineer | Independent technical advisory provides the third-party validation boards need for CAPEX decisions |
| First-time capital raise for expansion | Operator needs to demonstrate execution credibility to attract investors | Project Execution & PM | Track record of professional PM de-risks the investment in investors' eyes |
| Debt covenants / DSCR requirements | Must maintain financial ratios — cost overruns directly threaten covenants | Contract & Procurement | Tight procurement and cost control prevents covenant breaches |
| Multiple investor classes (equity + debt) | Complex stakeholder reporting across different capital providers | Portfolio Governance | Unified reporting framework serving equity investors, lenders, and board |

---

## Signal-to-Service Quick Reference

| Observed Signal | Primary Service | Secondary Service |
|---|---|---|
| No procurement/contracts team | Contract & Procurement | Owner's Engineer |
| No project managers in org | Project Execution & PM | Competence Development |
| PE/financial ownership | Owner's Engineer | Portfolio Governance |
| Aggressive timeline vs. small team | Project Execution & PM | Contract & Procurement |
| High-security strategy | Contract & Procurement | Project Execution & PM |
| Multiple sites planned | Portfolio Governance | Contract & Procurement |
| Pre-construction / feasibility stage | Early-Phase Advisory | Strategy Advisory |
| Energy company background | Early-Phase Advisory | Strategy Advisory |
| Rapid hiring (10+ roles) | Competence Development | Portfolio Governance |
| First-time DC developer | Owner's Engineer | Early-Phase Advisory |
| International contractors | Owner's Engineer | Contract & Procurement |
| Unclear market positioning | Strategy Advisory | Early-Phase Advisory |
| Schedule or cost overrun history | Project Execution & PM | Portfolio Governance |
| Milestone-gated investor capital | Portfolio Governance | Project Execution & PM |
| PE exit within 3-5 years | Project Execution & PM | Owner's Engineer |
| ESG/EU Taxonomy investor mandates | Strategy Advisory | Portfolio Governance |
| Raising capital / seeking new investors | Project Execution & PM | Portfolio Governance |
| Multiple capital providers (equity + debt) | Portfolio Governance | Contract & Procurement |
| Debt covenants / DSCR constraints | Contract & Procurement | Portfolio Governance |

---

## Confidence Calibration

When mapping pain points, rate confidence:

- **HIGH confidence:** Multiple independent signals point to the same service need (e.g., PE-backed + no PM team + aggressive timeline → Project Execution)
- **MEDIUM confidence:** One strong signal or two weaker signals (e.g., hiring for VP Construction → likely needs PM support, but could also be building internal capability)
- **LOW confidence:** Inferred from strategy or market segment rather than direct evidence (e.g., "high-security operators typically need X" without specific evidence for this operator)

Always label inferences distinctly from facts in the meeting brief.
