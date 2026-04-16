---
domain_id: "agent-skills"
source_id: "gemini-cli-creating-skills"
section_index: "4"
section_title: "Skill structure"
source_url: "https://geminicli.com/docs/cli/creating-skills/"
reader_url: "https://r.jina.ai/http://geminicli.com/docs/cli/creating-skills/"
captured_at: "2026-04-16T03:40:21+00:00"
---
## Skill structure

[Section titled “Skill structure”](http://geminicli.com/docs/cli/creating-skills/#skill-structure)

A skill is a directory containing a `SKILL.md` file at its root.

### Folder structure

[Section titled “Folder structure”](http://geminicli.com/docs/cli/creating-skills/#folder-structure)

While a `SKILL.md` file is the only required component, we recommend the following structure for organizing your skill’s resources:

`my-skill/├── SKILL.md       (Required) Instructions and metadata├── scripts/       (Optional) Executable scripts├── references/    (Optional) Static documentation└── assets/        (Optional) Templates and other resources`

### `SKILL.md` file

[Section titled “SKILL.md file”](http://geminicli.com/docs/cli/creating-skills/#skillmd-file)

The `SKILL.md` file is the core of your skill. This file uses YAML frontmatter for metadata and Markdown for instructions. For example:

```
---name: code-reviewerdescription:  Use this skill to review code. It supports both local changes and remote Pull  Requests.---
# Code Reviewer
This skill guides the agent in conducting thorough code reviews.
