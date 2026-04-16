---
domain_id: "agent-skills"
source_id: "claude-code-subagents"
section_index: "3"
section_title: "[​](http://code.claude.com/docs/en/sub-agents#configure-subagents)"
source_url: "https://code.claude.com/docs/en/sub-agents"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/sub-agents"
captured_at: "2026-04-16T03:40:12+00:00"
---
## [​](http://code.claude.com/docs/en/sub-agents#configure-subagents)

Configure subagents

### [​](http://code.claude.com/docs/en/sub-agents#use-the-/agents-command)

Use the /agents command

The `/agents` command opens a tabbed interface for managing subagents. The **Running** tab shows live subagents and lets you open or stop them. The **Library** tab lets you:
*   View all available subagents (built-in, user, project, and plugin)
*   Create new subagents with guided setup or Claude generation
*   Edit existing subagent configuration and tool access
*   Delete custom subagents
*   See which subagents are active when duplicates exist

This is the recommended way to create and manage subagents. For manual creation or automation, you can also add subagent files directly.To list all configured subagents from the command line without starting an interactive session, run `claude agents`. This shows agents grouped by source and indicates which are overridden by higher-priority definitions.
### [​](http://code.claude.com/docs/en/sub-agents#choose-the-subagent-scope)

Choose the subagent scope

Subagents are Markdown files with YAML frontmatter. Store them in different locations depending on scope. When multiple subagents share the same name, the higher-priority location wins.

