---
domain_id: "agent-skills"
source_id: "agent-skills-best-practices"
section_index: "15"
section_title: "Editing workflow"
source_url: "https://agentskills.io/skill-creation/best-practices"
reader_url: "https://r.jina.ai/http://agentskills.io/skill-creation/best-practices"
captured_at: "2026-04-16T03:40:47+00:00"
---
## Editing workflow

1. Make your edits
2. Run validation: `python scripts/validate.py output/`
3. If validation fails:
   - Review the error message
   - Fix the issues
   - Run validation again
4. Only proceed when validation passes
```

A reference document can also serve as the “validator” — instruct the agent to check its work against the reference before finalizing.

### Plan-validate-execute

For batch or destructive operations, have the agent create an intermediate plan in a structured format, validate it against a source of truth, and only then execute.

```
