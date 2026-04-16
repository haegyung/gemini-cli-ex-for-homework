---
domain_id: "agent-skills"
source_id: "agent-skills-best-practices"
section_index: "5"
section_title: "Calibrating control"
source_url: "https://agentskills.io/skill-creation/best-practices"
reader_url: "https://r.jina.ai/http://agentskills.io/skill-creation/best-practices"
captured_at: "2026-04-16T03:40:47+00:00"
---
## Calibrating control

Not every part of a skill needs the same level of prescriptiveness. Match the specificity of your instructions to the fragility of the task.

### Match specificity to fragility

**Give the agent freedom** when multiple approaches are valid and the task tolerates variation. For flexible instructions, explaining _why_ can be more effective than rigid directives — an agent that understands the purpose behind an instruction makes better context-dependent decisions. A code review skill can describe what to look for without prescribing exact steps:

```