| Location | Scope | Priority | How to create |
| --- | --- | --- | --- |
| Managed settings | Organization-wide | 1 (highest) | Deployed via [managed settings](http://code.claude.com/docs/en/settings) |
| `--agents` CLI flag | Current session | 2 | Pass JSON when launching Claude Code |
| `.claude/agents/` | Current project | 3 | Interactive or manual |
| `~/.claude/agents/` | All your projects | 4 | Interactive or manual |
| Plugin’s `agents/` directory | Where plugin is enabled | 5 (lowest) | Installed with [plugins](http://code.claude.com/docs/en/plugins) |

**Project subagents** (`.claude/agents/`) are ideal for subagents specific to a codebase. Check them into version control so your team can use and improve them collaboratively.Project subagents are discovered by walking up from the current working directory. Directories added with `--add-dir`[grant file access only](http://code.claude.com/docs/en/permissions#additional-directories-grant-file-access-not-configuration) and are not scanned for subagents. To share subagents across projects, use `~/.claude/agents/` or a [plugin](http://code.claude.com/docs/en/plugins).**User subagents** (`~/.claude/agents/`) are personal subagents available in all your projects.**CLI-defined subagents** are passed as JSON when launching Claude Code. They exist only for that session and aren’t saved to disk, making them useful for quick testing or automation scripts. You can define multiple subagents in a single `--agents` call:

```
claude --agents '{
  "code-reviewer": {
    "description": "Expert code reviewer. Use proactively after code changes.",
    "prompt": "You are a senior code reviewer. Focus on code quality, security, and best practices.",
    "tools": ["Read", "Grep", "Glob", "Bash"],
    "model": "sonnet"
  },
  "debugger": {
    "description": "Debugging specialist for errors and test failures.",
    "prompt": "You are an expert debugger. Analyze errors, identify root causes, and provide fixes."
  }
}'
```

The `--agents` flag accepts JSON with the same [frontmatter](http://code.claude.com/docs/en/sub-agents#supported-frontmatter-fields) fields as file-based subagents: `description`, `prompt`, `tools`, `disallowedTools`, `model`, `permissionMode`, `mcpServers`, `hooks`, `maxTurns`, `skills`, `initialPrompt`, `memory`, `effort`, `background`, `isolation`, and `color`. Use `prompt` for the system prompt, equivalent to the markdown body in file-based subagents.**Managed subagents** are deployed by organization administrators. Place markdown files in `.claude/agents/` inside the [managed settings directory](http://code.claude.com/docs/en/settings#settings-files), using the same frontmatter format as project and user subagents. Managed definitions take precedence over project and user subagents with the same name.**Plugin subagents** come from [plugins](http://code.claude.com/docs/en/plugins) you’ve installed. They appear in `/agents` alongside your custom subagents. See the [plugin components reference](http://code.claude.com/docs/en/plugins-reference#agents) for details on creating plugin subagents.

For security reasons, plugin subagents do not support the `hooks`, `mcpServers`, or `permissionMode` frontmatter fields. These fields are ignored when loading agents from a plugin. If you need them, copy the agent file into `.claude/agents/` or `~/.claude/agents/`. You can also add rules to [`permissions.allow`](http://code.claude.com/docs/en/settings#permission-settings) in `settings.json` or `settings.local.json`, but these rules apply to the entire session, not just the plugin subagent.

Subagent definitions from any of these scopes are also available to [agent teams](http://code.claude.com/docs/en/agent-teams#use-subagent-definitions-for-teammates): when spawning a teammate, you can reference a subagent type and the teammate uses its `tools` and `model`, with the definition’s body appended to the teammate’s system prompt as additional instructions. See [agent teams](http://code.claude.com/docs/en/agent-teams#use-subagent-definitions-for-teammates) for which frontmatter fields apply on that path.
### [​](http://code.claude.com/docs/en/sub-agents#write-subagent-files)

Write subagent files

Subagent files use YAML frontmatter for configuration, followed by the system prompt in Markdown:

Subagents are loaded at session start. If you create a subagent by manually adding a file, restart your session or use `/agents` to load it immediately.

```
---
name: code-reviewer
description: Reviews code for quality and best practices
tools: Read, Glob, Grep
model: sonnet
---

You are a code reviewer. When invoked, analyze the code and provide
specific, actionable feedback on quality, security, and best practices.
```

The frontmatter defines the subagent’s metadata and configuration. The body becomes the system prompt that guides the subagent’s behavior. Subagents receive only this system prompt (plus basic environment details like working directory), not the full Claude Code system prompt.A subagent starts in the main conversation’s current working directory. Within a subagent, `cd` commands do not persist between Bash or PowerShell tool calls and do not affect the main conversation’s working directory. To give the subagent an isolated copy of the repository instead, set [`isolation: worktree`](http://code.claude.com/docs/en/sub-agents#supported-frontmatter-fields).
#### [​](http://code.claude.com/docs/en/sub-agents#supported-frontmatter-fields)

Supported frontmatter fields

The following fields can be used in the YAML frontmatter. Only `name` and `description` are required.

| Field | Required | Description |
| --- | --- | --- |
| `name` | Yes | Unique identifier using lowercase letters and hyphens |
| `description` | Yes | When Claude should delegate to this subagent |
| `tools` | No | [Tools](http://code.claude.com/docs/en/sub-agents#available-tools) the subagent can use. Inherits all tools if omitted |
| `disallowedTools` | No | Tools to deny, removed from inherited or specified list |
| `model` | No | [Model](http://code.claude.com/docs/en/sub-agents#choose-a-model) to use: `sonnet`, `opus`, `haiku`, a full model ID (for example, `claude-opus-4-6`), or `inherit`. Defaults to `inherit` |
| `permissionMode` | No | [Permission mode](http://code.claude.com/docs/en/sub-agents#permission-modes): `default`, `acceptEdits`, `auto`, `dontAsk`, `bypassPermissions`, or `plan` |
| `maxTurns` | No | Maximum number of agentic turns before the subagent stops |
| `skills` | No | [Skills](http://code.claude.com/docs/en/skills) to load into the subagent’s context at startup. The full skill content is injected, not just made available for invocation. Subagents don’t inherit skills from the parent conversation |
| `mcpServers` | No | [MCP servers](http://code.claude.com/docs/en/mcp) available to this subagent. Each entry is either a server name referencing an already-configured server (e.g., `"slack"`) or an inline definition with the server name as key and a full [MCP server config](http://code.claude.com/docs/en/mcp#installing-mcp-servers) as value |
| `hooks` | No | [Lifecycle hooks](http://code.claude.com/docs/en/sub-agents#define-hooks-for-subagents) scoped to this subagent |
| `memory` | No | [Persistent memory scope](http://code.claude.com/docs/en/sub-agents#enable-persistent-memory): `user`, `project`, or `local`. Enables cross-session learning |
| `background` | No | Set to `true` to always run this subagent as a [background task](http://code.claude.com/docs/en/sub-agents#run-subagents-in-foreground-or-background). Default: `false` |
| `effort` | No | Effort level when this subagent is active. Overrides the session effort level. Default: inherits from session. Options: `low`, `medium`, `high`, `max` (Opus 4.6 only) |
| `isolation` | No | Set to `worktree` to run the subagent in a temporary [git worktree](http://code.claude.com/docs/en/common-workflows#run-parallel-claude-code-sessions-with-git-worktrees), giving it an isolated copy of the repository. The worktree is automatically cleaned up if the subagent makes no changes |
| `color` | No | Display color for the subagent in the task list and transcript. Accepts `red`, `blue`, `green`, `yellow`, `purple`, `orange`, `pink`, or `cyan` |
| `initialPrompt` | No | Auto-submitted as the first user turn when this agent runs as the main session agent (via `--agent` or the `agent` setting). [Commands](http://code.claude.com/docs/en/commands) and [skills](http://code.claude.com/docs/en/skills) are processed. Prepended to any user-provided prompt |

### [​](http://code.claude.com/docs/en/sub-agents#choose-a-model)

Choose a model

The `model` field controls which [AI model](http://code.claude.com/docs/en/model-config) the subagent uses:
*   **Model alias**: Use one of the available aliases: `sonnet`, `opus`, or `haiku`
*   **Full model ID**: Use a full model ID such as `claude-opus-4-6` or `claude-sonnet-4-6`. Accepts the same values as the `--model` flag
*   **inherit**: Use the same model as the main conversation
*   **Omitted**: If not specified, defaults to `inherit` (uses the same model as the main conversation)

When Claude invokes a subagent, it can also pass a `model` parameter for that specific invocation. Claude Code resolves the subagent’s model in this order:
1.   The [`CLAUDE_CODE_SUBAGENT_MODEL`](http://code.claude.com/docs/en/model-config#environment-variables) environment variable, if set
2.   The per-invocation `model` parameter
3.   The subagent definition’s `model` frontmatter
4.   The main conversation’s model

### [​](http://code.claude.com/docs/en/sub-agents#control-subagent-capabilities)

Control subagent capabilities

You can control what subagents can do through tool access, permission modes, and conditional rules.
#### [​](http://code.claude.com/docs/en/sub-agents#available-tools)

Available tools

Subagents can use any of Claude Code’s [internal tools](http://code.claude.com/docs/en/tools-reference). By default, subagents inherit all tools from the main conversation, including MCP tools.To restrict tools, use either the `tools` field (allowlist) or the `disallowedTools` field (denylist). This example uses `tools` to exclusively allow Read, Grep, Glob, and Bash. The subagent can’t edit files, write files, or use any MCP tools:

```
---
name: safe-researcher
description: Research agent with restricted capabilities
tools: Read, Grep, Glob, Bash
---
```

This example uses `disallowedTools` to inherit every tool from the main conversation except Write and Edit. The subagent keeps Bash, MCP tools, and everything else:

```
---
name: no-writes
description: Inherits every tool except file writes
disallowedTools: Write, Edit
---
```

If both are set, `disallowedTools` is applied first, then `tools` is resolved against the remaining pool. A tool listed in both is removed.
#### [​](http://code.claude.com/docs/en/sub-agents#restrict-which-subagents-can-be-spawned)

Restrict which subagents can be spawned

When an agent runs as the main thread with `claude --agent`, it can spawn subagents using the Agent tool. To restrict which subagent types it can spawn, use `Agent(agent_type)` syntax in the `tools` field.

In version 2.1.63, the Task tool was renamed to Agent. Existing `Task(...)` references in settings and agent definitions still work as aliases.

```
---
name: coordinator
description: Coordinates work across specialized agents
tools: Agent(worker, researcher), Read, Bash
---
```

This is an allowlist: only the `worker` and `researcher` subagents can be spawned. If the agent tries to spawn any other type, the request fails and the agent sees only the allowed types in its prompt. To block specific agents while allowing all others, use [`permissions.deny`](http://code.claude.com/docs/en/sub-agents#disable-specific-subagents) instead.To allow spawning any subagent without restrictions, use `Agent` without parentheses:

```
tools: Agent, Read, Bash
```

If `Agent` is omitted from the `tools` list entirely, the agent cannot spawn any subagents. This restriction only applies to agents running as the main thread with `claude --agent`. Subagents cannot spawn other subagents, so `Agent(agent_type)` has no effect in subagent definitions.
#### [​](http://code.claude.com/docs/en/sub-agents#scope-mcp-servers-to-a-subagent)

Scope MCP servers to a subagent

Use the `mcpServers` field to give a subagent access to [MCP](http://code.claude.com/docs/en/mcp) servers that aren’t available in the main conversation. Inline servers defined here are connected when the subagent starts and disconnected when it finishes. String references share the parent session’s connection.Each entry in the list is either an inline server definition or a string referencing an MCP server already configured in your session:

```
---
name: browser-tester
description: Tests features in a real browser using Playwright
mcpServers:
  # Inline definition: scoped to this subagent only
  - playwright:
      type: stdio
      command: npx
      args: ["-y", "@playwright/mcp@latest"]
  # Reference by name: reuses an already-configured server
  - github
---

Use the Playwright tools to navigate, screenshot, and interact with pages.
```

Inline definitions use the same schema as `.mcp.json` server entries (`stdio`, `http`, `sse`, `ws`), keyed by the server name.To keep an MCP server out of the main conversation entirely and avoid its tool descriptions consuming context there, define it inline here rather than in `.mcp.json`. The subagent gets the tools; the parent conversation does not.
#### [​](http://code.claude.com/docs/en/sub-agents#permission-modes)

Permission modes

The `permissionMode` field controls how the subagent handles permission prompts. Subagents inherit the permission context from the main conversation and can override the mode, except when the parent mode takes precedence as described below.

| Mode | Behavior |
| --- | --- |
| `default` | Standard permission checking with prompts |
| `acceptEdits` | Auto-accept file edits and common filesystem commands for paths in the working directory or `additionalDirectories` |
| `auto` | [Auto mode](http://code.claude.com/docs/en/permission-modes#eliminate-prompts-with-auto-mode): a background classifier reviews commands and protected-directory writes |
| `dontAsk` | Auto-deny permission prompts (explicitly allowed tools still work) |
| `bypassPermissions` | Skip permission prompts |
| `plan` | Plan mode (read-only exploration) |

Use `bypassPermissions` with caution. It skips permission prompts, allowing the subagent to execute operations without approval. Writes to `.git`, `.claude`, `.vscode`, `.idea`, and `.husky` directories still prompt for confirmation, except for `.claude/commands`, `.claude/agents`, and `.claude/skills`. See [permission modes](http://code.claude.com/docs/en/permission-modes#skip-all-checks-with-bypasspermissions-mode) for details.

If the parent uses `bypassPermissions`, this takes precedence and cannot be overridden. If the parent uses [auto mode](http://code.claude.com/docs/en/permission-modes#eliminate-prompts-with-auto-mode), the subagent inherits auto mode and any `permissionMode` in its frontmatter is ignored: the classifier evaluates the subagent’s tool calls with the same block and allow rules as the parent session.
#### [​](http://code.claude.com/docs/en/sub-agents#preload-skills-into-subagents)

Preload skills into subagents

Use the `skills` field to inject skill content into a subagent’s context at startup. This gives the subagent domain knowledge without requiring it to discover and load skills during execution.

```
---
name: api-developer
description: Implement API endpoints following team conventions
skills:
  - api-conventions
  - error-handling-patterns
---

Implement API endpoints. Follow the conventions and patterns from the preloaded skills.
```

The full content of each skill is injected into the subagent’s context, not just made available for invocation. Subagents don’t inherit skills from the parent conversation; you must list them explicitly.

This is the inverse of [running a skill in a subagent](http://code.claude.com/docs/en/skills#run-skills-in-a-subagent). With `skills` in a subagent, the subagent controls the system prompt and loads skill content. With `context: fork` in a skill, the skill content is injected into the agent you specify. Both use the same underlying system.

#### [​](http://code.claude.com/docs/en/sub-agents#enable-persistent-memory)

Enable persistent memory

The `memory` field gives the subagent a persistent directory that survives across conversations. The subagent uses this directory to build up knowledge over time, such as codebase patterns, debugging insights, and architectural decisions.

```
---
name: code-reviewer
description: Reviews code for quality and best practices
memory: user
---

You are a code reviewer. As you review code, update your agent memory with
patterns, conventions, and recurring issues you discover.
```

Choose a scope based on how broadly the memory should apply:

| Scope | Location | Use when |
| --- | --- | --- |
| `user` | `~/.claude/agent-memory/<name-of-agent>/` | the subagent should remember learnings across all projects |
| `project` | `.claude/agent-memory/<name-of-agent>/` | the subagent’s knowledge is project-specific and shareable via version control |
| `local` | `.claude/agent-memory-local/<name-of-agent>/` | the subagent’s knowledge is project-specific but should not be checked into version control |

When memory is enabled:
*   The subagent’s system prompt includes instructions for reading and writing to the memory directory.
*   The subagent’s system prompt also includes the first 200 lines or 25KB of `MEMORY.md` in the memory directory, whichever comes first, with instructions to curate `MEMORY.md` if it exceeds that limit.
*   Read, Write, and Edit tools are automatically enabled so the subagent can manage its memory files.

##### Persistent memory tips

*   `project` is the recommended default scope. It makes subagent knowledge shareable via version control. Use `user` when the subagent’s knowledge is broadly applicable across projects, or `local` when the knowledge should not be checked into version control.
*   Ask the subagent to consult its memory before starting work: “Review this PR, and check your memory for patterns you’ve seen before.”
*   Ask the subagent to update its memory after completing a task: “Now that you’re done, save what you learned to your memory.” Over time, this builds a knowledge base that makes the subagent more effective.
*   Include memory instructions directly in the subagent’s markdown file so it proactively maintains its own knowledge base:    ```
Update your agent memory as you discover codepaths, patterns, library
locations, and key architectural decisions. This builds up institutional
knowledge across conversations. Write concise notes about what you found
and where.
```    

#### [​](http://code.claude.com/docs/en/sub-agents#conditional-rules-with-hooks)

Conditional rules with hooks

For more dynamic control over tool usage, use `PreToolUse` hooks to validate operations before they execute. This is useful when you need to allow some operations of a tool while blocking others.This example creates a subagent that only allows read-only database queries. The `PreToolUse` hook runs the script specified in `command` before each Bash command executes:

```
---
name: db-reader
description: Execute read-only database queries
tools: Bash
hooks:
  PreToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "./scripts/validate-readonly-query.sh"
---
```

Claude Code [passes hook input as JSON](http://code.claude.com/docs/en/hooks#pretooluse-input) via stdin to hook commands. The validation script reads this JSON, extracts the Bash command, and [exits with code 2](http://code.claude.com/docs/en/hooks#exit-code-2-behavior-per-event) to block write operations:

```
#!/bin/bash
# ./scripts/validate-readonly-query.sh

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Block SQL write operations (case-insensitive)
if echo "$COMMAND" | grep -iE '\b(INSERT|UPDATE|DELETE|DROP|CREATE|ALTER|TRUNCATE)\b' > /dev/null; then
  echo "Blocked: Only SELECT queries are allowed" >&2
  exit 2
fi

exit 0
```

See [Hook input](http://code.claude.com/docs/en/hooks#pretooluse-input) for the complete input schema and [exit codes](http://code.claude.com/docs/en/hooks#exit-code-output) for how exit codes affect behavior.
#### [​](http://code.claude.com/docs/en/sub-agents#disable-specific-subagents)

Disable specific subagents

You can prevent Claude from using specific subagents by adding them to the `deny` array in your [settings](http://code.claude.com/docs/en/settings#permission-settings). Use the format `Agent(subagent-name)` where `subagent-name` matches the subagent’s name field.

```
{
  "permissions": {
    "deny": ["Agent(Explore)", "Agent(my-custom-agent)"]
  }
}
```

This works for both built-in and custom subagents. You can also use the `--disallowedTools` CLI flag:

```
claude --disallowedTools "Agent(Explore)"
```

See [Permissions documentation](http://code.claude.com/docs/en/permissions#tool-specific-permission-rules) for more details on permission rules.
### [​](http://code.claude.com/docs/en/sub-agents#define-hooks-for-subagents)

Define hooks for subagents

Subagents can define [hooks](http://code.claude.com/docs/en/hooks) that run during the subagent’s lifecycle. There are two ways to configure hooks:
1.   **In the subagent’s frontmatter**: Define hooks that run only while that subagent is active
2.   **In `settings.json`**: Define hooks that run in the main session when subagents start or stop

#### [​](http://code.claude.com/docs/en/sub-agents#hooks-in-subagent-frontmatter)

Hooks in subagent frontmatter

Define hooks directly in the subagent’s markdown file. These hooks only run while that specific subagent is active and are cleaned up when it finishes.

Frontmatter hooks fire when the agent is spawned as a subagent through the Agent tool or an @-mention. They do not fire when the agent runs as the main session via [`--agent`](http://code.claude.com/docs/en/sub-agents#invoke-subagents-explicitly) or the `agent` setting. For session-wide hooks, configure them in [`settings.json`](http://code.claude.com/docs/en/hooks).

All [hook events](http://code.claude.com/docs/en/hooks#hook-events) are supported. The most common events for subagents are:

| Event | Matcher input | When it fires |
| --- | --- | --- |
| `PreToolUse` | Tool name | Before the subagent uses a tool |
| `PostToolUse` | Tool name | After the subagent uses a tool |
| `Stop` | (none) | When the subagent finishes (converted to `SubagentStop` at runtime) |

This example validates Bash commands with the `PreToolUse` hook and runs a linter after file edits with `PostToolUse`:

```
---
name: code-reviewer
description: Review code changes with automatic linting
hooks:
  PreToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "./scripts/validate-command.sh $TOOL_INPUT"
  PostToolUse:
    - matcher: "Edit|Write"
      hooks:
        - type: command
          command: "./scripts/run-linter.sh"
---
```

`Stop` hooks in frontmatter are automatically converted to `SubagentStop` events.
#### [​](http://code.claude.com/docs/en/sub-agents#project-level-hooks-for-subagent-events)

Project-level hooks for subagent events

Configure hooks in `settings.json` that respond to subagent lifecycle events in the main session.

| Event | Matcher input | When it fires |
| --- | --- | --- |
| `SubagentStart` | Agent type name | When a subagent begins execution |
| `SubagentStop` | Agent type name | When a subagent completes |

Both events support matchers to target specific agent types by name. This example runs a setup script only when the `db-agent` subagent starts, and a cleanup script when any subagent stops:

```
{
  "hooks": {
    "SubagentStart": [
      {
        "matcher": "db-agent",
        "hooks": [
          { "type": "command", "command": "./scripts/setup-db-connection.sh" }
        ]
      }
    ],
    "SubagentStop": [
      {
        "hooks": [
          { "type": "command", "command": "./scripts/cleanup-db-connection.sh" }
        ]
      }
    ]
  }
}
```

See [Hooks](http://code.claude.com/docs/en/hooks) for the complete hook configuration format.
