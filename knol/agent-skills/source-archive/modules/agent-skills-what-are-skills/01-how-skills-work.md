---
domain_id: "agent-skills"
source_id: "agent-skills-what-are-skills"
section_index: "1"
section_title: "How skills work"
source_url: "https://agentskills.io/what-are-skills"
reader_url: "https://r.jina.ai/http://agentskills.io/what-are-skills"
captured_at: "2026-04-16T03:40:41+00:00"
---
## How skills work

Skills use **progressive disclosure** to manage context efficiently:

1.   **Discovery**: At startup, agents load only the name and description of each available skill, just enough to know when it might be relevant.
2.   **Activation**: When a task matches a skill’s description, the agent reads the full `SKILL.md` instructions into context.
3.   **Execution**: The agent follows the instructions, optionally loading referenced files or executing bundled code as needed.

This approach keeps agents fast while giving them access to more context on demand.
