---
domain_id: "agent-skills"
source_id: "claude-code-skills"
section_index: "7"
section_title: "Your task"
source_url: "https://code.claude.com/docs/en/skills"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/skills"
captured_at: "2026-04-16T03:40:11+00:00"
---
## Your task
Summarize this pull request...
```

When this skill runs:

1.   Each `!`<command>`` executes immediately (before Claude sees anything)
2.   The output replaces the placeholder in the skill content
3.   Claude receives the fully-rendered prompt with actual PR data

This is preprocessing, not something Claude executes. Claude only sees the final result.For multi-line commands, use a fenced code block opened with ````!` instead of the inline form:

```
