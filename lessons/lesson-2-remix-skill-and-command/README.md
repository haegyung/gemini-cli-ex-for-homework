# Lesson 2. Skill을 에이전트처럼 이해하고 내 과제에 맞게 remix하기

이 문서는 `LLM101.tools.Learn-is-doing/lessons/lesson-2-remix-skill-and-command/` 폴더의 정본 lesson guide 입니다.  
시리즈 이름은 `LLM101.Learn-is-Doing`이지만, 현재 lesson 자산의 실제 경로는 위 tools workspace 기준입니다.  
course 공통 안내는 상위 폴더의 `../../README.md`를 보고, 현재 lesson 실행은 이 파일을 기준으로 진행합니다.

## 1. 이 lesson의 목표

이번 lesson의 목적은 두 가지를 한 번에 잡는 것입니다.
- `skill`을 `특정 작업을 맡는 재사용 가능한 작은 전문 도우미`로 이해한다
- 그 관점으로 `Lesson 1`의 예제 Skill과 command를 자기 과제에 맞게 다시 설계하고, 최종적으로 `orchestration-agent` skill 1개까지 만들어 본다

이번 lesson에서 학생이 가져가야 할 핵심 결론:
- skill은 단순한 문장 묶음이 아니라 `역할 + 트리거 + 절차 + 자원 + 출력 계약`을 가진 작은 agent capability 입니다.
- `Gemini`, `Codex`, `Agent Skills` 표준은 skill을 거의 같은 방향으로 설명합니다.
- `Claude Code`도 skill을 지원하지만, 공식 문서에서는 `skill`과 `subagent`를 분리합니다.
- 공식 문서가 직접 요구하는 `최소 구조`와, lesson에서 가르치는 `8블록 확장 schema`는 같은 층위가 아닙니다.
- 프롬프트는 실전에서 `선언적 지식`, `절차적 지식`, `상황 정보`가 같이 있어야 안정적으로 작동합니다.
- 선언적 지식은 보통 앞에서는 문제 정의로, 뒤에서는 `출력 계약`으로 다시 닫힙니다.
- command가 맡던 orchestration 로직을 skill로 끌어올리면 runtime을 옮길 때 재사용 경계가 더 선명해집니다.

이번 lesson의 실습 단위:
- 기존 예제 Skill 1개를 `에이전트 구조`로 다시 읽고
- Lesson 1 command가 맡던 orchestration 역할을 `orchestration-agent` skill 1개와 얇은 command 1개로 다시 만든다

## 2. Glossary

- `skill`
  - 특정 작업을 안정적으로 수행하게 만드는 재사용 가능한 작은 전문 도우미
- `subagent`
  - 본체와 조금 떨어져 따로 움직이는 보조 에이전트
- `선언적 지식`
  - 무엇을 해야 하는지, 어떤 상태를 목표로 하는지, 어떤 제약과 용어를 지키는지에 대한 지식
- `절차적 지식`
  - 어떤 순서와 판단 규칙으로 작업을 수행하는지에 대한 지식
- `상황 정보`
  - 지금 어떤 과제를 다루는지, 어떤 파일/산출물/환경에서 작업하는지, 현재 어디서 막혔는지처럼 현재 상태를 고정하는 정보
- `출력 계약`
  - 최종 산출물 형식, 평가 기준, 예시, 금지사항처럼 결과를 닫아 주는 규칙
- `orchestration`
  - 여러 단계와 도구를 어떤 순서로 묶어 움직일지 정하는 일
- `trigger contract`
  - 이 skill을 언제 켜야 하고 언제 켜지 말아야 하는지 정해 둔 기준
- `entrypoint`
  - 이 skill을 읽기 시작하는 첫 파일이나 시작 지점
- `progress log`
  - Lesson 1에서 무엇을 이어받고 Lesson 2에서 무엇을 바꾸는지 남기는 작업 진행 로그

## 3. 기준 학습 문서와 기본 연습 과제

기준 학습 문서:
- [학생 실습용: Gemini CLI 작업 워크플로](../../../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md)

공유 공식 가이드:
- [skill-as-agent shared guide](../../knol/agent-skills/skill-as-agent-shared-guide.md)
- [official source map](../../knol/agent-skills/official-source-map.md)

