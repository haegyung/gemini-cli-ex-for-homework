---
domain_id: "agent-skills"
source_id: "openai-codex-skills"
section_index: "7"
section_title: "Enable or disable skills"
source_url: "https://developers.openai.com/codex/skills"
reader_url: "https://r.jina.ai/http://developers.openai.com/codex/skills"
captured_at: "2026-04-16T03:40:06+00:00"
---
## Enable or disable skills

Use `[[skills.config]]` entries in `~/.codex/config.toml` to disable a skill without deleting it:

```
[[skills.config]]
path = "/path/to/skill/SKILL.md"
enabled = false
```

Restart Codex after changing `~/.codex/config.toml`.
