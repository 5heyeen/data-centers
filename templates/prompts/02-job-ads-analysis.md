# Phase 2: Job Ads & Hiring Analysis

## Objective
Analyze active job postings to understand what capabilities the operator is building and — more importantly — what gaps their hiring reveals.

## Inputs
- `operator.md` — company name, legal name
- `01-company.md` — for context on current team

## Research Steps

1. **Finn.no:** WebSearch `site:finn.no "{company name}"` and `"{company name}" stilling datasenter"`. Also try the legal name (AS).

2. **Company careers page:** If website is known, WebFetch `{website}/karriere` or `{website}/careers` or similar.

3. **LinkedIn jobs:** WebSearch `site:linkedin.com/jobs "{company name}" Norway`.

4. **Categorize** each role found into:
   - Engineering & technical (electrical, mechanical, civil)
   - Project management & controls (PM, cost controller, planner)
   - Procurement & contracts
   - Operations & facilities
   - IT / networking / DCIM
   - Commercial / sales
   - Legal / compliance / regulatory
   - Leadership / management

5. **Analyze the pattern** — what they're hiring for reveals what they don't have:
   - Hiring for project managers → no internal PM capability → Metier PM services relevant
   - Hiring for procurement/contract roles → building that function → Metier can bridge the gap
   - Hiring many technical roles but few management roles → execution risk
   - No job ads for a company with announced projects → either outsourcing everything (strong Metier opportunity) or very early stage

## Output Format
Save to `02-hiring.md`:

```
# Hiring Analysis: {name}
## Date: {date}

### Active Job Postings
| Role | Platform | Date Posted | Category | Key Requirements |
|------|----------|-------------|----------|------------------|

### Hiring Pattern Summary
[What does the overall hiring pattern tell us?]

### Capability Gaps Inferred
[What roles are NOT being hired that you'd expect given their plans?]

### Implications for Metier
[Which Metier services does this hiring pattern suggest they need?]

### Sources
- [URL] — accessed {date}
```
