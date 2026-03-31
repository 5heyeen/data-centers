# DC GTM — Metier + Norconsult Data Center Go-To-Market

Research, strategy, and tooling for building a joint Metier + Norconsult data center practice in Norway.

---

## Repository Structure

```
dc-gtm/
├── CLAUDE.md                          # Master agent instructions (meeting-prep agent)
├── README.md                          # This file
├── synthesis.md                       # Cross-stream research synthesis
│
├── skills/                            # Reusable Claude Code skills (slash commands)
├── agents/                            # Agent definitions and breakdowns
├── specs/                             # Project specifications and design documents
├── memories/                          # Persistent context and learnings
│
├── projects/                          # Project-level folders
│   ├── dc-gtm/                        # The overall DC GTM initiative
│   └── operators/                     # Per-operator intelligence folders
│       ├── _template/                 # Template for new operators
│       ├── fossefall/                 # Fossefall (500 MW AI DC startup)
│       ├── skygard/                   # Skygard (Telenor/Hafslund/HitecVision JV)
│       ├── kitebrook/                 # Kitebrook
│       └── bifrost-edge/             # Bifrost Edge
│
├── research/                          # All research outputs
│   ├── investors/                     # Investor research and analysis
│   └── tech-trends/                   # Technology trends reshaping DC design & construction
│
├── tasks/                             # Research workspace (Phase 5 prompt chains + outputs)
│   ├── 01-operator-lifecycle/         # DC operator & project lifecycle phases
│   ├── 02-pain-points-by-phase/       # Pain points mapped to lifecycle phases
│   ├── 03-operator-intelligence/      # Company-level operator profiles + investor research
│   ├── 04-buying-behavior/            # How operators buy consulting services
│   ├── 05-competitive-landscape/      # Competitor analysis (Nordic + international)
│   ├── 06-regulatory-environment/     # Norwegian regulatory & political landscape
│   ├── 07-technology-trends/          # Technology trends reshaping DC design & construction
│   ├── 08-service-design/             # Service catalog and packaging
│   └── 09-target-operators/           # Investment flows, TAM/SAM, revenue roadmap
│
├── metier/                            # Metier-specific strategy documents
├── templates/                         # Templates for research and meeting briefs
└── scripts/                           # Utility scripts
```

---

## Folder Guide — What Goes Where

### `skills/` — Reusable Claude Code Skills

Slash commands that can be invoked in any Claude Code session. Copy to `~/.claude/commands/` for global use, or to `.claude/commands/` in any project for project-scoped use.

| Skill | Invoke with | Purpose |
|-------|-------------|---------|
| `researcher-agent.md` | `/researcher-agent` | Deep research orchestrator — breaks a topic into subtasks, generates Socratic prompt chains, executes research in parallel, synthesizes findings |
| `create-prompts.md` | `/create-prompts` | Generates exhaustive Socratic prompt chains for any topic (questions, not answers) |
| `run-prompt-chain.md` | `/run-prompt-chain` | Executes a prompt chain file — classifies prompts as independent/sequential, runs parallel where possible, saves outputs |
| `synthesise-research.md` | `/synthesise-research` | Reads all task-level research outputs and produces a unified synthesis answering the original question |
| `executive-brief.md` | `/executive-brief` | Structures content into What/Why/How/When/Who/Implications/Sources format |
| `select-diagram.md` | `/select-diagram` | Selects appropriate diagram type and generates Mermaid diagrams + interactive HTML |
| `save-research.md` | `/save-research` | Saves research outputs to local files and optionally to Notion |
| `decompose-task.md` | `/decompose-task` | Breaks a complex task into structured subtasks with dependencies |
| `write-specs.md` | `/write-specs` | Spec-driven development interview — produces detailed specs before implementation |

### `agents/` — Agent Definitions

Breakdowns and instructions for specialized agents that operate within this repo.

| File | Agent | Purpose |
|------|-------|---------|
| `meeting-prep-agent-breakdown.md` | Meeting Prep Agent | 6-phase research agent that produces meeting briefs for DC operator meetings. Uses `CLAUDE.md` as its instruction set. |

### `specs/` — Project Specifications

Design documents and specifications that informed the research structure.

| File | Purpose |
|------|---------|
| `researcher-agent.md` | Original spec for the researcher-agent skill |
| `socrates-prompt-chain.md` | Spec for the Socratic prompt chain methodology |
| `breakdown.md` | Task decomposition spec |
| `context-documents-sheyeen-metier.md` | Context about Sheyeen and Metier for agent instructions |

### `tasks/` — Research Workspace

The core research output. Organized by research theme. Each task folder follows this structure:

```
tasks/<NN>-<task-name>/
├── prompt-chain.md          # Socratic prompt chain (questions to research)
├── prompts/                 # Individual prompt outputs (one file per prompt)
│   ├── 01-<slug>.md
│   ├── 02-<slug>.md
│   └── ...
└── research.md              # Merged research output (all prompts combined)
```

**Research status:**