이 lesson이 옮긴 기준 단계:
- `9) 결과 수정 루프`
- `10) 다음에 다시 쓸 때 기본 실행 패턴`
- `12) 체크리스트`

기본 연습 과제:
- `Lesson 1으로 만든 workflow에서 안 맞았던 지점 1개를 찾아, 그 차이를 설명할 수 있는 orchestration-agent skill 1개와 얇은 command 1개만 다시 설계하기`

원칙:
- 사용자가 별도 과제를 지정하지 않으면 위 기본 연습 과제로 시작합니다.
- lesson의 기준은 `기존 workflow를 버리지 않고 agent 구조를 더 잘 드러내는 최소 수정` 입니다.
- Lesson 2는 Lesson 1의 연속선으로 보고, 무엇을 이어받고 무엇을 바꾸는지 `notes/progress-log.md`에 먼저 고정합니다.
- local 폴더의 내용을 전부 노출하는 대신, 이 lesson에 필요한 부분만 본문에 드러내고 나머지는 작업 자산으로 남깁니다.
- 계속 참조해야 하는 규칙이나 remix 판단 근거는 local 폴더 경로 안내보다 VibeWorkers OL 본문에 옮겨 적는 것을 우선합니다.
- `Codex`와 `Claude Code` 안내가 필요하더라도, 같은 workflow와 outputs를 유지한 채 필요한 차이만 따로 적습니다.

## 3-1. Lesson 1 연속선과 작업 진행 로그

Lesson 2는 독립 수업이 아니라 `Lesson 1으로 만든 workflow를 어디까지 유지하고 어디서 remix할지`를 다루는 연속 수업입니다.

그래서 이번 lesson에서는 결과물만 저장하지 않고 `notes/progress-log.md`를 함께 씁니다.

이 파일에는 최소한 아래 5가지를 남깁니다.
- Lesson 1에서 이어받는 workflow / outputs
- Lesson 1에서 안 맞았던 지점
- 그대로 유지할 요소
- 이번 session의 Action / Decision
- Evidence / Saved outputs / Next Action

권장 갱신 시점:
- `remix:start` 직후
- `outputs/01~05`를 저장한 뒤
- `remix:review`를 돌린 뒤

## 4. 왜 skill을 agent처럼 가르치는가

공식 문서를 기준으로 보면 공통점이 분명합니다.

빠른 역추적:
- vendor별 1차 출처 URL은 `../../knol/agent-skills/official-source-map.md`에 모아 둡니다.
- lesson에서 직접 인용할 공용 문장은 `../../knol/agent-skills/skill-as-agent-shared-guide.md`를 기준으로 씁니다.

- `Codex`
  - skill을 `task-specific capabilities`와 `reusable workflows`의 저작 형식으로 설명합니다.
  - skill은 `instructions, resources, optional scripts`를 묶는 디렉터리입니다.
- `Gemini CLI`
  - skill을 `specialized expertise`, `procedural workflows`, `task-specific resources`를 담는 self-contained directory 로 설명합니다.
- `Agent Skills`
  - skill을 AI agent capability를 확장하는 `lightweight, open format`으로 설명합니다.
  - 핵심 구조도 `SKILL.md + scripts/references/assets` 입니다.
- `Claude Code`
  - skill은 분명 존재하지만, 공식 문서에서 별도로 `subagent`를 `specialized AI assistants`로 정의합니다.
  - 그래서 Claude에서는 `skill = agent`라고 딱 잘라 말하기보다, `skill은 agent를 움직이게 하는 playbook이고, subagent는 더 분리된 실행 단위`라고 이해하는 편이 정확합니다.

이번 lesson에서는 학생 이해를 위해 아래처럼 정리합니다.

- 실전 학습 관점:
  - `skill은 agent처럼 생각해도 된다`
- 공식 구분 관점:
  - `Gemini / Codex / Agent Skills`에서는 이 비유가 거의 곧바로 맞는다
  - `Claude`에서는 `skill`과 `subagent`를 구분해야 한다

이렇게 가르치면 학생은 두 가지를 동시에 얻습니다.
- 왜 skill이 단순 프롬프트 조각이 아닌지 이해할 수 있다
- runtime마다 어디까지가 skill이고 어디부터가 별도 agent인지 구분할 수 있다

