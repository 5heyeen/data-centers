# Hyperscaler Data Center Requirements: How AWS, Google, Microsoft, and Meta Dictate Engineering Design

## 1. The Custom Everything Philosophy

Hyperscalers do not buy off-the-shelf infrastructure. They design their own servers, racks, power distribution, and cooling systems from first principles, optimizing for total cost of ownership (TCO) at massive scale rather than per-unit flexibility.

**Open Compute Project (OCP) and Open Rack v3.** Meta founded OCP in 2011 to open-source its data center hardware designs. The current [Open Rack v3 (ORv3) specification](https://www.opencompute.org/documents/open-rack-base-specification-version-3-pdf) defines a 21-inch-wide rack (537mm), a 20% increase in frontal area over the standard EIA-310 19-inch rack. This wider form factor delivers more airflow to IT devices and reduces cooling costs. ORv3 supports both 19-inch EIA equipment and 21-inch OCP equipment, but hyperscaler-native gear is designed exclusively for the 21-inch form factor, meaning that all cabling, containment systems, PDUs, and blanking panels from the traditional ecosystem are incompatible.

**Power distribution has been reinvented at the rack level.** Google pioneered the industry's move from 12VDC to [48VDC rack-level power distribution](https://www.opencompute.org/wiki/Open_Rack/SpecsAndDesigns), which reduces current draw by 4x and conduction losses by 16x compared to 12V. Meta adopted a 12VDC bus architecture in earlier designs. Both approaches eliminated traditional power distribution units (PDUs) and centralized UPS systems in favor of distributed battery backup at the rack level. In traditional data centers, power flows through utility transformers, UPS systems, PDUs, and finally to server power supplies -- hyperscalers compress or remove several of these stages.

**Cooling is bespoke.** Google's [Hamina, Finland data center](https://datacenters.google/locations/hamina-finland/) draws seawater from the Gulf of Finland through fiberglass-reinforced piping and titanium heat exchangers inherited from a former paper mill, achieving a PUE of 1.09. Meta's Prineville, Oregon facility pioneered large-scale evaporative cooling, though Meta is now shifting toward [closed-loop, zero-water-evaporation designs](https://www.datacenterdynamics.com/en/news/how-meta-acheives-120kw-a-rack-in-20kw-air-cooled-data-centers/) and Air-Assisted Liquid Cooling (AALC) for its newer AI-optimized facilities in El Paso and Beaver Dam. Google has deployed liquid cooling at [gigawatt scale across more than 2,000 TPU pods](https://chipsandcheese.com/p/googles-liquid-cooling-at-hot-chips) over the past seven years, reporting 99.999% uptime. Liquid-cooled ML servers have roughly half the volume of their air-cooled counterparts because compact cold plates replace bulky heatsinks, enabling Google to double chip density.

## 2. Massive Scale Design

**Campus-scale power.** Hyperscaler campuses now routinely demand 100 MW to 1 GW of dedicated power. Applied Digital's Polaris Forge campus in North Dakota, leased to a hyperscaler under a [$5 billion, 15-year agreement](https://www.datacenterdynamics.com/en/news/applied-digital-secures-5bn-15-year-lease-with-hyperscaler-at-north-dakota-data-center-campus/), will deliver 400 MW across three buildings (100 MW, 150 MW, 150 MW) between 2025 and 2027. At this scale, facilities require dedicated utility-grade substations and direct high-voltage transmission connections -- infrastructure that is qualitatively different from what colocation providers typically procure.

**Standardized, replicated modules.** Hyperscalers treat data halls as modular building blocks, typically 10-30 MW each, replicated identically across a campus and globally. According to [ABI Research](https://www.abiresearch.com/blog/data-center-design), 61% of all new data centers in 2026 will use at least one reference design, rising to 86% by 2030. This "design once, build many" approach allows hyperscalers to deploy proven designs with local adaptations for climate, power grid, and regulatory requirements. AWS, Google, and Microsoft all [rely on documented reference frameworks](https://www.purestorage.com/knowledge/what-is-a-hyperscale-data-center.html) to accelerate construction.

**Deployment speed.** Modular prefabrication enables shell completion within eight months for hyperscale builds. The [2025-2026 construction wave](https://www.datacenterknowledge.com/hyperscalers/hyperscalers-in-2026-what-s-next-for-the-world-s-largest-data-center-operators-) will see more than 150 new hyperscale data centers come online worldwide, backed by $400 billion in AI infrastructure investment. Building costs sit at $10-12 million per MW in 2025, rising to approximately $11.3 million per MW in 2026. However, more than 36 projects representing $162 billion in investment were either blocked or significantly delayed as of mid-2025, primarily due to power availability, equipment lead times, and local opposition.

## 3. Specific Engineering Requirements by Hyperscaler

### Google
Google has pushed furthest on custom power and cooling. Having led the 12V-to-48VDC transition, Google is now driving a move to [+/-400VDC distribution](https://cloud.google.com/blog/topics/systems/enabling-1-mw-it-racks-and-liquid-cooling-at-ocp-emea-summit), enabled by EV power-electronics supply chains, to support racks scaling from 100 kW to 1 MW. Google projects that ML workloads will require [more than 500 kW per IT rack before 2030](https://www.datacenterdynamics.com/en/news/hyperscalers-prepare-for-1mw-racks-at-ocp-emea-google-announces-new-cdu/). The company is contributing its fifth-generation cooling distribution unit, [Project Deschutes](https://chipsandcheese.com/p/googles-liquid-cooling-at-hot-chips), to OCP. Google's fleet-wide PUE sits at [1.08-1.10 quarterly](https://datacenters.google/efficiency/). Custom TPU pods require specific network topologies and liquid cooling infrastructure that standard facilities cannot accommodate.

### Microsoft / Azure
Microsoft blends standard infrastructure with increasingly custom designs. The [Maia 100 AI accelerator](https://www.datacenterfrontier.com/machine-learning/article/33015123/microsoft-unveils-custom-designed-data-center-ai-chips-racks-and-liquid-cooling) was the first Microsoft chip deployed with direct-to-chip liquid cooling, using a custom "sidekick" heat exchanger unit (HXU) that sits beside the rack in existing air-cooled facilities. The [Maia 200](https://blogs.microsoft.com/blog/2026/01/26/maia-200-the-ai-accelerator-built-for-inference/), launched in January 2026 for inference workloads, ships with a second-generation closed-loop liquid cooling HXU. These are deployed in the custom "Ares" rack and cluster design. Microsoft is also exploring [microfluidic cooling](https://news.microsoft.com/source/features/innovation/microfluidics-liquid-cooling-ai-chips/) that channels coolant directly through silicon, achieving up to 3x better cooling than conventional approaches.

### AWS
AWS maintains the largest global footprint with at least three availability zones per region, each AZ consisting of one or more discrete data centers. AWS has developed [five generations of custom silicon](https://aws.amazon.com/silicon-innovation/): Graviton CPUs (now at Graviton5 with 192 cores), Trainium AI accelerators (Trainium3 on TSMC 3nm delivering 2.52 PFLOPs FP8 per chip with 144 GB HBM3e), and the Nitro system that offloads virtualization to dedicated hardware. [Trainium4](https://www.hpcwire.com/2025/12/02/aws-brings-the-trainium3-chip-to-market-with-new-ec2-ultraservers/) will integrate Nvidia NVLink Fusion interconnect, enabling mixed GPU/Trainium racks on common MGX-based rack designs. AWS also relies heavily on third-party build-to-suit and colocation partners for shell construction.

### Meta
Meta is the founding force behind OCP and continues to push open-source hardware designs. At [OCP Summit 2025](https://futurumgroup.com/insights/2025-ocp-summit-ai-infrastructure-ai-servers-rack-power-cooling-and-networking/), Meta contributed rack designs that AMD used as the basis for [Helios, its reference AI rack](https://www.amd.com/en/blogs/2025/amd-helios-ai-rack-built-on-metas-2025-ocp-design.html), with volume deployment expected in 2026. Meta also unveiled the [IcePack liquid-cooled networking rack](https://www.servethehome.com/meta-icepack-liquid-cooled-networking-rack-from-ocp-2025/). Meta's first [AI-optimized data centers are slated for 2026](https://enkiai.com/data-center/metas-liquid-cooling-2025-inside-the-65b-ai-overhaul), blending high-performance custom hardware with flexible design. AALC is currently Meta's "bridge" technology for deploying 120-140 kW racks in facilities originally designed for 20 kW.

## 4. How Hyperscaler Requirements Break Standard Designs

The gap between hyperscaler specifications and traditional data center engineering is widening, not narrowing.

**Non-standard rack dimensions.** The 21-inch OCP rack format is physically incompatible with 19-inch EIA ecosystems. All containment aisles, cable trays, overhead busways, and blanking panels must be redesigned. Operators who have standardized on 19-inch infrastructure face significant retrofit costs.

**Radically different power topology.** The [Diablo 400 project](https://www.opencompute.org/documents/ocp-specification-diablo-400-v0-7-0-final-pdf) -- jointly developed by Google, Meta, and Microsoft under OCP -- defines a disaggregated "sidecar" power rack that converts AC to +/-400VDC and delivers it via high-voltage DC busbar to adjacent IT racks. Power supplies and battery backup units are [moved entirely outside the IT rack](https://techcommunity.microsoft.com/blog/azureinfrastructureblog/mt-diablo---disaggregated-power-fueling-the-next-wave-of-ai-platforms/4268799), freeing every millimeter inside for compute. This eliminates traditional UPS rooms, PDU whips, and server-level PSUs -- the fundamental building blocks of conventional data center power. Nominal output is +400VDC to COM at 410VDC with tight regulation. Operators built around N+1 or 2N UPS architectures with AC distribution must fundamentally rearchitect their power plants.

**Custom cooling infrastructure.** A facility designed for 5-20 kW per rack with raised-floor air cooling cannot support 100 kW+ liquid-cooled racks without wholesale mechanical redesign. CDU placement, piping runs, water quality management, and redundancy schemes are all hyperscaler-specific. Google's in-row CDUs with redundant components and dedicated UPS differ from any standard cooling product.

**Extreme power scale.** A 100+ MW campus requires dedicated high-voltage transmission infrastructure, utility interconnection agreements, and potentially on-site generation -- capabilities far beyond standard colocation "utility feed + diesel backup" models. Standard colo facilities typically offer 2-20 MW total.

**Proprietary networking.** Hyperscalers run custom network fabrics (Google Jupiter, AWS custom EFA, Meta FBOSS) with non-standard structured cabling requirements, optical interconnects, and rack-to-rack topologies that do not match traditional meet-me-room architectures.

## 5. What Hyperscalers Demand from Third-Party DC Providers

The engagement model between hyperscalers and third-party operators takes two primary forms:

**Build-to-suit.** The hyperscaler provides detailed engineering specifications -- rack layout, power topology, cooling design, structural loading, security requirements -- and the operator constructs to those exact specs. The operator becomes a construction and facilities management partner rather than a technology provider. This model demands that operators accept non-standard designs they may never reuse for another tenant.

**Powered shell.** The operator provides the building envelope, utility power connection, and basic mechanical infrastructure (potentially including cooling plant). The hyperscaler fits out the interior with its own IT infrastructure, racks, and potentially custom power distribution. [Powered shells](https://www.landgate.com/news/powered-shell-data-centers-everything-you-need-to-know) are increasingly preferred by AWS and Google for single-building or campus-scale deployments ranging from 100 MW to 1 GW, as they provide agility without the "one-size-fits-all" constraints of turnkey builds.

**The fundamental tension.** Third-party operators invest heavily in standardized, repeatable designs to manage cost and risk across their portfolio. Hyperscalers demand bespoke configurations that may be used at only one site. Colocation providers designed for [5-40 kW per rack with building-wide cooling](https://www.ibm.com/think/topics/hyperscale-vs-colocation) cannot easily accommodate a tenant requiring 120 kW racks with liquid cooling, 21-inch OCP form factors, and 400VDC power distribution. The operator must either invest in hyperscaler-specific infrastructure (with limited reuse value) or lose the contract. This tension is accelerating a bifurcation in the market: operators are increasingly specializing as either multi-tenant colo providers or hyperscale-focused development platforms, with few successfully straddling both.

---

**Sources:**

- [OCP Open Rack v3 Base Specification](https://www.opencompute.org/documents/open-rack-base-specification-version-3-pdf)
- [OCP Open Rack Specs and Designs](https://www.opencompute.org/wiki/Open_Rack/SpecsAndDesigns)
- [Eaton ORv3 Open Rack Solutions](https://www.eaton.com/us/en-us/catalog/backup-power-ups-surge-it-power-distribution/eaton-intelligent-power-manager/power-management-alliance-partners/open-compute-project.html)
- [Google: Enabling 1 MW IT Racks and Liquid Cooling at OCP EMEA Summit](https://cloud.google.com/blog/topics/systems/enabling-1-mw-it-racks-and-liquid-cooling-at-ocp-emea-summit)
- [DCD: Hyperscalers Prepare for 1MW Racks at OCP EMEA](https://www.datacenterdynamics.com/en/news/hyperscalers-prepare-for-1mw-racks-at-ocp-emea-google-announces-new-cdu/)
- [Google's Liquid Cooling at Hot Chips 2025](https://chipsandcheese.com/p/googles-liquid-cooling-at-hot-chips)
- [Google PUE Data](https://datacenters.google/efficiency/)
- [Google Hamina Finland Data Center](https://datacenters.google/locations/hamina-finland/)
- [TechRadar: EV Tech Powering 400VDC AI Data Centers](https://www.techradar.com/pro/microsoft-google-and-meta-have-borrowed-ev-tech-for-the-next-big-thing-in-data-center-1mw-watercooled-racks)
- [OCP Diablo 400 Specification v0.7.0](https://www.opencompute.org/documents/ocp-specification-diablo-400-v0-7-0-final-pdf)
- [Microsoft: Mt Diablo Disaggregated Power](https://techcommunity.microsoft.com/blog/azureinfrastructureblog/mt-diablo---disaggregated-power-fueling-the-next-wave-of-ai-platforms/4268799)
- [Meta: How Meta Achieves 120kW Racks in 20kW Data Centers](https://www.datacenterdynamics.com/en/news/how-meta-acheives-120kw-a-rack-in-20kw-air-cooled-data-centers/)
- [AMD Helios AI Rack on Meta's OCP 2025 Design](https://www.amd.com/en/blogs/2025/amd-helios-ai-rack-built-on-metas-2025-ocp-design.html)
- [Meta IcePack Liquid-Cooled Networking Rack](https://www.servethehome.com/meta-icepack-liquid-cooled-networking-rack-from-ocp-2025/)
- [OCP Summit 2025: AI Infrastructure](https://futurumgroup.com/insights/2025-ocp-summit-ai-infrastructure-ai-servers-rack-power-cooling-and-networking/)
- [Microsoft: Maia 200 AI Accelerator](https://blogs.microsoft.com/blog/2026/01/26/maia-200-the-ai-accelerator-built-for-inference/)
- [Microsoft: Microfluidic Cooling Breakthrough](https://news.microsoft.com/source/features/innovation/microfluidics-liquid-cooling-ai-chips/)
- [Microsoft: Liquid Cooling in Air-Cooled Data Centers](https://techcommunity.microsoft.com/blog/azureinfrastructureblog/liquid-cooling-in-air-cooled-data-centers-on-microsoft-azure/4268822)
- [AWS Silicon Innovation](https://aws.amazon.com/silicon-innovation/)
- [AWS Trainium3 EC2 UltraServers](https://www.hpcwire.com/2025/12/02/aws-brings-the-trainium3-chip-to-market-with-new-ec2-ultraservers/)
- [AWS Graviton5](https://www.aboutamazon.com/news/aws/aws-graviton-5-cpu-amazon-ec2)
- [Applied Digital $5B Hyperscaler Lease](https://www.datacenterdynamics.com/en/news/applied-digital-secures-5bn-15-year-lease-with-hyperscaler-at-north-dakota-data-center-campus/)
- [AI-First Hyperscalers: 2026 Outlook](https://www.datacenterknowledge.com/hyperscalers/hyperscalers-in-2026-what-s-next-for-the-world-s-largest-data-center-operators-)
- [ABI Research: Rethinking Data Center Design](https://www.abiresearch.com/blog/data-center-design)
- [Powered Shell Data Centers Guide](https://www.landgate.com/news/powered-shell-data-centers-everything-you-need-to-know)
- [IBM: Hyperscale vs Colocation](https://www.ibm.com/think/topics/hyperscale-vs-colocation)
- [Schneider Electric: 1 MW AI Rack Needs 800 VDC](https://blog.se.com/datacenter/2025/10/16/the-1-mw-ai-it-rack-is-coming-and-it-needs-800-vdc-power/)
