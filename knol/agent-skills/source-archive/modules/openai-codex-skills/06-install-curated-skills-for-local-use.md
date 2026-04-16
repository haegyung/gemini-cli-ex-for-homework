---
domain_id: "agent-skills"
source_id: "openai-codex-skills"
section_index: "6"
section_title: "Install curated skills for local use"
source_url: "https://developers.openai.com/codex/skills"
reader_url: "https://r.jina.ai/http://developers.openai.com/codex/skills"
captured_at: "2026-04-16T03:40:06+00:00"
---
## Install curated skills for local use

To add curated skills beyond the built-ins for your own local Codex setup, use `$skill-installer`. For example, to install the `$linear` skill:

`$skill-installer linear`
You can also prompt the installer to download skills from other repositories. Codex detects newly installed skills automatically; if one doesn’t appear, restart Codex.

Use this for local setup and experimentation. For reusable distribution of your own skills, prefer plugins.