## 5. 공식 문서 기준 skill의 최소 구조와 요구사항

이번 lesson에서는 먼저 `공식 문서가 직접 요구하는 최소 구조`를 잡고, 그 다음에만 lesson용 8블록으로 펼칩니다.

### 5-1. 공통으로 먼저 잡아야 하는 공식 최소 구조

- skill은 기본적으로 `SKILL.md`가 entrypoint인 디렉터리다
- `SKILL.md`는 metadata + instructions를 담는 중심 문서다
- `description`은 소개문이 아니라 `언제 이 skill을 써야 하는가`를 말해 주는 trigger contract다
- `scripts/`, `references/`, `assets/`는 optional supporting files다
- 긴 설명은 본문에 다 넣기보다 progressive disclosure로 분리하는 것이 공식 권장과 맞다

쉬운 말로 다시 말하면:
- `SKILL.md`
  - 이 skill 설명을 가장 먼저 읽는 중심 파일
- `description`
  - 이 skill을 언제 쓰면 좋은지 알려 주는 사용 기준 문장
- `scripts`, `references`, `assets`
  - 본문에 다 넣지 않고 따로 빼 둔 보조 자료

### 5-2. runtime별 공식 요구사항

`OpenAI Codex`
- `SKILL.md`는 `name`, `description`을 포함해야 한다
- Codex는 metadata를 먼저 읽고, skill을 쓰기로 결정했을 때만 본문을 로드한다
- implicit invocation은 `description` 경계에 의존한다
- optional metadata로 `agents/openai.yaml`을 둘 수 있다

`Google Gemini CLI`
- `SKILL.md`는 required file 이다
- YAML frontmatter + Markdown body 구조다
- `name`은 디렉터리명과 맞는 고유 식별자여야 한다
- `description`은 skill이 무엇을 하고 언제 쓰는지 설명해야 한다

`Anthropic Claude Code`
- skill은 `.claude/skills/<skill-name>/SKILL.md`에 둔다
- YAML frontmatter + Markdown body 구조다
- `description`은 권장 필드이며 자동 호출 판단에 쓰인다
- `name`은 slash command가 되며, 생략 시 디렉터리명을 쓸 수 있다

`Agent Skills Open Standard`
- `name`, `description`은 required다
- optional 필드는 `license`, `compatibility`, `metadata`, `allowed-tools`다
- body는 자유로운 Markdown instructions다

### 5-3. 이 lesson에서 쓰는 8블록 teaching schema

공식 최소 구조를 학생이 빠르게 읽고 remix할 수 있도록, 이번 lesson에서는 아래 8개 블록으로 펼쳐 설명합니다.

1. `Identity`
   - 이름, 역할, 이 skill이 맡는 일 1문장
2. `Trigger`
   - 언제 켜지고 언제 켜지지 말아야 하는가
3. `Input Contract`
   - 어떤 입력이 있으면 충분한가
4. `Output Contract`
   - 어떤 형식과 수준으로 결과를 내야 하는가
5. `Procedure`
   - 어떤 순서와 판단 규칙으로 움직이는가
6. `Resources`
   - scripts, references, templates, example outputs
7. `Guardrails / Gotchas`
   - 자주 틀리는 지점, 금지사항, 환경 제약
8. `Verification`
   - 테스트 프롬프트, 체크리스트, 산출물 평가 기준

짧게 요약하면:
- `공식 최소 구조`
  - 런타임이 읽는 실제 형식
- `8블록 teaching schema`
  - 학생이 skill을 agent capability처럼 해석하도록 돕는 설명 프레임

이번 lesson에서 학생에게 특히 강조할 것:
- `description`은 단순 소개문이 아니라 `트리거 계약`이다
- workflow가 길어질수록 `절차`는 stepwise 하게 적어야 한다
- output 예시는 장식이 아니라 `검증 장치`다
- references와 scripts는 본문을 짧게 유지하게 해 주는 `progressive disclosure` 장치다

## 6. Claude / Codex / Gemini / Agent Skills 비교 포인트

### 6-1. 공통점

