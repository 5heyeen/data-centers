# Phase 4: Competitive Landscape & Comparable Operators

## Objective
Identify operators with similar strategies or profiles, and learn from their challenges and approaches. This provides context for talking points and validates pain point hypotheses.

## Inputs
- `operator.md` — segment, ownership type
- `research/01-company.md` — strategy
- `research/03-news-ownership.md` — ownership context

## Research Steps

1. **Identify comparable operators** based on the operator's segment and profile:
   - Same market segment (e.g., other high-security DC operators)
   - Same ownership pattern (e.g., other PE-backed DC startups)
   - Same geography/scale (Norwegian/Nordic DC operators of similar size)
   - Aim for 3-5 comparables

2. **Research each comparable:**
   - WebSearch for their challenges, lessons learned, public project outcomes
   - Look for: construction delays, procurement issues, regulatory challenges, talent shortages, strategy pivots

3. **For high-security operators specifically:**
   - WebSearch for "high security data center procurement challenges"
   - Research comparable operators internationally (e.g., Kao Data UK, military-grade DCs in Sweden)
   - Understand where security clearance is required: contractors, suppliers, operational staff
   - Research NSM (Nasjonal Sikkerhetsmyndighet) requirements for DC operators

4. **For PE-backed startups specifically:**
   - WebSearch for "data center startup execution challenges"
   - Research other PE-backed DC developers and their timelines from launch to operation
   - Identify common failure modes (over-promising capacity, underestimating construction complexity)

5. **Synthesize patterns:**
   - What challenges do comparable operators consistently face?
   - Which of those challenges does this operator likely share?
   - What did successful comparables do differently?

## Output Format
Save to `research/04-comparables.md`:

```
# Comparable Operators: {name}
## Date: {date}

### Why These Comparables
[Explain the selection criteria]

### Comparable Operators
#### {Comparable 1}
- **Profile:** [1-2 sentences]
- **Similarities:** [to our target operator]
- **Challenges faced:** [what went wrong or was difficult]
- **Lessons for our operator:** [what can be learned]

#### {Comparable 2}
...

### Common Patterns
[What challenges appear repeatedly across comparables]

### Implications for {operator}
[Which of these patterns is most likely relevant]

### Sources
- [URL] — accessed {date}
```
