# Data Center Engineering & Design: Research Presentation

> Understanding the DC engineering value chain — standardized designs, basis of design, vendor reference architectures, leverandor relationships, and delivery models — to position Metier's services for Norwegian DC operators.

---

## Visual Overview

### DC Engineering Value Chain & Metier's Position

```mermaid
graph TD
    subgraph "OWNER SIDE (Where Metier Sits)"
        A[DC Operator / Owner] --> B["Owner's PM / Representative<br/><b>→ METIER</b>"]
        B --> C["OPR + Delivery Model Advisory"]
        B --> D["Design Review (30/60/90%)"]
        B --> E["Procurement Management"]
        B --> F["Program Management"]
    end

    subgraph "ENGINEERING LAYER"
        G["Engineering Consultant<br/>(Norconsult, COWI, Multiconsult)"]
        G --> H["Basis of Design"]
        G --> I["Detailed Engineering"]
        G --> J["EPCM Services"]
    end

    subgraph "CONTRACTOR LAYER"
        K["Design-Build Contractor<br/>(CTS Nordics, Bravida)"]
        L["Civil Contractor<br/>(Skanska, Veidekke)"]
        M["MEP Contractor<br/>(Caverion, Bravida, GK)"]
    end

    subgraph "VENDOR LAYER"
        N["Equipment Vendors<br/>(Schneider, Vertiv, Eaton, ABB)"]
        N --> O["Reference Designs"]
        N --> P["Prefab Modules"]
        N --> Q["Factory Testing"]
    end

    B -.->|"Partners with"| G
    B -.->|"Oversees"| K
    B -.->|"Evaluates"| N
    A --> G
    A --> K
    A --> L
    A --> M
```

### DC Project Lifecycle & Metier Entry Points

```mermaid
gantt
    title DC Project Lifecycle (Typical 10-50 MW)
    dateFormat YYYY-MM
    axisFormat %Y

    section Phase 1: Planning
    Business Requirements & Site Selection     :a1, 2026-01, 6M
    OPR Development (METIER leads)             :a2, 2026-04, 3M
    Delivery Model Selection (METIER advises)  :a3, 2026-06, 2M

    section Phase 2: Design
    Basis of Design (METIER + Norconsult)      :b1, 2026-07, 3M
    30% Concept Design                         :b2, 2026-10, 3M
    Design Review Gate (METIER)                :milestone, b2m, 2026-12, 0d
    60% Design Development                     :b3, 2027-01, 4M
    Long-Lead Procurement (METIER manages)     :b4, 2027-02, 6M
    Design Review Gate (METIER)                :milestone, b3m, 2027-04, 0d
    90% Construction Documents                 :b5, 2027-05, 3M
    Design Review Gate (METIER)                :milestone, b5m, 2027-07, 0d

    section Phase 3: Construction
    Civil Works & Foundations                  :c1, 2027-06, 12M
    MEP Installation                           :c2, 2027-10, 14M
    Module Delivery & Placement                :c3, 2028-02, 6M
    Program Management (METIER)                :c4, 2027-06, 18M

    section Phase 4: Commissioning
    L1-L3 Pre-Commissioning                    :d1, 2028-10, 3M
    L4 Functional Testing                      :d2, 2029-01, 2M
    L5 Integrated Systems Testing              :d3, 2029-03, 2M
```

### Delivery Models Comparison

```mermaid
quadrantChart
    title Delivery Models: Owner Control vs. Risk Transfer
    x-axis "Low Owner Control" --> "High Owner Control"
    y-axis "Low Risk Transfer" --> "High Risk Transfer"
    quadrant-1 "Sweet spot for PE-backed"
    quadrant-2 "Rare in DC"
    quadrant-3 "Traditional approach"
    quadrant-4 "For experienced operators"
    "EPC (Turnkey)": [0.25, 0.85]
    "Design-Build": [0.50, 0.65]
    "CM at Risk": [0.55, 0.55]
    "EPCM": [0.70, 0.35]
    "Design-Bid-Build": [0.85, 0.20]
    "Multi-Prime": [0.90, 0.15]
```

### Norwegian DC Leverandor Models

```mermaid
graph LR
    subgraph "Model A: Totalentreprise (Traditional)"
        OA[Owner] --> TA[Total Contractor<br/>e.g. HENT, Bravida]
        TA --> EA[Engineer<br/>as sub-supplier]
        TA --> SA[MEP Sub]
        TA --> CA[Civil Sub]
    end

    subgraph "Model B: EPCM / Owner-Led (DC Trend)"
        OB[Owner] --> EB[EPCM Consultant<br/>e.g. Norconsult]
        OB --> SB[Civil Contractor<br/>e.g. Skanska]
        OB --> MB[MEP Contractor<br/>e.g. Caverion]
        OB --> VB[Vendors<br/>e.g. Schneider]
        EB -.->|manages| SB
        EB -.->|manages| MB
    end

    style EA fill:#fbb,stroke:#c00
    style EB fill:#bfb,stroke:#0a0
```

---

## What / Why / How / Who / Implications

### What

