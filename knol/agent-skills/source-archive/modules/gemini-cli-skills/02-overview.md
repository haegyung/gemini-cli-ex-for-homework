---
domain_id: "agent-skills"
source_id: "gemini-cli-skills"
section_index: "2"
section_title: "Overview"
source_url: "https://geminicli.com/docs/cli/skills/"
reader_url: "https://r.jina.ai/http://geminicli.com/docs/cli/skills/"
captured_at: "2026-04-16T03:40:19+00:00"
---
## Overview

[Section titled “Overview”](http://geminicli.com/docs/cli/skills/#overview)

Unlike general context files ([`GEMINI.md`](http://geminicli.com/docs/cli/gemini-md)), which provide persistent workspace-wide background, Skills represent **on-demand expertise**. This allows Gemini to maintain a vast library of specialized capabilities—such as security auditing, cloud deployments, or codebase migrations—without cluttering the model’s immediate context window.

Gemini autonomously decides when to employ a skill based on your request and the skill’s description. When a relevant skill is identified, the model “pulls in” the full instructions and resources required to complete the task using the `activate_skill` tool.
