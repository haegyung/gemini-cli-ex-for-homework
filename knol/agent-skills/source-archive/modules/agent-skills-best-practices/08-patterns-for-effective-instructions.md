---
domain_id: "agent-skills"
source_id: "agent-skills-best-practices"
section_index: "8"
section_title: "Patterns for effective instructions"
source_url: "https://agentskills.io/skill-creation/best-practices"
reader_url: "https://r.jina.ai/http://agentskills.io/skill-creation/best-practices"
captured_at: "2026-04-16T03:40:47+00:00"
---
## Patterns for effective instructions

These are reusable techniques for structuring skill content. Not every skill needs all of them — use the ones that fit your task.

### Gotchas sections

The highest-value content in many skills is a list of gotchas — environment-specific facts that defy reasonable assumptions. These aren’t general advice (“handle errors appropriately”) but concrete corrections to mistakes the agent will make without being told otherwise:

```