The data center engineering and design process is a 5-phase lifecycle (Plan → Design → Build → Commission → Operate) where MEP engineering dominates — power and cooling drive the design, accounting for 60-70% of build cost. Unlike conventional buildings, the architect is subordinate to the MEP engineer.

Design progresses through 30/60/90/100% milestones. Equipment lead times (transformers: 16-40 weeks, generators: 20-40 weeks) anchor the schedule. Commissioning is a design discipline planned from day one through 5 levels of testing.

Six delivery models exist (Design-Bid-Build, Design-Build, EPC, EPCM, CM at Risk, IPD), with **Design-Build most common** for large DCs and **EPC growing fast** among PE-backed operators.

### Why It Matters for Metier

The Norwegian DC market is shifting from traditional totalentreprise (where engineers like Norconsult are sub-suppliers to contractors) to **owner-led models** (EPCM, multi-prime) where the engineering consultant works directly for the owner. Both Bulk N01 (Norconsult EPCM) and Skygard (COWI total advisor) demonstrate this trend.

This shift creates demand for independent owner-side project management — exactly what Metier provides. First-time and PE-backed DC developers lack in-house execution capability but need to control critical design parameters that can't be delegated to contractors.

### How Metier Can Engage

**Five service opportunities mapped to project phases:**

| # | Service | Phase | Partners | Revenue |
|---|---|---|---|---|
| A | OPR + Delivery Model Advisory | Planning | Metier only | T&M |
| B | Basis of Design Management | Planning→Design | Norconsult | Fixed fee (1-3% CAPEX) |
| C | Design Review & Management | Design (30/60/90%) | Norconsult support | Monthly retainer |
| D | Procurement & Long-Lead Mgmt | Design→Construction | Metier only | Retainer + success fees |
| E | Multi-Vendor Program Mgmt | Construction→Cx | Metier only | Monthly retainer |

**Critical timing:** Metier must engage **before** the EPCM consultant or Design-Build contractor is selected. Once those are in place, they absorb management scope.

### Who Are the Key Players

**Norwegian DC engineering ecosystem:**

| Player | Role | Relationship to Metier |
|---|---|---|
| **CTS Nordics** | Design-build contractor + NordicEPOD manufacturer | Metier sits opposite — owner's side oversight |
| **Norconsult** | Engineering consultant / EPCM (Bulk N01) | Partner for BoD; complement when design-only |
| **COWI** | Engineering consultant / total advisor (Skygard) | Similar to Norconsult dynamic |
| **Bravida / Caverion** | MEP contractors | Execute under Metier-managed contracts |
| **Skanska / Veidekke** | Civil contractors | Execute under Metier-managed contracts |
| **Schneider / Vertiv / Eaton** | Equipment vendors + reference designs | Metier evaluates and adapts their designs |
| **NS Nordics** | Specialized DC project management | Closest competitor |

### Implications

1. **Metier cannot replicate CTS's standardized design model** — it requires vertical integration (design + manufacturing + construction). But the growth of standardized design-build **increases** demand for independent owner-side advisors.

2. **Metier + Norconsult BoD service is viable and well-precedented** — separately billable, NOK 5-30M per engagement for 10-50 MW projects. Natural entry point that leads to downstream engagement.

3. **Schneider reference designs are starting points, not endpoints** — substantial site-specific engineering remains (civil, grid, TEK17, permitting). Metier manages this gap.

4. **The leverandor dynamic is shifting in Metier's favor** — DC projects are moving from contractor-led (engineer as sub-supplier) to owner-led (engineer works for owner). This creates room for independent PM.

5. **Early phase is Metier's highest-value entry point** — OPR workshops, delivery model advisory, and BoD management happen before contractors are engaged. Once the EPCM firm or DB contractor is in place, PM scope gets absorbed.

6. **NS Nordics is the main competitor** — they're already doing DC project management in Norway. Metier differentiates with broader services (procurement, governance, early-phase advisory) and larger organizational scale.

---

## Sources

Detailed source citations are in the individual research files:

| Subtask | File | Key Sources |
|---|---|---|
| 01 - CTS Standardized Design | `workspace/tasks/01-cts-standardized-design/research.md` | CTS Nordics, Eaton, DCD, Bulk Infrastructure |
| 02 - Basis of Design | `workspace/tasks/02-basis-of-design/research.md` | ASHRAE, SiTESPAN, Norconsult, FIDIC, NS Nordics |
| 03 - Vendor Reference Designs | `workspace/tasks/03-vendor-reference-designs/research.md` | Schneider Electric, Vertiv, Huawei, ABB, ENERCON |
| 04 - Leverandor Relationships | `workspace/tasks/04-leverandor-relationships/research.md` | Standard Norge, Codex, Byggeindustrien, COWI, DLA Piper |
| 05 - DC Design Process | `workspace/tasks/05-dc-design-process/research.md` | DataXConnect, King & Spalding, Procore, Structure Research |
| 06 - Metier Positioning | `workspace/tasks/06-metier-positioning/research.md` | Synthesis of subtasks 01-05 |
| Synthesis | `workspace/synthesis.md` | Cross-subtask synthesis answering 5 original questions |
