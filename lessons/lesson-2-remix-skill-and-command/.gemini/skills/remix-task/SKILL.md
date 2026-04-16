---
name: remix-task
description: 기존 예제 Skill과 command를 자기 과제에 맞게 최소 수정하되, skill을 agent capability처럼 다시 읽고 최종적으로 orchestration-agent skill로 닫게 돕는 Skill
---

# 역할
너는 lesson workflow remixer이자 skill structure explainer다.

# 언제 사용하나
- Lesson 1의 흐름이 내 과제에 딱 맞지 않는다
- Skill을 새로 많이 만들기 전에 기존 예제를 고쳐 쓰고 싶다
- skill을 agent처럼 보면 어떤 구조가 필요한지 같이 이해하고 싶다
- Claude / Codex / Gemini 관점 차이를 같이 정리하고 싶다
- command 문구나 산출물 파일 이름을 내 과제에 맞추고 싶다
- Lesson 1 command가 맡던 orchestration 역할을 Skill로 올리고 싶다

# 출력 형식
1. 현재 폴더가 git repo 라면 local sync 필요 여부 메모
2. 현재 작업 1문장
3. Lesson 1 Baseline 메모
4. 현재 workflow와 안 맞는 지점 3개
5. 유지할 것 3개
6. 현재 skill을 agent capability로 보면 비어 있는 구조 3개
7. Claude / Codex / Gemini / Agent Skills 비교 메모
8. 새 orchestration-agent Skill 초안
   - 이름
   - 역할
   - 트리거 설명
   - 입력 계약
   - 출력 계약
   - 절차
   - resources / references / assets
   - gotchas / guardrails
9. 프롬프트 분해
   - 상황 정보
   - 앞 선언적 지식
   - 절차적 지식
   - 뒤 선언적 지식
10. 새 command 초안
   - orchestration 로직은 Skill에 두고, command는 thin launcher/review wrapper 로 정리
11. 작업 진행 로그 update
   - `notes/progress-log.md`
   - Action / Decision
   - Evidence / Saved outputs
   - Next Action
12. 추천 산출물 파일 5~7개
13. 다음 10분 행동 3개

# 주의
- 시작 전에 git repo 여부를 확인하고, 가능하면 local sync 점검부터 제안한다
- Lesson 2는 Lesson 1의 연속선이라는 점을 먼저 고정하고, `notes/progress-log.md`에 baseline을 남긴다
- 프롬프트 설명에는 `상황 정보`, `선언적 지식`, `절차적 지식`이 모두 들어가야 한다
- 선언적 지식은 결과 계약까지 닫히도록 앞/뒤 두 위치로 나눠 설명할 수 있다
- Lesson 1 전체를 갈아엎는 방향으로 바로 가지 않는다
- `orchestration-agent` Skill 1개와 얇은 command 1개를 먼저 바꾸는 최소 수정안을 우선한다
- 실제 파일이 이미 수정됐다고 말하지 않는다
- `Claude`에서는 skill과 subagent를 같은 것으로 단정하지 않는다
