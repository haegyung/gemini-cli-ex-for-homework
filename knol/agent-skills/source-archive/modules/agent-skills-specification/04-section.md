---
domain_id: "agent-skills"
source_id: "agent-skills-specification"
section_index: "4"
section_title: "[​](http://agentskills.io/specification#progressive-disclosure)"
source_url: "https://agentskills.io/specification"
reader_url: "https://r.jina.ai/http://agentskills.io/specification"
captured_at: "2026-04-16T03:40:42+00:00"
---
## [​](http://agentskills.io/specification#progressive-disclosure)

Progressive disclosure

Skills should be structured for efficient use of context:
1.   **Metadata** (~100 tokens): The `name` and `description` fields are loaded at startup for all skills
2.   **Instructions** (< 5000 tokens recommended): The full `SKILL.md` body is loaded when the skill is activated
3.   **Resources** (as needed): Files (e.g. those in `scripts/`, `references/`, or `assets/`) are loaded only when required

Keep your main `SKILL.md` under 500 lines. Move detailed reference material to separate files.
