---
domain_id: "agent-skills"
source_id: "claude-code-subagents"
section_index: "0"
section_title: "Overview"
source_url: "https://code.claude.com/docs/en/sub-agents"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/sub-agents"
captured_at: "2026-04-16T03:40:12+00:00"
---
# Create custom subagents - Claude Code Docs

[Skip to main content](http://code.claude.com/docs/en/sub-agents#content-area)

[Claude Code Docs home page![Image 1: light logo](https://mintcdn.com/claude-code/c5r9_6tjPMzFdDDT/logo/light.svg?fit=max&auto=format&n=c5r9_6tjPMzFdDDT&q=85&s=78fd01ff4f4340295a4f66e2ea54903c)![Image 2: dark logo](https://mintcdn.com/claude-code/c5r9_6tjPMzFdDDT/logo/dark.svg?fit=max&auto=format&n=c5r9_6tjPMzFdDDT&q=85&s=1298a0c3b3a1da603b190d0de0e31712)](http://code.claude.com/docs/en/overview)

![Image 3: US](https://d3gk2c5xim1je2.cloudfront.net/flags/US.svg)

English

Search...

⌘K Ask AI

*   [Claude Developer Platform](https://platform.claude.com/)
*   [Claude Code on the Web](https://claude.ai/code)
*   [Claude Code on the Web](https://claude.ai/code)

Search...

Navigation

Agents

Create custom subagents

[Getting started](http://code.claude.com/docs/en/overview)[Build with Claude Code](http://code.claude.com/docs/en/sub-agents)[Deployment](http://code.claude.com/docs/en/third-party-integrations)[Administration](http://code.claude.com/docs/en/setup)[Configuration](http://code.claude.com/docs/en/settings)[Reference](http://code.claude.com/docs/en/cli-reference)[Agent SDK](http://code.claude.com/docs/en/agent-sdk/overview)[What's New](http://code.claude.com/docs/en/whats-new)[Resources](http://code.claude.com/docs/en/legal-and-compliance)

##### Agents

*   [Create custom subagents](http://code.claude.com/docs/en/sub-agents)
*   [Run agent teams](http://code.claude.com/docs/en/agent-teams)

##### Tools and plugins

*   [Model Context Protocol (MCP)](http://code.claude.com/docs/en/mcp)
*   [Discover and install prebuilt plugins](http://code.claude.com/docs/en/discover-plugins)
*   [Create plugins](http://code.claude.com/docs/en/plugins)
*   [Extend Claude with skills](http://code.claude.com/docs/en/skills)

##### Automation

*   [Automate with hooks](http://code.claude.com/docs/en/hooks-guide)
*   [Push external events to Claude](http://code.claude.com/docs/en/channels)
*   [Run prompts on a schedule](http://code.claude.com/docs/en/scheduled-tasks)
*   [Programmatic usage](http://code.claude.com/docs/en/headless)

##### Troubleshooting

*   [Troubleshooting](http://code.claude.com/docs/en/troubleshooting)

On this page

*   [Built-in subagents](http://code.claude.com/docs/en/sub-agents#built-in-subagents)
*   [Quickstart: create your first subagent](http://code.claude.com/docs/en/sub-agents#quickstart-create-your-first-subagent)
*   [Configure subagents](http://code.claude.com/docs/en/sub-agents#configure-subagents)
*   [Use the /agents command](http://code.claude.com/docs/en/sub-agents#use-the-%2Fagents-command)
*   [Choose the subagent scope](http://code.claude.com/docs/en/sub-agents#choose-the-subagent-scope)
*   [Write subagent files](http://code.claude.com/docs/en/sub-agents#write-subagent-files)
*   [Supported frontmatter fields](http://code.claude.com/docs/en/sub-agents#supported-frontmatter-fields)
*   [Choose a model](http://code.claude.com/docs/en/sub-agents#choose-a-model)
*   [Control subagent capabilities](http://code.claude.com/docs/en/sub-agents#control-subagent-capabilities)
*   [Available tools](http://code.claude.com/docs/en/sub-agents#available-tools)
*   [Restrict which subagents can be spawned](http://code.claude.com/docs/en/sub-agents#restrict-which-subagents-can-be-spawned)
*   [Scope MCP servers to a subagent](http://code.claude.com/docs/en/sub-agents#scope-mcp-servers-to-a-subagent)
*   [Permission modes](http://code.claude.com/docs/en/sub-agents#permission-modes)
*   [Preload skills into subagents](http://code.claude.com/docs/en/sub-agents#preload-skills-into-subagents)
*   [Enable persistent memory](http://code.claude.com/docs/en/sub-agents#enable-persistent-memory)
*   [Conditional rules with hooks](http://code.claude.com/docs/en/sub-agents#conditional-rules-with-hooks)
*   [Disable specific subagents](http://code.claude.com/docs/en/sub-agents#disable-specific-subagents)
*   [Define hooks for subagents](http://code.claude.com/docs/en/sub-agents#define-hooks-for-subagents)
*   [Hooks in subagent frontmatter](http://code.claude.com/docs/en/sub-agents#hooks-in-subagent-frontmatter)
*   [Project-level hooks for subagent events](http://code.claude.com/docs/en/sub-agents#project-level-hooks-for-subagent-events)
*   [Work with subagents](http://code.claude.com/docs/en/sub-agents#work-with-subagents)
*   [Understand automatic delegation](http://code.claude.com/docs/en/sub-agents#understand-automatic-delegation)
*   [Invoke subagents explicitly](http://code.claude.com/docs/en/sub-agents#invoke-subagents-explicitly)
*   [Run subagents in foreground or background](http://code.claude.com/docs/en/sub-agents#run-subagents-in-foreground-or-background)
*   [Common patterns](http://code.claude.com/docs/en/sub-agents#common-patterns)
*   [Isolate high-volume operations](http://code.claude.com/docs/en/sub-agents#isolate-high-volume-operations)
*   [Run parallel research](http://code.claude.com/docs/en/sub-agents#run-parallel-research)
*   [Chain subagents](http://code.claude.com/docs/en/sub-agents#chain-subagents)
*   [Choose between subagents and main conversation](http://code.claude.com/docs/en/sub-agents#choose-between-subagents-and-main-conversation)
*   [Manage subagent context](http://code.claude.com/docs/en/sub-agents#manage-subagent-context)
*   [Resume subagents](http://code.claude.com/docs/en/sub-agents#resume-subagents)
*   [Auto-compaction](http://code.claude.com/docs/en/sub-agents#auto-compaction)
*   [Example subagents](http://code.claude.com/docs/en/sub-agents#example-subagents)
*   [Code reviewer](http://code.claude.com/docs/en/sub-agents#code-reviewer)
*   [Debugger](http://code.claude.com/docs/en/sub-agents#debugger)
*   [Data scientist](http://code.claude.com/docs/en/sub-agents#data-scientist)
*   [Database query validator](http://code.claude.com/docs/en/sub-agents#database-query-validator)
*   [Next steps](http://code.claude.com/docs/en/sub-agents#next-steps)

Agents

# Create custom subagents

Copy page

Create and use specialized AI subagents in Claude Code for task-specific workflows and improved context management.

Copy page

Subagents are specialized AI assistants that handle specific types of tasks. Use one when a side task would flood your main conversation with search results, logs, or file contents you won’t reference again: the subagent does that work in its own context and returns only the summary. Define a custom subagent when you keep spawning the same kind of worker with the same instructions.Each subagent runs in its own context window with a custom system prompt, specific tool access, and independent permissions. When Claude encounters a task that matches a subagent’s description, it delegates to that subagent, which works independently and returns results. To see the context savings in practice, the [context window visualization](http://code.claude.com/docs/en/context-window) walks through a session where a subagent handles research in its own separate window.

If you need multiple agents working in parallel and communicating with each other, see [agent teams](http://code.claude.com/docs/en/agent-teams) instead. Subagents work within a single session; agent teams coordinate across separate sessions.

Subagents help you:
*   **Preserve context** by keeping exploration and implementation out of your main conversation
*   **Enforce constraints** by limiting which tools a subagent can use
*   **Reuse configurations** across projects with user-level subagents
*   **Specialize behavior** with focused system prompts for specific domains
*   **Control costs** by routing tasks to faster, cheaper models like Haiku

Claude uses each subagent’s description to decide when to delegate tasks. When you create a subagent, write a clear description so Claude knows when to use it.Claude Code includes several built-in subagents like **Explore**, **Plan**, and **general-purpose**. You can also create custom subagents to handle specific tasks. This page covers the [built-in subagents](http://code.claude.com/docs/en/sub-agents#built-in-subagents), [how to create your own](http://code.claude.com/docs/en/sub-agents#quickstart-create-your-first-subagent), [full configuration options](http://code.claude.com/docs/en/sub-agents#configure-subagents), [patterns for working with subagents](http://code.claude.com/docs/en/sub-agents#work-with-subagents), and [example subagents](http://code.claude.com/docs/en/sub-agents#example-subagents).
