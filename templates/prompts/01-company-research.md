# Phase 1: Company Research

## Objective
Build a comprehensive company profile from public sources.

## Inputs
- `operator.md` — company name, website, key people (if known)

## Research Steps

1. **Company website:** WebFetch the main website, about page, strategy/vision page, team/leadership page. Extract mission, strategy, key messages.

2. **Proff.no / Brønnøysund:** WebSearch `"{company name}" site:proff.no` to get financial data, board composition, employee count, revenue. If org number is known, also check `brreg.no/api` for registry data.

3. **General news search:** WebSearch `"{company name}" datasenter` and `"{company name}" data center Norway"`. Focus on last 12 months.

4. **Extract:**
   - Company mission and stated strategy
   - Leadership team (names, titles, backgrounds)
   - Size indicators (employees, revenue)
   - Timeline of key milestones (founded, first site, expansions)
   - Any stated partnerships or customer relationships

## Language Note
Search in both Norwegian and English. Many Norwegian company sites and registry data are in Norwegian. Key Norwegian terms: "datasenter", "prosjektleder", "styret" (board), "daglig leder" (CEO), "ansatte" (employees).

## Output Format
Save to `01-company.md`:

```
# Company Research: {name}
## Date: {date}

### Company Overview
[2-3 paragraphs]

### Leadership Team
| Name | Title | Background | LinkedIn |
|------|-------|------------|----------|

### Stated Strategy
[What do they say they're doing and why]

### Key Milestones
| Date | Event |
|------|-------|

### Financial Indicators
[From proff.no / brreg.no if available]

### Sources
- [URL] — accessed {date}
```
