---
domain_id: "agent-skills"
source_id: "agent-skills-best-practices"
section_index: "2"
section_title: "Spending context wisely"
source_url: "https://agentskills.io/skill-creation/best-practices"
reader_url: "https://r.jina.ai/http://agentskills.io/skill-creation/best-practices"
captured_at: "2026-04-16T03:40:47+00:00"
---
## Spending context wisely

Once a skill activates, its full `SKILL.md` body loads into the agent’s context window alongside conversation history, system context, and other active skills. Every token in your skill competes for the agent’s attention with everything else in that window.

### Add what the agent lacks, omit what it knows

Focus on what the agent _wouldn’t_ know without your skill: project-specific conventions, domain-specific procedures, non-obvious edge cases, and the particular tools or APIs to use. You don’t need to explain what a PDF is, how HTTP works, or what a database migration does.

```
<!-- Too verbose — the agent already knows what PDFs are -->