- 셋 다 `SKILL.md` 중심 구조를 쓴다
- 셋 다 `name + description`을 핵심 메타데이터로 본다
- 셋 다 skill을 필요할 때만 불러오는 `on-demand capability`로 다룬다
- 셋 다 scripts / references / assets 같은 보조 파일을 둘 수 있다

### 6-2. 차이점

`Gemini CLI`
- `.gemini/skills/` 또는 `.agents/skills/` 를 쓴다
- skill activation 전에 description 기반 매칭과 사용자 승인 흐름이 있다
- procedural guidance를 우선 적용하도록 설계돼 있다

`Codex`
- `.agents/skills/` 를 중심으로 skill을 읽는다
- skill은 reusable workflow 이고, `subagent`는 명시적으로 spawn 하는 별도 실행 단위다
- `description` 경계가 명확해야 implicit invocation 품질이 올라간다

`Claude Code`
- `.claude/skills/` 를 쓴다
- skill도 자동/수동 호출이 가능하다
- 다만 공식 문서상 `specialized AI assistant`라는 표현은 subagent에 더 강하게 붙는다

`Agent Skills`
- 특정 제품이 아니라 open format 이다
- skill을 `lightweight, open format`과 `specialized knowledge and workflows`의 묶음으로 설명한다
- 그래서 여러 agent 런타임 사이의 공통 구조를 설명할 때 기준점으로 쓰기 좋다

### 6-3. 학생에게 전달할 한 문장

- `skill은 agent가 특정 일을 하게 만드는 재사용 가능한 설계도이고, 어떤 환경에서는 그 자체가 agent처럼 작동하며, 어떤 환경에서는 subagent를 움직이는 playbook 역할까지 겸한다`

## 7. 프롬프트는 왜 `선언적 지식 + 절차적 지식 + 상황 정보`가 필요한가

이번 lesson에서는 프롬프트의 필수 재료를 아래 3가지로 가르칩니다.
실제 문장 배치는 보통 `상황 정보 -> 앞 선언적 지식 -> 절차적 지식 -> 뒤 선언적 지식(출력 계약)`으로 정리합니다.

### 7-1. 상황 정보

먼저 `지금 이 작업이 어떤 맥락에서 실행되는지`를 고정합니다.

예시:
- 현재 과제
- 기존 산출물 상태
- 작업 중인 폴더 / 파일 / runtime
- Lesson 1에서 실제로 안 맞았던 지점
- 현재 막힌 부분
- 제출 형식이나 마감 조건

이 부분이 약하면 agent는 일반론을 말하거나, 지금 다루는 mismatch를 놓치기 쉽습니다.

### 7-2. 선언적 지식

먼저 `무엇을 왜 해야 하는지`를 고정합니다.

예시:
- 역할
- 작업 목적
- 핵심 용어
- 입력 자료
- 제약조건
- 하지 말아야 할 것

이 부분이 약하면 agent는 과제의 중심을 자주 놓칩니다.

선언적 지식은 보통 두 군데에 들어갑니다.
- 앞 선언적 지식
  - 목표, 역할, 제약, 용어 정의
- 뒤 선언적 지식
  - 출력 계약, 루브릭, 예시, 금지 형식

즉, `출력 계약`도 선언적 지식의 일부입니다.

### 7-3. 절차적 지식

다음으로 `어떻게 움직일지`를 적습니다.

예시:
- 단계 순서
- 우선순위
- 판단 분기
- 도구 사용 순서
- 실패 시 대응
- 중간 산출물

이 부분이 약하면 agent는 같은 목표를 알아도 매번 다른 방식으로 헤매기 쉽습니다.

짧게 정리하면:
- 상황 정보 = `현재 작업 프레임`
- 선언적 지식 = `문제 정의 + 결과 계약`
- 절차적 지식 = `행동 규칙`

이번 lesson에서는 학생이 이 3요소를 항상 분리해서 보게 하고, 선언적 지식은 앞/뒤 두 위치로 배치할 수 있다고 설명합니다.

## 8. 이 lesson 폴더에서 실제로 쓰는 파일

- `README.md`
  - 현재 lesson 실행 가이드
- `GEMINI.md`
  - lesson runtime 규칙 정본
