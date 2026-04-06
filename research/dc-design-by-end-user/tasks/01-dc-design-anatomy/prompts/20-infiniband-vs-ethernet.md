# Prompt 20: infiniband-vs-ethernet

> **Prompt:** [See prompt chain for full text]

---

# Network Fabric Choices and Physical Cabling Infrastructure in Large-Scale GPU Clusters

## Overview

The choice of network fabric fundamentally shapes the physical infrastructure of a data center — from rack placement and row spacing to overhead tray capacity and total cable mass. For a 1,000-rack GPU cluster, these decisions have enormous cost and operational consequences.

---

## Fabric Comparison: Key Physical Parameters

### InfiniBand (HDR / NDR / XDR)

InfiniBand remains the dominant interconnect for HPC and AI training clusters due to its low latency and high bandwidth.

| Generation | Speed | Connector | Copper DAC Max | AOC Max | Fiber per Link |
|------------|-------|-----------|----------------|---------|----------------|
| HDR | 200 Gbps | QSFP56 | ~3 m | ~100 m | 4 fibers (MMF) or 2 (SMF) |
| NDR | 400 Gbps | OSFP / QSFP112 | ~2.5 m | ~100 m | 4–8 fibers (MPO-12) |
| XDR | 800 Gbps | OSFP-XD | ~2 m | ~100 m (expected) | 8–16 fibers |

**Key constraint:** The short copper DAC reach (2–3 m) means that leaf switches must be co-located within or immediately adjacent to compute racks. Spine switches connecting to leaf switches across the cluster require active optical cables (AOCs) or standard fiber patch cords. NVIDIA's fat-tree topologies (used with Quantum-2 NDR and Quantum-3 XDR switches) typically require every GPU node to have multiple uplinks — an NDR-based DGX SuperPOD with 32 nodes per rack can require 8+ cables per node to the leaf, and then multiple leaf-to-spine links, resulting in thousands of cables per pod.

**Copper DAC cables** weigh roughly 30–60 g/m for passive QSFP types, while **AOCs** are lighter per meter but require more careful bend radius management. For longer runs to spine switches, **MPO/MTP fiber trunk cables** (typically 12 or 24 fibers per trunk) are used, each weighing approximately 30–50 g/m for standard indoor plenum-rated cables.

### Ethernet (400GbE / 800GbE)

Ethernet offers more flexibility in topology design and longer reach options:

| Standard | Speed | Connector | Copper Max | SR Optics | DR/FR Optics | Fiber per Link |
|----------|-------|-----------|------------|-----------|---------------|----------------|
| 400GbE | 400 Gbps | QSFP-DD / OSFP | ~3 m (DAC) | ~100 m (SR8, MMF) | 500 m–2 km (DR4/FR4, SMF) | 4–8 fibers |
| 800GbE | 800 Gbps | OSFP | ~2.5 m | ~100 m (SR8) | 500 m–2 km (DR8) | 8–16 fibers |

**Advantage:** Ethernet's longer-reach optics (DR4 at 500 m, FR4 at 2 km over single-mode fiber) allow spine switches to be centralized in a dedicated aggregation room, reducing the need for distributed spine placement. This provides more architectural flexibility but still requires massive fiber counts for the leaf-spine interconnections. The CLOS-based topologies common in Ethernet fabrics (popularized by hyperscalers) tend to have slightly lower cable counts per node than fat-tree InfiniBand but more aggregation-layer links.

### NVIDIA NVLink / NVSwitch

NVLink is strictly **intra-node** (within a server chassis or baseboard):

- **NVLink 4.0 (Hopper):** 900 GB/s total per GPU, copper traces on PCB or short copper cables within the chassis
- **NVLink 5.0 (Blackwell):** 1.8 TB/s per GPU, NVLink Switch connecting up to 576 GPUs in the GB200 NVL72 configurations using copper cables within a rack-scale enclosure

NVLink does not affect inter-rack cabling directly, but the NVL72 architecture consolidates more GPUs per rack, changing the ratio of compute racks to network racks and potentially reducing total inter-rack cable count at the cost of higher per-rack power and cooling density.

### Ultra Ethernet Consortium (UEC)

The UEC, founded in 2023 with members including AMD, Broadcom, Cisco, Intel, Meta, and Microsoft, is developing enhancements to Ethernet for AI/HPC workloads — specifically targeting lower tail latency, improved congestion control, and multipath transport. The physical layer is expected to reuse standard Ethernet optics and connectors (OSFP, QSFP-DD), so the cabling infrastructure impact is primarily through more efficient bandwidth utilization rather than new physical media. UEC 1.0 specifications were targeted for 2024–2025, with products expected to follow.

---

## Quantifying the 1,000-Rack GPU Cluster

