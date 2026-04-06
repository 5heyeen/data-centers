# Compute Hardware & Data Center Engineering Design: NVIDIA GPU vs Google TPU vs Custom ASICs

## 1. NVIDIA GPU Systems

### DGX H100 (Hopper Generation)

The DGX H100 system packs 8x H100 GPUs and draws approximately **10-11 kW per node** under full load. NVIDIA recommends a maximum rack density of **4 systems per rack**, yielding **40-45 kW per rack** in the air-cooled configuration. Rack densities above four nodes are explicitly discouraged due to thermodynamic limits of air cooling at that density. Liquid-cooled variants of the HGX H100 platform reduce total data center cooling energy by roughly 86% compared to air cooling, and enable higher rack densities approaching 60-70 kW per rack. ([NVIDIA DGX SuperPOD Design Guide](https://docs.nvidia.com/dgx-superpod/design-guides/dgx-superpod-data-center-design-h100/latest/electrical.html), [IntuitionLabs HGX Requirements Guide](https://intuitionlabs.ai/articles/nvidia-hgx-data-center-requirements))

### DGX GB200 / GB200 NVL72 (Blackwell Generation)

The GB200 NVL72 represents a fundamental shift to **mandatory liquid cooling** at rack scale. Key specifications:

- **Power:** ~120 kW per rack (each compute tray draws 5.4-5.7 kW; 18 trays per rack). Individual B200 GPUs draw up to 1,200W each.
- **Physical dimensions:** 600mm wide x 1,068mm deep x 2,236mm high — wider and deeper than standard 19" racks.
- **Weight:** 1,360 kg (3,000 lbs) per rack.
- **Cooling:** Coolant enters at 25 degrees C at 2 liters per second, exits 20 degrees C warmer. Cold plates on CPUs and GPUs are fed by rack manifolds. Networking and storage components remain air-cooled with internal fans.
- **NVLink Domain:** 72 Blackwell GPUs interconnected via 9 NVLink Switch trays (each with 2 NVLink chips, 144 ports at 100 GB/s per port). This entire 72-GPU domain acts as a **single logical GPU**, meaning the rack is the atomic scheduling unit — you cannot split an NVL72 across racks.

The successor **GB300 NVL72** (announced GTC 2025) increases per-GPU power to 1.4 kW with 288GB HBM3e and 50% greater performance. Looking further ahead, the **Vera Rubin NVL144** (H2 2026) targets 144 GPUs per rack in two power profiles: 190 kW (Max Q) and 230 kW (Max P), with a fully fanless, cableless compute tray design. ([The Register - GB200 NVL72](https://www.theregister.com/2024/03/21/nvidia_dgx_gb200_nvk72/), [NVIDIA GB200 NVL72](https://www.nvidia.com/en-us/data-center/gb200-nvl72/), [Introl - Vera Rubin](https://introl.com/blog/nvidia-vera-rubin-gpu-600kw-racks-2027), [ServeTheHome - CES 2026](https://www.servethehome.com/nvidia-launches-next-generation-rubin-ai-compute-platform-at-ces-2026/))

### InfiniBand Networking Constraints

NVIDIA's InfiniBand NDR/XDR fabric imposes strict physical layout requirements:

- **Copper DAC cables:** Used within or between adjacent racks, effective at **3 meters or less**. Approximately 70% of GPU-to-ToR connections in typical deployments use DAC.
- **Active Optical Cables (AOC):** Used for cross-aisle connections where DAC cannot reach, up to ~30m for standard runs.
- **Single-mode fiber transceivers:** NL-type OSFP for up to 30m, NS-type for up to 100m.
- **Cable routing:** NVIDIA mandates 50/50 left-right cable splits per switch to balance the massive cable volume and preserve rack serviceability.
- **Switch density:** The QM9700 NDR switch fits 64 connections into 1U using dual-port OSFP connectors with finned thermal management.

These cable length constraints directly dictate rack placement geometry: compute racks must be within 3m of their ToR switches for copper, and spine switches must be within 100m for the entire fabric. This constrains row length, aisle width, and the physical footprint of a SuperPOD. ([NVIDIA Cabling Design Guide](https://docs.nvidia.com/dgx-superpod/design-guide-cabling-data-centers/latest/considerations.html), [NVIDIA Interconnect Cabling Requirements](https://docs.nvidia.com/networking/display/INTRCNCTCABREQNDR400ETH))

### Power Draw Profile

GPU training workloads are distinctively **bursty**. According to the Uptime Institute, power can swing from 30-40% of rated load to 150% in milliseconds, hold for 10-20 milliseconds, then drop back. In worst cases, system-level power can **double almost instantaneously**. This behavior strains UPS systems: load fluctuations can exceed a UPS's ability to condition power using internal capacitance alone, forcing it to draw on stored energy reserves. Mitigation strategies include oversizing branch circuits, distributing GPUs across racks to prevent localized hotspots, setting power caps via nvidia-smi, and using modular lithium-ion UPS systems with higher energy density. ([Uptime Institute - AI Power Fluctuations](https://journal.uptimeinstitute.com/ai-power-fluctuations-strain-both-budgets-and-hardware/), [Uptime Institute - Electrical Considerations](https://journal.uptimeinstitute.com/electrical-considerations-with-large-ai-compute/))

---

## 2. Google TPU Systems

### TPU v6e (Trillium)

Google's sixth-generation TPU delivers 4.7x peak compute over TPU v5e with doubled HBM capacity and bandwidth, and doubled Inter-Chip Interconnect (ICI) bandwidth. It is **67% more energy-efficient** than v5e through advanced process nodes and aggressive power gating. Trillium scales to **256 TPUs per pod**, with pods interconnectable via Google's 13 Pb/s Jupiter network fabric to form building-scale supercomputers with tens of thousands of chips. ([Google Cloud Blog - Trillium](https://cloud.google.com/blog/products/compute/introducing-trillium-6th-gen-tpus))

### TPU v7 (Ironwood) — 2025

Ironwood is Google's most powerful TPU to date:

- **Per-chip:** 4,614 FP8 TFLOPS, 192 GB HBM3e, 7.37 TB/s memory bandwidth.
- **Pod scale:** Up to **9,216 chips** in a single pod, delivering 42.5 FP8 ExaFLOPS with 1.77 PB of shared HBM.
- **Power:** ~10 MW for a full 9,216-chip superpod — roughly **1.1 kW per chip**.
- **Cooling:** Third-generation liquid cooling with board-level cold plates, rack-level manifolds, and blind-mate quick connects aligned with OCP ORv3 standards.

([Google Cloud - TPU7x Documentation](https://docs.cloud.google.com/tpu/docs/tpu7x), [Google Blog - Ironwood](https://blog.google/innovation-and-ai/infrastructure-and-cloud/google-cloud/ironwood-tpu-age-of-inference/), [Tom's Hardware - Ironwood](https://www.tomshardware.com/tech-industry/artificial-intelligence/google-deploys-new-axion-cpus-and-seventh-gen-ironwood-tpu-training-and-inferencing-pods-beat-nvidia-gb300-and-shape-ai-hypercomputer-model))

### Custom Infrastructure

Google's facility design diverges significantly from industry standards in several ways:

- **Power distribution:** Google is moving from 48 VDC to **plus/minus 400 VDC**, enabling racks to scale from 100 kW to 1 MW. This leverages EV supply chain economics for power components. Battery backup and power conditioning sit **outside** the IT rack.
- **Networking:** Google's Jupiter AI fabric uses **fully proprietary whitebox switches** (manufactured by Celestica to Google's designs, running Google's own NOS). This is not merchant Ethernet or InfiniBand — it is a custom ICI (Inter-Chip Interconnect) that requires specific cabling and topology.
- **Rack design:** While Ironwood's liquid cooling aligns with OCP ORv3 mechanical standards, the overall system integration (power shelves, networking, software stack) remains Google-proprietary.
- **OCP collaboration:** Google is working with Meta and Microsoft on the "Mt. Diablo" project to standardize electrical and mechanical interfaces, but this is still in draft specification phase.

([Google Cloud Blog - OCP EMEA](https://cloud.google.com/blog/topics/systems/enabling-1-mw-it-racks-and-liquid-cooling-at-ocp-emea-summit), [Google Cloud Blog - Ironwood Stack](https://cloud.google.com/blog/products/compute/inside-the-ironwood-tpu-codesigned-ai-stack), [Hot Chips 2025 - TPU Rack Overview](https://hc2025.hotchips.org/assets/program/tutorials/HC2025.T1DCRacks.S7.Pankaj.pdf))

---

## 3. Other Accelerators

### AMD Instinct MI350 / MI355X (2025)

AMD's MI350 series offers a competitive alternative with more deployment flexibility:

- **Memory:** 288 GB HBM3e, up to 8 TB/s bandwidth.
- **Rack configurations:** Up to **64 GPUs air-cooled** or **128 GPUs liquid-cooled** per rack (up to 2.6 ExaFLOPS FP4/FP6 per liquid-cooled rack).
- **Form factors:** 8U air-cooled trays (8x MI350X) and 4U liquid-cooled trays (8x MI355X).
- **Key differentiator:** AMD continues to offer both air- and liquid-cooled options, supporting enterprise environments that cannot retrofit for liquid cooling.
- **Future (2026):** The MI400 series with "Helios" rack-scale architecture will connect 72 GPUs via **UALink** (Ultra Accelerator Link), an open standard alternative to NVLink, with up to 432 GB HBM4 per GPU.

([AMD Blog - Rack Scale AI](https://www.amd.com/en/blogs/2025/amd-delivering-open-rack-scale-ai-infrastructure-to-unlock-agentic-ai.html), [AMAX - MI350 Support](https://www.amax.com/amax-announces-support-for-amd-instinct-mi350-series-across-new-rackscale-and-server-platforms/), [SiliconANGLE - MI350 Launch](https://siliconangle.com/2025/06/12/amd-debuts-new-flagship-mi350-data-center-graphics-cards-185b-transistors/))

### Amazon Trainium2/Trainium3

AWS designs its custom silicon for tight integration with its own facility infrastructure:

- **Trainium2:** Nearly 500,000 chips deployed across 30 data centers on a 1,200-acre Indiana site (Project Rainier), with Anthropic targeting over 1 million chips by end of 2025.
- **Trainium3:** Delivers 4x better performance/watt than Trainium2 and **5x more output tokens per megawatt** at equivalent latency. 40% more performance per watt.
- **Facility co-design:** AWS has developed a new power shelf for 6x rack power density increases, plus cooling system improvements that reduce mechanical energy consumption by **46%** and embodied carbon in concrete by 35%.
- **Availability:** Trainium3 UltraServers became generally available in late 2025.

([Data Centre Magazine - Trainium2](https://datacentremagazine.com/news/aws-how-500-000-trainium2-chips-power-project-rainier), [Data Centre Magazine - Trainium3](https://datacentremagazine.com/news/trainium3-new-aws-chip-promises-4x-performance-boost), [DCD - Trainium3 GA](https://www.datacenterdynamics.com/en/news/aws-makes-trainium3-ultraservers-generally-available/))

### Microsoft Maia 100

Microsoft's first custom AI accelerator exemplifies the chip-to-facility co-design approach:

- **Chip:** ~820mm2 on TSMC N5 with CoWoS-S, 64 GB HBM2e, 1.8 TB/s bandwidth.
- **Custom racks:** Microsoft designed wider-than-standard racks from scratch to accommodate Maia 100 server boards, with expanded space for power and networking cabling.
- **Cooling ("Sidekick"):** A companion unit sits beside each Maia rack, circulating liquid through cold plates attached to chip surfaces — functioning like a car radiator. No large centralized chillers required.
- **Future:** Microsoft is prototyping in-chip microfluidic cooling (partnership with Corintis) that embeds microchannel coolant pathways directly into the silicon package.

([Microsoft Source](https://news.microsoft.com/source/features/ai/in-house-chips-silicon-to-service-to-meet-ai-demand/), [Azure Blog - Maia](https://azure.microsoft.com/en-us/blog/azure-maia-for-the-era-of-ai-from-silicon-to-software-to-systems/), [Data Center Frontier](https://www.datacenterfrontier.com/machine-learning/article/33015123/microsoft-unveils-custom-designed-data-center-ai-chips-racks-and-liquid-cooling))

---

## 4. Engineering Design Implications by Hardware Type

### Power Profile: Steady-State vs Bursty

| Characteristic | NVIDIA GPU Training | Google TPU | Inference Workloads |
|---|---|---|---|
| Load variability | 30-150% swings in milliseconds | More stable (Google controls scheduling) | Generally steadier but model-dependent |
| UPS impact | Must overprovision or use Li-ion with fast response | Internal to Google's custom power | Varies by provider |
| Generator sizing | Size to peak, not average | N/A (captive facilities) | Can size closer to average |

Bursty GPU loads force operators to either overprovision UPS capacity (expensive) or accept that the UPS will periodically dip into stored energy. Software power capping (nvidia-smi) trades peak performance for electrical stability. ([Uptime Institute - AI Power Fluctuations](https://journal.uptimeinstitute.com/ai-power-fluctuations-strain-both-budgets-and-hardware/))

### Floor Loading and Structural Requirements

High-density AI racks impose severe structural demands:

- A fully loaded 100 kW rack weighs **6,000-8,000 lbs (2,700-3,600 kg)** concentrated in approximately 10 square feet.
- Standard raised floors rated at 250 PSF **cannot support** these loads.
- Reinforced concrete slabs must increase from the traditional 6-8 inches to **12-18 inches**, with post-tensioned concrete and epoxy-coated rebar to handle 1,000+ PSF.
- CDU (Coolant Distribution Unit) weight when flooded reaches **3 tons**, requiring 800 kg/m2 floor capacity.
- Structural steel platforms can spread loads across 40 square feet to reduce point loading, at a cost of **$50,000-100,000 per rack** in structural upgrades.

([Introl - High Density Racks](https://introl.com/blog/high-density-racks-100kw-ai-data-center-ocp-2025), [Introl - Extreme Density](https://introl.com/blog/extreme-density-infrastructure-40-250kw-rack))

### Form Factor Comparison

| Platform | Rack Standard | Width | Cooling | Deployable in Colo? |
|---|---|---|---|---|
| NVIDIA GB200 NVL72 | OCP-compatible, contributed designs | 600mm (wider than 19") | Mandatory liquid | Yes, with facility upgrades |
| Google Ironwood | OCP ORv3 cooling, proprietary power/network | Custom | Mandatory liquid | No (Google-only) |
| AMD MI350 | Standard 19" OCP | Standard | Air or liquid | Yes |
| Microsoft Maia | Custom (wider than standard) | Custom | Liquid (Sidekick) | No (Azure-only) |
| AWS Trainium | Custom | Custom | Liquid | No (AWS-only) |

### Networking Topology as Physical Constraint

The choice of interconnect fabric directly shapes the data hall:

- **InfiniBand (NVIDIA):** Spine-leaf topology with strict cable length budgets. Copper DAC under 3m forces compute and ToR switches into adjacent racks. Fiber up to 100m for spine connections sets maximum row length. Cable volume is enormous and must be carefully routed with 50/50 left-right splits.
- **Google ICI:** Custom 3D torus/mesh topology requiring specific chip adjacency within pods. The 9,216-chip Ironwood pod demands precise physical arrangement of hundreds of racks.
- **UALink (AMD future):** Open-standard chip-to-chip interconnect positioning AMD as an alternative to NVLink lock-in, though at smaller initial scale (72 GPUs).
- **Ethernet (emerging):** Ultra Ethernet Consortium pushing 800G Ethernet as an InfiniBand alternative with longer reach and standard cabling, though with higher latency.

---

## 5. How Hardware Choice Locks Facility Design

The compute hardware decision creates a spectrum of facility commitment:

**Most portable — AMD MI350:** Standard 19" OCP racks, air- or liquid-cooled options, Ethernet or InfiniBand networking. Can deploy in existing colocation facilities with modest electrical upgrades. The upcoming UALink interconnect further reduces vendor lock-in.

**Portable with constraints — NVIDIA GB200/GB300:** OCP-contributed designs enable multi-vendor rack sourcing, but NVL72 mandates liquid cooling, wider racks, reinforced floors, and InfiniBand fabric with precise rack geometry. Deployable in purpose-upgraded colocation but requires significant facility investment. The NVLink domain means the 72-GPU rack is an indivisible unit — facility planners must account for this granularity.

**Captive to cloud provider — AWS Trainium, Microsoft Maia:** Custom silicon co-designed with proprietary facility infrastructure (custom racks, power shelves, cooling systems). Only deployable in the hyperscaler's own facilities. The benefit is extreme optimization — AWS achieves 46% mechanical energy reduction through co-design — but there is zero portability.

**Fully proprietary — Google TPU:** The most vertically integrated stack. Custom chips, custom racks, custom networking (Jupiter fabric with proprietary switches), custom power distribution (400 VDC). While Google is contributing some mechanical standards to OCP, the full system can only run in Google-designed and Google-operated facilities. A 9,216-chip Ironwood pod consuming 10 MW is not something that can be deployed in a third-party data center.

The practical implication for facility designers: an NVIDIA-centric design offers the widest tenant base and future flexibility, while Google/AWS/Microsoft custom silicon requires purpose-built, single-tenant facilities with bespoke power and cooling infrastructure that cannot easily be repurposed.

---

## Sources

- [NVIDIA GB200 NVL72](https://www.nvidia.com/en-us/data-center/gb200-nvl72/)
- [NVIDIA DGX GB200 Hardware Guide](https://docs.nvidia.com/dgx/dgxgb200-user-guide/hardware.html)
- [The Register - DGX GB200 NVL72](https://www.theregister.com/2024/03/21/nvidia_dgx_gb200_nvk72/)
- [NVIDIA Cabling Design Guide](https://docs.nvidia.com/dgx-superpod/design-guide-cabling-data-centers/latest/considerations.html)
- [NVIDIA Interconnect Cabling Requirements](https://docs.nvidia.com/networking/display/INTRCNCTCABREQNDR400ETH)
- [NVIDIA DGX SuperPOD H100 Design Guide](https://docs.nvidia.com/dgx-superpod/design-guides/dgx-superpod-data-center-design-h100/latest/electrical.html)
- [Google Cloud Blog - Trillium TPU](https://cloud.google.com/blog/products/compute/introducing-trillium-6th-gen-tpus)
- [Google Cloud - TPU7x Ironwood Documentation](https://docs.cloud.google.com/tpu/docs/tpu7x)
- [Google Blog - Ironwood Announcement](https://blog.google/innovation-and-ai/infrastructure-and-cloud/google-cloud/ironwood-tpu-age-of-inference/)
- [Google Cloud Blog - OCP EMEA 1MW Racks](https://cloud.google.com/blog/topics/systems/enabling-1-mw-it-racks-and-liquid-cooling-at-ocp-emea-summit)
- [Google Cloud Blog - Ironwood Codesigned Stack](https://cloud.google.com/blog/products/compute/inside-the-ironwood-tpu-codesigned-ai-stack)
- [AMD Blog - Rack Scale AI Infrastructure](https://www.amd.com/en/blogs/2025/amd-delivering-open-rack-scale-ai-infrastructure-to-unlock-agentic-ai.html)
- [AMAX - AMD MI350 Support](https://www.amax.com/amax-announces-support-for-amd-instinct-mi350-series-across-new-rackscale-and-server-platforms/)
- [SiliconANGLE - AMD MI350](https://siliconangle.com/2025/06/12/amd-debuts-new-flagship-mi350-data-center-graphics-cards-185b-transistors/)
- [Data Centre Magazine - AWS Trainium2 Project Rainier](https://datacentremagazine.com/news/aws-how-500-000-trainium2-chips-power-project-rainier)
- [Data Centre Magazine - AWS Trainium3](https://datacentremagazine.com/news/trainium3-new-aws-chip-promises-4x-performance-boost)
- [DCD - Trainium3 UltraServers GA](https://www.datacenterdynamics.com/en/news/aws-makes-trainium3-ultraservers-generally-available/)
- [Microsoft Source - Custom Chips](https://news.microsoft.com/source/features/ai/in-house-chips-silicon-to-service-to-meet-ai-demand/)
- [Azure Blog - Maia](https://azure.microsoft.com/en-us/blog/azure-maia-for-the-era-of-ai-from-silicon-to-software-to-systems/)
- [Data Center Frontier - Microsoft Custom Chips and Racks](https://www.datacenterfrontier.com/machine-learning/article/33015123/microsoft-unveils-custom-designed-data-center-ai-chips-racks-and-liquid-cooling)
- [Uptime Institute - AI Power Fluctuations](https://journal.uptimeinstitute.com/ai-power-fluctuations-strain-both-budgets-and-hardware/)
- [Uptime Institute - Electrical Considerations](https://journal.uptimeinstitute.com/electrical-considerations-with-large-ai-compute/)
- [Introl - High Density Racks 100kW+](https://introl.com/blog/high-density-racks-100kw-ai-data-center-ocp-2025)
- [Introl - Extreme Density 40-250kW](https://introl.com/blog/extreme-density-infrastructure-40-250kw-rack)
- [Introl - NVIDIA Vera Rubin 600kW](https://introl.com/blog/nvidia-vera-rubin-gpu-600kw-racks-2027)
- [ServeTheHome - Vera Rubin CES 2026](https://www.servethehome.com/nvidia-launches-next-generation-rubin-ai-compute-platform-at-ces-2026/)
- [Tom's Hardware - Vera Rubin Platform](https://www.tomshardware.com/pc-components/gpus/nvidias-vera-rubin-platform-in-depth-inside-nvidias-most-complex-ai-and-hpc-platform-to-date)
- [IntuitionLabs - HGX Platform Requirements](https://intuitionlabs.ai/articles/nvidia-hgx-data-center-requirements)
- [Tom's Hardware - Google Ironwood](https://www.tomshardware.com/tech-industry/artificial-intelligence/google-deploys-new-axion-cpus-and-seventh-gen-ironwood-tpu-training-and-inferencing-pods-beat-nvidia-gb300-and-shape-ai-hypercomputer-model)
- [Hot Chips 2025 - TPU Rack Overview](https://hc2025.hotchips.org/assets/program/tutorials/HC2025.T1DCRacks.S7.Pankaj.pdf)
