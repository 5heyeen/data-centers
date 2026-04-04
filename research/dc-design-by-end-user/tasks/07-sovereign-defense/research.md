# Sovereign Cloud & Defense Data Center Engineering Requirements

## 1. Sovereign Cloud: Regulatory Drivers and Infrastructure Implications

The sovereign cloud market has moved from a niche concern to a dominant infrastructure category. Gartner projects European sovereign cloud IaaS spending will surge 83% from $6.9 billion in 2025 to $12.6 billion in 2026, driven by a convergence of legal, political, and technical forces ([Impossible Cloud](https://www.impossiblecloud.com/magazine/cloud-data-sovereignty-for-eu-business-in-2026-new)).

**Data Residency and the CLOUD Act Problem.** The foundational driver is jurisdictional control. The US CLOUD Act (2018) grants US law enforcement authority to demand data from US-headquartered companies regardless of where data physically resides -- including servers in Frankfurt, Dublin, or Oslo. Microsoft's general manager for France testified before the French Senate that he could not guarantee French citizen data was safe from US authority access. The Schrems II ruling (2020) invalidated the Privacy Shield, and while the EU-US Data Privacy Framework replaced it, the European Data Protection Board advises against over-reliance on the DPF ([Orrick](https://www.orrick.com/en/Insights/2026/01/Data-Localization-and-the-Sovereign-Cloud-EU-Cloud-Regulations-Explained); [Akave](https://akave.com/blog/the-2026-data-sovereignty-reckoning)). This creates a structural requirement: for truly sovereign workloads, data must not only reside within national borders but must be processed by entities outside the reach of extraterritorial laws.

**National Cloud Certifications.** Europe has fragmented into national certification regimes, each with distinct requirements:

- **France -- SecNumCloud (v3.2):** The most stringent European qualification. Requires that no single non-EU entity holds more than 24% of share capital or voting rights, and that all data remains subject exclusively to French/EU law. OVHcloud operates SecNumCloud-certified services from purpose-built data centers in Roubaix, Gravelines, and Strasbourg, staffed exclusively by European-based personnel ([Scalingo](https://scalingo.com/blog/secnumcloud-qualification-anssi-guide); [OVHcloud](https://www.ovhcloud.com/en/compliance/secnumcloud/)).
- **Germany -- C5 (Cloud Computing Compliance Criteria Catalogue):** Maintained by the BSI, C5 complements ISO 27001 with cloud-specific controls focusing on data protection against non-European laws ([AWS](https://aws.amazon.com/compliance/bsi-c5/)).
- **Norway -- NSM requirements:** Under the Sikkerhetsloven (Security Act), organizations handling classified information must implement risk-based protective security programs. NSM has cross-sector supervisory responsibility ([Cyberday](https://www.cyberday.ai/blog/what-is-sikkerhetsloven); [NSM](https://nsm.no/about-nsm/about-the-norwegian-national-security-authority/)).
- **EU -- EUCS (European Union Cloud Services Scheme):** Still under development by ENISA, the scheme defines three assurance levels. A major political battle continues over whether sovereignty requirements (data localization, ownership restrictions) will be included at the highest level. As of early 2026, earlier sovereignty requirements for "High+" were removed, though the Council has urged their reintroduction ([ENISA](https://www.enisa.europa.eu/publications/eucs-cloud-service-scheme); [Hogan Lovells](https://www.hoganlovells.com/en/publications/eucs-controversial-data-sovereignty-issues-continue-to-drive-debate-around-the-eu-certification-scheme-for-cloud-services)).

**Operational and Supply Chain Sovereignty.** The October 2025 EU Cloud Sovereignty Framework (CSF v1.2.1) introduced a scoring system where Supply Chain (20%) and Technology (15%) carry the highest weights -- meaning organizations cannot compensate for opaque hardware through legal compliance alone. Initiatives such as EuroStack advocate for a Europe-led digital supply chain spanning chips, cloud, AI, and governance. The European Parliament has reported on "European technological sovereignty and digital infrastructure" as a strategic priority ([European Commission CSF](https://commission.europa.eu/document/download/09579818-64a6-4dd5-9577-446ab6219113_en); [European Parliament](https://www.europarl.europa.eu/doceo/document/A-10-2025-0107_EN.html); [STORDIS](https://stordis.com/cloud-sovereignty-framework/)).

**Operational sovereignty** means that staff operating sovereign infrastructure must hold national security clearances and no foreign nationals may have access. AWS's European Sovereign Cloud, which reached general availability in Brandenburg, Germany in January 2026, is operated by a new EU-based legal entity with EU citizen board members, and future hiring is limited exclusively to EU citizens ([DEV Community](https://dev.to/aws-builders/amazons-new-european-sovereign-cloud-a-strategic-response-to-us-law-and-eu-data-privacy-ed3)).

## 2. Government and Classified Data Center Engineering

Classified data centers operate under fundamentally different engineering paradigms from commercial facilities, governed by standards that are themselves often classified.

### Physical Security Tiers

NATO classifies information at four levels (NATO RESTRICTED through COSMIC TOP SECRET). Norway's Sikkerhetsloven establishes parallel national levels: BEGRENSET (Restricted), KONFIDENSIELT (Confidential), HEMMELIG (Secret), and STRENGT HEMMELIG (Top Secret). Information classified KONFIDENSIELT or higher may only be stored and processed in designated protected or restricted physical security zones -- progressive layers of controlled access from the facility perimeter inward ([NSM](https://nsm.no/regelverk-og-hjelp/veiledere-og-handboker-til-sikkerhetsloven/veileder-i-handtering-og-beskyttelse-av-sikkerhetsgradert-informasjon/behandling-av-dokumenter-og-lagringsmedier-med-sikkerhetsgradert-informasjon/behandling-av-konfidensielt-og-hoyere/); [Lovdata](https://lovdata.no/lov/2018-06-01-24)).

Under the US Intelligence Community Directive 705 (ICD 705), SCIFs (Sensitive Compartmented Information Facilities) require a minimum of three layers of 5/8" gypsum wallboard, staggered seams, acoustic fill, and construction designed to provide visual evidence of unauthorized penetration. Access control relies on secure entry vestibules (mantraps) with two interlocking doors -- one must close before the other opens -- combined with biometric scanners, encrypted keycards, and intrusion detection. The 2025 ICD 705 update, the largest in 15 years, now requires higher levels of RF shielding integrated into the facility's basic physical structure ([ICD 705 Tech Spec](https://exwc.navfac.navy.mil/Portals/88/Documents/EXWC/DoD_Locks/PDFs/ICD-ICS-705_Tech_Spec.pdf); [CenCore](https://cencoregroup.com/comprehensive-guide-to-icd-705-modular-scif-requirements/); [MGAC](https://www.mgac.com/blog/new-scif-requirements-under-the-icd-705/)).

### TEMPEST/EMSEC Shielding

TEMPEST is a NATO codename (and NSA specification) for protection against compromising emanations -- unintentional radio/electrical signals, sounds, and vibrations that leak from information systems. The current NATO standard is SDIP-27 (formerly AMSG 720B), which defines three protection levels:

- **Level A (SDIP-27 Level A / NSTISSAM Level I):** Strictest -- designed against near-field exploitation (less than 1 meter). Requires approximately 80-100 dB attenuation.
- **Level B:** Protection against exploitation up to 20 meters.
- **Level C:** Most relaxed -- protection against exploitation at greater distances.

The full SDIP-27 standard remains classified. Installation requirements are covered by NATO SDIP-29, which specifies grounding, cable distances, and equipment placement within shielded enclosures ([Wikipedia -- TEMPEST](https://en.wikipedia.org/wiki/Tempest_(codename)); [Interelectronix](https://www.interelectronix.com/shielding-standards.html); [Holland Shielding](https://hollandshielding.com/en/eavesdropping)).

Engineering a TEMPEST-compliant room involves surrounding the space with a continuous Faraday cage -- typically welded steel or copper sheet enclosures. Every penetration (ventilation, power, data, fire suppression) must be treated:

- **Ventilation:** Honeycomb waveguide panels below cut-off frequency, preventing RF leakage while permitting airflow. Mesh sizes must be as small as possible to maintain shielding effectiveness ([Faraday Cages](https://faradaycages.com/server-rooms)).
- **Power entry:** Filtered power entry panels and isolation transformers to prevent conducted emissions. EMI power-line filters must meet TEMPEST attenuation specifications ([MAJR Products](https://www.majr.com/tempest-shielding/)).
- **Data entry/exit:** Fiber optic only -- copper cabling is prohibited because it conducts electromagnetic emissions. Waveguide filters bring fiber into shielded enclosures while maintaining RF isolation integrity ([FiberPlex](https://www.fiberplex.com/products/waveguide_overview.html)).
- **Fire suppression:** Gas-based systems are mandatory (no water in TEMPEST rooms). Agent delivery must pass through TEMPEST-compliant penetrations.
- **Cooling:** Either waveguide air penetrations (for air-cooled systems) or water-cooled closed loops with no direct air exchange through the shielded boundary. This is one of the most significant engineering constraints, as high-density compute generates substantial heat that must be removed without compromising the Faraday cage ([Bunkerkit](https://bunkerkit.com/en/specific-uses/data-center-it-room/)).

### Air-Gapped Networks

Classified networks are physically isolated from the internet. No wireless connectivity of any kind is permitted within the secure zone. Data entry and exit points use hardware-enforced data diodes (one-way transfers) or physically controlled media exchange procedures. All internal cabling is fiber-optic to eliminate EM emission risk ([OPSWAT](https://www.opswat.com/blog/air-gapped-network); [Silverfort](https://www.silverfort.com/glossary/an-air-gapped-network/)).

### Blast Resistance

US DoD facilities follow UFC 4-010-01 (Minimum Antiterrorism Standards for Buildings), which establishes standoff distances and progressive collapse resistance as the primary defense strategy. The core principle is keeping threats as far from inhabited areas as possible; where standoff distance is insufficient, structural reinforcement (blast-resistant walls, laminated glass, reinforced frames) compensates. NATO allied facilities follow comparable standards, though specific requirements are not publicly documented ([UFC 4-010-01](https://www.wbdg.org/dod/ufc/ufc-4-010-01); [STRUCTURE Magazine](https://www.structuremag.org/?p=12983)).

## 3. Engineering Cost and Complexity Implications

Standard commercial data center construction costs range from approximately $6,450 to $11,840 per square meter. TEMPEST-shielded rooms carry an estimated 5-10x cost premium, driven by the welded metal enclosures, specialized HVAC waveguide penetrations, filtered power panels, fiber-only connectivity, and gas fire suppression. Modular shielded enclosures are commercially available for up to approximately 93 square meters, but larger installations require custom construction combining carpentry, precision metal fabrication, and electronics assembly -- techniques that are "often counter-intuitive" compared to standard construction ([Dgtl Infra](https://dgtlinfra.com/how-much-does-it-cost-to-build-a-data-center/); [TEMPEST Inc](https://www.tempest-inc.com/courses-shielded-room-construction.htm)).

Construction of classified facilities requires a cleared workforce with appropriate security clearances, a secure construction area, and Technical Surveillance Counter-Measures (TSCM) sweeps before, during, and after construction.

## 4. Norwegian and Nordic Context

Norway occupies a unique position at the intersection of sovereign cloud demand and NATO defense requirements:

- **Skygard Data Centers:** Established as a joint venture by Telenor (31.7%), Hafslund (31.7%), and HitecVision (31.7%), Skygard was launched in direct response to Norwegian security authorities' request for domestic data centers to handle sensitive national security information. The Oslo facility supports up to 40 MW and hosts Telenor's sovereign AI cloud, Norway's first sovereign NVIDIA GPU-accelerated infrastructure ([DCD](https://www.datacenterdynamics.com/en/news/telenor-group-to-invest-945m-to-expand-sovereign-cloud-with-aws/); [Mobile Europe](https://www.mobileeurope.co.uk/telenor-invests-in-sovereign-data-centre-company-skygard/); [DataCenter Knowledge](https://www.datacenterknowledge.com/business/mwc-2026-red-hat-telenor-team-up-for-sovereign-norway-ai-factory)).

- **Green Mountain:** Norway's largest data center operator, acquired by Israeli property company Azrieli for $850 million. Serves government agencies among other customers ([Dgtl Infra](https://dgtlinfra.com/green-mountain-24-mw-data-centers-850m-azrieli/); [Business Wire](https://www.businesswire.com/news/home/20250212664902/en/)).

- **NATO CAOC in Norway:** Norway is establishing NATO's third Combined Air Operations Centre, likely in Bodø, with temporary facilities already operational. This drives demand for classified-capable data infrastructure in-country ([High North News](https://www.highnorthnews.com/en/important-thing-allied-air-operations-center-actually-placed-norway)).

- **Supplementary Defense Cooperation Agreement (SDCA):** Norway and the US agreed on eight additional "agreed facilities and areas" for joint military use, further increasing the requirement for NATO-standard classified infrastructure on Norwegian soil ([Global Security](https://www.globalsecurity.org/military/library/news/2024/02/mil-240202-govno01.htm)).

- **Norwegian Defense Acquisitions 2026-2033:** The government has published its Future Acquisitions for the Defence Sector plan covering 2026-2033, signaling sustained investment in defense infrastructure ([Regjeringen](https://www.regjeringen.no/en/documents/future-acquisitions-for-the-defence-sector-faf-20262033/id3143079/)).

## 5. What Cannot Be Retrofitted -- and Why Purpose-Built Matters

This is perhaps the most critical insight for data center developers and investors: several classified-facility requirements are structurally incompatible with retrofit.

- **TEMPEST/Faraday shielding** must be integrated into the building envelope from day one. Retrofitting a SCIF to add RF shielding is described as "a complex, high-stakes undertaking" requiring "precise execution under stringent security controls." The continuous welded metal enclosure must envelop the entire room including floor, ceiling, and all penetrations -- adding this to an existing structure means essentially building a room-within-a-room, with severe space loss, structural loading concerns, and cost escalation that typically exceeds the cost of purpose-built construction ([Cooper Builds](https://www.cooperbuilds.com/post/how-to-renovate-a-scif-to-add-rf-shielding-a-practical-and-secure-approach)).

- **Blast resistance** is structural and cannot be meaningfully added post-construction. UFC 4-010-01 relies on standoff distances and structural design (reinforced concrete, progressive collapse resistance) that must be part of the original building design.

- **Progressive security zones** require specific building layouts with layered access control -- public zone, restricted zone, secure zone, sensitive zone -- each with its own access controls, CCTV, and IDS. Retrofitting these zones into a commercial colocation facility designed for open floor plans is typically impractical.

- **Waveguide HVAC and filtered power** require specific mechanical and electrical infrastructure that must be designed around the shielded enclosure, not patched onto an existing MEP system.

The implication is clear: sovereign and defense-grade data centers are almost universally purpose-built. Operators who plan for these requirements from the design phase can serve the fastest-growing segment of European data center demand. Those who do not will find it prohibitively expensive -- both financially and technically -- to enter this market after construction.

---

**Sources:**

- [Orrick -- Data Localization and the Sovereign Cloud](https://www.orrick.com/en/Insights/2026/01/Data-Localization-and-the-Sovereign-Cloud-EU-Cloud-Regulations-Explained)
- [Akave -- The 2026 Data Sovereignty Reckoning](https://akave.com/blog/the-2026-data-sovereignty-reckoning)
- [Impossible Cloud -- Cloud Data Sovereignty for EU Business in 2026](https://www.impossiblecloud.com/magazine/cloud-data-sovereignty-for-eu-business-in-2026-new)
- [AWS -- European Sovereign Cloud](https://dev.to/aws-builders/amazons-new-european-sovereign-cloud-a-strategic-response-to-us-law-and-eu-data-privacy-ed3)
- [Scalingo -- SecNumCloud Guide](https://scalingo.com/blog/secnumcloud-qualification-anssi-guide)
- [OVHcloud -- SecNumCloud](https://www.ovhcloud.com/en/compliance/secnumcloud/)
- [AWS -- BSI C5](https://aws.amazon.com/compliance/bsi-c5/)
- [ENISA -- EUCS Cloud Service Scheme](https://www.enisa.europa.eu/publications/eucs-cloud-service-scheme)
- [Hogan Lovells -- EUCS Sovereignty Debate](https://www.hoganlovells.com/en/publications/eucs-controversial-data-sovereignty-issues-continue-to-drive-debate-around-the-eu-certification-scheme-for-cloud-services)
- [European Commission -- Cloud Sovereignty Framework](https://commission.europa.eu/document/download/09579818-64a6-4dd5-9577-446ab6219113_en)
- [European Parliament -- Technological Sovereignty Report](https://www.europarl.europa.eu/doceo/document/A-10-2025-0107_EN.html)
- [STORDIS -- Cloud Sovereignty Framework Analysis](https://stordis.com/cloud-sovereignty-framework/)
- [Cyberday -- Sikkerhetsloven](https://www.cyberday.ai/blog/what-is-sikkerhetsloven)
- [NSM -- About the Norwegian National Security Authority](https://nsm.no/about-nsm/about-the-norwegian-national-security-authority/)
- [NSM -- Handling of KONFIDENSIELT and Higher](https://nsm.no/regelverk-og-hjelp/veiledere-og-handboker-til-sikkerhetsloven/veileder-i-handtering-og-beskyttelse-av-sikkerhetsgradert-informasjon/behandling-av-dokumenter-og-lagringsmedier-med-sikkerhetsgradert-informasjon/behandling-av-konfidensielt-og-hoyere/)
- [Wikipedia -- TEMPEST](https://en.wikipedia.org/wiki/Tempest_(codename))
- [Interelectronix -- Shielding Standards](https://www.interelectronix.com/shielding-standards.html)
- [Holland Shielding -- Eavesdropping](https://hollandshielding.com/en/eavesdropping)
- [Faraday Cages -- Server Rooms](https://faradaycages.com/server-rooms)
- [MAJR Products -- TEMPEST Shielding](https://www.majr.com/tempest-shielding/)
- [FiberPlex -- Waveguide Overview](https://www.fiberplex.com/products/waveguide_overview.html)
- [Bunkerkit -- Data Center with EMC Shielding](https://bunkerkit.com/en/specific-uses/data-center-it-room/)
- [OPSWAT -- Air-Gapped Networks](https://www.opswat.com/blog/air-gapped-network)
- [ICD 705 Tech Spec (NAVFAC)](https://exwc.navfac.navy.mil/Portals/88/Documents/EXWC/DoD_Locks/PDFs/ICD-ICS-705_Tech_Spec.pdf)
- [CenCore -- ICD 705 Guide](https://cencoregroup.com/comprehensive-guide-to-icd-705-modular-scif-requirements/)
- [MGAC -- New SCIF Requirements](https://www.mgac.com/blog/new-scif-requirements-under-the-icd-705/)
- [Cooper Builds -- Retrofitting SCIF RF Shielding](https://www.cooperbuilds.com/post/how-to-renovate-a-scif-to-add-rf-shielding-a-practical-and-secure-approach)
- [UFC 4-010-01 (WBDG)](https://www.wbdg.org/dod/ufc/ufc-4-010-01)
- [STRUCTURE Magazine -- Blast Design](https://www.structuremag.org/?p=12983)
- [TEMPEST Inc -- Shielded Room Construction](https://www.tempest-inc.com/courses-shielded-room-construction.htm)
- [Dgtl Infra -- Data Center Construction Costs](https://dgtlinfra.com/how-much-does-it-cost-to-build-a-data-center/)
- [DCD -- Telenor Sovereign Cloud with AWS](https://www.datacenterdynamics.com/en/news/telenor-group-to-invest-945m-to-expand-sovereign-cloud-with-aws/)
- [Mobile Europe -- Telenor Invests in Skygard](https://www.mobileeurope.co.uk/telenor-invests-in-sovereign-data-centre-company-skygard/)
- [DataCenter Knowledge -- Telenor/Red Hat Sovereign AI Factory](https://www.datacenterknowledge.com/business/mwc-2026-red-hat-telenor-team-up-for-sovereign-norway-ai-factory)
- [Dgtl Infra -- Green Mountain Sold to Azrieli](https://dgtlinfra.com/green-mountain-24-mw-data-centers-850m-azrieli/)
- [Business Wire -- Norway Data Center Portfolio 2025](https://www.businesswire.com/news/home/20250212664902/en/)
- [High North News -- NATO CAOC in Norway](https://www.highnorthnews.com/en/important-thing-allied-air-operations-center-actually-placed-norway)
- [Global Security -- Norway-US SDCA Agreement](https://www.globalsecurity.org/military/library/news/2024/02/mil-240202-govno01.htm)
- [Regjeringen -- Future Acquisitions for Defence 2026-2033](https://www.regjeringen.no/en/documents/future-acquisitions-for-the-defence-sector-faf-20262033/id3143079/)
- [Lovdata -- Sikkerhetsloven](https://lovdata.no/lov/2018-06-01-24)
