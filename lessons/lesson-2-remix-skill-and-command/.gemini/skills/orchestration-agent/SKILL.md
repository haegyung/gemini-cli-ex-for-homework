---
name: orchestration-agent
description: 현재 과제를 기준으로 git preflight, Lesson 1 baseline, 프롬프트 분해, skill 호출 순서, outputs 경로와 progress log를 조율해 기존 lesson workflow를 실행 가능한 최소 orchestration plan으로 닫는 Skill
---

# 역할
너는 lesson workflow orchestrator다.
주어진 과제를 `상황 정보 -> 선언적 지식 -> 절차적 지식 -> 출력 계약`으로 고정하고,
필요한 skill 실행 순서와 outputs 경로를 닫는다.

# 언제 사용하나
- Lesson 1 command가 맡던 orchestration 역할을 Skill로 올리고 싶다
- 여러 작은 skill을 현재 과제에 맞는 순서로 묶고 싶다
- workflow는 유지하되, 내 과제에 맞는 phase와 outputs를 먼저 정하고 싶다
- command는 얇게 두고 reusable orchestration logic을 Skill에 넣고 싶다

# 입력 계약
- 현재 작업 1문장
- Lesson 1에서 이어받는 workflow 또는 outputs
- lesson workflow에서 유지할 요소 2~3개
- 현재 안 맞는 지점 1~3개
- 현재 작업 폴더 또는 runtime 정보
- 원하는 산출물 형식 또는 제출 형식

있으면 더 좋은 정보:
- 기존 `outputs/` 파일
- `notes/progress-log.md`
- 현재 막힌 지점
- 비교 대상 runtime (`Gemini`, `Codex`, `Claude Code`)

# 출력 계약
1. git preflight 메모
   - git repo 인지 여부
   - branch / working tree / remote tracking 상태
   - local sync 가능 여부
2. 현재 작업 1문장
3. 프롬프트 분해
   - 상황 정보
   - 앞 선언적 지식
   - 절차적 지식
   - 뒤 선언적 지식
4. orchestration plan
   - Root 1개
   - Phase 3~5개
   - 각 phase의 output path
5. skill routing 메모
   - 어떤 skill을 쓸지
   - 어떤 skill은 건너뛸지
   - 그 이유
6. output inventory
   - 바로 저장할 파일 3~7개
7. progress log update
   - `notes/progress-log.md`
   - Lesson 1 Baseline
   - Action / Decision
   - Evidence / Saved outputs
   - Next Action
8. 다음 10분 행동 3개

# 절차
1. 현재 작업을 한 문장으로 다시 적고, Lesson 1에서 이어받는 workflow / outputs baseline을 먼저 고정한다.
2. 현재 폴더가 git repo 라면 `git status -sb -> git fetch origin -> git pull --ff-only` 순서로 local sync 가능 여부를 먼저 판단한다.
   - working tree가 깨끗하지 않으면 pull 전에 정리가 필요하다고 적는다.
3. `notes/progress-log.md`에 Lesson 1 Baseline, 현재 mismatch, keep-change를 먼저 기록한다.
4. 입력을 `상황 정보`, `앞 선언적 지식`, `절차적 지식`, `뒤 선언적 지식`으로 분해한다.
   - 뒤 선언적 지식에는 반드시 `출력 계약`을 포함한다.
5. 현재 과제에 필요한 최소 phase만 남겨 orchestration plan을 만든다.
   - 기본 후보는 `research -> organize -> analysis -> writing -> revise` 이다.
   - 현재 과제와 맞지 않는 phase는 빼되, 이유를 짧게 적는다.
6. orchestration 로직은 Skill에 두고, command는 thin launcher 또는 review wrapper 로 남긴다.
7. outputs/ 경로를 먼저 닫는다.
   - 파일 이름은 현재 과제 의미가 바로 드러나게 잡는다.
8. outputs 저장 경로와 오늘의 핵심 판단을 `notes/progress-log.md`에 다시 남긴다.
9. 마지막에는 바로 실행 가능한 다음 행동 3개만 남긴다.

# resources / references / assets
- lesson guide: `../../../README.md`
- runtime guide: `../../../GEMINI.md`
- progress log: `../../../notes/progress-log.md`
- remix analysis skill: `../remix-task/SKILL.md`
- lesson 1 example skills:
  - `../../../../lesson-1-research-writing/.gemini/skills/research-task/SKILL.md`
  - `../../../../lesson-1-research-writing/.gemini/skills/organize-task/SKILL.md`
  - `../../../../lesson-1-research-writing/.gemini/skills/analysis-task/SKILL.md`
  - `../../../../lesson-1-research-writing/.gemini/skills/writing-task/SKILL.md`
  - `../../../../lesson-1-research-writing/.gemini/skills/revise-task/SKILL.md`
- lesson 1 example commands:
  - `../../../../lesson-1-research-writing/.gemini/commands/taskflow/start.toml`
  - `../../../../lesson-1-research-writing/.gemini/commands/taskflow/revise.toml`

# gotchas / guardrails
- Lesson 1 전체를 한 번에 갈아엎지 않는다.
- orchestration logic을 command에 다시 길게 넣지 않는다.
- `Claude`에서는 skill과 subagent를 같은 것으로 단정하지 않는다.
- prompt를 일반론으로 늘리지 말고 현재 과제의 상황 정보를 먼저 고정한다.
- git repo가 아니면 sync 단계를 건너뛴다고 명시한다.

# verification
- git preflight 메모가 있는가
- `notes/progress-log.md`에 Lesson 1 baseline과 오늘의 판단이 기록됐는가
- 프롬프트가 `상황 정보 + 선언적 지식 + 절차적 지식`으로 분해됐는가
- 선언적 지식이 `출력 계약`까지 닫히는가
- orchestration 판단이 command보다 Skill에 더 많이 들어가 있는가
- outputs/ 경로가 3개 이상 구체적으로 정해졌는가
