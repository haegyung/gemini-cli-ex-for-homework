---
domain_id: "agent-skills"
source_id: "gemini-cli-skills"
section_index: "6"
section_title: "How it Works"
source_url: "https://geminicli.com/docs/cli/skills/"
reader_url: "https://r.jina.ai/http://geminicli.com/docs/cli/skills/"
captured_at: "2026-04-16T03:40:19+00:00"
---
## How it Works

[Section titled “How it Works”](http://geminicli.com/docs/cli/skills/#how-it-works)

1.   **Discovery**: At the start of a session, Gemini CLI scans the discovery tiers and injects the name and description of all enabled skills into the system prompt.
2.   **Activation**: When Gemini identifies a task matching a skill’s description, it calls the `activate_skill` tool.
3.   **Consent**: You will see a confirmation prompt in the UI detailing the skill’s name, purpose, and the directory path it will gain access to.
4.   **Injection**: Upon your approval: 
    *   The `SKILL.md` body and folder structure is added to the conversation history.
    *   The skill’s directory is added to the agent’s allowed file paths, granting it permission to read any bundled assets.

5.   **Execution**: The model proceeds with the specialized expertise active. It is instructed to prioritize the skill’s procedural guidance within reason.

### Skill activation

[Section titled “Skill activation”](http://geminicli.com/docs/cli/skills/#skill-activation)

Once a skill is activated (typically by Gemini identifying a task that matches the skill’s description and your approval), its specialized instructions and resources are loaded into the agent’s context. A skill remains active and its guidance is prioritized for the duration of the session.
