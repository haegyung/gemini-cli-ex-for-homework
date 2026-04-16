---
domain_id: "agent-skills"
source_id: "agent-skills-what-are-skills"
section_index: "0"
section_title: "Overview"
source_url: "https://agentskills.io/what-are-skills"
reader_url: "https://r.jina.ai/http://agentskills.io/what-are-skills"
captured_at: "2026-04-16T03:40:41+00:00"
---
At its core, a skill is a folder containing a `SKILL.md` file. This file includes metadata (`name` and `description`, at minimum) and instructions that tell an agent how to perform a specific task. Skills can also bundle scripts, templates, and reference materials.

```
my-skill/
├── SKILL.md          # Required: instructions + metadata
├── scripts/          # Optional: executable code
├── references/       # Optional: documentation
└── assets/           # Optional: templates, resources
```
