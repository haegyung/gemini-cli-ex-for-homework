---
domain_id: "agent-skills"
source_id: "agent-skills-best-practices"
section_index: "14"
section_title: "Form processing workflow"
source_url: "https://agentskills.io/skill-creation/best-practices"
reader_url: "https://r.jina.ai/http://agentskills.io/skill-creation/best-practices"
captured_at: "2026-04-16T03:40:47+00:00"
---
## Form processing workflow

Progress:
- [ ] Step 1: Analyze the form (run `scripts/analyze_form.py`)
- [ ] Step 2: Create field mapping (edit `fields.json`)
- [ ] Step 3: Validate mapping (run `scripts/validate_fields.py`)
- [ ] Step 4: Fill the form (run `scripts/fill_form.py`)
- [ ] Step 5: Verify output (run `scripts/verify_output.py`)
```

### Validation loops

Instruct the agent to validate its own work before moving on. The pattern is: do the work, run a validator (a script, a reference checklist, or a self-check), fix any issues, and repeat until validation passes.

```
