# Engineering Consultancies and Contractors in Norwegian Data Center Construction: How the Leverandor Relationships Work

## Key Findings Summary

1. **In traditional Norwegian totalentreprise (design-build), the engineering consultant typically works FOR the contractor** as a sub-supplier. The contractor hires firms like Norconsult to handle technical design disciplines (HVAC, electrical, fire, acoustics), and the owner has no direct contractual relationship with the engineer.

2. **Data center projects are shifting this dynamic.** The two major Norwegian DC projects with public contract details -- Bulk N01 and Skygard -- both use owner-side engineering models where the consultancy (Norconsult, COWI) contracts directly with the owner, not with a construction contractor.

3. **The EPCM model (used by Norconsult on Bulk N01) fundamentally changes the engineer's position.** Instead of being a sub-supplier buried under the contractor, the EPCM consultant becomes the owner's primary agent, managing procurement and construction on the owner's behalf. Construction contractors become subordinate to the engineer, not the other way around.

4. **MEP contractors (Bravida, Caverion, GK) can play either role in DC projects** -- as the general/total contractor bringing their own engineering, or as specialist sub-contractors under an EPCM or multi-prime structure managed by the owner's engineer.

5. **This shift represents a significant opportunity for PM consultancies like Metier**, as DC owners increasingly need independent owner-side support to manage complex, multi-contractor projects.

---

## 1. The Traditional Norwegian Construction Model

Norwegian construction projects use standardized contract forms governed by NS (Norsk Standard) contracts:

