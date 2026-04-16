---
domain_id: "agent-skills"
source_id: "claude-code-subagents"
section_index: "4"
section_title: "[​](http://code.claude.com/docs/en/sub-agents#work-with-subagents)"
source_url: "https://code.claude.com/docs/en/sub-agents"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/sub-agents"
captured_at: "2026-04-16T03:40:12+00:00"
---
## [​](http://code.claude.com/docs/en/sub-agents#work-with-subagents)

Work with subagents

### [​](http://code.claude.com/docs/en/sub-agents#understand-automatic-delegation)

Understand automatic delegation

Claude automatically delegates tasks based on the task description in your request, the `description` field in subagent configurations, and current context. To encourage proactive delegation, include phrases like “use proactively” in your subagent’s description field.
### [​](http://code.claude.com/docs/en/sub-agents#invoke-subagents-explicitly)

Invoke subagents explicitly

When automatic delegation isn’t enough, you can request a subagent yourself. Three patterns escalate from a one-off suggestion to a session-wide default:
*   **Natural language**: name the subagent in your prompt; Claude decides whether to delegate
*   **@-mention**: guarantees the subagent runs for one task
*   **Session-wide**: the whole session uses that subagent’s system prompt, tool restrictions, and model via the `--agent` flag or the `agent` setting

For natural language, there’s no special syntax. Name the subagent and Claude typically delegates:

```
Use the test-runner subagent to fix failing tests
Have the code-reviewer subagent look at my recent changes
```

**@-mention the subagent.** Type `@` and pick the subagent from the typeahead, the same way you @-mention files. This ensures that specific subagent runs rather than leaving the choice to Claude:

```
@"code-reviewer (agent)" look at the auth changes
```

