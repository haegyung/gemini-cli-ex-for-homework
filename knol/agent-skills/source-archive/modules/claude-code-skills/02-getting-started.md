---
domain_id: "agent-skills"
source_id: "claude-code-skills"
section_index: "2"
section_title: "Getting started"
source_url: "https://code.claude.com/docs/en/skills"
reader_url: "https://r.jina.ai/http://code.claude.com/docs/en/skills"
captured_at: "2026-04-16T03:40:11+00:00"
---
## Getting started

### Create your first skill

This example creates a skill that teaches Claude to explain code using visual diagrams and analogies. Since it uses default frontmatter, Claude can load it automatically when you ask how something works, or you can invoke it directly with `/explain-code`.

1

2

3

### Where skills live

Where you store a skill determines who can use it:

| Location | Path | Applies to |
| --- | --- | --- |
| Enterprise | See [managed settings](https://code.claude.com/docs/en/settings#settings-files) | All users in your organization |
| Personal | `~/.claude/skills/<skill-name>/SKILL.md` | All your projects |
| Project | `.claude/skills/<skill-name>/SKILL.md` | This project only |
| Plugin | `<plugin>/skills/<skill-name>/SKILL.md` | Where plugin is enabled |

When skills share the same name across levels, higher-priority locations win: enterprise > personal > project. Plugin skills use a `plugin-name:skill-name` namespace, so they cannot conflict with other levels. If you have files in `.claude/commands/`, those work the same way, but if a skill and a command share the same name, the skill takes precedence.

#### Live change detection

Claude Code watches skill directories for file changes. Adding, editing, or removing a skill under `~/.claude/skills/`, the project `.claude/skills/`, or a `.claude/skills/` inside an `--add-dir` directory takes effect within the current session without restarting. Creating a top-level skills directory that did not exist when the session started requires restarting Claude Code so the new directory can be watched.

#### Automatic discovery from nested directories

When you work with files in subdirectories, Claude Code automatically discovers skills from nested `.claude/skills/` directories. For example, if you’re editing a file in `packages/frontend/`, Claude Code also looks for skills in `packages/frontend/.claude/skills/`. This supports monorepo setups where packages have their own skills.Each skill is a directory with `SKILL.md` as the entrypoint:

```
my-skill/
├── SKILL.md           # Main instructions (required)
├── template.md        # Template for Claude to fill in
├── examples/
│   └── sample.md      # Example output showing expected format
└── scripts/
    └── validate.sh    # Script Claude can execute
```

The `SKILL.md` contains the main instructions and is required. Other files are optional and let you build more powerful skills: templates for Claude to fill in, example outputs showing the expected format, scripts Claude can execute, or detailed reference documentation. Reference these files from your `SKILL.md` so Claude knows what they contain and when to load them. See [Add supporting files](http://code.claude.com/docs/en/skills#add-supporting-files) for more details.

#### Skills from additional directories

The `--add-dir` flag [grants file access](https://code.claude.com/docs/en/permissions#additional-directories-grant-file-access-not-configuration) rather than configuration discovery, but skills are an exception: `.claude/skills/` within an added directory is loaded automatically. See [Live change detection](http://code.claude.com/docs/en/skills#live-change-detection) for how edits are picked up during a session.Other `.claude/` configuration such as subagents, commands, and output styles is not loaded from additional directories. See the [exceptions table](https://code.claude.com/docs/en/permissions#additional-directories-grant-file-access-not-configuration) for the complete list of what is and isn’t loaded, and the recommended ways to share configuration across projects.