Consider a reference cluster: **1,000 racks, each containing GPU nodes interconnected via a two-tier (leaf-spine) fat-tree fabric at NDR 400 Gbps InfiniBand.**

### Cable Count Estimation

- **Per rack:** ~32 GPU nodes × 8 NDR ports per node = 256 cables to leaf switches (mix of intra-rack DAC and inter-rack AOC/fiber)
- **Leaf-to-spine uplinks:** Each leaf switch typically has a 1:1 or 2:1 oversubscription ratio. With ~2,000 leaf switches across the cluster, and 32+ uplinks per leaf to spine switches, that yields **~64,000 leaf-to-spine fiber links**
- **Total fiber strands:** Each link using MPO-12 connectivity = 12 fibers. At 64,000 links, that is approximately **768,000 fiber terminations**, or roughly **100,000–150,000 discrete fiber strands** when using trunk cables with MPO breakouts
- **Intra-rack copper DAC:** ~256,000 DAC cables (short, within-rack)

### Cable Mass

| Cable Type | Quantity (est.) | Weight per Cable | Subtotal |
|------------|----------------|------------------|----------|
| Copper DAC (1–3 m) | ~250,000 | ~100–200 g each | 25–50 tonnes |
| AOC (5–30 m) | ~30,000 | ~150–500 g each | 5–15 tonnes |
| Fiber trunk (10–50 m) | ~15,000 | ~200–1,000 g each | 3–15 tonnes |
| **Total estimated** | | | **~30–80 tonnes** |

A more conservative, well-optimized design might achieve **10–20 tonnes** of total cabling by minimizing copper DAC lengths and using high-density fiber trunks. NVIDIA's published reference architectures for SuperPOD clusters suggest cable weights in the **tens of tonnes** range for clusters of this scale, depending on the topology and oversubscription ratio chosen.

### Overhead Tray and Pathway Requirements

- **Tray capacity:** Standard cable trays (e.g., 600 mm wide ladder rack) support roughly 50–100 kg per linear meter. A 1,000-rack cluster spanning a 5,000+ sq. m hall may need **500+ linear meters** of overhead cable tray at full loading
- **Tray fill ratio:** Best practice limits tray fill to 40–50% for airflow, maintenance access, and future additions
- **Volume:** Fiber trunk cables are roughly 10–15 mm diameter each. 500 trunks in a single pathway occupy a cross-section of approximately 0.03–0.05 m², requiring multiple parallel tray runs

---

## How Fabric Choice Forces Physical Layout Decisions

### Rack Placement and Row Spacing

1. **InfiniBand's short copper reach (2–3 m)** forces leaf switches into the same rack or immediately adjacent racks. This creates a "pod" structure where compute and network racks must be tightly grouped, typically in clusters of 16–32 racks with spine switches no more than 30–50 m away. Row spacing must accommodate the overhead cable pathway between pods.

2. **Ethernet's longer-reach optics** (DR4 at 500 m) permit centralized spine placement in a "meet-me" room or aggregation zone, enabling more flexible row layouts and allowing compute halls to be separated from network aggregation infrastructure.

3. **Cable bend radius** requirements (particularly for fiber — minimum 10× cable diameter for standard SMF) affect how tightly rows can be spaced and how overhead trays route between rows. Typical row spacing in GPU clusters is **1.2–1.5 m cold aisle, 1.0–1.2 m hot aisle**, but heavy cabling overhead may push this to **1.5–2.0 m** to accommodate tray width and maintenance access.

### Key Design Tradeoffs

| Factor | InfiniBand | Ethernet |
|--------|-----------|----------|
| Topology flexibility | Constrained by short copper reach | More flexible due to longer optics |
| Spine placement | Distributed (within pods) | Centralized or distributed |
| Cable density per rack | Higher (more ports per node) | Moderate |
| Total cable mass | Higher (more copper DAC) | Lower (more fiber, less copper) |
| Operational complexity | Proprietary management (NVIDIA UFM) | Standards-based, multi-vendor |
| Row spacing pressure | Higher (dense cabling) | Moderate |

---

## Summary

For a 1,000-rack GPU cluster, the network fabric choice is not merely a networking decision — it is a **structural and civil engineering decision**. InfiniBand's superior per-link performance comes at the cost of constrained physical layouts, higher cable mass (potentially 30+ tonnes when copper DAC dominates), and denser overhead tray requirements. Ethernet provides more architectural freedom but may require more total links to achieve equivalent bisection bandwidth. In either case, total fiber counts routinely exceed 100,000 strands, and cable management infrastructure (trays, pathways, containment) becomes a significant fraction of the facility's construction cost and ongoing operational burden. These realities must be addressed early in the design phase — retrofitting cable pathways after construction is extremely costly and disruptive.

---
*Executed: 2026-04-03 | Mode: independent*
