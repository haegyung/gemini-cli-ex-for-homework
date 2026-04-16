---
domain_id: "agent-skills"
source_id: "openai-codex-subagents"
section_index: "3"
section_title: "Typical workflow"
source_url: "https://developers.openai.com/codex/subagents"
reader_url: "https://r.jina.ai/http://developers.openai.com/codex/subagents"
captured_at: "2026-04-16T03:40:10+00:00"
---
## Typical workflow

Codex handles orchestration across agents, including spawning new subagents, routing follow-up instructions, waiting for results, and closing agent threads.

When many agents are running, Codex waits until all requested results are available, then returns a consolidated response.

Codex only spawns a new agent when you explicitly ask it to do so.

To see it in action, try the following prompt on your project:

```
I would like to review the following points on the current PR (this branch vs main). Spawn one agent per point, wait for all of them, and summarize the result for each point.
1. Security issue
2. Code quality
3. Bugs
4. Race
5. Test flakiness
6. Maintainability of the code
```
