# Prompt 24: insurance-vs-fire-codes

> **Prompt:** [See prompt chain for full text]

---

# Fire Suppression Design in Data Centers: Insurance, Codes, and the Gas vs. Water Tension

## Insurance Carrier Requirements

Major insurance carriers exert enormous influence over data center fire suppression design, often imposing requirements that exceed local building codes.

**FM Global** is the dominant insurer in the mission-critical facility space. Their **Data Sheet 5-32 (Data Centers and Related Facilities)** generally requires automatic sprinkler protection throughout data centers, even where gaseous suppression is installed. FM Global's position is that sprinklers provide a reliable, proven backup — gas systems can fail due to door seals, discharge timing, or room integrity issues. FM Global typically mandates wet-pipe or pre-action sprinklers as a baseline, with gas suppression treated as a supplementary system rather than a replacement.

**Zurich** and **AIG** follow similar philosophies. Zurich's data center risk engineering guidelines emphasize that gaseous agents alone are insufficient without automatic sprinkler backup, citing concerns about deep-seated fires in cable bundles that gas systems may not fully extinguish. AIG's technical advisories similarly recommend dual-system approaches. The practical effect: if an operator wants favorable insurance premiums and coverage terms, they install sprinklers regardless of their gas suppression investment.

## Code Requirements: NFPA, IBC, and European Standards

**NFPA 75 (Standard for the Fire Protection of Information Technology Equipment)** permits clean agent suppression as a primary system for IT spaces but does not exempt facilities from general building sprinkler requirements under **NFPA 13**. The **International Building Code (IBC)** mandates automatic sprinkler systems in buildings exceeding certain size thresholds (typically 1,115 m² for Group B occupancies, though data centers may be classified differently depending on jurisdiction).

**NFPA 2001 (Clean Agent Fire Extinguishing Systems)** governs the design of gas-based systems using agents like FM-200 (HFC-227ea), Novec 1230, or inert gas blends (IG-541/IG-55). These codes permit gas suppression but rarely allow it to fully replace sprinklers in large facilities.

**In Europe**, the regulatory landscape varies. EN 15004 governs gaseous extinguishing systems. Many European jurisdictions are more permissive regarding gas-only suppression in dedicated IT rooms, particularly where the room is a distinct fire compartment with rated enclosures.

**Norway's TEK17 (Byggteknisk forskrift)** requires fire suppression aligned with the building's risk class. Data centers typically fall under risk class 2 or higher, and buildings above certain sizes require automatic fire suppression (§ 11-12). The specific system type is determined through performance-based fire engineering (brannteknisk prosjektering), which gives Norwegian designers more flexibility than prescriptive US codes. However, Norwegian insurers (and international insurers covering Norwegian assets) often impose FM Global-aligned requirements, negating this code flexibility in practice.

## The Dual-System Compromise and Cost Implications

The industry-standard compromise is a **dual-system architecture**: clean agent (gas) suppression as the primary system for rapid fire knockdown without water damage, backed by a **pre-action sprinkler system** that activates only upon confirmed fire (double-interlock: both detector activation and sprinkler head fusing required). This minimizes accidental water discharge while satisfying insurer requirements.

**Cost implications are significant.** Gas-based suppression systems typically cost **3–5x more per square meter** than sprinkler systems. A pre-action sprinkler system for a 1,000 m² white space might cost €50,000–80,000, while a clean agent system for the same space runs €200,000–400,000 depending on agent choice and ceiling height. Operators paying for both systems face substantial capital expenditure, which is a particular pain point for smaller or scaling operators.

## Liquid and Immersion Cooling: Changing the Risk Profile

The shift toward **direct liquid cooling (DLC)** and **single-phase/two-phase immersion cooling** fundamentally alters fire risk. Immersion cooling submerges servers in dielectric fluid, which is typically non-flammable or has very high flash points (e.g., 3M Novec engineered fluids). This reduces airborne fire propagation risks significantly. However, codes and insurer requirements have not yet fully caught up — most insurers still require traditional suppression systems even in immersion-cooled environments, though some are beginning to offer premium reductions for facilities that can demonstrate reduced fire loads through liquid cooling adoption.

## Key Takeaway

The fundamental tension remains: **equipment owners prefer gas suppression** (no water damage, faster recovery), while **insurers and codes require sprinklers** (proven reliability, deep-seated fire capability). The dual-system approach is now effectively mandatory for any commercially insured data center of meaningful scale, adding significant cost that operators must plan for from the earliest design stages. In the Nordic context, performance-based fire engineering under TEK17 offers theoretical flexibility, but insurer requirements typically dictate the outcome regardless.

---
*Executed: 2026-04-03 | Mode: independent*
