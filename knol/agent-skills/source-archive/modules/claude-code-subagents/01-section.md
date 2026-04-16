---
domain_id: "agent-skills"
source_id: "claude-code-subagents"
section_index: "1"
section_title: "[​](http://code.claude.com/docs/en/sub-agents#built-in-subagents)"
source_url: "https://code.claude.com/docs/en/sub-agents"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/sub-agents"
captured_at: "2026-04-16T03:40:12+00:00"
---
## [​](http://code.claude.com/docs/en/sub-agents#built-in-subagents)

Built-in subagents

Claude Code includes built-in subagents that Claude automatically uses when appropriate. Each inherits the parent conversation’s permissions with additional tool restrictions.

*   Explore 
*   Plan 
*   General-purpose 
*   Other 

A fast, read-only agent optimized for searching and analyzing codebases.
*   **Model**: Haiku (fast, low-latency)
*   **Tools**: Read-only tools (denied access to Write and Edit tools)
*   **Purpose**: File discovery, code search, codebase exploration

Claude delegates to Explore when it needs to search or understand a codebase without making changes. This keeps exploration results out of your main conversation context.When invoking Explore, Claude specifies a thoroughness level: **quick** for targeted lookups, **medium** for balanced exploration, or **very thorough** for comprehensive analysis.

A research agent used during [plan mode](http://code.claude.com/docs/en/common-workflows#use-plan-mode-for-safe-code-analysis) to gather context before presenting a plan.
*   **Model**: Inherits from main conversation
*   **Tools**: Read-only tools (denied access to Write and Edit tools)
*   **Purpose**: Codebase research for planning

When you’re in plan mode and Claude needs to understand your codebase, it delegates research to the Plan subagent. This prevents infinite nesting (subagents cannot spawn other subagents) while still gathering necessary context.

A capable agent for complex, multi-step tasks that require both exploration and action.
*   **Model**: Inherits from main conversation
*   **Tools**: All tools
*   **Purpose**: Complex research, multi-step operations, code modifications

Claude delegates to general-purpose when the task requires both exploration and modification, complex reasoning to interpret results, or multiple dependent steps.

Claude Code includes additional helper agents for specific tasks. These are typically invoked automatically, so you don’t need to use them directly.

| Agent | Model | When Claude uses it |
| --- | --- | --- |
| statusline-setup | Sonnet | When you run `/statusline` to configure your status line |
| Claude Code Guide | Haiku | When you ask questions about Claude Code features |

Beyond these built-in subagents, you can create your own with custom prompts, tool restrictions, permission modes, hooks, and skills. The following sections show how to get started and customize subagents.
