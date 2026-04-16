---
domain_id: "agent-skills"
source_id: "openai-codex-skills"
section_index: "3"
section_title: "Create a skill"
source_url: "https://developers.openai.com/codex/skills"
reader_url: "https://r.jina.ai/http://developers.openai.com/codex/skills"
captured_at: "2026-04-16T03:40:06+00:00"
---
## Create a skill

Use the built-in creator first:

`$skill-creator`
The creator asks what the skill does, when it should trigger, and whether it should stay instruction-only or include scripts. Instruction-only is the default.

You can also create a skill manually by creating a folder with a `SKILL.md` file:

```
---
name: skill-name
description: Explain exactly when this skill should and should not trigger.
---

Skill instructions for Codex to follow.
```

Codex detects skill changes automatically. If an update doesn’t appear, restart Codex.
