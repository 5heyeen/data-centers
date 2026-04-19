# Barriers to Direct Owner Engagement for Engineering Consultancies in the Data Center Sector

**Focus: What prevents firms like Norconsult from serving DC operators directly, and what must they build?**

## Executive Summary

Engineering consultancies seeking to work directly for data center owners face five interlocking barriers: (1) a commercial model locked into the totalentreprise supply chain, (2) missing DC-specific technical competencies, (3) organizational structures misaligned with mission-critical delivery, (4) absent market relationships and track record, and (5) a Norwegian contractual culture that defaults to design-build. Overcoming these requires a deliberate combination of acquisition, dedicated team formation, and credentialing -- a path that competitors COWI, Ramboll, and WSP have already traveled.

---

## 1. Commercial Barriers: Escaping the Sub-Supplier Trap

**The totalentreprise lock-in.** Under NS 8407/8417 (Norwegian design-build standard), the totalentreprenor owns both the design and the client relationship. The engineering consultant becomes a sub-supplier under NS 8417, with no direct line to the owner and limited ability to influence scope or solutions. The owner trades control for simplicity: "the builder deals with fewer contract parties and the totalentrepreneur bears the responsibility and risk for design and execution" ([Okland & Co](https://www.oklandco.no/kompetanse/entreprise/rad-om-valg-av-entrepriserformer)). The engineer's fee is squeezed through the contractor's markup.

**Fee uplift from direct engagement.** Construction management and EPCM fees typically range from 5-10% of total project cost for projects in the $10M-$100M+ range, declining with scale ([Highspire](https://www.highspire.com/construction-management-consulting-fees/); [Iconic PM](https://www.iconicprojectmanagement.com/post/typical-project-management-fees-in-construction-what-should-i-expect-to-pay)). Sub-consulting margins are structurally lower: prime contractors mark up sub-consultant rates and limit fee negotiations. [Inference] Direct-for-owner engagements likely yield 30-50% higher effective margins for the engineering firm compared to sub-consultant work, because the contractor's intermediate margin layer is eliminated.

**Liability exposure increases.** Under NS 8401 (direct owner-consultant contract), the consultant bears full professional liability for design adequacy. Under NS 8417 (sub-consultant under contractor), the contractor absorbs much of this risk. Moving to EPCM means the consultant's insurance obligations are "limited to professional indemnity and specific liabilities," but the owner manages subcontractor risks directly ([MASTT](https://www.mastt.com/blogs/epcm-vs-epc)). This is manageable but requires higher PI insurance limits and more robust QA processes. Standard liability caps in engineering contracts typically limit exposure to fees received or a minimum dollar amount ([Structure Magazine](https://www.structuremag.org/article/managing-the-risks-of-subconsultant-relationships/)).

---

## 2. DC-Specific Capability Gaps

Traditional MEP engineering is necessary but insufficient for data centers. The gap between conventional building services and mission-critical DC design is substantial:

- **Redundancy engineering:** N+1, 2N, and 2(N+1) configurations across power and cooling, designed for concurrent maintainability without downtime -- a concept absent from standard building design ([Mintropy](https://www.mintropy.com/services/data-center-mep-engineering-services/)).
- **Tier design methodology:** Uptime Institute's Tier classification (I-IV) requires specific design expertise. The Accredited Tier Designer (ATD) credential is a market signal that a firm understands these standards ([Uptime Institute](https://uptimeinstitute.com/education/accredited-tier-designer-atd)).
- **Power distribution within data halls:** Not just grid connection (where Norconsult has demonstrated strength on the Bulk N01 project), but UPS topology, PDU architecture, busway distribution, and generator synchronization.
- **Advanced cooling:** Liquid cooling (direct-to-chip, immersion), free cooling economization, PUE optimization, and heat reuse -- all rapidly evolving with AI workload densities pushing beyond 50 kW/rack ([HVAC Blog](https://hvac-blog.cfn-hvac.com/2026/03/liquid-cooling-for-data-centers-design.html)).
- **5-level commissioning:** Data center commissioning spans from Level 1 (component verification) through Level 5 (integrated systems testing), far more rigorous than standard building Cx. Commissioning costs 5-8% of project budgets and is non-negotiable for Tier-certified facilities ([Uptime Institute](https://journal.uptimeinstitute.com/improve-project-success-through-mission-critical-commissioning/)).
- **BMS/DCIM integration:** Designing monitoring and control systems specific to data center operations -- distinct from standard building automation.

[Inference] Norconsult's Bulk N01 engagement focuses on power infrastructure and EPCM coordination. This demonstrates project management and power-side capability but likely does not yet cover the full spectrum of in-hall DC design (cooling, IT infrastructure, commissioning).

---

## 3. Organizational Barriers: Discipline Silos vs. Dedicated Teams

**How competitors have organized:**

- **COWI** has a dedicated data center practice that delivers "end-to-end consulting" directly to operators like Skygard (a Telenor/Hafslund/HitecVision JV). COWI was contracted to deliver a "complete solution" covering design, sustainable energy, engineering, and architecture ([COWI](https://www.cowi.com/projects/skygard-data-centre/)). This integrated delivery model requires a cross-disciplinary team, not a loose federation of discipline specialists.

- **Ramboll** acquired EYP Mission Critical Facilities in January 2022 -- a 50-person firm with 20+ years of DC focus, giving Ramboll "100 dedicated data center experts globally" and an expected $60M in DC consulting revenue by 2025 ([DCD](https://www.datacenterdynamics.com/en/news/ramboll-acquires-eyp-mission-critical-facilities/); [Ramboll](https://www.ramboll.com/news/ramboll-acquires-leading-data-centre-consulting-company)).

- **WSP** acquired kW Mission Critical Engineering, a firm "solely focused on the strategic planning, engineering design, and assessment of data centers." WSP also built a global centre of excellence, growing from 2 engineers to 26+ dedicated DC specialists ([WSP/DCD](https://www.datacenterdynamics.com/en/news/wsp-acquires-data-center-engineering-firm-kw-mce/)).

- **Accenture** acquired DLB Associates (founded 1980, DC specialist) in December 2025 for its end-to-end DC capabilities including "site selection, design engineering, commissioning, and energy optimization" ([Accenture Newsroom](https://newsroom.accenture.com/news/2025/accenture-to-acquire-majority-stake-in-dlb-to-expand-capital-projects-capabilities-for-end-to-end-data-center-development)).

**The pattern is clear:** successful entrants either acquire a dedicated DC team (Ramboll/EYP, WSP/kW MCE, Accenture/DLB) or build one organically as a cross-functional unit (COWI, Sweco). A discipline-based matrix organization where DC work is distributed across electrical, mechanical, and structural departments does not produce the integrated delivery that DC operators demand.

[Inference] Norconsult's traditional discipline-silo structure is a significant barrier. DC operators need a single point of contact leading a team that integrates power, cooling, structural, fire/life safety, security, and commissioning. The Metier acquisition (250 PM consultants, December 2025) adds project management depth but not DC-specific technical design capability.

---

## 4. Market Relationship Barriers

**Hyperscaler access is gatekept.** Google, Meta, and Microsoft work with a small number of pre-qualified engineering firms globally. Breaking into these relationships requires demonstrated hyperscale track record, pre-screened personnel with certifications, and often years of smaller engagements before being trusted with a campus-scale project. [Inference] This market segment is likely inaccessible to Norconsult in the near term.

**Colocation and mid-market operators are more accessible.** Norwegian operators like Bulk Infrastructure, Green Mountain, DigiPlex/STACK, and Skygard are building at scales where a credible Nordic engineering firm with local knowledge offers genuine value -- particularly around Norwegian grid connection, regulatory approvals (konsesjon), and environmental compliance. Norconsult's Bulk N01 engagement is a beachhead into this segment.

**Visibility gap.** Norconsult has a data centre page on its website listing EPCM and engineering services ([Norconsult](https://norconsult.com/services/industry/data-centres/)), but a single reference project (Bulk N01, focused on power infrastructure) is thin compared to COWI's Skygard showcase or Ramboll's 40-country portfolio via EYP. DC operators evaluating engineering partners look for depth of DC-specific reference projects.

---

## 5. Norwegian Contractual and Cultural Barriers

**Totalentreprise is the default.** Norwegian construction culture strongly favors totalentreprise (NS 8407) for complex projects. In this model, "the builder deals with fewer contract parties" and transfers design risk to the contractor ([Byggordboka](https://www.byggordboka.no/artikkel/les/entrepriseformer)). Many DC operators, especially those without deep in-house technical teams, default to this model because it is familiar and perceived as lower risk.

**The alternative requires a capable owner.** For an owner to engage an engineer directly under NS 8401, the owner must be willing to retain design risk and manage more contract interfaces. This works when: (a) the owner has in-house technical competence to be an informed client, or (b) the owner hires an EPCM consultant to act as their technical representative. Bulk Infrastructure's choice to engage Norconsult as EPCM for N01 suggests Bulk has sufficient owner-side competence to manage this model.

**NS 8401 vs NS 8417 differences are material.** Under NS 8401, the consultant contracts directly with the owner and bears professional liability for design. Under NS 8417, the consultant contracts with the totalentreprenor and the contractor bears outward-facing design liability. The consultant's exposure under NS 8401 is higher, but so is the fee, the influence, and the client relationship ([Standard Norge](https://www.standard.no/nyheter/nyhetsarkiv/kontrakter-og-blanketter/2013/nye-utgaver-av-ns-8401-og-ns-8402/)).

---

## What Norconsult Needs to Build

Based on the barriers identified, the path forward has four elements:

1. **Acquire or build a dedicated DC design team (10-20 specialists minimum):** Following the Ramboll/EYP and WSP/kW MCE playbook, Norconsult needs a nucleus of mission-critical engineers with Uptime Institute credentials, DC commissioning experience, and cooling/power-in-hall expertise. Organic hiring is slow given the global talent shortage; a targeted acquisition of a small DC specialist firm would accelerate this by 3-5 years.

2. **Create a cross-functional DC practice unit:** Pull this team out of the discipline silos. DC operators want one team that owns the full design -- not a matrix where they must coordinate between departments. This unit should combine DC-specific engineers with Metier's project management capability to offer integrated EPCM.

3. **Invest in credentials and track record:** Get staff ATD-certified through Uptime Institute. Pursue Tier design certification on at least one project. Publish DC-specific thought leadership. The Bulk N01 project is a start but needs to be expanded from power infrastructure into full-scope DC design to be a convincing reference.

4. **Target the accessible market first:** Norwegian and Nordic colocation/enterprise operators (not hyperscalers) where local knowledge, regulatory expertise, and Norwegian-language capability are genuine differentiators against international competitors. Use the Metier acquisition to offer combined PM + engineering as an EPCM package that gives owners a credible alternative to totalentreprise.

---

## Sources

- [Okland & Co - Enterprise Forms](https://www.oklandco.no/kompetanse/entreprise/rad-om-valg-av-entrepriserformer)
- [Highspire - Construction Management Fees](https://www.highspire.com/construction-management-consulting-fees/)
- [Iconic PM - Project Management Fees](https://www.iconicprojectmanagement.com/post/typical-project-management-fees-in-construction-what-should-i-expect-to-pay)
- [MASTT - EPCM vs EPC](https://www.mastt.com/blogs/epcm-vs-epc)
- [Structure Magazine - Subconsultant Risk](https://www.structuremag.org/article/managing-the-risks-of-subconsultant-relationships/)
- [Mintropy - Data Center MEP](https://www.mintropy.com/services/data-center-mep-engineering-services/)
- [Uptime Institute - ATD Credential](https://uptimeinstitute.com/education/accredited-tier-designer-atd)
- [Uptime Institute - DC Commissioning](https://journal.uptimeinstitute.com/improve-project-success-through-mission-critical-commissioning/)
- [HVAC Blog - Liquid Cooling](https://hvac-blog.cfn-hvac.com/2026/03/liquid-cooling-for-data-centers-design.html)
- [DCD - Ramboll Acquires EYP](https://www.datacenterdynamics.com/en/news/ramboll-acquires-eyp-mission-critical-facilities/)
- [Ramboll - EYP Acquisition](https://www.ramboll.com/news/ramboll-acquires-leading-data-centre-consulting-company)
- [DCD - WSP Acquires kW MCE](https://www.datacenterdynamics.com/en/news/wsp-acquires-data-center-engineering-firm-kw-mce/)
- [Accenture - DLB Acquisition](https://newsroom.accenture.com/news/2025/accenture-to-acquire-majority-stake-in-dlb-to-expand-capital-projects-capabilities-for-end-to-end-data-center-development)
- [COWI - Skygard Project](https://www.cowi.com/projects/skygard-data-centre/)
- [Norconsult - Data Centres](https://norconsult.com/services/industry/data-centres/)
- [Standard Norge - NS 8401/8402](https://www.standard.no/nyheter/nyhetsarkiv/kontrakter-og-blanketter/2013/nye-utgaver-av-ns-8401-og-ns-8402/)
- [Byggordboka - Enterprise Forms](https://www.byggordboka.no/artikkel/les/entrepriseformer)
- [Norconsult Investor Relations - Metier Acquisition](https://investor.norconsult.com/stock-exchange-and-press-releases/norconsult-to-acquire-metier-group-as/)
