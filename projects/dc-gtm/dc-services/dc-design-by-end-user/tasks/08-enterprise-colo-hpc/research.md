# Enterprise Colocation & HPC/Research Data Center Engineering Requirements

## 1. Enterprise Colocation Engineering

### Power Architecture

Enterprise colocation facilities must serve dozens of tenants with wildly different power requirements simultaneously. The standard approach is **dual-feed (A+B) power** per rack, where two independent power circuits provide full redundancy. In practice, this means two or four PDUs per rack -- two for the A feed and two for the B feed -- often color-coded to prevent human error during maintenance. When one feed fails, the remaining supply supports the entire load ([Belden](https://www.belden.com/blog/exploring-dual-power-feeds-in-data-centers)).

Power density in standard colocation typically ranges from **5-8 kW per cabinet** as a baseline allocation, with the industry average sitting around 8 kW/rack. However, operators now face demand for mixed density spanning 5-30 kW/rack across different tenants in the same facility. Equinix offers kVA-based power cabinets with scalable amperage options, and metered-outlet PDUs (such as Eaton's billing-grade models) measure consumption within 1% accuracy at the outlet level for per-tenant billing ([Eaton](https://www.eaton.com/us/en-us/catalog/backup-power-ups-surge-it-power-distribution/eaton-metered-outlet-rack-pdu.html), [Equinix Docs](https://docs.equinix.com/en-us/Content/Colocation-Products/SecureCabinets/colo-secure-cabinets-kVA.htm)). Power redundancy is typically N+1 or 2N, depending on the tier level and tenant SLA.

### Cooling

Standard colocation relies on **air cooling with hot/cold aisle containment**. Green Mountain's Norwegian facilities illustrate two distinct approaches: their Rennesoy site uses **fjord water cooling** from an adjacent deep-water fjord (stable at 8 degrees C year-round at 75m depth) with N+N redundancy, while their Hamar facility uses **free air cooling** leveraging Norway's average 5.8 degrees C ambient temperature ([Green Mountain](https://greenmountain.no/data-centers/), [Business Norway](https://businessnorway.com/solutions/green-mountain-carbon-neutral-data-centres-have-natural-cooling)). For high-density zones (20+ kW/rack), operators deploy in-row cooling units or rear-door heat exchangers (RDHx), installed to client specification.

### Rack Standards and Tenant Partitioning

Standard racks follow the **19-inch EIA-310 form factor, 42-48U height**, and must accommodate diverse customer equipment from 1U servers to full-height storage arrays. Tenant isolation is achieved through **private cages** (dedicated fenced areas with locked access) and **private suites** (fully enclosed rooms). Equinix offers cage and suite configurations with dedicated cooling, power metering, and physical security per tenant ([Equinix](https://docs.equinix.com/en-us/Content/Colocation-Products/colo-private-cage.htm)).

### Network Connectivity

Enterprise colocation is fundamentally **carrier-neutral**. Facilities like Digital Realty's 312 global sites provide multiple meet-me rooms, diverse fiber entry points, and direct cross-connects between tenants and carriers. Cloud on-ramps to AWS, Azure, and GCP are standard, with most major facilities offering at least two cloud provider direct connections ([Dgtl Infra](https://dgtlinfra.com/carrier-neutral-data-centers/), [Digital Realty](https://www.digitalrealty.com/data-centers/design/certifications-compliance)).

### Security and Compliance

Multi-tenant colocation requires layered security: facility perimeter controls, biometric access per tenant cage, CCTV, and visitor escort procedures. The compliance baseline includes **SOC 1 Type 2, SOC 2 Type 2, ISO 27001, PCI DSS, and HIPAA**. CoreSite, Equinix, and Digital Realty all maintain these certifications across their portfolios. SOC 2 mandates documented access control, physical monitoring, and environmental controls; ISO 27001 provides the overarching ISMS framework ([CoreSite](https://www.coresite.com/data-center-design/compliance), [Equinix](https://www.equinix.com/data-centers/design/standards-compliance)).

### The Core Challenge

Designing one facility to serve 50+ tenants with different needs creates inherent tension. Standard colocation pricing (approximately $196/kW and rising in 2026) reflects the overhead of this flexibility ([AI Tool Discovery](https://www.aitooldiscovery.com/ai-infra/colocation-data-center-explained)). The operator must provision for worst-case power and cooling scenarios across every cage while maintaining acceptable PUE -- a problem that worsens as density divergence between tenants increases.

---

## 2. HPC/Research Data Center Engineering

### Compute and Power Profile

HPC facilities differ from pure AI/GPU training farms in important ways. Power density is typically **20-50 kW/rack** -- lower than the 50-100+ kW/rack of dense GPU clusters, because HPC workloads mix CPU-heavy simulation with GPU-accelerated computation. However, the aggregate facility power is enormous: LUMI in Finland draws from 200 MW of available hydropower capacity; Frontier at ORNL consumes 8-30 MW at peak; MareNostrum 5 in Barcelona has a 20 MW total facility capacity ([CSC/LUMI](https://csc.fi/en/our-expertise/high-performance-computing/lumi-supercomputer/), [ORNL](https://www.ornl.gov/news/frontier-supercomputer-debuts-worlds-fastest-breaking-exascale-barrier), [BSC](https://www.bsc.es/marenostrum/marenostrum-5)).

**Power stability is paramount.** Jobs run for days or weeks; an unplanned outage can destroy weeks of compute. LUMI's facility (a converted paper mill) had only a single 2-minute outage in 38 years of operation -- that kind of grid reliability drives site selection for HPC.

### Cooling Infrastructure

All modern top-tier HPC systems use **direct liquid cooling (DLC)**:

- **LUMI**: HPE Cray EX custom rack design, fully water-cooled with Cooling Distribution Units (CDUs). Waste heat (40 degrees C water) feeds Kajaani's district heating network, recovering approximately 80% of waste heat. PUE is exceptionally low ([Granlund](https://www.granlundgroup.com/references/lumi-is-the-most-energy-efficient-and-ecological-supercomputer-in-the-world/)).
- **Frontier**: Liquid-cooled by four 350-horsepower pumps moving 6,000 gallons/minute through the system. Cooling capacity: 11,000 tons (approximately 40 MW equivalent). The entire 20,000 sq ft machine room was stripped and rebuilt -- piping, electrical, flooring -- to handle the density ([HPCwire](https://www.hpcwire.com/off-the-wire/ornl-begins-datacenter-buildout-for-new-exascale-supercomputer-frontier/), [IEEE Spectrum](https://spectrum.ieee.org/frontier-exascale-supercomputer)).
- **MareNostrum 5**: Lenovo's fifth-generation Neptune direct water-cooling technology. The facility achieves a PUE below 1.08 with a 17 MW cooling capacity against 20 MW total power ([Lenovo](https://news.lenovo.com/pressroom/press-releases/lenovo-hpc-pre-exascale-supercomputer-marenostrum-5/)).

### Networking: Dual Fabric Architecture

HPC networking is architecturally distinct from enterprise colocation. The compute fabric -- historically **InfiniBand (HDR/NDR)** and increasingly **400GbE or HPE Slingshot** -- connects compute nodes with ultra-low latency for MPI communication. Separately, a **storage fabric** connects compute to parallel file systems. This dual-fabric approach is critical because storage I/O patterns (large sequential reads, checkpoint writes) differ fundamentally from inter-node communication patterns ([Bacula Systems](https://www.baculasystems.com/blog/lustre-vs-gpfs/), [Redline Performance](https://redlineperf.com/solution/hpc-storage-networking/)).

### Parallel Storage Systems

HPC storage is dominated by two parallel file systems:

- **Lustre**: Open-source, excels at high-throughput sequential I/O. Data is striped across Object Storage Targets (OSTs) with dedicated Metadata Servers (MDS). Performs best over InfiniBand with RDMA. Tunable striping parameters match application I/O profiles. Preferred for large-scale national HPC systems.
- **GPFS/Spectrum Scale**: IBM's parallel filesystem, more adaptable to mixed workloads and standard Ethernet networks. Provides stronger multi-tenancy and management tooling. Both regularly achieve **hundreds of GB/s** in well-tuned environments.

MareNostrum 5's storage exemplifies the scale: **248 PB net capacity** (SSD/flash and HDD), with 1.2 TB/s write and 1.6 TB/s read throughput ([BSC](https://www.bsc.es/marenostrum/marenostrum-5)).

---

## 3. How Colocation Differs from Purpose-Built Facilities

### The "One Size Fits None" Problem

Standard colocation is designed for flexibility -- it must serve any tenant with any workload. This generality creates fundamental inefficiencies at both ends of the density spectrum:

- **Low-density tenants (5 kW/rack)** overpay for cooling and power infrastructure designed for higher densities. Stranded power capacity raises the operator's cost per usable kW.
- **High-density tenants (50+ kW/rack)** find that standard air-cooling, floor loading, and power distribution cannot support their requirements. Retrofitting is expensive and disruptive to neighboring tenants.

Purpose-built HPC/AI facilities sidestep this entirely. Frontier's machine room was stripped to bare concrete and rebuilt for a single workload. LUMI's facility was designed around specific CDU placements, water flow rates, and electrical topology. These facilities achieve PUE values (1.04-1.08) that multi-tenant colocation cannot match ([Datacenters.com](https://www.datacenters.com/news/ai-and-hpc-are-changing-data-center-design-are-you-ready)).

### Emerging Hybrid Models

Some operators are bridging the gap with **"flex space" designs** that accommodate both standard and high-density cabinets in the same hall. DC BLOX and Flexential, for example, market high-density colocation zones purpose-designed for AI/HPC within otherwise standard facilities ([DC BLOX](https://www.dcblox.com/data-center-services/high-density-colocation-ai-hpc/), [Flexential](https://www.flexential.com/solutions/support-high-density-deployments)). Bulk Infrastructure (Norway) has similarly positioned colocation as a viable alternative to purpose-built for HPC, arguing that colocation reduces time-to-deployment and capital risk ([Bulk Infrastructure](https://bulkinfrastructure.com/newsroom/maximizing-hpc-investment-through-data-center-colocation)).

However, operating hybrid facilities requires **different engineering teams, different sales organizations, and different operational capabilities** -- a complexity tax that many operators underestimate ([Build Inc](https://build.inc/insights/hyperscale-vs-colocation-data-center-developer-guide)).

### Infrastructure Misalignment Risk

A critical observation from the HPC/colocation intersection: too often, those scoping data center projects assume the electrical and mechanical infrastructure is already suited to purpose. In reality, upgrading existing colocation for high-density workloads typically requires reinforcing structural flooring, adding secondary cooling loops, reconfiguring whitespace, and upgrading electrical capacity -- changes that can be as disruptive as building new ([Scientific Computing World](https://www.scientific-computing.com/analysis-opinion/hpc-and-hdc-data-centre)).

---

## Summary

| Dimension | Enterprise Colocation | HPC/Research |
|---|---|---|
| Power density | 5-30 kW/rack (mixed) | 20-50 kW/rack (uniform) |
| Cooling | Air + containment; some in-row/RDHx | Direct liquid cooling (DLC) |
| Network | Carrier-neutral, diverse fiber | Dual-fabric: InfiniBand/Slingshot + storage |
| Storage | Tenant-provided | Parallel FS (Lustre/GPFS), hundreds of GB/s |
| Optimization | Generic (multi-tenant flexibility) | Workload-specific (single-purpose) |
| Compliance | SOC 2, ISO 27001, PCI DSS | Facility-specific; government/research standards |
| Typical PUE | 1.3-1.5 | 1.04-1.08 |

---

**Sources:**

- [Equinix - AI High-Performance Data Centers](https://blog.equinix.com/blog/2025/10/08/ais-engine-room-inside-the-high-performance-data-centers-powering-the-future/)
- [Equinix - Standards and Compliance](https://www.equinix.com/data-centers/design/standards-compliance)
- [Eaton Metered Outlet PDU](https://www.eaton.com/us/en-us/catalog/backup-power-ups-surge-it-power-distribution/eaton-metered-outlet-rack-pdu.html)
- [Belden - Dual Power Feeds](https://www.belden.com/blog/exploring-dual-power-feeds-in-data-centers)
- [Digital Realty - Certifications](https://www.digitalrealty.com/data-centers/design/certifications-compliance)
- [Dgtl Infra - Carrier Neutral Data Centers](https://dgtlinfra.com/carrier-neutral-data-centers/)
- [CoreSite - Compliance](https://www.coresite.com/data-center-design/compliance)
- [Green Mountain Data Centers](https://greenmountain.no/data-centers/)
- [Business Norway - Green Mountain](https://businessnorway.com/solutions/green-mountain-carbon-neutral-data-centres-have-natural-cooling)
- [CSC - LUMI Supercomputer](https://csc.fi/en/our-expertise/high-performance-computing/lumi-supercomputer/)
- [Granlund - LUMI Energy Efficiency](https://www.granlundgroup.com/references/lumi-is-the-most-energy-efficient-and-ecological-supercomputer-in-the-world/)
- [ORNL - Frontier](https://www.ornl.gov/news/frontier-supercomputer-debuts-worlds-fastest-breaking-exascale-barrier)
- [IEEE Spectrum - Frontier](https://spectrum.ieee.org/frontier-exascale-supercomputer)
- [Nature - Frontier Energy Dataset](https://www.nature.com/articles/s41597-024-03913-w)
- [BSC - MareNostrum 5](https://www.bsc.es/marenostrum/marenostrum-5)
- [Lenovo - MareNostrum 5](https://news.lenovo.com/pressroom/press-releases/lenovo-hpc-pre-exascale-supercomputer-marenostrum-5/)
- [Bacula Systems - Lustre vs GPFS](https://www.baculasystems.com/blog/lustre-vs-gpfs/)
- [Redline Performance - HPC Storage & Networking](https://redlineperf.com/solution/hpc-storage-networking/)
- [Datacenters.com - AI and HPC Design](https://www.datacenters.com/news/ai-and-hpc-are-changing-data-center-design-are-you-ready)
- [DC BLOX - High-Density Colocation](https://www.dcblox.com/data-center-services/high-density-colocation-ai-hpc/)
- [Flexential - HPC Deployments](https://www.flexential.com/solutions/support-high-density-deployments)
- [Bulk Infrastructure - HPC Colocation](https://bulkinfrastructure.com/newsroom/maximizing-hpc-investment-through-data-center-colocation)
- [Build Inc - Hyperscale vs Colocation](https://build.inc/insights/hyperscale-vs-colocation-data-center-developer-guide)
- [Scientific Computing World - HPC and HDC](https://www.scientific-computing.com/analysis-opinion/hpc-and-hdc-data-centre)
- [AI Tool Discovery - Colocation Costs 2026](https://www.aitooldiscovery.com/ai-infra/colocation-data-center-explained)
