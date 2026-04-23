# Prompt 29: eyp-design-philosophy-from-cases

> **Prompt:** Based on EYP's public case studies and project descriptions, what design philosophy emerges — are they focused on hyperscale, enterprise, colo, or edge? Do they favour particular cooling or power architectures?

---

*[Sequential — builds on Prompts 26-28 (playbook and methodology)]*

## Client Segment Profile

Based on documented projects and service descriptions, EYP MCF's primary segments are:

**1. Enterprise / Corporate Data Centers (strongest track record)**
EYP MCF's roots are in corporate enterprise data centers — facilities owned and operated by large organizations for their own IT workloads. The HP partnership era (2007-2018) reinforced this: HP/HPE's market was enterprise clients, and EYP MCF designed data centers to support HP's consulting sales. This is reflected in the Hybrid IT / Adaptive Stack advisory framework, which is oriented toward enterprise IT decision-making (build vs. lease vs. colo vs. cloud analysis) rather than hyperscale development.

**2. HPC / Supercomputing / Government Science (distinctive)**
EYP MCF has a notable track record in high-performance computing for government and academic clients:
- NCAR-Wyoming Supercomputing Center (NWSC) — design lead; Uptime Institute Green Enterprise IT Award 2013, DCD North America "Green" Award 2013
- NCSA Petascale Computing Building, University of Illinois — design lead for NSF Track 1 leadership-class supercomputer facility
This is a differentiating segment where EYP MCF has reference-project credibility that most engineering firms cannot match.

**3. Colocation**
- Designed a "massively modular" 700,000 sq ft colocation facility in Dallas — major reference project
- Colo segment uses modular/containerized approach, standardized design, scalable expansion
INFERENCE: Colo is a significant segment but the modular project references suggest a specific focus on standardized/prefab delivery rather than custom design.

**4. AI Campus (Emerging / Most Recent)**
- October 2025: Selected for 438-acre AI campus (Texas Critical Data Centers, Odessa TX) — full-scope engineering
This is EYP MCF's first publicly confirmed AI-scale campus project. It signals active engagement with the AI buildout market but the track record is too new to assess methodology depth.

**Not primarily hyperscale:** No confirmed hyperscale (Microsoft, Google, Meta, Amazon) named references in public domain. EYP MCF's advisory framework (Sourcing and Demand Analysis, Hybrid IT planning) is oriented toward clients making strategic decisions, not toward hyperscalers with fixed internal standards who need fast execution of their own specifications.

## Cooling Architecture Preferences (from published sources)

EYP MCF designs across a range of cooling architectures based on client needs:
- **Adiabatic cooling** — documented in modular colo projects
- **Chilled water** — standard for enterprise and colo
- **Evaporative cooling** — used in HPC projects where water use is permissible and efficiency is critical (NWSC in Wyoming — dry climate, evaporative efficiency excellent)
- **Liquid immersion cooling** — documented for data mining / crypto / high-density use case (34-unit modular deployment)
- **CFD thermal modeling** — systematic use across projects
- **Rear-door heat exchangers** — cited in high-density applications

No stated architectural preference — the firm describes itself as technology-agnostic, selecting cooling based on client requirements and site conditions.

## Power Architecture Philosophy

- Designs for **Tier III and Tier IV** redundancy (Uptime Institute) — documented track record including first Tier IV in US, Saudi Arabia, China (claimed)
- Experience with both **centralized UPS** and **in-rack distributed critical power battery backup**
- Modular deployments include central UPS designs
- Sustainability-first: strong emphasis on PUE reduction, renewable energy integration, GHG abatement

## Emerging Design Philosophy Signals

- **AI/high-density readiness**: Texas campus win and immersion cooling track record suggests capability, but no published framework for 40-150 kW/rack liquid-cooled AI designs yet confirmed
- **Net-zero framework**: Ramboll's September 2025 roadmap (from i3/Ansett) establishes ambitious sustainability standards — water neutrality, zero waste, operational net zero — which the combined practice promotes as a design target
- **Modular-first for speed**: Containerized and prefabricated approach for colo and rapid deployment scenarios

---
*Executed: 2026-04-17 | Mode: sequential (builds on Prompts 26-28)*
