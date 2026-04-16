---
domain_id: "agent-skills"
source_id: "claude-code-skills"
section_index: "8"
section_title: "Environment"
source_url: "https://code.claude.com/docs/en/skills"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/skills"
captured_at: "2026-04-16T03:40:11+00:00"
---
## Environment
```!
node --version
npm --version
git status --short
```
```

To disable this behavior for skills and custom commands from user, project, plugin, or [additional-directory](http://code.claude.com/docs/en/skills#skills-from-additional-directories) sources, set `"disableSkillShellExecution": true` in [settings](https://code.claude.com/docs/en/settings). Each command is replaced with `[shell command execution disabled by policy]` instead of being run. Bundled and managed skills are not affected. This setting is most useful in [managed settings](https://code.claude.com/docs/en/permissions#managed-settings), where users cannot override it.

### Run skills in a subagent

Add `context: fork` to your frontmatter when you want a skill to run in isolation. The skill content becomes the prompt that drives the subagent. It won’t have access to your conversation history.

Skills and [subagents](https://code.claude.com/docs/en/sub-agents) work together in two directions:

| Approach | System prompt | Task | Also loads |
| --- | --- | --- | --- |
| Skill with `context: fork` | From agent type (`Explore`, `Plan`, etc.) | SKILL.md content | CLAUDE.md |
| Subagent with `skills` field | Subagent’s markdown body | Claude’s delegation message | Preloaded skills + CLAUDE.md |

With `context: fork`, you write the task in your skill and pick an agent type to execute it. For the inverse (defining a custom subagent that uses skills as reference material), see [Subagents](https://code.claude.com/docs/en/sub-agents#preload-skills-into-subagents).

#### Example: Research skill using Explore agent

This skill runs research in a forked Explore agent. The skill content becomes the task, and the agent provides read-only tools optimized for codebase exploration:

```
---
name: deep-research
description: Research a topic thoroughly
context: fork
agent: Explore
---

Research $ARGUMENTS thoroughly:

1. Find relevant files using Glob and Grep
2. Read and analyze the code
3. Summarize findings with specific file references
```

When this skill runs:

1.   A new isolated context is created
2.   The subagent receives the skill content as its prompt (“Research $ARGUMENTS thoroughly…”)
3.   The `agent` field determines the execution environment (model, tools, and permissions)
4.   Results are summarized and returned to your main conversation

The `agent` field specifies which subagent configuration to use. Options include built-in agents (`Explore`, `Plan`, `general-purpose`) or any custom subagent from `.claude/agents/`. If omitted, uses `general-purpose`.

### Restrict Claude’s skill access

By default, Claude can invoke any skill that doesn’t have `disable-model-invocation: true` set. Skills that define `allowed-tools` grant Claude access to those tools without per-use approval when the skill is active. Your [permission settings](https://code.claude.com/docs/en/permissions) still govern baseline approval behavior for all other tools. Built-in commands like `/compact` and `/init` are not available through the Skill tool.Three ways to control which skills Claude can invoke:**Disable all skills** by denying the Skill tool in `/permissions`:

```
# Add to deny rules:
Skill
```

**Allow or deny specific skills** using [permission rules](https://code.claude.com/docs/en/permissions):

```
# Allow only specific skills
Skill(commit)
Skill(review-pr *)

# Deny specific skills
Skill(deploy *)
```

Permission syntax: `Skill(name)` for exact match, `Skill(name *)` for prefix match with any arguments.**Hide individual skills** by adding `disable-model-invocation: true` to their frontmatter. This removes the skill from Claude’s context entirely.

Skills can be distributed at different scopes depending on your audience:

*   **Project skills**: Commit `.claude/skills/` to version control
*   **Plugins**: Create a `skills/` directory in your [plugin](https://code.claude.com/docs/en/plugins)
*   **Managed**: Deploy organization-wide through [managed settings](https://code.claude.com/docs/en/settings#settings-files)

### Generate visual output

Skills can bundle and run scripts in any language, giving Claude capabilities beyond what’s possible in a single prompt. One powerful pattern is generating visual output: interactive HTML files that open in your browser for exploring data, debugging, or creating reports.This example creates a codebase explorer: an interactive tree view where you can expand and collapse directories, see file sizes at a glance, and identify file types by color.Create the Skill directory:

```
mkdir -p ~/.claude/skills/codebase-visualizer/scripts
```

Create `~/.claude/skills/codebase-visualizer/SKILL.md`. The description tells Claude when to activate this Skill, and the instructions tell Claude to run the bundled script:

```
---
name: codebase-visualizer
description: Generate an interactive collapsible tree visualization of your codebase. Use when exploring a new repo, understanding project structure, or identifying large files.
allowed-tools: Bash(python *)
---

# Codebase Visualizer

Generate an interactive HTML tree view that shows your project's file structure with collapsible directories.