Your full message still goes to Claude, which writes the subagent’s task prompt based on what you asked. The @-mention controls which subagent Claude invokes, not what prompt it receives.Subagents provided by an enabled [plugin](http://code.claude.com/docs/en/plugins) appear in the typeahead as `<plugin-name>:<agent-name>`. Named background subagents currently running in the session also appear in the typeahead, showing their status next to the name. You can also type the mention manually without using the picker: `@agent-<name>` for local subagents, or `@agent-<plugin-name>:<agent-name>` for plugin subagents.**Run the whole session as a subagent.** Pass [`--agent <name>`](http://code.claude.com/docs/en/cli-reference) to start a session where the main thread itself takes on that subagent’s system prompt, tool restrictions, and model:

```
claude --agent code-reviewer
```

The subagent’s system prompt replaces the default Claude Code system prompt entirely, the same way [`--system-prompt`](http://code.claude.com/docs/en/cli-reference) does. `CLAUDE.md` files and project memory still load through the normal message flow. The agent name appears as `@<name>` in the startup header so you can confirm it’s active.This works with built-in and custom subagents, and the choice persists when you resume the session.For a plugin-provided subagent, pass the scoped name: `claude --agent <plugin-name>:<agent-name>`.To make it the default for every session in a project, set `agent` in `.claude/settings.json`:

```
{
  "agent": "code-reviewer"
}
```

The CLI flag overrides the setting if both are present.
### [​](http://code.claude.com/docs/en/sub-agents#run-subagents-in-foreground-or-background)

Run subagents in foreground or background

Subagents can run in the foreground (blocking) or background (concurrent):
*   **Foreground subagents** block the main conversation until complete. Permission prompts and clarifying questions (like [`AskUserQuestion`](http://code.claude.com/docs/en/tools-reference)) are passed through to you.
*   **Background subagents** run concurrently while you continue working. Before launching, Claude Code prompts for any tool permissions the subagent will need, ensuring it has the necessary approvals upfront. Once running, the subagent inherits these permissions and auto-denies anything not pre-approved. If a background subagent needs to ask clarifying questions, that tool call fails but the subagent continues.

If a background subagent fails due to missing permissions, you can start a new foreground subagent with the same task to retry with interactive prompts.Claude decides whether to run subagents in the foreground or background based on the task. You can also:
*   Ask Claude to “run this in the background”
*   Press **Ctrl+B** to background a running task

To disable all background task functionality, set the `CLAUDE_CODE_DISABLE_BACKGROUND_TASKS` environment variable to `1`. See [Environment variables](http://code.claude.com/docs/en/env-vars).
### [​](http://code.claude.com/docs/en/sub-agents#common-patterns)

Common patterns

#### [​](http://code.claude.com/docs/en/sub-agents#isolate-high-volume-operations)

Isolate high-volume operations

One of the most effective uses for subagents is isolating operations that produce large amounts of output. Running tests, fetching documentation, or processing log files can consume significant context. By delegating these to a subagent, the verbose output stays in the subagent’s context while only the relevant summary returns to your main conversation.

```
Use a subagent to run the test suite and report only the failing tests with their error messages
```

#### [​](http://code.claude.com/docs/en/sub-agents#run-parallel-research)

Run parallel research

For independent investigations, spawn multiple subagents to work simultaneously:

```
Research the authentication, database, and API modules in parallel using separate subagents
```

Each subagent explores its area independently, then Claude synthesizes the findings. This works best when the research paths don’t depend on each other.

When subagents complete, their results return to your main conversation. Running many subagents that each return detailed results can consume significant context.

For tasks that need sustained parallelism or exceed your context window, [agent teams](http://code.claude.com/docs/en/agent-teams) give each worker its own independent context.
#### [​](http://code.claude.com/docs/en/sub-agents#chain-subagents)

Chain subagents

For multi-step workflows, ask Claude to use subagents in sequence. Each subagent completes its task and returns results to Claude, which then passes relevant context to the next subagent.

```
Use the code-reviewer subagent to find performance issues, then use the optimizer subagent to fix them
```

### [​](http://code.claude.com/docs/en/sub-agents#choose-between-subagents-and-main-conversation)

Choose between subagents and main conversation

Use the **main conversation** when:
*   The task needs frequent back-and-forth or iterative refinement
*   Multiple phases share significant context (planning → implementation → testing)
*   You’re making a quick, targeted change
*   Latency matters. Subagents start fresh and may need time to gather context

Use **subagents** when:
*   The task produces verbose output you don’t need in your main context
*   You want to enforce specific tool restrictions or permissions
*   The work is self-contained and can return a summary

Consider [Skills](http://code.claude.com/docs/en/skills) instead when you want reusable prompts or workflows that run in the main conversation context rather than isolated subagent context.For a quick question about something already in your conversation, use [`/btw`](http://code.claude.com/docs/en/interactive-mode#side-questions-with-btw) instead of a subagent. It sees your full context but has no tool access, and the answer is discarded rather than added to history.

Subagents cannot spawn other subagents. If your workflow requires nested delegation, use [Skills](http://code.claude.com/docs/en/skills) or [chain subagents](http://code.claude.com/docs/en/sub-agents#chain-subagents) from the main conversation.

### [​](http://code.claude.com/docs/en/sub-agents#manage-subagent-context)

Manage subagent context

#### [​](http://code.claude.com/docs/en/sub-agents#resume-subagents)

Resume subagents

Each subagent invocation creates a new instance with fresh context. To continue an existing subagent’s work instead of starting over, ask Claude to resume it.Resumed subagents retain their full conversation history, including all previous tool calls, results, and reasoning. The subagent picks up exactly where it stopped rather than starting fresh.When a subagent completes, Claude receives its agent ID. Claude uses the `SendMessage` tool with the agent’s ID as the `to` field to resume it. The `SendMessage` tool is only available when [agent teams](http://code.claude.com/docs/en/agent-teams) are enabled via `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`.To resume a subagent, ask Claude to continue the previous work:

```
Use the code-reviewer subagent to review the authentication module
[Agent completes]

Continue that code review and now analyze the authorization logic
[Claude resumes the subagent with full context from previous conversation]
```

If a stopped subagent receives a `SendMessage`, it auto-resumes in the background without requiring a new `Agent` invocation.You can also ask Claude for the agent ID if you want to reference it explicitly, or find IDs in the transcript files at `~/.claude/projects/{project}/{sessionId}/subagents/`. Each transcript is stored as `agent-{agentId}.jsonl`.Subagent transcripts persist independently of the main conversation:
*   **Main conversation compaction**: When the main conversation compacts, subagent transcripts are unaffected. They’re stored in separate files.
*   **Session persistence**: Subagent transcripts persist within their session. You can [resume a subagent](http://code.claude.com/docs/en/sub-agents#resume-subagents) after restarting Claude Code by resuming the same session.
*   **Automatic cleanup**: Transcripts are cleaned up based on the `cleanupPeriodDays` setting (default: 30 days).

#### [​](http://code.claude.com/docs/en/sub-agents#auto-compaction)

Auto-compaction

Subagents support automatic compaction using the same logic as the main conversation. By default, auto-compaction triggers at approximately 95% capacity. To trigger compaction earlier, set `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE` to a lower percentage (for example, `50`). See [environment variables](http://code.claude.com/docs/en/env-vars) for details.Compaction events are logged in subagent transcript files:

```
{
  "type": "system",
  "subtype": "compact_boundary",
  "compactMetadata": {
    "trigger": "auto",
    "preTokens": 167189
  }
}
```

The `preTokens` value shows how many tokens were used before compaction occurred.
