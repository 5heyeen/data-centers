# Research Breakdown — DC Go-To-Market Plan (FINAL)

## Scope
Joint Metier + Norconsult DC go-to-market plan for Norway. Cross-company steering group audience.

---

## EXISTING PROMPT CHAIN (Phases 1-4) — 20 Prompt Pairs

### Phase 1: Customer & Risk Landscape (1A-1H)
- 1A: Planning Brief ✅
- 1B: Operator Lifecycle & Phase Anxieties ✅
- 1C: Customer Persona Deep-Dive (9 segments) ✅
- 1D: Pre-FID Advisory (Rush-to-FID problem) ✅
- 1E: DC Development Risk Taxonomy (8 risk categories) ✅
- 1F: Construction Phase (Norwegian contract dynamics) ✅
- 1G: Mid-Project Pain Points (preventable failures) ✅
- 1H: Norconsult Integration (combined value prop) ✅

### Phase 2: Market, Competitive & Regulatory (2A-2D)
- 2A: How Operators Buy Advisory Services ✅
- 2B: Norwegian Regulatory & Political Landscape ✅
- 2C: Competitive Positioning (wedge narratives) ✅
- 2D: "Norwegian Execution Layer" Partnership Model ✅

### Phase 3: Strategy Synthesis (3A-3E)
- 3A: GTM Success Principles & Failure Analysis ✅
- 3B: Core GTM Strategy & Segment Prioritization ✅
- 3C: Customer Journey & Highest-Value Entry Points ✅
- 3D: 30/90/180-Day Action Plan ✅
- 3E: Program-Level Advisory for Multi-Site Operators ✅

### Phase 4: Execution & Sales Tools (4A-4C)
- 4A: Service Design (expert simulation) ✅
- 4B: Pricing & Commercial Model Design ✅
- 4C: Objection Pre-Empt & Sales Enablement ✅

---

## NEW PROMPT CHAINS (Phase 5) — 4 Sections, 8 Prompt Pairs

### Phase 5A-5B: Operator Intelligence Profiles
**Gap:** Existing chain works at persona-type level (9 segments). No company-specific analysis of who has money/customers/land/power, their strategy, execution model, or tailored value prop.

- **5A.1:** Operator-by-Operator Strategic Position Assessment (~16+ operators)
- **5A.2:** Operator Strategy → Execution Model → Consulting Needs
- **5B.1:** Tailored Metier + Norconsult Value Proposition per Operator
- **5B.2:** Operator Priority Matrix & Account Plan

Saved: `tasks/03-operator-intelligence/prompt-chain.md`

### Phase 5C-5D: Technology & Market Trends
**Gap:** No systematic trend analysis — liquid cooling, modular construction, AI infrastructure, nuclear/SMR, edge, digital twin, EU Taxonomy/CSRD, subsea cables. Some elements touched in persona 9 and 1E but not dedicated.

- **5C.1:** Technology Trends Reshaping DC Design, Construction & Operations (8 trends)
- **5C.2:** Trend Impact on Metier + Norconsult Service Design

Saved: `tasks/07-technology-trends/prompt-chain.md`

### Phase 5E-5F: Investment Flows & Target Prioritization
**Gap:** "Where is the money going?" at company level. Investor mapping, investment sizing, TAM/SAM/SOM, revenue projections, and steering-group-ready commercial strategy.

- **5E.1:** DC Investment Capital Flowing into Norway (investor database)
- **5E.2:** What Investment Flows Mean for Consulting Demand (TAM, revenue scenarios)
- **5F.1:** Time-Phased Market Opportunity (2025-2030)
- **5F.2:** Final Target Prioritization & Revenue Roadmap for Steering Group

Saved: `tasks/09-target-operators/prompt-chain.md`

**NOTE:** 5E.1 produces structured investor data for Notion database: https://www.notion.so/32c64f448283803aa833d54fd0e96df5

### Phase 5G-5H: The Investor Perspective
**Gap:** How investors evaluate DC investments, execution capability as investment criterion, Metier's role in strengthening investability. Critical for Persona 1 ("Finansgutta"), lender relationships, and positioning Metier as essential to the investment process.

- **5G.1:** What Makes a DC a Good Investment — The Investor's Checklist
- **5G.2:** The Role of Execution Capability in Investment Decisions
- **5H.1:** How Advisory Firms Create Investor-Grade Execution Confidence
- **5H.2:** Metier's Investor-Facing Value Proposition & Service Design

Saved: `tasks/03-operator-intelligence/prompt-chain-investor.md`

---

## Execution Order

**Already have prompts (Phases 1-4):** Run per existing sequence 1A → ... → 4C

**New prompts (Phase 5):** Run after Phase 2-3 outputs are available:
- 5A → 5B (operator intelligence — needs 1C, 1E, 2B context)
- 5C → 5D (technology trends — can run in parallel with 5A-5B)
- 5E → 5F (investment flows + final synthesis — needs 5A-5B + 5C-5D outputs)
- 5G → 5H (investor perspective — can run in parallel with 5A-5B, feeds into 5F)

**Full extended sequence:**
1A → 1B → 1C → 1D → 1E → 1F → 1G → 1H → 2A → 2B → 2C → 2D → 3A → 3B → 3C → 3D → 3E → 4A → 4B → 4C → 5A → 5B → 5C → 5D → 5E → 5F → 5G → 5H

Or with parallelism:
- Sequential: 1A → 1B → 1C → 1D → 1E → 1F → 1G → 1H → 2A → 2B → 2C → 2D → 3A → 3B → 3C → 3D → 3E → 4A → 4B → 4C
- Then parallel: [5A → 5B] + [5C → 5D] + [5G → 5H]
- Then sequential: 5E → 5F (final synthesis needs all Phase 5 outputs)
