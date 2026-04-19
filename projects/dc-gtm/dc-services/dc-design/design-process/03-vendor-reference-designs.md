# Vendor Reference Designs in Data Center Projects: From Schneider Electric's Blueprint to Built Facility

## Key Findings Summary

- **Schneider Electric's reference designs are schematic-level starting points, not construction-ready documents.** They include electrical one-line diagrams, piping diagrams, dimensioned floor layouts, equipment lists, and ETAP/CFD digital twin models -- but explicitly not site-specific detailed engineering.
- **Substantial engineering work remains** between receiving a vendor reference design and breaking ground: civil/structural design, grid connection engineering, local code compliance (TEK17 in Norway), environmental and fire safety assessments, permitting, and utility coordination.
- **All major vendors (Schneider, Vertiv, Huawei, ABB) follow the same pattern**: they provide pre-validated module designs and configuration tools, but the operator must separately procure site adaptation engineering.
- **An independent owner's engineer role is critical** when using vendor designs -- someone must validate the vendor's design against the operator's actual requirements, manage the gaps, and coordinate the multiple disciplines the vendor does not cover.
- **[Inference]** This gap between vendor reference design and construction-ready detailed engineering is precisely where a PM consultancy like Metier can add value -- as owner's engineer, design coordinator, and gap manager.

---

## 1. What Schneider Electric Actually Provides

