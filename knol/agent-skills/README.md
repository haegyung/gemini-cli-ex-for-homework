# Agent Skills Knol

이 폴더는 `skill을 agent처럼 가르치는 lesson`에 필요한 공식 근거와 공용 해설을 모읍니다.

구성:
- [official-source-map.md](./official-source-map.md): 공식 URL, 공식 최소 구조, skill/subagent 경계
- [agent-skills-open-standard.md](./agent-skills-open-standard.md): Agent Skills open standard의 required fields와 best practices
- [openai-codex.md](./openai-codex.md): Codex skill/subagent 구조와 공식 요구사항
- [anthropic-claude-code.md](./anthropic-claude-code.md): Claude Code skill/subagent 구조와 공식 요구사항
- [google-gemini-cli.md](./google-gemini-cli.md): Gemini CLI skill 구조와 공식 요구사항
- [skill-as-agent-shared-guide.md](./skill-as-agent-shared-guide.md): lesson 2와 course 문서에서 바로 인용할 공용 합성본
- [source-archive/README.md](./source-archive/README.md): 공식 원문 크롤링 보존본, normalized 원문, 모듈 문서

사용 규칙:
- lesson 문서는 vendor 원문을 직접 장황하게 재서술하지 않고 이 폴더의 합성 문서를 우선 참조합니다.
- vendor별 차이를 확인해야 할 때만 각 요약 문서를 엽니다.
- 사실성 확인이 필요할 때는 `source-archive/`의 normalized/modules를 먼저 보고, 필요 시 `official-source-map.md`의 1차 문서 URL로 역추적합니다.
- `공식 최소 구조`와 `lesson용 teaching schema`를 같은 층위로 쓰지 않습니다.
