---
domain_id: "agent-skills"
source_id: "gemini-cli-creating-skills"
section_index: "2"
section_title: "Getting started: The `skill-creator` skill"
source_url: "https://geminicli.com/docs/cli/creating-skills/"
reader_url: "https://r.jina.ai/http://geminicli.com/docs/cli/creating-skills/"
captured_at: "2026-04-16T03:40:21+00:00"
---
## Getting started: The `skill-creator` skill

[Section titled “Getting started: The skill-creator skill”](http://geminicli.com/docs/cli/creating-skills/#getting-started-the-skill-creator-skill)

The recommended way to create a new skill is to use the built-in `skill-creator` skill. To use it, ask Gemini CLI to create a new skill for you.

**Example prompt:**

> “create a new skill called ‘code-reviewer’”

Gemini CLI will then use the `skill-creator` to generate the skill:

1.   Generate a new directory for your skill (for example, `my-new-skill/`).
2.   Create a `SKILL.md` file with the necessary YAML frontmatter (`name` and `description`).
3.   Create the standard resource directories: `scripts/`, `references/`, and `assets/`.
