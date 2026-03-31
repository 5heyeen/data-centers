# Phase 5: Pain Point Mapping

## Objective
Synthesize all research into a structured pain point analysis, mapping each pain point to relevant Metier services. This is the analytical core of the meeting brief — no web research, purely synthesis.

## Inputs
- `research/01-company.md` — company profile
- `research/02-hiring.md` — capability gaps from hiring analysis
- `research/03-news-ownership.md` — ownership implications and timeline pressure
- `research/04-comparables.md` — lessons from comparable operators
- `../../metier/services.md` — Metier service catalog
- `../../metier/pain-point-mapping.md` — decision framework and archetype patterns

## Analysis Steps

1. **Identify the operator archetype** from `pain-point-mapping.md`:
   - Pattern A: Finance-First Developer
   - Pattern B: High-Security Operator
   - Pattern C: Utility Spin-off
   - Pattern D: Established Operator Scaling Up
   - Or a combination / new pattern

2. **List all evidence-backed pain points** from the research phases:
   - From Phase 1 (company): strategy-execution gaps, team composition
   - From Phase 2 (hiring): capability gaps revealed by job ads
   - From Phase 3 (ownership): timeline pressure, governance needs
   - From Phase 4 (comparables): likely challenges based on similar operators

3. **Score each Metier service** for relevance:
   - **HIGH:** Multiple independent signals + matches archetype pattern + comparable operators confirm
   - **MEDIUM:** One strong signal or archetype match but limited direct evidence
   - **LOW:** Inferred from segment/strategy but no direct operator-specific evidence

4. **Rank the top 3 pain points** by urgency:
   - Urgency considers: timeline pressure, current capability vs. need, consequences of not addressing

5. **Identify unaddressed pain points** — problems that don't map to Metier services. Important for credibility in the meeting (shows honest analysis).

6. **Flag low-confidence assessments** — clearly separate facts from inferences.

## Output Format
Save to `research/05-pain-points.md`:

```
# Pain Point Analysis: {name}
## Date: {date}

### Operator Archetype
[Which pattern(s) from the mapping framework, with justification]

### Top Pain Points (ranked by urgency)

#### 1. {Pain Point Title}
- **Description:** [what the problem is]
- **Evidence:** [specific findings from which research phase]
- **Urgency:** HIGH/MEDIUM/LOW [why]
- **Metier service:** [which service addresses this]
- **Confidence:** HIGH/MEDIUM/LOW [based on evidence quality]

#### 2. {Pain Point Title}
...

#### 3. {Pain Point Title}
...

### Full Service Relevance Matrix

| Metier Service | Relevance | Key Evidence | Pitch Angle |
|---|---|---|---|
| Contract & Procurement | | | |
| Project Execution & PM | | | |
| Early-Phase Advisory | | | |
| Owner's Engineer / PMC | | | |
| Portfolio Governance | | | |
| Strategy Advisory | | | |
| Competence Development | | | |
| Digital Initiatives | | | |

### Unaddressed Pain Points
[Pain points that don't map to Metier services]

### Key Uncertainties
[What we don't know that could change the analysis — questions to validate in the meeting]
```
