# Phase 3: News, Ownership & Funding Analysis

## Objective
Understand the operator's ownership structure, funding situation, investor requirements, recent developments, and what these imply about their needs, decision-making dynamics, and consulting opportunities.

## Inputs
- `operator.md` — ownership type, owner entities, org number, known investor context
- `01-company.md` — company overview

## Research Steps

1. **Ownership deep-dive:**
   - WebSearch `"{company name}" eiere` (owners) and `"{company name}" aksjonærer` (shareholders)
   - Search brreg.no / proff.no for shareholder registry data: `"{company name}" aksjonærregister site:proff.no`
   - If PE-backed: research the PE firm — typical hold period, investment thesis, portfolio, return expectations
   - If utility-subsidiary: research the parent's DC strategy and other DC investments
   - If consortium: research each partner's role and strategic interest
   - If infrastructure-fund-backed: research the fund's mandate, target returns, hold period

2. **Funding & investor research:**
   - WebSearch `"{company name}" investering` (investment) and `"{company name}" finansiering` (financing)
   - WebSearch `"{company name}" datasenter kapital` (data center capital) and `"{company name}" funding`
   - Search for funding rounds, capital raises, project finance arrangements
   - For each identified investor, research:
     - **Fund type:** PE, infrastructure fund, sovereign wealth, family office, corporate, utility
     - **Investment thesis:** What does this investor look for? What's their DC thesis?
     - **Portfolio:** Other DC/infrastructure investments by the same investor
     - **Typical return targets:** PE (15-25% IRR), infra funds (8-12% IRR), sovereign wealth (6-10%)
     - **Typical hold period:** PE (3-7 yrs), infra funds (10-15+ yrs), sovereign (indefinite)
   - Research investor requirements and constraints:
     - **Milestone gates:** Is capital deployment stage-gated? (e.g., release tranche 2 after grid connection secured)
     - **Reporting burden:** Quarterly financials, construction progress dashboards, KPI reporting
     - **ESG mandates:** EU Taxonomy alignment, PUE targets, renewable energy requirements, SFDR classification
     - **Governance provisions:** Board seats, CAPEX approval thresholds, change-of-control restrictions
     - **Debt covenants:** Restrictions on additional leverage, DSCR requirements
   - Infer capital deployment pressure: how much of the committed capital is deployed vs. remaining? Is there a deployment deadline?

3. **Recent news (last 12 months):**
   - WebSearch `"{company name}" datasenter 2025 2026`
   - Check DCD (datacenterdynamics.com), Computer Weekly Nordics, BeBeez for coverage
   - Look for: funding announcements, site acquisitions, permitting news, partnership announcements, regulatory developments

4. **Regulatory & permitting:**
   - WebSearch `"{company name}" konsesjon` (concession) or `"{company name}" regulering` (zoning/regulation)
   - Check for grid connection status, environmental assessments, municipal approvals

5. **Infer ownership & funding implications:**
   - PE ownership → tight timelines, cost discipline, likely exit 3-7 years, need to reach revenue quickly; **milestone-gated capital means professional PM is essential to unlock funding tranches**
   - Infrastructure fund → longer horizon but strict ESG/reporting requirements; **need for portfolio governance and structured reporting**
   - Utility subsidiary → infrastructure expertise, possibly lacking DC commercial knowledge, sustainability angle
   - State-owned/backed → public procurement rules, transparency requirements, longer decision cycles
   - Consortium → complex decision-making, potentially conflicting interests, need for clear governance
   - Sovereign wealth → patient capital but high governance standards; **may require independent technical advisory (Owner's Engineer) for accountability**
   - Self-funded / corporate balance sheet → fewer external constraints but may lack external discipline; less urgency for structured PM

## Output Format
Save to `03-news-ownership.md`:

```
# News, Ownership & Funding Analysis: {name}
## Date: {date}

### Ownership Structure
[Who owns what, and what does it mean]

### Funding Situation
[Total known funding, funding rounds, capital structure]

#### Investor Profiles
| Investor | Fund type | Amount | Thesis | Hold period | Known requirements |
|----------|-----------|--------|--------|-------------|-------------------|

#### Investor Requirements & Constraints
- **Return targets:** [IRR expectations based on investor type]
- **Exit horizon:** [When do investors expect liquidity?]
- **Milestone gates:** [Is capital release tied to project milestones?]
- **ESG mandates:** [EU Taxonomy, renewables, PUE targets?]
- **Reporting burden:** [What do investors expect to see and how often?]
- **Governance provisions:** [Board seats, approval thresholds?]

#### Capital Deployment Status
[How much is committed vs. deployed? Is there deployment timeline pressure?]

### Ownership & Funding Implications
[What does the ownership and funding structure imply about their needs, decision-making, timeline, and Metier service opportunities?]

### Recent News Timeline
| Date | Event | Source |
|------|-------|--------|

### Regulatory & Permitting Status
[Known permitting status, grid connections, environmental assessments]

### Key Takeaways
[3-5 bullet points summarizing what this means for a Metier pitch, including funding-driven service needs]

### Sources
- [URL] — accessed {date}
```