- `.gemini/skills/remix-task/SKILL.md`
  - skill을 agent처럼 읽고 자기 과제에 맞게 재설계하는 예시 Skill
- `.gemini/skills/orchestration-agent/SKILL.md`
  - Lesson 1 command의 orchestration 역할을 skill로 올린 예시 Skill
- `.gemini/commands/remix/start.toml`
  - orchestration-agent 초안을 잡는 시작 command
- `.gemini/commands/remix/review.toml`
  - orchestration-agent draft를 점검하고 테스트 프롬프트를 만드는 예시 command
- `outputs/`
  - lesson 산출물 저장 폴더
- `notes/`
  - lesson 메모 폴더
- `notes/progress-log.md`
  - Lesson 1 -> Lesson 2 연속선과 remix 판단을 남기는 작업 진행 로그

## 9. 먼저 고를 것: 내 작업에서 어디가 안 맞았는가

좋은 시작 과제 예시:
- 발표문 작업인데 Lesson 1 산출물이 너무 글쓰기 중심이라 안 맞았다
- 보고서 구조는 잡혔지만, 필요한 출력 형식이 내 과제와 달랐다
- 리서치보다 인터뷰 정리나 사례 비교가 더 중요한 과제였다
- command는 좋았지만, 내 수업 제출 형식과 파일 이름이 안 맞았다

처음에는 피하는 것이 좋은 과제:
- lesson 전체를 한 번에 갈아엎으려는 작업
- skill 5개와 command 5개를 동시에 바꾸려는 작업
- 아직 실제 과제가 정해지지 않은 상태에서 구조만 크게 설계하는 작업

계속 기억할 문장:
- Lesson 2의 핵심은 `무작정 새로 만들기`보다 `기존 skill을 agent 구조로 다시 읽기`입니다.
- 큰 설계를 새로 만드는 것보다, 안 맞는 지점 3개를 agent 구조로 다시 해석하는 편이 더 빠릅니다.
- 좋은 customization은 구조를 늘리는 것이 아니라 `트리거, 절차, 출력 계약`을 선명하게 만들고, orchestration 경계를 skill로 올리는 것입니다.
- 이번 lesson에서는 `orchestration-agent` Skill 1개, 얇은 command 1개, 산출물 이름 1세트만 바꿔도 충분합니다.

## 10. Lesson 2 실행하기

세 환경 공통 원칙:
- Lesson 1에서 실제로 안 맞았던 지점 1개를 먼저 고릅니다.
- 사용자가 별도 과제를 주지 않았다면 기본 연습 과제를 그대로 씁니다.
- 기존 workflow를 버리지 않고 mismatch를 줄이는 방향으로 수정합니다.
- 수정 전에는 반드시 `이 skill이 어떤 agent 역할을 못 하고 있는가`를 먼저 말로 적습니다.
- 최종 산출물은 가능한 한 command보다 `orchestration-agent` skill 쪽에 더 많은 절차 지식을 남깁니다.
- 시작할 때 `notes/progress-log.md`에 Lesson 1 baseline, mismatch, keep/change를 먼저 적습니다.
- `remix:start`, `outputs/01~05`, `remix:review` 뒤에는 `notes/progress-log.md`를 갱신합니다.

### 10-1. 시작 전 local sync

현재 lesson 자산이 git repo 안에 있다면, 시작 전에 local sync를 먼저 점검해 봅니다.

권장 순서:
1. 현재 상태 확인

```bash
git status -sb
git branch --show-current
```

2. 원격 최신 이력 가져오기

```bash
git fetch origin
```

3. working tree가 깨끗하면 fast-forward pull 시도

```bash
git pull --ff-only
```

메모:
- 로컬 변경이 있으면 pull 전에 현재 변경을 먼저 정리합니다.
- lesson 2는 기존 예제를 최소 수정하는 단계이므로, 시작 전에 local 기준선을 맞춰 두는 편이 비교와 remix가 쉬워집니다.

### 10-2. 공통 시작 요청

환경과 상관없이 아래 뜻으로 시작하면 됩니다.

