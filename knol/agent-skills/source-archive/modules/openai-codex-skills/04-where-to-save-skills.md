---
domain_id: "agent-skills"
source_id: "openai-codex-skills"
section_index: "4"
section_title: "Where to save skills"
source_url: "https://developers.openai.com/codex/skills"
reader_url: "https://r.jina.ai/http://developers.openai.com/codex/skills"
captured_at: "2026-04-16T03:40:06+00:00"
---
## Where to save skills

Codex reads skills from repository, user, admin, and system locations. For repositories, Codex scans `.agents/skills` in every directory from your current working directory up to the repository root. If two skills share the same `name`, Codex doesn’t merge them; both can appear in skill selectors.

| Skill Scope | Location | Suggested use |
| --- | --- | --- |
| `REPO` | `$CWD/.agents/skills` Current working directory: where you launch Codex. | If you’re in a repository or code environment, teams can check in skills relevant to a working folder. For example, skills only relevant to a microservice or a module. |
| `REPO` | `$CWD/../.agents/skills` A folder above CWD when you launch Codex inside a Git repository. | If you’re in a repository with nested folders, organizations can check in skills relevant to a shared area in a parent folder. |
| `REPO` | `$REPO_ROOT/.agents/skills` The topmost root folder when you launch Codex inside a Git repository. | If you’re in a repository with nested folders, organizations can check in skills relevant to everyone using the repository. These serve as root skills available to any subfolder in the repository. |
| `USER` | `$HOME/.agents/skills` Any skills checked into the user’s personal folder. | Use to curate skills relevant to a user that apply to any repository the user may work in. |
| `ADMIN` | `/etc/codex/skills` Any skills checked into the machine or container in a shared, system location. | Use for SDK scripts, automation, and for checking in default admin skills available to each user on the machine. |
| `SYSTEM` | Bundled with Codex by OpenAI. | Useful skills relevant to a broad audience such as the skill-creator and plan skills. Available to everyone when they start Codex. |

Codex supports symlinked skill folders and follows the symlink target when scanning these locations.

These locations are for authoring and local discovery. When you want to distribute reusable skills beyond a single repo, or optionally bundle them with app integrations, use [plugins](http://developers.openai.com/codex/plugins/build).