- **NS 8407 (Totalentreprise / Design-Build):** The totalentreprenor assumes responsibility for both design and execution. The owner provides functional requirements; the contractor handles all engineering. The contractor hires consulting engineers (like Norconsult) as sub-suppliers under NS 8417. The owner has no direct contract with the engineer. ([NS 8407 - Codex Advokat](https://codex.no/bedrift/entrepriserett/ns-kontrakter/totalentreprise/totalentreprise-ns8407-ns8417), [Standard Norge](https://standard.no/fagomrader/kontraktstandarder-bygg-anlegg-og-eiendom/juridiske-standarder-for-bygg-og-anlegg-mellom-profesjonelle-parter/totalentreprise-ns-8407-og-totalunderentreprise-ns-8417/))

- **Generalentreprise (NS 8405):** The owner handles design separately (hiring architects and engineers directly), then contracts the execution to a general contractor. The engineer works for the owner.

- **Byggherrestyrte sideentrepriser (Owner-managed split contracts):** The owner contracts directly with multiple trades and is responsible for coordination between them. The engineer works for the owner. ([Langseth Advokatfirma](https://www.langsethadvokat.no/en/hva-er-totalentreprise-generalentreprise-byggherrestyrte-entreprise-mm/))

**A concrete example of the traditional model:** On the new UNN Narvik hospital project, HENT acted as totalentreprenor and hired Norconsult as a sub-supplier/advisor for HVAC, electrical, ICT, fire safety, and acoustics engineering. Ramboll in turn worked as a sub-contractor to Norconsult. The design responsibility chain ran: Owner (UNN) -> HENT (total contractor) -> Norconsult (engineering sub-supplier) -> Ramboll (sub-sub-supplier). ([Byggeindustrien](https://www.bygg.no/bygg-kontrakter-norconsult/hent-signerte-med-norconsult-for-radgivertjenester-pa-nytt-narvik-sykehus/1776270), [Mynewsdesk/Norconsult](https://www.mynewsdesk.com/no/norconsult/pressreleases/norconsult-valgt-som-raadgiver-for-bygging-av-nytt-sykehus-i-narvik-3007057))

**The "tiltransport" mechanism** is also common: the owner initially hires an engineer for early-phase design, then "transfers" that engineer's contract to the total contractor when construction begins. After transfer, the contractor has full instruction rights over the engineer. The owner retains risk only for design decisions made before the transfer. ([Advokatfirmaet Selmer / Bygg.no](https://www.bygg.no/byggejus/artikkelserie-fra-advokatfirmaet-selmer-tiltransport-av-prosjekterende/785268), [Bjornsen Advokatfirma](https://bjornsen-advokatfirma.no/fagstoff/prosjekteringsrisiko-i-totalentrepriseforhold/))

---

## 2. How Data Center Projects Change This Dynamic

Data centers are not typical building projects. They require specialized MEP systems (power distribution, cooling, fire suppression, BMS/DCIM), long-lead equipment procurement, phased construction for incremental capacity, and continuous operational integration. This complexity pushes owners toward models that keep the engineering consultant on their side of the table.

### The EPCM Model: Norconsult on Bulk N01

Norconsult's contract with Bulk Infrastructure for the N01 campus at Stoleheia is an **EPCM (Engineering, Procurement, and Construction Management)** contract -- a fundamentally different arrangement from being a sub-supplier to a totalentreprenor:

- Norconsult provides **project management and control, engineering and engineering leadership for all project phases, procurement, and construction management** -- directly for the owner (Bulk). ([Byggeindustrien](https://www.bygg.no/kontrakter-norconsult/norconsult-fikk-datasenter-kontrakt/234992), [Norsk Infrastruktur](https://www.norskinfrastruktur.no/norconsult-sa-rger-for-gra-nn-kraftforsyning-til-bulk-infrastructure-groups-nye-datasenter-i-vennesla))
- Construction started late 2023, expected completion end of 2026, with an investment exceeding NOK 3 billion. ([BuildPilot](https://www.buildpilot.com/en/project/datacentercampus-utviklingstrinn-stoleheia-230555461))
- In EPCM, the owner (Bulk) holds direct contracts with construction contractors and vendors. Norconsult manages these contractors on the owner's behalf but does not take single-point construction risk. ([H+M EPC](https://www.hm-ec.com/blog-posts/epc-vs-epcm-projects-understanding-execution-models-hm), [SBEC](https://www.sbec.com/Insights/EPC-vs-EPCM-What%E2%80%99s-the-Difference-and-Why-It-Matters/))

**This is the opposite of the totalentreprise model.** Instead of the engineer working under the contractor, the engineer works for the owner and manages the contractors.

### COWI on Skygard Oslo

Skygard (owned by Telenor, Hafslund, HitecVision, and Analysys Mason Nordic -- a NOK 2.4 billion investment) contracted COWI directly to "deliver a complete solution" for their Oslo data center -- covering design of data centres, sustainable energy, engineering solutions, and architecture. ([COWI](https://www.cowi.com/projects/skygard-data-centre/), [Datacenter Forum](https://www.datacenter-forum.com/datacenter-forum/new-datacentre-doubles-as-a-green-urban-space-in-the-heart-of-oslo))

[Inference] COWI's engagement as "total advisor" directly for the owner (not under a contractor) follows the same pattern as Norconsult/Bulk -- the owner retains the engineering relationship and contracts separately with construction firms.

### Google's Multi-Contract Approach in Skien

Google's hyperscale data center in Telemark uses a **split-contract / multi-prime approach**: Google contracted Skanska Norway separately for groundwork (NOK 1.1 billion) and then for core/shell construction (NOK 569 million) as distinct packages. A collaboration contract model with target pricing was used. ([Skanska](https://group.skanska.com/media/press-releases-articles/278070/Skanska-prepares-for-new-data-center-in-Telemark,-Norway,-for-NOK-1.1-billion,-about-SEK-1.1-billion), [DLA Piper](https://www.dlapiper.com/en/insights/publications/2024/05/construction-of-googles-eur600-million-hyperscale-data-centre-in-norway))

[Inference] Hyperscalers like Google typically maintain their own in-house engineering teams and use owner-managed multi-prime contracting, making them unlikely to use totalentreprise. The engineering function sits firmly on the owner's side.

---

## 3. MEP Contractors in Norwegian DC Projects

The major Nordic MEP/technical installation companies active in DC construction include:

- **Bravida:** Positions itself as capable of taking "overall responsibility as a general contractor" for data center projects, combining project management with MEP installation (HVAC, electrical, ventilation, cooling, fire protection). Has delivered facilities for Meta. Can scale up with partners for civil/structural work. ([Bravida](https://www.bravida.se/en/our-offering/data-center/))

- **Caverion (now Assemblin Caverion Group):** Offers end-to-end data centre services including project management, installations, control room services, and preventive maintenance. Selected as "technical construction and installation partner" for data center projects (e.g., Kouvola, Finland). ([Caverion](https://www.caverion.com/catalog/services/datacentres/), [Caverion Kouvola](https://www.caverion.com/newsroom/releases/2025/kouvola-data-center-built-with-finnish-expertise--the-project-company-has-selected-caverion-as-its-technical-construction-and-installation-partner/))

- **GK:** Active in Norwegian technical installations but less prominent in DC-specific marketing.

[Inference] The MEP contractors' role depends on the owner's chosen delivery model:
- **In an EPCM model** (like Bulk N01): MEP contractors are hired as specialist sub-contractors, managed by the EPCM consultant (Norconsult). They may or may not bring their own engineering -- but the overall engineering leadership sits with the EPCM firm.
- **In a design-build / totalentreprise model:** An MEP firm like Bravida could act as the totalentreprenor, hiring engineering consultants (potentially Norconsult) as sub-suppliers for design work. Bravida explicitly markets this capability.
- **In an owner-managed multi-prime model** (like Google): MEP contractors are one of several direct contracts managed by the owner's team.

---

## 4. The Leverandor Chain: Two Competing Models

### Model A: Traditional Totalentreprise (Contractor-Led)
```
Owner (Byggherre)
  └── Total Contractor (e.g., Skanska, Bravida, HENT)
        ├── Engineering Consultant (e.g., Norconsult) -- sub-supplier
        ├── MEP Sub-contractor
        ├── Civil/Structural Sub-contractor
        └── Equipment Suppliers
```
The engineer works FOR the contractor. The owner has limited visibility into design decisions. This is common for simpler buildings but creates problems for DC projects where the owner needs to specify and control critical infrastructure parameters.

### Model B: EPCM / Owner-Managed (Owner-Led)
```
Owner (Byggherre)
  ├── EPCM Consultant / Owner's Engineer (e.g., Norconsult, COWI)
  │     └── manages →
  ├── Civil Contractor (e.g., Skanska) -- direct owner contract
  ├── MEP Contractor (e.g., Bravida, Caverion) -- direct owner contract
  ├── Specialist Sub-contractors -- direct owner contracts
  └── Equipment Suppliers (OFCI) -- direct owner procurement
```
The engineer works FOR the owner. The owner holds all construction contracts directly. The EPCM firm manages these on the owner's behalf.

[Inference] Data center projects in Norway are gravitating toward Model B because:
1. DC owners need to control critical design parameters (power density, cooling efficiency, redundancy levels) that cannot be delegated to a general contractor
2. Phased build-out requires ongoing engineering involvement across multiple construction packages
3. Long-lead equipment (generators, UPS, switchgear, cooling units) requires owner-direct procurement to manage supply chain risk
4. The specialized nature of DC engineering means few general contractors have in-house DC design competence

---

## 5. Where Does the PM Consultant Fit?

**NS Nordics** is a specialized PM firm providing project management for four data center projects (10MW to 150MW) currently under construction in Norway, offering planning, scheduling, risk assessment, 4D BIM, and progress tracking. They have 10+ years of experience and ISO/OSHA/BREEAM certifications. ([NS Nordics](https://nsnordics.com/), [NS Nordics Norway Projects](https://nsnordics.com/projects/data-centre-projects-in-norway/))

[Inference] NS Nordics appears to operate on the owner's side, providing project controls and management oversight -- a role complementary to (or potentially competing with) the EPCM consultant. In projects where the engineering firm provides EPCM (like Norconsult on Bulk N01), the PM function is bundled with engineering. In projects where the owner hires an engineering consultant for design only (like COWI on Skygard), there is room for a separate PM consultant.

**For Metier, the key insight is this:** When the engineering consultant operates as an EPCM provider (like Norconsult on Bulk N01), they absorb the PM function. Metier's opportunity is strongest in scenarios where:
- The owner uses an engineering consultant for design but needs separate project management/controls
- The owner wants an independent PM overlay to monitor the EPCM consultant's performance
- The owner is in early phase and needs strategic advisory before selecting a delivery model
- The project uses multi-prime contracting and the owner lacks internal PM capacity

---

## Sources

- [NS 8407 Totalentreprise - Codex Advokat](https://codex.no/bedrift/entrepriserett/ns-kontrakter/totalentreprise/totalentreprise-ns8407-ns8417)
- [Standard Norge - NS 8407 og NS 8417](https://standard.no/fagomrader/kontraktstandarder-bygg-anlegg-og-eiendom/juridiske-standarder-for-bygg-og-anlegg-mellom-profesjonelle-parter/totalentreprise-ns-8407-og-totalunderentreprise-ns-8417/)
- [Langseth Advokatfirma - Entrepriseformer](https://www.langsethadvokat.no/en/hva-er-totalentreprise-generalentreprise-byggherrestyrte-entreprise-mm/)
- [Bjornsen Advokatfirma - Prosjekteringsrisiko](https://bjornsen-advokatfirma.no/fagstoff/prosjekteringsrisiko-i-totalentrepriseforhold/)
- [Byggeindustrien - Norconsult datasenter-kontrakt](https://www.bygg.no/kontrakter-norconsult/norconsult-fikk-datasenter-kontrakt/234992)
- [Norsk Infrastruktur - Norconsult/Bulk](https://www.norskinfrastruktur.no/norconsult-sa-rger-for-gra-nn-kraftforsyning-til-bulk-infrastructure-groups-nye-datasenter-i-vennesla)
- [Byggeindustrien - HENT/Norconsult Narvik sykehus](https://www.bygg.no/bygg-kontrakter-norconsult/hent-signerte-med-norconsult-for-radgivertjenester-pa-nytt-narvik-sykehus/1776270)
- [Mynewsdesk - Norconsult UNN Narvik](https://www.mynewsdesk.com/no/norconsult/pressreleases/norconsult-valgt-som-raadgiver-for-bygging-av-nytt-sykehus-i-narvik-3007057)
- [Selmer/Bygg.no - Tiltransport](https://www.bygg.no/byggejus/artikkelserie-fra-advokatfirmaet-selmer-tiltransport-av-prosjekterende/785268)
- [COWI - Skygard Data Centre](https://www.cowi.com/projects/skygard-data-centre/)
- [Datacenter Forum - Skygard Oslo](https://www.datacenter-forum.com/datacenter-forum/new-datacentre-doubles-as-a-green-urban-space-in-the-heart-of-oslo)
- [DLA Piper - Google Norway DC](https://www.dlapiper.com/en/insights/publications/2024/05/construction-of-googles-eur600-million-hyperscale-data-centre-in-norway)
- [Skanska - Google Telemark contract](https://group.skanska.com/media/press-releases-articles/278070/Skanska-prepares-for-new-data-center-in-Telemark,-Norway,-for-NOK-1.1-billion,-about-SEK-1.1-billion)
- [Bravida - Data Center offering](https://www.bravida.se/en/our-offering/data-center/)
- [Caverion - Data Centre services](https://www.caverion.com/catalog/services/datacentres/)
- [H+M EPC - EPC vs EPCM](https://www.hm-ec.com/blog-posts/epc-vs-epcm-projects-understanding-execution-models-hm)
- [SBEC - EPC vs EPCM](https://www.sbec.com/Insights/EPC-vs-EPCM-What%E2%80%99s-the-Difference-and-Why-It-Matters/)
- [NS Nordics](https://nsnordics.com/)
- [NS Nordics - Norway DC Projects](https://nsnordics.com/projects/data-centre-projects-in-norway/)
- [BuildPilot - N01 Campus](https://www.buildpilot.com/en/project/datacentercampus-utviklingstrinn-stoleheia-230555461)
- [Caverion - Kouvola DC](https://www.caverion.com/newsroom/releases/2025/kouvola-data-center-built-with-finnish-expertise--the-project-company-has-selected-caverion-as-its-technical-construction-and-installation-partner/)