```text
먼저 지금 작업 폴더가 git repo라면 local sync가 필요한지 확인해줘.
이 lesson-2 remix workflow를 사용해서
"예시: Lesson 1의 산출물이 보고서 중심이라, 인터뷰 정리 과제에 맞게 Skill 1개와 command 1개만 고치고 싶다.
그리고 이 skill을 하나의 agent capability로 보면 어떤 구조를 가져야 하는지도 같이 정리해줘."
작업을 시작해줘.
가능하면 outputs/01_skill_as_agent_note.md부터 제안해줘.
가능하면 notes/progress-log.md에 Lesson 1 baseline부터 같이 정리해줘.
```

이 요청은 보통 아래 흐름으로 이어집니다.
- Lesson 1 baseline과 현재 과제를 `notes/progress-log.md`에 기록
- 현재 작업 1문장 정리
- Lesson 1과 안 맞는 지점 3개 식별
- 그대로 유지할 요소 3개 식별
- Lesson 1 command가 맡던 orchestration 역할을 skill로 올리면 무엇이 비는지 정리
- 새 `orchestration-agent` Skill 초안 제안
- 새 command 초안을 얇은 launcher/review wrapper 로 제안
- 프롬프트의 `상황 정보 + 선언적 지식 + 절차적 지식` 분해 제안

### 10-3. Gemini CLI

`.gemini`를 그대로 사용하고 아래 command를 실행합니다.

```text
/remix:start "먼저 현재 작업 폴더가 git repo라면 local sync 필요 여부를 확인해줘. Lesson 1의 산출물이 보고서 중심이라, 인터뷰 정리 과제에 맞게 orchestration-agent Skill 1개와 얇은 command 1개만 고치고 싶다. Lesson 1 command의 orchestration 역할을 skill로 올리고 싶다."
```

필요하면 아래를 다시 읽습니다.

```text
/memory reload
/skills reload
/commands reload
```

### 10-4. Codex / Claude Code가 필요할 때만

공통 원칙:
- 같은 remix workflow를 유지합니다.
- `GEMINI.md` 규칙을 현재 환경 runtime 파일로 옮깁니다.
- native command가 없으면 같은 뜻의 plain prompt를 사용합니다.

`Codex`
- `GEMINI.md` -> `AGENTS.md`
- `.gemini/skills/*`, `.gemini/commands/*`를 Codex 구조로 옮깁니다.
- skill은 reusable workflow 로, subagent는 별도 delegated execution 으로 구분해 설명합니다.

`Claude Code`
- `GEMINI.md` -> `CLAUDE.md`
- `.gemini/skills/*`, `.gemini/commands/*`를 Claude Code 구조로 옮깁니다.
- skill과 subagent가 공식적으로 분리된다는 점을 함께 설명합니다.

### 10-5. 추천 산출물

가능하면 아래 파일로 저장하면서 진행합니다.
- `outputs/01_skill_as_agent_note.md`
- `outputs/02_runtime_comparison.md`
- `outputs/03_orchestration_skill.md`
- `outputs/04_prompt_decomposition.md`
- `outputs/05_orchestration_command.md`
- `notes/progress-log.md`

### 10-6. draft 검토

초안을 만든 뒤에는 세 환경 모두 아래 뜻으로 다듬으면 됩니다.

```text
이 lesson-2 remix review workflow를 사용해서
"지금 만든 orchestration-agent skill / command draft를 검토해서
agent 구조가 빠진 부분은 보완하고,
과한 부분은 줄이고,
바로 실행 가능한 테스트 프롬프트 3개를 만들어줘."
작업을 진행해줘.
```

`Gemini CLI`에서는 아래 command를 그대로 실행할 수 있습니다.

```text
/remix:review "지금 만든 orchestration-agent skill/command draft를 검토해서 agent 구조가 빠진 부분은 보완하고, 과한 부분은 줄이고, 바로 실행 가능한 테스트 프롬프트 3개를 만들어줘."
```

수정 결과는 보통 아래 파일로 정리하면 됩니다.
- `outputs/06_test_prompt.md`
- `outputs/07_revision_notes.md`
- `notes/progress-log.md`에 review 요약 / 빠진 구조 / 다음 행동 기록

## 11. Lesson 2를 처음 실행할 때 가장 안전한 순서

