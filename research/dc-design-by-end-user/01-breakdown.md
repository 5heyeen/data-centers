# Research Breakdown

## Scope
What exactly needs to be designed in a data center, and how do those designs change depending on the end user? What is it about end-user requirements that dictates engineering design? All from an engineering perspective.

## Subtasks

### 1. DC Design Anatomy
What exactly gets designed in a data center? Map all engineering/design domains (power architecture, cooling, structural/civil, network/cabling, fire suppression, physical security, redundancy topology, controls/BMS).

### 2. Cooling Architecture Deep Dive
Air vs liquid (direct-to-chip, rear-door, immersion) — engineering tradeoffs, piping, CDU placement, heat rejection, PUE impact, retrofit complexity. Impact on facility layout and MEP design.

### 3. Compute Hardware & Engineering Impact
How NVIDIA GPUs vs Google TPUs vs custom ASICs (Trainium, Inferentia, etc.) impose different power, thermal, networking, and physical requirements on facility design.

### 4. AI Training & GPU Cloud Requirements
Ultra-high density (50-150kW/rack), liquid cooling, InfiniBand fabric, massive power intake, thermal management. CoreWeave, Lambda, GPU cloud operator patterns.

### 5. AI Inference & Edge Requirements
Latency sensitivity, edge proximity, different density profiles, mixed GPU/CPU, network egress patterns. How inference differs from training in engineering terms.

### 6. Hyperscaler Requirements
How AWS/Azure/Google dictate design: custom rack specs, proprietary cooling, OCP-style open compute, massive scale, specific power/network topology.

### 7. Sovereign & Defense Requirements
Data residency, government certifications, TEMPEST shielding, air-gapped networks, blast resistance, NATO/national security standards, Schrems II compliance.

### 8. Enterprise Colo & HPC Requirements
Standard colocation (mixed density, flexibility) and HPC/research workloads (parallel storage, low-latency interconnects).

### 9. Why Standardized Designs Fail
The gap between template designs (8-15 kW/rack air-cooled) and real client needs. What specifically breaks: cooling, power topology, redundancy, compliance, floor loading, ceiling height. How this causes project delays and cost overruns.
