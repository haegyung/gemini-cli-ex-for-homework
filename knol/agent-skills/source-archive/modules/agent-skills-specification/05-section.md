---
domain_id: "agent-skills"
source_id: "agent-skills-specification"
section_index: "5"
section_title: "[​](http://agentskills.io/specification#file-references)"
source_url: "https://agentskills.io/specification"
reader_url: "https://r.jina.ai/http://agentskills.io/specification"
captured_at: "2026-04-16T03:40:42+00:00"
---
## [​](http://agentskills.io/specification#file-references)

File references

When referencing other files in your skill, use relative paths from the skill root:

SKILL.md

```
See [the reference guide](references/REFERENCE.md) for details.

Run the extraction script:
scripts/extract.py
```

Keep file references one level deep from `SKILL.md`. Avoid deeply nested reference chains.