1. lesson 자산이 들어 있는 현재 폴더가 git repo인지 확인하기
2. git repo라면 `git fetch origin`과 `git pull --ff-only`로 local sync 가능 여부 먼저 점검하기
3. Lesson 1에서 실제로 안 맞았던 지점 1개 고르기
4. `notes/progress-log.md`에 Lesson 1 baseline / mismatch / keep-change 기록하기
5. 그 차이를 `이 skill이 무슨 agent 역할을 못 하고 있는가`로 다시 말해 보기
6. Lesson 1 command가 맡던 orchestration 역할을 `orchestration-agent` skill로 올릴 범위를 정하기
7. 현재 환경에서 lesson 자산을 한 번 불러오기
8. `remix:start` 단계에 해당하는 시작 요청을 1회 실행하기
9. `outputs/01~05`와 `notes/progress-log.md`를 함께 저장하기
10. `remix:review` 단계까지 1회 돌려보고 로그에 review 결과 남기기
11. 그 다음 자기 과제에 맞게 실제 `orchestration-agent` skill 수정 범위를 결정하기

## 12. 추천 실습 시나리오

### 시나리오 0. 기본 연습 과제

```text
이 lesson-2 remix workflow를 사용해서
"Lesson 1으로 만든 workflow에서 안 맞았던 지점 1개를 찾아
orchestration-agent Skill 1개와 얇은 command 1개만 고치기.
그리고 그 skill을 agent capability로 보면 어떤 구조가 필요한지 함께 설명하기."
작업을 시작해줘.
```

### 시나리오 A. 인터뷰 정리형 과제

```text
이 lesson-2 remix workflow를 사용해서
"Lesson 1 흐름을 인터뷰 정리와 인사이트 정리 중심으로 바꾸고 싶다.
Lesson 1 command가 맡던 orchestration 역할을 skill로 올렸을 때 어떤 입력/절차/출력 계약이 필요한지 같이 정리해줘."
작업을 시작해줘.
```

### 시나리오 B. 제출 형식 맞추기

```text
이 lesson-2 remix workflow를 사용해서
"Lesson 1 command를 보고서 제출 형식에 맞게 바꾸고 싶다.
이 command의 orchestration 로직을 skill로 옮기고, 프롬프트에 필요한 상황 정보, 선언적 지식, 절차적 지식을 다시 분해해줘."
작업을 시작해줘.
```

### 시나리오 C. 구조 비교형 과제

```text
Claude, Codex, Gemini 관점에서
"좋은 skill은 어떤 agent 구조를 가져야 하는가"
를 비교하고,
그 비교를 바탕으로 내 과제용 orchestration-agent skill 초안을 만들어줘.
```

## 13. 막힐 때 쓰는 문장

### 시작이 막힐 때

```text
새 구조를 만들지 말고 Lesson 1에서 안 맞는 지점 3개만 먼저 찾아줘.
그리고 그 차이를 skill이 못 맡고 있는 agent 역할 3개로 바꿔서 말해줘.
```

### 구조가 막힐 때

```text
이 skill을
역할 / 트리거 / 입력 / 출력 / 절차 / 가드레일
6개 블록으로만 다시 정리해줘.
```

### 수정이 막힐 때

```text
지금 draft에서 과한 부분을 줄여줘.
프롬프트를 상황 정보 / 선언적 지식 / 절차적 지식으로 다시 나눠주고,
선언적 지식은 결과 계약까지 분명하게 정리해줘.
바로 테스트 가능한 프롬프트 3개만 남겨줘.
```

## 14. 이 lesson이 끝났다고 볼 기준

아래 네 가지가 나오면 이 lesson은 끝났다고 볼 수 있습니다.

- `skill을 agent처럼 볼 수 있는 이유`를 3~5문장으로 설명할 수 있다
- `Claude / Codex / Gemini / Agent Skills`의 공통점과 차이점을 1장 표나 bullet로 정리할 수 있다
- 자기 과제용 `orchestration-agent` Skill 1개와 얇은 command 1개를 `상황 정보 + 선언적 지식 + 절차적 지식` 관점으로 다시 쓸 수 있다
- `notes/progress-log.md`에 `Lesson 1 Baseline -> 오늘의 Action / Decision -> Evidence / Saved outputs -> Next Action` 흐름이 남아 있다
