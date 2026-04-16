---
domain_id: "agent-skills"
source_id: "agent-skills-specification"
section_index: "3"
section_title: "[​](http://agentskills.io/specification#optional-directories)"
source_url: "https://agentskills.io/specification"
reader_url: "https://r.jina.ai/http://agentskills.io/specification"
captured_at: "2026-04-16T03:40:42+00:00"
---
## [​](http://agentskills.io/specification#optional-directories)

Optional directories

### [​](http://agentskills.io/specification#scripts/)

`scripts/`

Contains executable code that agents can run. Scripts should:
*   Be self-contained or clearly document dependencies
*   Include helpful error messages
*   Handle edge cases gracefully

Supported languages depend on the agent implementation. Common options include Python, Bash, and JavaScript.
### [​](http://agentskills.io/specification#references/)

`references/`

Contains additional documentation that agents can read when needed:
*   `REFERENCE.md` - Detailed technical reference
*   `FORMS.md` - Form templates or structured data formats
*   Domain-specific files (`finance.md`, `legal.md`, etc.)

Keep individual [reference files](http://agentskills.io/specification#file-references) focused. Agents load these on demand, so smaller files mean less use of context.
### [​](http://agentskills.io/specification#assets/)

`assets/`

Contains static resources:
*   Templates (document templates, configuration templates)
*   Images (diagrams, examples)
*   Data files (lookup tables, schemas)
