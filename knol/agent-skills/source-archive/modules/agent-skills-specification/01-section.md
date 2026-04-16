---
domain_id: "agent-skills"
source_id: "agent-skills-specification"
section_index: "1"
section_title: "[​](http://agentskills.io/specification#directory-structure)"
source_url: "https://agentskills.io/specification"
reader_url: "https://r.jina.ai/http://agentskills.io/specification"
captured_at: "2026-04-16T03:40:42+00:00"
---
## [​](http://agentskills.io/specification#directory-structure)

Directory structure

A skill is a directory containing, at minimum, a `SKILL.md` file:

```
skill-name/
├── SKILL.md          # Required: metadata + instructions
├── scripts/          # Optional: executable code
├── references/       # Optional: documentation
├── assets/           # Optional: templates, resources
└── ...               # Any additional files or directories
```
