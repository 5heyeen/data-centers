# AI Inference Workloads and Data Center Engineering Design: How Inference Diverges from Training

## 1. Inference vs. Training -- Key Engineering Differences

AI inference and training represent fundamentally different computational paradigms, and their divergence is now reshaping data center design from the ground up.

**Power density gap.** Training clusters push rack densities to extreme levels -- NVIDIA's GB200 NVL72 rack consumes roughly 130 kW per rack, and next-generation training racks are expected to reach 300+ kW ([Goldman Sachs](https://www.goldmansachs.com/insights/articles/rising-power-density-disrupts-ai-infrastructure)). Inference racks operate at a materially lower range, typically 15-40 kW per rack for most deployments, though high-end inference configurations can reach 50-80 kW. This lower density is driven by the fact that inference servers use fewer GPUs per node and often run lower-power chip models ([Tech Plus Trends](https://techplustrends.com/power-requirements-ai-data-centers/)).

**Heterogeneous hardware ecosystem.** Training is dominated by NVIDIA H100/H200/B200 GPUs with homogeneous cluster builds. Inference, by contrast, is increasingly served by a diverse mix of accelerators: NVIDIA L40S and inference-optimized GPUs, AWS Inferentia2 (which delivers 4x throughput versus general-purpose GPUs at up to 70% lower cost per inference), Intel Gaudi 3 ASICs (projecting 1.8 PFLOPS at 600W), and Google TPUs. GPUs still hold roughly 70% market share as of 2025, but custom ASICs are projected to capture 20% of dedicated inference deployments by 2030 ([HowAIWorks.ai](https://howaiworks.ai/blog/tpu-gpu-asic-ai-hardware-market-2025); [IDTechEx](https://www.idtechex.com/en/research-report/ai-chips-for-data-centers-and-cloud/1095)).

**Workload variability.** Training is a sustained, deterministic block load -- GPUs run at near-full utilization for days or weeks. Inference is stochastic and bursty: unpredictable user arrivals and heterogeneous prompt lengths produce pronounced power volatility with diurnal patterns aligned to user activity, instantaneous spikes for complex requests, and nonlinear scaling behavior. This creates challenges for power provisioning and grid integration that differ fundamentally from the steady-state draw of training ([McKinsey](https://www.mckinsey.com/industries/technology-media-and-telecommunications/our-insights/the-next-big-shifts-in-ai-workloads-and-hyperscaler-strategies); [Schneider Electric](https://blog.se.com/datacenter/2025/05/08/the-current-and-future-path-to-ai-inference-data-center-optimization/)).

**Network architecture.** Training clusters require ultra-low-latency GPU-to-GPU interconnect, making InfiniBand (1-2 microsecond latency, 800 Gb/s per port, lossless fabric) the dominant choice. Inference workloads primarily need high north-south bandwidth (server to internet/user) rather than east-west (GPU-to-GPU), making standard Ethernet with spine-leaf topology sufficient. Ethernet is also dramatically cheaper -- Juniper estimates 55% total-cost-of-ownership savings over InfiniBand across three years, including 56% OpEx and 55% CapEx savings. Ethernet is expected to surpass InfiniBand as the dominant AI networking technology by late 2025-2026 ([ARC Compute](https://www.arccompute.io/arc-blog/infiniband-vs-ethernet-choosing-the-right-network-fabric-for-ai-clusters); [WWT](https://www.wwt.com/blog/the-battle-of-ai-networking-ethernet-vs-infiniband); [DrivenNets](https://drivenets.com/blog/why-infiniband-falls-short-of-ethernet-for-ai-networking/)).

## 2. Facility Design Implications

The engineering profile of inference translates into a distinct facility archetype.

**Cooling strategy.** At 15-40 kW/rack, many inference deployments remain within the envelope of advanced air cooling or hybrid approaches. Air-cooled solutions can support up to approximately 72 kW per rack with rear-door heat exchangers, which are 30-60% more efficient than traditional air cooling alone. This means the majority of inference workloads can avoid the cost and complexity of direct liquid cooling (DLC), though facilities should be designed "liquid-ready" for future density growth. By contrast, training at 100-300 kW/rack makes liquid cooling mandatory. The hybrid approach -- air cooling for general infrastructure, with liquid cooling available for the densest racks -- is becoming the standard design pattern for inference-focused facilities ([Schneider Electric](https://blog.se.com/datacenter/2025/11/18/air-vs-liquid-cooling-finding-right-strategy-ai-ready-data-centers/); [Introl](https://introl.com/blog/liquid-vs-air-cooling-ai-data-centers); [CoreSite](https://www.coresite.com/blog/liquid-cooling-steps-up-for-high-density-racks-and-ai-workloads)).

**Power redundancy.** Inference services demand high availability (they serve real-time user requests), but the per-facility investment is lower than massive training campuses. Tier III design -- N+1 redundancy, concurrently maintainable, 99.982% uptime -- is typically sufficient for inference deployments. Training mega-campuses, where a single facility may represent hundreds of millions in GPU investment, more frequently justify Tier III+ or Tier IV redundancy to protect that capital expenditure ([Uptime Institute](https://uptimeinstitute.com/tiers); [INGENIOUS.BUILD](https://www.ingenious.build/blog-posts/data-center-tiers-explained)).

**Geographic distribution model.** This is perhaps the most consequential difference. Training concentrates in a small number of massive campuses (50-500+ MW) located wherever cheap, abundant power is available. Inference scales outward rather than upward: it requires geographic distribution near population centers to meet latency requirements. Deloitte estimates inference comprised half of all AI compute in 2025, growing to two-thirds in 2026 -- this expanding share is driving demand for distributed regional facilities of 1-10 MW rather than singular mega-campuses ([JLL 2026 Global Data Center Outlook](https://www.joneslanglasalle.com.cn/en-cn/insights/market-outlook/data-center-outlook); [Dell'Oro Group](https://www.delloro.com/2026-predictions-data-center-infrastructure/); [Deloitte](https://www.deloitte.com/us/en/insights/industry/technology/technology-media-and-telecom-predictions/2025/genai-power-consumption-creates-need-for-more-sustainable-data-centers.html)).

## 3. Edge Data Center Engineering for Inference

The latency imperative is pushing inference into edge facilities with distinct engineering constraints.

**Constrained sites and modular design.** Edge inference facilities typically range from 1-5 MW and must fit into metro-area locations -- rooftops, basements, retrofitted commercial buildings, or small dedicated plots. Prefabricated modular data centers are emerging as the primary delivery mechanism: pre-engineered units can be deployed in as little as 3 months (e.g., Crusoe Spark units), compared to 12-24 months for traditional construction, with 30% faster overall deployment timelines. Duos Edge AI deploys modular compute pods measuring 55 feet by 12.5 feet containing GPU racks ([Data Center Frontier](https://www.datacenterfrontier.com/executive-roundtable/article/33038782/roundtable-charting-the-edge-and-prefab-modular-inflection-point); [DCD on Crusoe](https://www.datacenterdynamics.com/en/news/crusoe-launches-edge-offering-with-self-made-modular-ai-data-centers/); [Intelligent Data Centres](https://www.intelligentdatacentres.com/2025/04/24/building-smarter-modular-prefabricated-data-centres-for-an-ai-focused-future-at-the-edge/)).

**Power and cooling at the edge.** Edge facilities may leverage existing building electrical infrastructure at lower total loads. Prefabricated units equipped with chilled-water and free cooling systems achieve PUE below 1.5. At 15-30 kW/rack, many edge inference deployments are comfortably air-cooled, though modular designs increasingly integrate chilled water loops and direct-to-chip liquid cooling as optional zones for higher-density racks ([Schneider Electric Blog](https://blog.se.com/datacenter/2024/09/26/solving-ai-growing-pains-edge-modular-data-centers/); [Nlyte](https://www.nlyte.com/blog/ai-at-the-edge/)).

**Security trade-offs.** Edge facilities in metro areas inherently operate with less physical security perimeter than fenced, guarded hyperscale campuses. Security design shifts toward physical hardening of the module itself (tamper-resistant enclosures, biometric access) rather than campus-level perimeter defense.

## 4. Why Inference Is More Compatible with Standardized Designs -- and Where It Is Not

Inference workloads align well with standardized, repeatable facility designs for several reasons:

- **Lower density enables air cooling**, removing the need for bespoke liquid cooling plumbing that varies by GPU generation.
- **Standard Ethernet networking** eliminates InfiniBand's cable-length constraints (copper limited to ~2 meters, fiber optics required beyond), enabling more flexible rack layouts and standard structured cabling.
- **Modular repeatability** works because inference hardware configurations are more standardized across sites than training clusters, which are often custom-designed around specific GPU/networking generations.
- **Smaller facility footprint** makes prefabricated and containerized solutions viable, enabling factory-built quality control and faster deployment.

**However, inference is not simply "traditional enterprise colo."** Even at 15-40 kW/rack, inference densities are 2-5x higher than legacy enterprise colocation (typically 5-8 kW/rack). Facilities need upgraded power distribution (busway over traditional whip-and-receptacle), enhanced cooling capacity, and electrical infrastructure designed for the bursty, variable load profile rather than steady-state draw. The CBRE 2025 outlook notes growing demand for "Edge data centers with relatively easy-to-secure power capacity of up to 10MW" -- a facility class that sits distinctly between traditional edge micro-DCs and hyperscale campuses ([Azura Consultancy](https://www.azuraconsultancy.com/edge-data-centers/); [Netrality](https://netrality.com/blog/high-density-colocation-ai-gpu-infrastructure/)).

**The bottom line:** inference is emerging as the volume workload of the AI era -- Schneider Electric and McKinsey both project it will account for 75%+ of AI energy demand by 2030. Its engineering requirements favor distributed networks of smaller, standardized, rapidly deployable facilities rather than monolithic training campuses. For data center operators, this represents a fundamentally different buildout strategy: more sites, smaller scale per site, standard designs, Ethernet networking, air or hybrid cooling, and Tier III redundancy -- but at power densities that still require meaningful adaptation from traditional colocation infrastructure.

---

**Sources:**

- [Goldman Sachs - Rising Power Density Disrupts AI Infrastructure](https://www.goldmansachs.com/insights/articles/rising-power-density-disrupts-ai-infrastructure)
- [Tech Plus Trends - Power Requirements for AI Data Centers (2026)](https://techplustrends.com/power-requirements-ai-data-centers/)
- [McKinsey - The Next Big Shifts in AI Workloads](https://www.mckinsey.com/industries/technology-media-and-telecommunications/our-insights/the-next-big-shifts-in-ai-workloads-and-hyperscaler-strategies)
- [HowAIWorks.ai - TPUs vs GPUs vs ASICs: AI Hardware Guide 2025](https://howaiworks.ai/blog/tpu-gpu-asic-ai-hardware-market-2025)
- [IDTechEx - AI Chips for Data Centers and Cloud 2025-2035](https://www.idtechex.com/en/research-report/ai-chips-for-data-centers-and-cloud/1095)
- [ARC Compute - InfiniBand vs Ethernet for AI Clusters](https://www.arccompute.io/arc-blog/infiniband-vs-ethernet-choosing-the-right-network-fabric-for-ai-clusters)
- [WWT - The Battle of AI Networking: Ethernet vs InfiniBand](https://www.wwt.com/blog/the-battle-of-ai-networking-ethernet-vs-infiniband)
- [DrivenNets - Why Ethernet Fits AI Networking Needs](https://drivenets.com/blog/why-infiniband-falls-short-of-ethernet-for-ai-networking/)
- [Schneider Electric - Air vs Liquid Cooling for AI Data Centers](https://blog.se.com/datacenter/2025/11/18/air-vs-liquid-cooling-finding-right-strategy-ai-ready-data-centers/)
- [Introl - Liquid Cooling vs Air Cooling for AI Data Centers](https://introl.com/blog/liquid-vs-air-cooling-ai-data-centers)
- [CoreSite - Liquid Cooling for High-Density Racks](https://www.coresite.com/blog/liquid-cooling-steps-up-for-high-density-racks-and-ai-workloads)
- [Uptime Institute - Tier Classification System](https://uptimeinstitute.com/tiers)
- [JLL - 2026 Global Data Center Outlook](https://www.joneslanglasalle.com.cn/en-cn/insights/market-outlook/data-center-outlook)
- [Dell'Oro Group - Data Center Infrastructure in 2026](https://www.delloro.com/2026-predictions-data-center-infrastructure/)
- [Deloitte - GenAI Power Consumption and Sustainable Data Centers](https://www.deloitte.com/us/en/insights/industry/technology/technology-media-and-telecom-predictions/2025/genai-power-consumption-creates-need-for-more-sustainable-data-centers.html)
- [Data Center Frontier - Edge and Prefab Modular Roundtable](https://www.datacenterfrontier.com/executive-roundtable/article/33038782/roundtable-charting-the-edge-and-prefab-modular-inflection-point)
- [DCD - Crusoe Launches Edge Modular AI Data Centers](https://www.datacenterdynamics.com/en/news/crusoe-launches-edge-offering-with-self-made-modular-ai-data-centers/)
- [Intelligent Data Centres - Modular Prefabricated Data Centres for AI at the Edge](https://www.intelligentdatacentres.com/2025/04/24/building-smarter-modular-prefabricated-data-centres-for-an-ai-focused-future-at-the-edge/)
- [Schneider Electric - Solving AI Growing Pains at the Edge](https://blog.se.com/datacenter/2024/09/26/solving-ai-growing-pains-edge-modular-data-centers/)
- [Netrality - High-Density Colocation for AI and GPU Workloads](https://netrality.com/blog/high-density-colocation-ai-gpu-infrastructure/)
- [Azura Consultancy - Edge Data Centers 2025](https://www.azuraconsultancy.com/edge-data-centers/)
- [Netrality - Edge Data Centers Complete Guide 2025](https://netrality.com/blog/edge-data-centers-complete-guide/)
