---
domain_id: "agent-skills"
source_id: "claude-code-subagents"
section_index: "2"
section_title: "[​](http://code.claude.com/docs/en/sub-agents#quickstart-create-your-first-subagent)"
source_url: "https://code.claude.com/docs/en/sub-agents"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/sub-agents"
captured_at: "2026-04-16T03:40:12+00:00"
---
## [​](http://code.claude.com/docs/en/sub-agents#quickstart-create-your-first-subagent)

Quickstart: create your first subagent

Subagents are defined in Markdown files with YAML frontmatter. You can [create them manually](http://code.claude.com/docs/en/sub-agents#write-subagent-files) or use the `/agents` command.This walkthrough guides you through creating a user-level subagent with the `/agents` command. The subagent reviews code and suggests improvements for the codebase.

1

[](http://code.claude.com/docs/en/sub-agents#)

Open the subagents interface

In Claude Code, run:

```
/agents
```

2

[](http://code.claude.com/docs/en/sub-agents#)

Choose a location

Switch to the **Library** tab, select **Create new agent**, then choose **Personal**. This saves the subagent to `~/.claude/agents/` so it’s available in all your projects.

3

[](http://code.claude.com/docs/en/sub-agents#)

Generate with Claude

Select **Generate with Claude**. When prompted, describe the subagent:

```
A code improvement agent that scans files and suggests improvements
for readability, performance, and best practices. It should explain
each issue, show the current code, and provide an improved version.
```

Claude generates the identifier, description, and system prompt for you.

4

[](http://code.claude.com/docs/en/sub-agents#)

Select tools

For a read-only reviewer, deselect everything except **Read-only tools**. If you keep all tools selected, the subagent inherits all tools available to the main conversation.

5

[](http://code.claude.com/docs/en/sub-agents#)

Select model

Choose which model the subagent uses. For this example agent, select **Sonnet**, which balances capability and speed for analyzing code patterns.

6

[](http://code.claude.com/docs/en/sub-agents#)

Choose a color

Pick a background color for the subagent. This helps you identify which subagent is running in the UI.

7

[](http://code.claude.com/docs/en/sub-agents#)

Configure memory

Select **User scope** to give the subagent a [persistent memory directory](http://code.claude.com/docs/en/sub-agents#enable-persistent-memory) at `~/.claude/agent-memory/`. The subagent uses this to accumulate insights across conversations, such as codebase patterns and recurring issues. Select **None** if you don’t want the subagent to persist learnings.

8

[](http://code.claude.com/docs/en/sub-agents#)

Save and try it out

Review the configuration summary. Press `s` or `Enter` to save, or press `e` to save and edit the file in your editor. The subagent is available immediately. Try it:

```
Use the code-improver agent to suggest improvements in this project
```

Claude delegates to your new subagent, which scans the codebase and returns improvement suggestions.

You now have a subagent you can use in any project on your machine to analyze codebases and suggest improvements.You can also create subagents manually as Markdown files, define them via CLI flags, or distribute them through plugins. The following sections cover all configuration options.
