# prep-meeting-agent

Meeting preparation agent for Metier's data center operator clients. Researches operators from public sources and produces structured meeting briefs mapping their pain points to Metier's services.

## Quick Start

```bash
# For an existing operator:
cd operators/fossefall
claude
# Then say: "Run all phases"

# For a new operator:
./scripts/new-operator.sh <operator-name>
# Edit operators/<name>/operator.md with known info
cd operators/<name>
claude
# Then say: "Run all phases"
```

## Structure

```
dc-gtm/
├── CLAUDE.md                      # Master agent instructions
├── metier/
│   ├── services.md                # Metier service catalog (DC-specific)
│   └── pain-point-mapping.md      # Pain point → service decision framework
├── templates/
│   ├── operator-profile.md        # Template for operator input
│   ├── meeting-brief.md           # Template for output brief
│   └── prompts/                   # 6 research phase instructions
│       ├── 01-company-research.md
│       ├── 02-job-ads-analysis.md
│       ├── 03-news-and-ownership.md
│       ├── 04-competitive-landscape.md
│       ├── 05-pain-point-mapping.md
│       └── 06-brief-generation.md
├── operators/
│   ├── _template/                 # Template for new operators
│   ├── fossefall/                 # First operator (fully configured)
│   ├── skygard/                   # Placeholder
│   ├── kitebrook/                 # Placeholder
│   └── bifrost-edge/              # Placeholder
└── scripts/
    └── new-operator.sh            # Scaffold a new operator folder
```

## Research Phases

1. **Company Research** — Website, proff.no, general profile
2. **Job Ads Analysis** — finn.no, careers page, capability gaps
3. **News & Ownership** — Ownership structure, recent news, regulatory status
4. **Competitive Landscape** — Comparable operators and their challenges
5. **Pain Point Mapping** — Synthesis: map gaps to Metier services
6. **Meeting Brief** — Final deliverable for meeting preparation
