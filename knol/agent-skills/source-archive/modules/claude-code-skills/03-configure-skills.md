---
domain_id: "agent-skills"
source_id: "claude-code-skills"
section_index: "3"
section_title: "Configure skills"
source_url: "https://code.claude.com/docs/en/skills"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/skills"
captured_at: "2026-04-16T03:40:11+00:00"
---
## Configure skills

Skills are configured through YAML frontmatter at the top of `SKILL.md` and the markdown content that follows.

### Types of skill content

Skill files can contain any instructions, but thinking about how you want to invoke them helps guide what to include:**Reference content** adds knowledge Claude applies to your current work. Conventions, patterns, style guides, domain knowledge. This content runs inline so Claude can use it alongside your conversation context.

```
---
name: api-conventions
description: API design patterns for this codebase
---

When writing API endpoints:
- Use RESTful naming conventions
- Return consistent error formats
- Include request validation
```

**Task content** gives Claude step-by-step instructions for a specific action, like deployments, commits, or code generation. These are often actions you want to invoke directly with `/skill-name` rather than letting Claude decide when to run them. Add `disable-model-invocation: true` to prevent Claude from triggering it automatically.

```
---
name: deploy
description: Deploy the application to production
context: fork
disable-model-invocation: true
---

Deploy the application:
1. Run the test suite
2. Build the application
3. Push to the deployment target
```

Your `SKILL.md` can contain anything, but thinking through how you want the skill invoked (by you, by Claude, or both) and where you want it to run (inline or in a subagent) helps guide what to include. For complex skills, you can also [add supporting files](http://code.claude.com/docs/en/skills#add-supporting-files) to keep the main skill focused.

### Frontmatter reference

Beyond the markdown content, you can configure skill behavior using YAML frontmatter fields between `---` markers at the top of your `SKILL.md` file:

```
---
name: my-skill
description: What this skill does
disable-model-invocation: true
allowed-tools: Read Grep
---

Your skill instructions here...
```

All fields are optional. Only `description` is recommended so Claude knows when to use the skill.

| Field | Required | Description |
| --- | --- | --- |
| `name` | No | Display name for the skill. If omitted, uses the directory name. Lowercase letters, numbers, and hyphens only (max 64 characters). |
| `description` | Recommended | What the skill does and when to use it. Claude uses this to decide when to apply the skill. If omitted, uses the first paragraph of markdown content. Front-load the key use case: the combined `description` and `when_to_use` text is truncated at 1,536 characters in the skill listing to reduce context usage. |
| `when_to_use` | No | Additional context for when Claude should invoke the skill, such as trigger phrases or example requests. Appended to `description` in the skill listing and counts toward the 1,536-character cap. |
| `argument-hint` | No | Hint shown during autocomplete to indicate expected arguments. Example: `[issue-number]` or `[filename] [format]`. |
| `disable-model-invocation` | No | Set to `true` to prevent Claude from automatically loading this skill. Use for workflows you want to trigger manually with `/name`. Default: `false`. |
| `user-invocable` | No | Set to `false` to hide from the `/` menu. Use for background knowledge users shouldn’t invoke directly. Default: `true`. |
| `allowed-tools` | No | Tools Claude can use without asking permission when this skill is active. Accepts a space-separated string or a YAML list. |
| `model` | No | Model to use when this skill is active. |
| `effort` | No | [Effort level](https://code.claude.com/docs/en/model-config#adjust-effort-level) when this skill is active. Overrides the session effort level. Default: inherits from session. Options: `low`, `medium`, `high`, `max` (Opus 4.6 only). |
| `context` | No | Set to `fork` to run in a forked subagent context. |
| `agent` | No | Which subagent type to use when `context: fork` is set. |
| `hooks` | No | Hooks scoped to this skill’s lifecycle. See [Hooks in skills and agents](https://code.claude.com/docs/en/hooks#hooks-in-skills-and-agents) for configuration format. |
| `paths` | No | Glob patterns that limit when this skill is activated. Accepts a comma-separated string or a YAML list. When set, Claude loads the skill automatically only when working with files matching the patterns. Uses the same format as [path-specific rules](https://code.claude.com/docs/en/memory#path-specific-rules). |
| `shell` | No | Shell to use for `!`command`` and ````!` blocks in this skill. Accepts `bash` (default) or `powershell`. Setting `powershell` runs inline shell commands via PowerShell on Windows. Requires `CLAUDE_CODE_USE_POWERSHELL_TOOL=1`. |

#### Available string substitutions

Skills support string substitution for dynamic values in the skill content:

| Variable | Description |
| --- | --- |
| `$ARGUMENTS` | All arguments passed when invoking the skill. If `$ARGUMENTS` is not present in the content, arguments are appended as `ARGUMENTS: <value>`. |
| `$ARGUMENTS[N]` | Access a specific argument by 0-based index, such as `$ARGUMENTS[0]` for the first argument. |
| `$N` | Shorthand for `$ARGUMENTS[N]`, such as `$0` for the first argument or `$1` for the second. |
| `${CLAUDE_SESSION_ID}` | The current session ID. Useful for logging, creating session-specific files, or correlating skill output with sessions. |
| `${CLAUDE_SKILL_DIR}` | The directory containing the skill’s `SKILL.md` file. For plugin skills, this is the skill’s subdirectory within the plugin, not the plugin root. Use this in bash injection commands to reference scripts or files bundled with the skill, regardless of the current working directory. |

Indexed arguments use shell-style quoting, so wrap multi-word values in quotes to pass them as a single argument. For example, `/my-skill "hello world" second` makes `$0` expand to `hello world` and `$1` to `second`. The `$ARGUMENTS` placeholder always expands to the full argument string as typed.**Example using substitutions:**

```
---
name: session-logger
description: Log activity for this session
---

Log the following to logs/${CLAUDE_SESSION_ID}.log:

$ARGUMENTS
```

### Add supporting files

Skills can include multiple files in their directory. This keeps `SKILL.md` focused on the essentials while letting Claude access detailed reference material only when needed. Large reference docs, API specifications, or example collections don’t need to load into context every time the skill runs.

```
my-skill/
├── SKILL.md (required - overview and navigation)
├── reference.md (detailed API docs - loaded when needed)
├── examples.md (usage examples - loaded when needed)
└── scripts/
    └── helper.py (utility script - executed, not loaded)
```

Reference supporting files from `SKILL.md` so Claude knows what each file contains and when to load it:

```
