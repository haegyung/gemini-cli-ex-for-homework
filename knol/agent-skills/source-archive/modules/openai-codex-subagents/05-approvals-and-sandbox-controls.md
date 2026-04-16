---
domain_id: "agent-skills"
source_id: "openai-codex-subagents"
section_index: "5"
section_title: "Approvals and sandbox controls"
source_url: "https://developers.openai.com/codex/subagents"
reader_url: "https://r.jina.ai/http://developers.openai.com/codex/subagents"
captured_at: "2026-04-16T03:40:10+00:00"
---
## Approvals and sandbox controls

Subagents inherit your current sandbox policy.

In interactive CLI sessions, approval requests can surface from inactive agent threads even while you are looking at the main thread. The approval overlay shows the source thread label, and you can press `o` to open that thread before you approve, reject, or answer the request.

In non-interactive flows, or whenever a run can’t surface a fresh approval, an action that needs new approval fails and Codex surfaces the error back to the parent workflow.

Codex also reapplies the parent turn’s live runtime overrides when it spawns a child. That includes sandbox and approval choices you set interactively during the session, such as `/approvals` changes or `--yolo`, even if the selected custom agent file sets different defaults.

You can also override the sandbox configuration for individual [custom agents](http://developers.openai.com/codex/subagents#custom-agents), such as explicitly marking one to work in read-only mode.
