# Phase 6: Meeting Brief Generation

## Objective
Synthesize all research into a concise, actionable meeting brief. This is the final deliverable — optimized for a 15-minute read before a meeting.

## Inputs
- `operator.md` — meeting details, contact info
- `research/01-company.md` — company profile
- `research/02-hiring.md` — hiring analysis
- `research/03-news-ownership.md` — ownership and news
- `research/04-comparables.md` — comparable operators
- `research/05-pain-points.md` — pain point analysis
- `../../metier/services.md` — for service descriptions
- `../../templates/meeting-brief.md` — output template

## Generation Steps

1. **Read all research outputs** and the meeting brief template.

2. **Company Snapshot:** Write 2-3 paragraphs synthesizing who they are, what they're building, why now. Keep it tight — this is an executive summary.

3. **Key People:** Table of people likely in the meeting + other key decision makers. Include a "notes for meeting" column with anything useful (e.g., "previously at Statnett, understands grid issues").

4. **Strategic Context:** What segment, why that segment, what's driving their timeline. Connect ownership to strategy.

5. **Capability Assessment:** Three columns — what they have, what they're building (hiring), what's missing. This is the core of the pitch.

6. **Pain Points:** Take the top 3 from Phase 5. For each, include evidence, urgency, Metier service, and confidence. Don't over-claim.

7. **Recommended Pitch:** Pick 1-2 Metier services to lead with. Explain why these are the strongest opening angle for THIS operator. Be specific.

8. **Talking Points:** Write 3-5 conversational openers tied to their specific situation. These should feel natural, not salesy. Reference specific evidence.

9. **Questions to Ask:** 5-8 open questions that:
   - Validate assumptions from the research
   - Uncover pain points the research couldn't reveal
   - Show genuine understanding of their challenges
   - Invite them to share their perspective

10. **Risks & Objections:** Be honest about why they might NOT need Metier or what objections to expect. Preparation for these builds credibility.

11. **Comparable Operators:** Brief table showing 2-3 operators with similar profiles and key lessons.

12. **Sources:** All URLs from all research phases.

## Output
Save to `research/brief.md` following the template structure in `../../templates/meeting-brief.md`.

## Quality Checklist
- [ ] Every claim cites a source
- [ ] Inferences are clearly labeled as such
- [ ] Talking points reference specific evidence, not generic statements
- [ ] Questions are open-ended, not leading
- [ ] The brief can be read in under 15 minutes
- [ ] Low-confidence assessments are flagged