Schneider Electric offers **EcoStruxure Data Center Reference Designs** -- pre-validated blueprints showing how power, cooling, and IT systems integrate. These are available at two levels ([SE Reference Designs portal](https://www.se.com/us/en/work/solutions/data-centers-and-networks/reference-designs/)):

**Design Summary PDF (~7 pages):** Features and performance characteristics for facility power, facility cooling, and IT space systems.

**Engineering Package (registration required):**
- CAD drawings (DWG + PDF) of electrical one-line diagrams
- Piping diagrams
- Dimensioned floor layouts
- Equipment list / bill of materials
- DCIM use case documentation
([Schneider Electric Blog - Customer Feedback on Reference Designs](https://blog.se.com/datacenter/architecture/2015/02/05/customer-feedback-data-center-reference-designs/); [WP 147 - Advantages of Using a Reference Design](https://it-resource.schneider-electric.com/white-papers/wp-147-data-center-projects-advantages-of-using-a-reference-design))

**Newer AI reference designs** (developed with NVIDIA) additionally include:
- ETAP electrical system models for digital twin simulation
- EcoStruxure IT Design CFD thermal models
- Integration with NVIDIA Omniverse for digital twin visualization
- Nine distinct AI reference configurations (prefab modules, retrofits, purpose-built for GB200/GB300 NVL72 clusters)
([BusinessWire - Schneider/NVIDIA AI Reference Designs](https://www.businesswire.com/news/home/20251006074939/en/Schneider-Electric-unveils-new-AI-data-centre-reference-designs-with-NVIDIA); [SE Press Release - GB300 NVL72 Reference Designs](https://www.se.com/ww/en/about-us/newsroom/news/press-releases/schneider-electric-announces-new-reference-designs-featuring-integrated-power-management-and-liquid-cooling-controls-supporting-nvidia-mission-control-and-nvidia-gb300-nvl72-68ca8fdd5e6c6f9d3a096133/))

**Design tools Schneider provides** (free, web-based):
- **TradeOff Tools**: Interactive calculators for CapEx comparison, PUE estimation, temperature rise scenarios -- rough order of magnitude (+/- 20%), not quoting tools ([SE TradeOff Tools](https://www.se.com/us/en/work/solutions/data-centers-and-networks/trade-off-tools/))
- **Data Center Capital Cost Calculator**: Compares cost implications of different architecture choices using third-party pricing data and government labor statistics ([SE CapEx Calculator](https://www.se.com/ww/en/work/solutions/system/s1/data-center-and-network-systems/trade-off-tools/data-center-capital-cost-calculator/))
- **EcoStruxure IT Design CFD**: Computational fluid dynamics modeling for thermal design

**For prefabricated modular (EcoStruxure Modular DC):** The modules are pre-assembled, integrated, and tested in the factory. Performance characteristics are validated before shipment. Schneider provides a "custom solutions" engineering team for integration support. Deployment from order to operational: 6-9 months for traditional, as fast as 12 weeks for the newest "Easy Modular Data Center All-in-One" ([SE Modular DC](https://www.se.com/ww/en/work/solutions/data-centers-and-networks/modular-data-center/); [Power Solutions - Easy Modular DC](https://www.power-solutions.com/2026/04/15/schneider-electrics-easy-modular-data-center-all-in-one-a-complete-data-center-in-12-weeks/))

---

## 2. The Gap: What the Vendor Design Does NOT Cover

A vendor reference design -- whether from Schneider, Vertiv, or Huawei -- covers the **internal systems** of the data center (power distribution, cooling, IT space layout). It does **not** cover the site-specific work required to actually build and operate the facility. The following disciplines represent the engineering gap:

**Civil and Structural Engineering:**
- Geotechnical investigation (soil bearing capacity, contamination)
- Foundation design (continuous slab, piers, or combination)
- Site grading, drainage, and stormwater management
- Access roads, parking, landscaping
- Structural design for the building shell (if not fully containerized)
([RETTEW - Civil Engineering for Data Centers](https://www.rettew.com/newsroom/building-tomorrow-role-civil-engineering-data-centers/); [Technical Mobile - Site Preparation Services](https://www.mobiledatacentre.com/data-centre-support/site-preparation-services/))

**Grid Connection and Electrical Utility Coordination:**
- High-voltage/medium-voltage substation design
- Utility interconnection agreement and engineering studies
- Redundant power feed routing
- On-site generation (backup generators, potentially on-site substation)
([Keentel Engineering - Grid Readiness](https://keentelengineering.com/data-center-grid-readiness-engineering-solutions))

**Local Building Code Compliance (Norway-specific):**
- TEK17 (Byggteknisk forskrift) compliance
- Plan- og bygningsloven (Planning and Building Act) permitting
- Fire safety engineering per local fire authority requirements
- Accessibility requirements
- Energy performance documentation

**Environmental and Regulatory:**
- Environmental impact assessment (konsekvensutredning)
- Noise impact studies
- Zoning/land-use compliance (reguleringsplan)
- Water discharge permits (if water-cooled)

**Other Site-Specific Engineering:**
- Network/fiber connectivity and duct routing
- Physical security infrastructure (fences, access control, CCTV)
- Module orientation and placement optimization (solar exposure, wind, drainage)
- Snow load considerations (critical in Norway)
- Lightning protection

**[Inference]** The vendor reference design typically corresponds to RIBA Stage 2/3 (Concept/Spatial Coordination) for the internal MEP systems only. A full RIBA Stage 4 (Technical Design) and construction document set across all disciplines is still required before construction can begin.

---

## 3. Other Vendors' Approaches

**Vertiv (SmartMod / SmartMod Max):**
Offers a free web-based **Modular Designer Lite** configurator -- users input site location (for weather data/cooling sizing), IT load, rack specs, battery backup needs, and electrical topology. Outputs include 2D/3D visualizations, technical documentation, and a configuration package. An internal "Modular Designer" (advanced version) is used by Vertiv experts to optimize designs for site conditions. Vertiv provides factory-integrated and tested modules with power, cooling, and monitoring, but site civil works and utility connections remain the operator's responsibility. ([Vertiv Modular Designer](https://www.vertiv.com/en-emea/solutions/vertiv-modular-designer/); [Data Center Frontier - Vertiv Configurator](https://www.datacenterfrontier.com/design/article/33038386/vertivs-free-online-configurator-eases-prefabricated-modular-data-center-design-planning))

**Huawei (FusionDC 5.0):**
Uses a "1+4+N" architecture -- one unified design with four core module types (IT, power, cooling, battery) that can be combined into multiple configurations. Huawei emphasizes "productized engineering design" with prefabrication and pre-commissioning in factory. Claims 50% reduction in time-to-market vs. traditional, and delivery in as little as 3 months. Like Schneider, the modules are factory-validated but site works are separate. ([Huawei Digital Power - Prefabricated Modular DC](https://digitalpower.huawei.com/en/data-center-facility/prefabricated-modular-data-center))

**ABB:**
Focuses on electrical infrastructure -- modular, prewired, and pretested MV/LV switchgear, eHouses, and power skids. Provides "minimal site and civil works" through prefabrication but does not offer full-facility reference designs in the same way as Schneider. Developing advanced 800V DC reference architectures with NVIDIA for AI workloads. Offers consulting services including engineering studies and owner's engineering. ([ABB Data Centers](https://electrification.us.abb.com/industries/data-center); [ABB Prefabricated Solutions](https://new.abb.com/data-centers/prefabricated-and-integrated-data-center-solutions))

---

## 4. The Process: Reference Design to Detailed Engineering

Based on the research, the typical workflow looks like this:

1. **Operator selects a reference design** from a vendor (or multiple vendors) based on capacity, density, cooling approach, and redundancy requirements. This is essentially a schematic-level validated architecture.

2. **Operator engages an engineering firm** (MEP/architectural) to adapt the reference design to the specific site. This firm produces:
   - Site-adapted detailed drawings across all disciplines
   - Construction documents compliant with local codes
   - Permit application packages
   - Coordination between the vendor's MEP systems and the site's civil/structural/utility systems

3. **The vendor provides factory engineering** for the modules themselves -- internal wiring, piping, component integration, factory testing. This is "done" when the modules ship.

4. **Site construction** proceeds in parallel: civil works, foundations, utility connections, building shell (if applicable), security infrastructure.

5. **Module delivery and installation**: Modules are placed on prepared foundations, connected to site utilities (power, water, network), and commissioned.

6. **Integrated commissioning**: End-to-end testing of the full system.

**[Inference]** The reference design compresses steps 1-2 significantly (from months of MEP concept design to weeks of adaptation), but it does not eliminate the need for a local engineering firm to produce construction-ready documents for the site-specific scope.

---

## 5. The Role of the Owner's Engineer

Even with a vendor reference design, the operator needs an **owner's engineer (OE)** or **owner's representative** to:

- **Validate the vendor design** against the operator's actual requirements (not just accept vendor defaults)
- **Manage the design gaps** -- coordinate between the vendor's scope and the local engineering firm's scope
- **Review and challenge** vendor equipment selections and pricing
- **Coordinate multiple disciplines** -- the vendor handles MEP internals, but someone must integrate structural, civil, fire, security, network, and utility engineering
- **Manage the permitting process** -- the vendor's reference design is not a permit application
- **Oversee construction quality** and commissioning
- **Represent the owner's interest** in risk allocation, schedule, and budget decisions

As one source notes, an owner's engineer "goes above and beyond the scope of an independent engineer, representing the asset owner and collaboratively optimizing all technical aspects of a design with the goal of maximizing profits, by decreasing CapEx and OpEx" -- they don't just identify problems, they help solve them. ([Pure Power - IE vs OE](https://www.purepower.com/blog/independent-engineering-versus-owners-engineering); [Montenegro Business - Owner's Engineer in DC Operations](https://monte.business/data-center-operations-the-integral-role-of-the-owners-engineer/); [ENERCON - Data Centers](https://www.enercon.com/markets/data-centers/))

---

## 6. Implications for Metier

**[Inference]** The research confirms that vendor reference designs are a powerful accelerator but not a replacement for project management and engineering coordination. The specific value gaps where Metier could position itself include:

- **Owner's Engineer / Design Manager**: Bridging the gap between Schneider's (or Vertiv's, Huawei's) reference design and the site-specific detailed engineering, especially for Norwegian regulatory requirements (TEK17, PBL, fire safety, environmental).
- **Vendor-Independent Design Review**: Validating that the vendor's reference design actually meets the operator's operational and commercial requirements, not just the vendor's standard offering.
- **Multi-Discipline Coordination**: Managing the interface between the module vendor, the local MEP/structural/civil engineers, the grid connection process (Statnett/local netteier), and the permitting authorities.
- **Construction and Commissioning Management**: Overseeing the on-site integration of factory-built modules with site-built infrastructure.

The key message to operators: "A Schneider reference design gives you a 3-month head start on MEP concept design. But you still need 6-12 months of site-specific engineering, permitting, civil works, and grid connection work. That is where we come in."

---

## Sources

- [Schneider Electric - EcoStruxure Data Center Reference Designs](https://www.se.com/us/en/work/solutions/data-centers-and-networks/reference-designs/)
- [Schneider Electric Blog - Customer Feedback on Reference Designs](https://blog.se.com/datacenter/architecture/2015/02/05/customer-feedback-data-center-reference-designs/)
- [Schneider Electric WP 147 - Advantages of Using a Reference Design](https://it-resource.schneider-electric.com/white-papers/wp-147-data-center-projects-advantages-of-using-a-reference-design)
- [BusinessWire - Schneider/NVIDIA AI Data Centre Reference Designs](https://www.businesswire.com/news/home/20251006074939/en/Schneider-Electric-unveils-new-AI-data-centre-reference-designs-with-NVIDIA)
- [SE Press Release - NVIDIA GB300 Reference Designs](https://www.se.com/ww/en/about-us/newsroom/news/press-releases/schneider-electric-announces-new-reference-designs-featuring-integrated-power-management-and-liquid-cooling-controls-supporting-nvidia-mission-control-and-nvidia-gb300-nvl72-68ca8fdd5e6c6f9d3a096133/)
- [Schneider Electric - TradeOff Tools](https://www.se.com/us/en/work/solutions/data-centers-and-networks/trade-off-tools/)
- [Schneider Electric - Data Center Capital Cost Calculator](https://www.se.com/ww/en/work/solutions/system/s1/data-center-and-network-systems/trade-off-tools/data-center-capital-cost-calculator/)
- [Schneider Electric - EcoStruxure Modular Data Center](https://www.se.com/ww/en/work/solutions/data-centers-and-networks/modular-data-center/)
- [Power Solutions - Schneider Easy Modular DC All-in-One](https://www.power-solutions.com/2026/04/15/schneider-electrics-easy-modular-data-center-all-in-one-a-complete-data-center-in-12-weeks/)
- [Vertiv - Modular Designer Configurator](https://www.vertiv.com/en-emea/solutions/vertiv-modular-designer/)
- [Data Center Frontier - Vertiv Configurator](https://www.datacenterfrontier.com/design/article/33038386/vertivs-free-online-configurator-eases-prefabricated-modular-data-center-design-planning)
- [Huawei Digital Power - Prefabricated Modular Data Center](https://digitalpower.huawei.com/en/data-center-facility/prefabricated-modular-data-center)
- [ABB Electrification - Data Center](https://electrification.us.abb.com/industries/data-center)
- [ABB - Prefabricated and Integrated Data Center Solutions](https://new.abb.com/data-centers/prefabricated-and-integrated-data-center-solutions)
- [Pure Power - Independent Engineering vs Owner's Engineering](https://www.purepower.com/blog/independent-engineering-versus-owners-engineering)
- [Montenegro Business - Owner's Engineer in DC Operations](https://monte.business/data-center-operations-the-integral-role-of-the-owners-engineer/)
- [ENERCON - Data Centers](https://www.enercon.com/markets/data-centers/)
- [RETTEW - Civil Engineering for Data Centers](https://www.rettew.com/newsroom/building-tomorrow-role-civil-engineering-data-centers/)
- [Technical Mobile - Site Preparation Services](https://www.mobiledatacentre.com/data-centre-support/site-preparation-services/)
- [Keentel Engineering - Data Center Grid Readiness](https://keentelengineering.com/data-center-grid-readiness-engineering-solutions)
