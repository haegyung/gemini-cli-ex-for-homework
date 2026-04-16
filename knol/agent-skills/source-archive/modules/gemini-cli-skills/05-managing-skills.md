---
domain_id: "agent-skills"
source_id: "gemini-cli-skills"
section_index: "5"
section_title: "Managing Skills"
source_url: "https://geminicli.com/docs/cli/skills/"
reader_url: "https://r.jina.ai/http://geminicli.com/docs/cli/skills/"
captured_at: "2026-04-16T03:40:19+00:00"
---
## Managing Skills

[Section titled “Managing Skills”](http://geminicli.com/docs/cli/skills/#managing-skills)

### In an Interactive Session

[Section titled “In an Interactive Session”](http://geminicli.com/docs/cli/skills/#in-an-interactive-session)

Use the `/skills` slash command to view and manage available expertise:

*   `/skills list` (default): Shows all discovered skills and their status.
*   `/skills link <path>`: Links agent skills from a local directory via symlink.
*   `/skills disable <name>`: Prevents a specific skill from being used.
*   `/skills enable <name>`: Re-enables a disabled skill.
*   `/skills reload`: Refreshes the list of discovered skills from all tiers.

Note

`/skills disable` and `/skills enable` default to the `user` scope. Use `--scope workspace` to manage workspace-specific settings.

### From the Terminal

[Section titled “From the Terminal”](http://geminicli.com/docs/cli/skills/#from-the-terminal)

The `gemini skills` command provides management utilities:

Terminal window

```
# List all discovered skillsgemini skills list
# Link agent skills from a local directory via symlink# Discovers skills (SKILL.md or */SKILL.md) and creates symlinks in ~/.gemini/skills# (or ~/.agents/skills)gemini skills link /path/to/my-skills-repo
# Link to the workspace scope (.gemini/skills or .agents/skills)gemini skills link /path/to/my-skills-repo --scope workspace
# Install a skill from a Git repository, local directory, or zipped skill file (.skill)# Uses the user scope by default (~/.gemini/skills or ~/.agents/skills)gemini skills install https://github.com/user/repo.gitgemini skills install /path/to/local/skillgemini skills install /path/to/local/my-expertise.skill
# Install a specific skill from a monorepo or subdirectory using --pathgemini skills install https://github.com/my-org/my-skills.git --path skills/frontend-design
# Install to the workspace scope (.gemini/skills or .agents/skills)gemini skills install /path/to/skill --scope workspace
# Uninstall a skill by namegemini skills uninstall my-expertise --scope workspace
# Enable a skill (globally)gemini skills enable my-expertise
# Disable a skill. Can use --scope to specify workspace or user (defaults to workspace)gemini skills disable my-expertise --scope workspace
```
