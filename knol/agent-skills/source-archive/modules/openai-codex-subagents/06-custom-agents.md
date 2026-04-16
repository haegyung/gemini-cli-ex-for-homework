---
domain_id: "agent-skills"
source_id: "openai-codex-subagents"
section_index: "6"
section_title: "Custom agents"
source_url: "https://developers.openai.com/codex/subagents"
reader_url: "https://r.jina.ai/http://developers.openai.com/codex/subagents"
captured_at: "2026-04-16T03:40:10+00:00"
---
## Custom agents

Codex ships with built-in agents:

*   `default`: general-purpose fallback agent.
*   `worker`: execution-focused agent for implementation and fixes.
*   `explorer`: read-heavy codebase exploration agent.

To define your own custom agents, add standalone TOML files under `~/.codex/agents/` for personal agents or `.codex/agents/` for project-scoped agents.

Each file defines one custom agent. Codex loads these files as configuration layers for spawned sessions, so custom agents can override the same settings as a normal Codex session config. That can feel heavier than a dedicated agent manifest, and the format may evolve as authoring and sharing mature.

Every standalone custom agent file must define:

*   `name`
*   `description`
*   `developer_instructions`

Optional fields such as `nickname_candidates`, `model`, `model_reasoning_effort`, `sandbox_mode`, `mcp_servers`, and `skills.config` inherit from the parent session when you omit them.

### Global settings

Global subagent settings still live under `[agents]` in your [configuration](http://developers.openai.com/codex/config-basic#configuration-precedence).

| Field | Type | Required | Purpose |
| --- | --- | --- | --- |
| `agents.max_threads` | number | No | Concurrent open agent thread cap. |
| `agents.max_depth` | number | No | Spawned agent nesting depth (root session starts at 0). |
| `agents.job_max_runtime_seconds` | number | No | Default timeout per worker for `spawn_agents_on_csv` jobs. |

**Notes:**

*   `agents.max_threads` defaults to `6` when you leave it unset.
*   `agents.max_depth` defaults to `1`, which allows a direct child agent to spawn but prevents deeper nesting. Keep the default unless you specifically need recursive delegation. Raising this value can turn broad delegation instructions into repeated fan-out, which increases token usage, latency, and local resource consumption. `agents.max_threads` still caps concurrent open threads, but it doesn’t remove the cost and predictability risks of deeper recursion.
*   `agents.job_max_runtime_seconds` is optional. When you leave it unset, `spawn_agents_on_csv` falls back to its per-call default timeout of 1800 seconds per worker.
*   If a custom agent name matches a built-in agent such as `explorer`, your custom agent takes precedence.

### Custom agent file schema

| Field | Type | Required | Purpose |
| --- | --- | --- | --- |
| `name` | string | Yes | Agent name Codex uses when spawning or referring to this agent. |
| `description` | string | Yes | Human-facing guidance for when Codex should use this agent. |
| `developer_instructions` | string | Yes | Core instructions that define the agent’s behavior. |
| `nickname_candidates` | string[] | No | Optional pool of display nicknames for spawned agents. |

You can also include other supported `config.toml` keys in a custom agent file, such as `model`, `model_reasoning_effort`, `sandbox_mode`, `mcp_servers`, and `skills.config`.

Codex identifies the custom agent by its `name` field. Matching the filename to the agent name is the simplest convention, but the `name` field is the source of truth.

### Display nicknames

Use `nickname_candidates` when you want Codex to assign more readable display names to spawned agents. This is especially helpful when you run many instances of the same custom agent and want the UI to show distinct labels instead of repeating the same agent name.

Nicknames are presentation-only. Codex still identifies and spawns the agent by its `name`.

Nickname candidates must be a non-empty list of unique names. Each nickname can use ASCII letters, digits, spaces, hyphens, and underscores.

Example:

```
name = "reviewer"
description = "PR reviewer focused on correctness, security, and missing tests."
developer_instructions = """
Review code like an owner.
Prioritize correctness, security, behavior regressions, and missing test coverage.
"""
nickname_candidates = ["Atlas", "Delta", "Echo"]
```

In practice, the Codex app and CLI can show the nicknames where agent activity appears, while the underlying agent type stays `reviewer`.

### Example custom agents

The best custom agents are narrow and opinionated. Give each one clear job, a tool surface that matches that job, and instructions that keep it from drifting into adjacent work.

#### Example 1: PR review

This pattern splits review across three focused custom agents:

*   `pr_explorer` maps the codebase and gathers evidence.
*   `reviewer` looks for correctness, security, and test risks.
*   `docs_researcher` checks framework or API documentation through a dedicated MCP server.

Project config (`.codex/config.toml`):

```
[agents]
max_threads = 6
max_depth = 1
```

`.codex/agents/pr-explorer.toml`:

```
name = "pr_explorer"
description = "Read-only codebase explorer for gathering evidence before changes are proposed."
model = "gpt-5.3-codex-spark"
model_reasoning_effort = "medium"
sandbox_mode = "read-only"
developer_instructions = """
Stay in exploration mode.
Trace the real execution path, cite files and symbols, and avoid proposing fixes unless the parent agent asks for them.
Prefer fast search and targeted file reads over broad scans.
"""
```

`.codex/agents/reviewer.toml`:

```
name = "reviewer"
description = "PR reviewer focused on correctness, security, and missing tests."
model = "gpt-5.4"
model_reasoning_effort = "high"
sandbox_mode = "read-only"
developer_instructions = """
Review code like an owner.
Prioritize correctness, security, behavior regressions, and missing test coverage.
Lead with concrete findings, include reproduction steps when possible, and avoid style-only comments unless they hide a real bug.
"""
```

`.codex/agents/docs-researcher.toml`:

```
name = "docs_researcher"
description = "Documentation specialist that uses the docs MCP server to verify APIs and framework behavior."
model = "gpt-5.4-mini"
model_reasoning_effort = "medium"
sandbox_mode = "read-only"
developer_instructions = """
Use the docs MCP server to confirm APIs, options, and version-specific behavior.
Return concise answers with links or exact references when available.
Do not make code changes.
"""

[mcp_servers.openaiDeveloperDocs]
url = "https://developers.openai.com/mcp"
```

This setup works well for prompts like:

`Review this branch against main. Have pr_explorer map the affected code paths, reviewer find real risks, and docs_researcher verify the framework APIs that the patch relies on.`
