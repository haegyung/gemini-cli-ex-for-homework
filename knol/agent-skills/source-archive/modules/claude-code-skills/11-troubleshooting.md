---
domain_id: "agent-skills"
source_id: "claude-code-skills"
section_index: "11"
section_title: "Troubleshooting"
source_url: "https://code.claude.com/docs/en/skills"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/skills"
captured_at: "2026-04-16T03:40:11+00:00"
---
## Troubleshooting

### Skill not triggering

If Claude doesn’t use your skill when expected:

1.   Check the description includes keywords users would naturally say
2.   Verify the skill appears in `What skills are available?`
3.   Try rephrasing your request to match the description more closely
4.   Invoke it directly with `/skill-name` if the skill is user-invocable

### Skill triggers too often

If Claude uses your skill when you don’t want it:

1.   Make the description more specific
2.   Add `disable-model-invocation: true` if you only want manual invocation

### Skill descriptions are cut short

Skill descriptions are loaded into context so Claude knows what’s available. All skill names are always included, but if you have many skills, descriptions are shortened to fit the character budget, which can strip the keywords Claude needs to match your request. The budget scales dynamically at 1% of the context window, with a fallback of 8,000 characters.To raise the limit, set the `SLASH_COMMAND_TOOL_CHAR_BUDGET` environment variable. Or trim the `description` and `when_to_use` text at the source: front-load the key use case, since each entry’s combined text is capped at 1,536 characters regardless of budget.

*   **[Subagents](https://code.claude.com/docs/en/sub-agents)**: delegate tasks to specialized agents
*   **[Plugins](https://code.claude.com/docs/en/plugins)**: package and distribute skills with other extensions
*   **[Hooks](https://code.claude.com/docs/en/hooks)**: automate workflows around tool events
*   **[Memory](https://code.claude.com/docs/en/memory)**: manage CLAUDE.md files for persistent context
*   **[Commands](https://code.claude.com/docs/en/commands)**: reference for built-in commands and bundled skills
*   **[Permissions](https://code.claude.com/docs/en/permissions)**: control tool and skill access
