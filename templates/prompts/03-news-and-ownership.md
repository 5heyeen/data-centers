# Phase 3: News & Ownership Analysis

## Objective
Understand the operator's ownership structure, recent developments, and what these imply about their needs and decision-making dynamics.

## Inputs
- `operator.md` — ownership type, owner entities, org number
- `research/01-company.md` — company overview

## Research Steps

1. **Ownership deep-dive:**
   - WebSearch `"{company name}" eiere` (owners) and `"{company name}" aksjonærer` (shareholders)
   - If PE-backed: research the PE firm — typical hold period, investment thesis, portfolio, return expectations
   - If utility-subsidiary: research the parent's DC strategy and other DC investments
   - If consortium: research each partner's role and strategic interest

2. **Recent news (last 12 months):**
   - WebSearch `"{company name}" datasenter 2025 2026`
   - Check DCD (datacenterdynamics.com), Computer Weekly Nordics, BeBeez for coverage
   - Look for: funding announcements, site acquisitions, permitting news, partnership announcements, regulatory developments

3. **Regulatory & permitting:**
   - WebSearch `"{company name}" konsesjon` (concession) or `"{company name}" regulering` (zoning/regulation)
   - Check for grid connection status, environmental assessments, municipal approvals

4. **Infer ownership implications:**
   - PE ownership → tight timelines, cost discipline, likely exit 3-7 years, need to reach revenue quickly
   - Utility subsidiary → infrastructure expertise, possibly lacking DC commercial knowledge, sustainability angle
   - State-owned/backed → public procurement rules, transparency requirements, longer decision cycles
   - Consortium → complex decision-making, potentially conflicting interests, need for clear governance

## Output Format
Save to `research/03-news-ownership.md`:

```
# News & Ownership Analysis: {name}
## Date: {date}

### Ownership Structure
[Who owns what, and what does it mean]

### Ownership Implications
[What does the ownership structure imply about their needs, decision-making, and timeline]

### Recent News Timeline
| Date | Event | Source |
|------|-------|--------|

### Regulatory & Permitting Status
[Known permitting status, grid connections, environmental assessments]

### Key Takeaways
[3-5 bullet points summarizing what this means for a Metier pitch]

### Sources
- [URL] — accessed {date}
```
