---
domain_id: "agent-skills"
source_id: "agent-skills-specification"
section_index: "2"
section_title: "[​](http://agentskills.io/specification#skill-md-format)"
source_url: "https://agentskills.io/specification"
reader_url: "https://r.jina.ai/http://agentskills.io/specification"
captured_at: "2026-04-16T03:40:42+00:00"
---
## [​](http://agentskills.io/specification#skill-md-format)

`SKILL.md` format

The `SKILL.md` file must contain YAML frontmatter followed by Markdown content.
### [​](http://agentskills.io/specification#frontmatter)

Frontmatter

| Field | Required | Constraints |
| --- | --- | --- |
| `name` | Yes | Max 64 characters. Lowercase letters, numbers, and hyphens only. Must not start or end with a hyphen. |
| `description` | Yes | Max 1024 characters. Non-empty. Describes what the skill does and when to use it. |
| `license` | No | License name or reference to a bundled license file. |
| `compatibility` | No | Max 500 characters. Indicates environment requirements (intended product, system packages, network access, etc.). |
| `metadata` | No | Arbitrary key-value mapping for additional metadata. |
| `allowed-tools` | No | Space-separated string of pre-approved tools the skill may use. (Experimental) |

**Minimal example:**

SKILL.md

```
---
name: skill-name
description: A description of what this skill does and when to use it.
---
```

**Example with optional fields:**

SKILL.md

```
---
name: pdf-processing
description: Extract PDF text, fill forms, merge files. Use when handling PDFs.
license: Apache-2.0
metadata:
  author: example-org
  version: "1.0"
---
```

#### [​](http://agentskills.io/specification#name-field)

`name` field

The required `name` field:
*   Must be 1-64 characters
*   May only contain unicode lowercase alphanumeric characters (`a-z`) and hyphens (`-`)
*   Must not start or end with a hyphen (`-`)
*   Must not contain consecutive hyphens (`--`)
*   Must match the parent directory name

**Valid examples:**

```
name: pdf-processing
```

```
name: data-analysis
```

```
name: code-review
```

**Invalid examples:**

```
name: PDF-Processing  # uppercase not allowed
```

```
name: -pdf  # cannot start with hyphen
```

```
name: pdf--processing  # consecutive hyphens not allowed
```

#### [​](http://agentskills.io/specification#description-field)

`description` field

The required `description` field:
*   Must be 1-1024 characters
*   Should describe both what the skill does and when to use it
*   Should include specific keywords that help agents identify relevant tasks

**Good example:**

```
description: Extracts text and tables from PDF files, fills PDF forms, and merges multiple PDFs. Use when working with PDF documents or when the user mentions PDFs, forms, or document extraction.
```

**Poor example:**

```
description: Helps with PDFs.
```

#### [​](http://agentskills.io/specification#license-field)

`license` field

The optional `license` field:
*   Specifies the license applied to the skill
*   We recommend keeping it short (either the name of a license or the name of a bundled license file)

**Example:**

```
license: Proprietary. LICENSE.txt has complete terms
```

#### [​](http://agentskills.io/specification#compatibility-field)

`compatibility` field

The optional `compatibility` field:
*   Must be 1-500 characters if provided
*   Should only be included if your skill has specific environment requirements
*   Can indicate intended product, required system packages, network access needs, etc.

**Examples:**

```
compatibility: Designed for Claude Code (or similar products)
```

```
compatibility: Requires git, docker, jq, and access to the internet
```

```
compatibility: Requires Python 3.14+ and uv
```

Most skills do not need the `compatibility` field.

#### [​](http://agentskills.io/specification#metadata-field)

`metadata` field

The optional `metadata` field:
*   A map from string keys to string values
*   Clients can use this to store additional properties not defined by the Agent Skills spec
*   We recommend making your key names reasonably unique to avoid accidental conflicts

**Example:**

```
metadata:
  author: example-org
  version: "1.0"
```

#### [​](http://agentskills.io/specification#allowed-tools-field)

`allowed-tools` field

The optional `allowed-tools` field:
*   A space-separated string of tools that are pre-approved to run
*   Experimental. Support for this field may vary between agent implementations

**Example:**

```
allowed-tools: Bash(git:*) Bash(jq:*) Read
```

### [​](http://agentskills.io/specification#body-content)

Body content

The Markdown body after the frontmatter contains the skill instructions. There are no format restrictions. Write whatever helps agents perform the task effectively.Recommended sections:
*   Step-by-step instructions
*   Examples of inputs and outputs
*   Common edge cases

Note that the agent will load this entire file once it’s decided to activate a skill. Consider splitting longer `SKILL.md` content into referenced files.
