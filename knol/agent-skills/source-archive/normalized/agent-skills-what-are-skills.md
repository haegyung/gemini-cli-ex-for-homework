---
domain_id: "agent-skills"
source_id: "agent-skills-what-are-skills"
source_group: "agent-skills-open-standard"
source_vendor: "Agent Skills"
source_topic: "What Are Skills"
source_url: "https://agentskills.io/what-are-skills"
reader_url: "https://r.jina.ai/http://agentskills.io/what-are-skills"
reader_title: "What are skills? - Agent Skills"
captured_at: "2026-04-16T03:40:41+00:00"
content_sha256: "14bc620c08ea763046517f7c3ea1157366d07926ee381af9f24811900350aee4"
---
At its core, a skill is a folder containing a `SKILL.md` file. This file includes metadata (`name` and `description`, at minimum) and instructions that tell an agent how to perform a specific task. Skills can also bundle scripts, templates, and reference materials.

```
my-skill/
├── SKILL.md          # Required: instructions + metadata
├── scripts/          # Optional: executable code
├── references/       # Optional: documentation
└── assets/           # Optional: templates, resources
```

## How skills work

Skills use **progressive disclosure** to manage context efficiently:

1.   **Discovery**: At startup, agents load only the name and description of each available skill, just enough to know when it might be relevant.
2.   **Activation**: When a task matches a skill’s description, the agent reads the full `SKILL.md` instructions into context.
3.   **Execution**: The agent follows the instructions, optionally loading referenced files or executing bundled code as needed.

This approach keeps agents fast while giving them access to more context on demand.

## The SKILL.md file

Every skill starts with a `SKILL.md` file containing YAML frontmatter and Markdown instructions:

```
---
name: pdf-processing
description: Extract PDF text, fill forms, merge files. Use when handling PDFs.
---

# PDF Processing

## When to use this skill
Use this skill when the user needs to work with PDF files...

## How to extract text
1. Use pdfplumber for text extraction...

## How to fill forms
...
```

The following frontmatter is required at the top of `SKILL.md`:

*   `name`: A short identifier
*   `description`: When to use this skill

The Markdown body contains the actual instructions and has no specific restrictions on structure or content.This simple format has some key advantages:

*   **Self-documenting**: A skill author or user can read a `SKILL.md` and understand what it does, making skills easy to audit and improve.
*   **Extensible**: Skills can range in complexity from just text instructions to executable code, assets, and templates.
*   **Portable**: Skills are just files, so they’re easy to edit, version, and share.

## Next steps

*   [View the specification](https://agentskills.io/specification) to understand the full format.
*   [Add skills support to your agent](https://agentskills.io/client-implementation/adding-skills-support) to build a compatible client.
*   [See example skills](https://github.com/anthropics/skills) on GitHub.
*   [Read authoring best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices) for writing effective skills.
*   [Use the reference library](https://github.com/agentskills/agentskills/tree/main/skills-ref) to validate skills and generate prompt XML.
