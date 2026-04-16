---
domain_id: "agent-skills"
source_id: "claude-code-skills"
section_index: "5"
section_title: "Advanced patterns"
source_url: "https://code.claude.com/docs/en/skills"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/skills"
captured_at: "2026-04-16T03:40:11+00:00"
---
## Advanced patterns

### Inject dynamic context

The `!`<command>`` syntax runs shell commands before the skill content is sent to Claude. The command output replaces the placeholder, so Claude receives actual data, not the command itself.This skill summarizes a pull request by fetching live PR data with the GitHub CLI. The `!`gh pr diff`` and other commands run first, and their output gets inserted into the prompt:

```
---
name: pr-summary
description: Summarize changes in a pull request
context: fork
agent: Explore
allowed-tools: Bash(gh *)
---
