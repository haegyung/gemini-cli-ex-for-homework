---
domain_id: "agent-skills"
source_id: "openai-codex-subagents"
section_index: "7"
section_title: "Process CSV batches with subagents (experimental)"
source_url: "https://developers.openai.com/codex/subagents"
reader_url: "https://r.jina.ai/http://developers.openai.com/codex/subagents"
captured_at: "2026-04-16T03:40:10+00:00"
---
## Process CSV batches with subagents (experimental)

This workflow is experimental and may change as subagent support evolves. Use `spawn_agents_on_csv` when you have many similar tasks that map to one row per work item. Codex reads the CSV, spawns one worker subagent per row, waits for the full batch to finish, and exports the combined results to CSV.

This works well for repeated audits such as:

*   reviewing one file, package, or service per row
*   checking a list of incidents, PRs, or migration targets
*   generating structured summaries for many similar inputs

The tool accepts:

*   `csv_path` for the source CSV
*   `instruction` for the worker prompt template, using `{column_name}` placeholders
*   `id_column` when you want stable item ids from a specific column
*   `output_schema` when each worker should return a JSON object with a fixed shape
*   `output_csv_path`, `max_concurrency`, and `max_runtime_seconds` for job control

Each worker must call `report_agent_job_result` exactly once. If a worker exits without reporting a result, Codex marks that row with an error in the exported CSV.

Example prompt:

```
Create /tmp/components.csv with columns path,owner and one row per frontend component.

Then call spawn_agents_on_csv with:
- csv_path: /tmp/components.csv
- id_column: path
- instruction: "Review {path} owned by {owner}. Return JSON with keys path, risk, summary, and follow_up via report_agent_job_result."
- output_csv_path: /tmp/components-review.csv
- output_schema: an object with required string fields path, risk, summary, and follow_up
```

When you run this through `codex exec`, Codex shows a single-line progress update on `stderr` while the batch is running. The exported CSV includes the original row data plus metadata such as `job_id`, `item_id`, `status`, `last_error`, and `result_json`.

Related runtime settings:

*   `agents.max_threads` caps how many agent threads can stay open concurrently.
*   `agents.job_max_runtime_seconds` sets the default per-worker timeout for CSV fan-out jobs. A per-call `max_runtime_seconds` override takes precedence.
*   `sqlite_home` controls where Codex stores the SQLite-backed state used for agent jobs and their exported results.

#### Example 2: Frontend integration debugging

This pattern is useful for UI regressions, flaky browser flows, or integration bugs that cross application code and the running product.

Project config (`.codex/config.toml`):

```
[agents]
max_threads = 6
max_depth = 1
```

`.codex/agents/code-mapper.toml`:

```
name = "code_mapper"
description = "Read-only codebase explorer for locating the relevant frontend and backend code paths."
model = "gpt-5.4-mini"
model_reasoning_effort = "medium"
sandbox_mode = "read-only"
developer_instructions = """
Map the code that owns the failing UI flow.
Identify entry points, state transitions, and likely files before the worker starts editing.
"""
```

`.codex/agents/browser-debugger.toml`:

```
name = "browser_debugger"
description = "UI debugger that uses browser tooling to reproduce issues and capture evidence."
model = "gpt-5.4"
model_reasoning_effort = "high"
sandbox_mode = "workspace-write"
developer_instructions = """
Reproduce the issue in the browser, capture exact steps, and report what the UI actually does.
Use browser tooling for screenshots, console output, and network evidence.
Do not edit application code.
"""

[mcp_servers.chrome_devtools]
url = "http://localhost:3000/mcp"
startup_timeout_sec = 20
```

`.codex/agents/ui-fixer.toml`:

```
name = "ui_fixer"
description = "Implementation-focused agent for small, targeted fixes after the issue is understood."
model = "gpt-5.3-codex-spark"
model_reasoning_effort = "medium"
developer_instructions = """
Own the fix once the issue is reproduced.
Make the smallest defensible change, keep unrelated files untouched, and validate only the behavior you changed.
"""

[[skills.config]]
path = "/Users/me/.agents/skills/docs-editor/SKILL.md"
enabled = false
```

This setup works well for prompts like:

`Investigate why the settings modal fails to save. Have browser_debugger reproduce it, code_mapper trace the responsible code path, and ui_fixer implement the smallest fix once the failure mode is clear.`