| # | Task | Status | Key Output |
|---|------|--------|------------|
| 01 | Operator Lifecycle & Phases | Prompt chain exists (Phase 1B) | Not yet researched here |
| 02 | Pain Points by Phase | Prompt chain exists (Phase 1D-1G) | Not yet researched here |
| 03 | Operator Intelligence | **COMPLETE** | 20+ operators profiled, priority matrix, value props, investor research |
| 04 | Buying Behavior | Prompt chain exists (Phase 2A) | Not yet researched here |
| 05 | Competitive Landscape | Prompt chain exists (Phase 2C) | Not yet researched here |
| 06 | Regulatory Environment | Prompt chain exists (Phase 2B) | Not yet researched here |
| 07 | Technology Trends | **COMPLETE** | 8 trends analyzed, capability gaps, timing matrix |
| 08 | Service Design | Prompt chain exists (Phase 4A) | Not yet researched here |
| 09 | Target Operators & Revenue | **COMPLETE** | Investment flows, TAM/SAM/SOM, steering group roadmap |

Tasks 01, 02, 04, 05, 06, 08 have prompt chains designed in the Phase 1-4 Socratic framework (see `01-breakdown.md`) but haven't been executed in this repo yet.

### `projects/operators/` — Per-Operator Intelligence

One folder per target DC operator. Used by the meeting-prep agent and for ongoing operator tracking.

```
projects/operators/<operator-name>/
├── CLAUDE.md              # Agent instructions specific to this operator
├── operator.md            # Input: what we know before research
├── profile.md             # Output: full researched profile
├── value-proposition.md   # Output: tailored Metier value prop
└── research/              # Raw research outputs from each phase
    ├── 01-company.md
    ├── 02-hiring.md
    ├── 03-news-ownership.md
    ├── 04-comparables.md
    ├── 05-pain-points.md
    └── brief.md           # Final meeting brief
```

**To add a new operator:** Run `./scripts/new-operator.sh <operator-name>`, then edit `operator.md` with what you know.

### `research/investors/` — Investor Research

Research and analysis of investors in the Norwegian data center market. Includes investor checklists, execution capability assessments, and value propositions.

### `research/tech-trends/` — Technology Trends

Technology trends reshaping data center design and construction. Includes trend analysis, capability gap assessment, and timing matrix.

### `memories/` — Persistent Context

Persistent learnings, context, and notes that carry across sessions.

### `metier/` — Metier Strategy Documents

Documents describing Metier's capabilities, services, and positioning for the DC market.

| File | Purpose |
|------|---------|
| `services.md` | Metier's DC-specific service catalog (8 services) |
| `pain-point-mapping.md` | Decision framework: pain point → service recommendation, including 4 operator archetype patterns |

### `templates/` — Templates

Reusable templates for research outputs and meeting preparation.

| File/Folder | Purpose |
|-------------|---------|
| `operator-profile.md` | Template for operator input (seed data before research) |
| `meeting-brief.md` | Template for the final meeting brief output |
| `prompts/01-06` | 6 research phase instruction templates for the meeting-prep agent |

### `scripts/` — Utility Scripts

| Script | Purpose |
|--------|---------|
| `new-operator.sh` | Scaffolds a new operator folder from `projects/operators/_template/` |

---

## Top-Level Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Master agent instructions — tells Claude how to operate when run inside this repo (meeting-prep agent workflow) |
| `synthesis.md` | Cross-stream research synthesis — the unified answer to "what should Metier + Norconsult's DC GTM plan be?" |
| `00-scope.md` | Research scope definition |
| `00-scope-prompt-chain.md` | Top-level Socratic prompt chain for the entire GTM research |
| `01-breakdown.md` | Full task breakdown — maps Phase 1-4 (existing prompts) + Phase 5 (new research) |

---

## How to Use This Repo

### Run the meeting-prep agent for an operator
```bash
cd projects/operators/fossefall
claude
# Say: "Run all phases"
```

### Run GTM research
```bash
cd tasks/03-operator-intelligence
claude
# Say: "/run-prompt-chain prompt-chain.md"
```

### Add a new operator
```bash
./scripts/new-operator.sh <name>
# Edit projects/operators/<name>/operator.md
cd projects/operators/<name>
claude
# Say: "Run all phases"
```

### Use the skills in any project
Copy `skills/*.md` to `~/.claude/commands/` — they become available as `/create-prompts`, `/researcher-agent`, etc. in all Claude Code sessions.

---

## Key Research Findings (from synthesis.md)

- **Norway DC construction market:** $3B+ annually, 21% CAGR
- **53 projects on Statnett grid queue** reserving 3.4 GW (>8% of national capacity)
- **20+ operators profiled** — 5 priority accounts identified (Bulk, Green Mountain, Lefdal/3i, Telenor/Skygard, Google Phase 2)
- **White space:** No firm in Norway offers investor-grade DC execution advisory backed by a national-scale engineering firm
- **Revenue opportunity:** NOK 25M (Y1) → 45M (Y2) → 60M (Y3), NOK 3-4M/year investment, cash-positive from Year 1
- **Recommendation:** Option A — "Invest for Growth" — formally establish joint DC practice
