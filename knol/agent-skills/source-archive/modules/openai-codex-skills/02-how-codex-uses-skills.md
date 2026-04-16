---
domain_id: "agent-skills"
source_id: "openai-codex-skills"
section_index: "2"
section_title: "How Codex uses skills"
source_url: "https://developers.openai.com/codex/skills"
reader_url: "https://r.jina.ai/http://developers.openai.com/codex/skills"
captured_at: "2026-04-16T03:40:06+00:00"
---
## How Codex uses skills

Codex can activate skills in two ways:

1.   **Explicit invocation:** Include the skill directly in your prompt. In CLI/IDE, run `/skills` or type `$` to mention a skill.
2.   **Implicit invocation:** Codex can choose a skill when your task matches the skill `description`.

Because implicit matching depends on `description`, write descriptions with clear scope and boundaries.
