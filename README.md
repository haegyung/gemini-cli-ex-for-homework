# LLM101.Learn-is-Doing

이 폴더는 `LLM101.Learn-is-Doing` 튜토리얼 시리즈의 tools 정본(course root)입니다.  
시리즈 이름은 `LLM101.Learn-is-Doing`이고, 현재 tools workspace의 실제 경로는 `LLM101.tools.Learn-is-doing/`입니다.  
기준 문서인 학생 실습용 Gemini CLI 튜토리얼을 lesson 단위 실행 자산으로 다시 정리해 둔 workspace입니다.

현재 포함된 lesson:
- [Lesson 1. 스킬을 활용해서 리서치부터 글쓰기까지](./lessons/lesson-1-research-writing/README.md)
- [Lesson 2. Skill을 에이전트처럼 이해하고 내 과제에 맞게 remix하기](./lessons/lesson-2-remix-skill-and-command/README.md)

워크숍 운영 문서:
- [Workshop Materials](../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md)

VibeWorkers OL 연동 문서:
- [VibeWorkers OL System](./ol/README.md)

프로젝트 정의:
- [PROJECT_DEFINITION.md](./PROJECT_DEFINITION.md)

기준 학습 문서:
- [학생 실습용: Gemini CLI 작업 워크플로](../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md)

교재/심화 문서:
- [Gemini CLI 실습 교재 (MD 구조화 버전)](../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-textbook.md)
- [학생 Task 중심 Gemini CLI 튜토리얼 (긴 버전)](../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-structured.md)

공유 공식 가이드 허브:
- [knol/agent-skills/skill-as-agent-shared-guide.md](./knol/agent-skills/skill-as-agent-shared-guide.md)
- [knol/agent-skills/official-source-map.md](./knol/agent-skills/official-source-map.md)

## 0. 이 코스의 목적

이 코스는 위 기준 문서의 학생 실습 흐름을 재사용 가능한 lesson 형태로 옮긴 것입니다.

핵심 원칙:
- 기준은 `실제 작업 1개를 끝까지 굴리는 workflow` 입니다.
- lesson 1은 기준 문서의 `GEMINI.md 작성 -> SKILL 5개 -> custom command 2개 -> 첫 실행 -> revise loop`를 lesson 자산으로 정리한 버전입니다.
- lesson 2는 같은 흐름을 자기 과제에 맞게 최소 수정하되, skill을 `agent capability`로 읽고 command에 있던 orchestration 역할을 `orchestration-agent` skill로 올리는 extension 입니다.
- lesson 2 이후의 코스 공통 기준은 `프롬프트에 상황 정보 + 선언적 지식 + 절차적 지식이 모두 있어야 한다`는 점을 명시하는 것입니다.
- lesson 실행 전 현재 작업 폴더가 git repo 라면 `local sync 가능 상태`부터 점검하는 것을 기본 preflight로 둡니다. working tree가 깨끗하고 `origin` 원격이 있을 때만 fetch/pull을 진행합니다.
- local 폴더 전체를 학습자에게 그대로 노출하는 것을 기본값으로 두지 않고, 필요한 내용만 lesson 문서나 VibeWorkers OL 본문에 드러내는 것을 원칙으로 둡니다.
- 학생-facing 문서에서 낯선 전문 용어나 기술 용어가 나오면, 처음 등장할 때 쉬운 말로 바로 풀어 쓰거나 짧은 용어 풀이를 붙입니다.
- `Gemini CLI`, `Codex`, `Claude Code`를 별도 커리큘럼으로 나누지 않고, 같은 workflow와 산출물 구조를 유지한 채 필요한 차이만 따로 안내합니다.
- runtime별 skill 구조 차이는 `./knol/agent-skills/`의 공유 요약을 기준으로 통일합니다.
- publishable workshop 운영 문서는 `../LLM101.docs.Learn-is-doing/canonical/markdown/`을 정본으로 두고, tools repo는 별도 `workshop/` 미러를 두지 않고 이 경로를 직접 참조합니다.

## 0-1. 낯선 용어를 읽는 기본 규칙

이 코스에서는 전문 용어를 많이 아는지를 평가하지 않습니다. 문서에 낯선 말이 나오면 아래 방식으로 바로 이해할 수 있게 씁니다.

- `workflow`
  - 일을 끝내기 위한 작업 순서
- `skill`
  - 특정 작업을 덜 막히게 해 주는 작은 전문 도우미
- `command`
  - 자주 쓰는 요청을 바로 실행하게 만든 짧은 호출문
- `runtime`
  - 지금 실제로 쓰는 실행 환경. 예: `Gemini CLI`, `Codex`, `Claude Code`
- `preflight`
  - 시작 전에 먼저 확인하는 점검 단계
- `orchestration`
  - 여러 단계와 도구를 어떤 순서로 묶어 움직일지 정하는 일

학생-facing 문서에서는 위처럼 `용어 -> 쉬운 말` 순서로 처음 설명하고, 그다음부터만 짧은 원어를 다시 씁니다.

## 1. 가장 짧은 시작 순서

1. 기준 학습 문서 [`tutorial-gemini-cli-student-workflow.md`](../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md) 를 한 번 읽습니다.
2. 현재 작업 폴더가 git repo 라면 먼저 `git status -sb`로 상태를 확인합니다. working tree가 깨끗하고 `origin` 원격이 있을 때만 `git fetch origin`, `git pull --ff-only`를 실행합니다. 로컬 변경이 있거나 원격이 없으면 sync 단계는 건너뛰고 현재 상태만 기록합니다.
3. 이번 주에 실제로 해야 하는 작업 1개를 문장으로 적습니다.
4. `lessons/lesson-1-research-writing/` 폴더를 현재 작업 환경으로 import 합니다.
5. `GEMINI.md`, `.gemini/`, `outputs/`를 현재 환경 규약에 맞게 불러옵니다.
6. `start` 단계에 해당하는 요청 1회를 실행합니다.
7. `outputs/`에 결과를 남깁니다.
8. 결과를 보고 `revise` 또는 `remix` 단계로 한 번 더 수정합니다.

권장 진행 순서:
- `lessons/lesson-1-research-writing/`
- `lessons/lesson-2-remix-skill-and-command/`

## 2. lesson 맵

### Lesson 1

- 목적: 학생의 실제 과제, 발표, 보고서, 학습 작업을 `리서치 -> 정리 -> 분석 -> 글쓰기 -> 다듬기` 순서로 한 번 끝까지 돌립니다.
- 기준 근거:
  - 기준 문서의 `5) GEMINI.md 작성`
  - `6) Task용 작은 SKILL 제작`
  - `7) 오케스트레이션용 custom command 2개 만들기`
  - `8) 실제 작업에 적용`
  - `9) 결과 수정 루프`

### Lesson 2

- 목적: Lesson 1 예제를 버리지 않고 자기 과제에 맞게 최소 수정하되, skill을 `재사용 가능한 agent capability`로 이해하고 최종적으로 `orchestration-agent` skill 1개까지 만들어 봅니다.
- 추가 기준: 프롬프트를 `상황 정보 + 선언적 지식 + 절차적 지식`으로 분해해 보고, 시작 전에 git local sync 가능 상태를 먼저 점검합니다. working tree가 깨끗하고 `origin`이 있을 때만 fetch/pull을 진행합니다.
- 기준 근거:
  - 기준 문서의 `9) 결과 수정 루프`
  - `10) 다음에 다시 쓸 때 기본 실행 패턴`
  - `12) 체크리스트`
- 공유 해설 근거:
  - `./knol/agent-skills/skill-as-agent-shared-guide.md`
  - `./knol/agent-skills/official-source-map.md`

## 3. 기준 실행 흐름

### 3-1. Gemini CLI

기준 문서에 직접 나온 기본 흐름을 그대로 씁니다.

- 준비물:
  - macOS 또는 Linux 터미널
  - Node.js 20+
  - 인터넷 연결
  - 개인 Google 계정 또는 Gemini API Key
  - 실제 작업 1개
- 설치 / 인증:
  - `npm install -g @google/gemini-cli`
  - `brew install gemini-cli`
  - 또는 `npx @google/gemini-cli`
- 확인:
  - `gemini --version`
  - `gemini`
  - `/about`
- lesson 자산을 가져온 뒤 필요하면 아래를 다시 읽습니다.

```text
/memory reload
/skills reload
/commands reload
```

### 3-2. Codex / Claude Code

기준 문서에는 Gemini CLI 단계가 상세히 적혀 있고, 이 코스에서는 같은 workflow를 다른 환경으로 옮길 때 필요한 차이만 적습니다.

공통 원칙:
- 실제 작업 1개를 적는 방식은 같습니다.
- 산출물 구조는 같은 뜻을 유지합니다.
- `GEMINI.md`의 규칙을 각 환경의 runtime 파일로 옮깁니다.
- `.gemini` 자산은 각 환경의 skill / command 구조로 다시 만듭니다.
- 현재 폴더가 git repo 라면 lesson 시작 전에 local sync 가능 상태부터 확인합니다. working tree가 깨끗하고 `origin`이 있을 때만 fetch/pull을 진행합니다.
- local 폴더의 세부 내용은 필요한 부분만 노출하고, 반복해서 참고해야 하는 안내는 VibeWorkers OL 본문에 적어 학습자 surface를 얇게 유지합니다.
- 프롬프트를 설명할 때는 `상황 정보`, `선언적 지식`, `절차적 지식`을 분리하고, `출력 계약`은 선언적 지식의 닫기 단계로 둡니다.

필요할 때만 별도 안내:
- `Codex`: `GEMINI.md` -> `AGENTS.md`
- `Claude Code`: `GEMINI.md` -> `CLAUDE.md`
- native command가 없으면 lesson `README.md`의 시작 / 수정 요청을 plain prompt로 실행합니다.

## 4. 구조와 SoT

이 코스의 정본 경로는 아래처럼 나눕니다.
- course 공통 안내 SoT: `README.md`
- project 정의 SoT: `PROJECT_DEFINITION.md`
- 구현 요구사항 SoT: `IMPLEMENTATION_REQUIREMENTS.md`
- lesson 템플릿 SoT: `LESSON_TEMPLATE.md`
- 합본 SoT: `COMBINED.md`
- 합본 생성 스크립트 SoT: `scripts/build_combined.sh`
- course 검증 SoT: `scripts/validate_course.sh`
- OL 검증 SoT: `scripts/validate_vibeworkers_ol.sh`
- quality gate SoT: `scripts/run_quality_gate.sh`
- lesson 1 본문 SoT: `lessons/lesson-1-research-writing/README.md`
- lesson 1 runtime 규칙 SoT: `lessons/lesson-1-research-writing/GEMINI.md`
- lesson 2 본문 SoT: `lessons/lesson-2-remix-skill-and-command/README.md`
- lesson 2 runtime 규칙 SoT: `lessons/lesson-2-remix-skill-and-command/GEMINI.md`
- 기준 학습 문서 SoT: `../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md`
- shared agent-skills guide SoT: `knol/agent-skills/skill-as-agent-shared-guide.md`
- workshop publishable SoT: `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md`
- OL bridge SoT: `ol/README.md`
- OL inventory SoT: `ol/manifest.tsv`
- OL page contracts SoT: `ol/pages/*.md`

현재 폴더 구조:

```text
LLM101.tools.Learn-is-doing/
├── README.md
├── PROJECT_DEFINITION.md
├── IMPLEMENTATION_REQUIREMENTS.md
├── LESSON_TEMPLATE.md
├── COMBINED.md
├── knol/
├── ol/
│   ├── README.md
│   ├── manifest.tsv
│   └── pages/
├── scripts/
│   ├── build_combined.sh
│   ├── run_quality_gate.sh
│   ├── validate_course.sh
│   └── validate_vibeworkers_ol.sh
├── lessons/
│   ├── lesson-1-research-writing/
│   │   ├── README.md
│   │   ├── GEMINI.md
│   │   ├── .gemini/
│   │   ├── outputs/
│   │   └── notes/
│   └── lesson-2-remix-skill-and-command/
│       ├── README.md
│       ├── GEMINI.md
│       ├── .gemini/
│       ├── outputs/
│       └── notes/
└── ../LLM101.docs.Learn-is-doing/canonical/markdown/
    ├── workshop-materials.md
    ├── workshop-90min-run-sheet.md
    ├── workshop-90min-student-handout.md
    └── workshop-d-1-preflight.md
```

## 5. 합본 정책

이 코스는 업데이트가 끝날 때마다 합본을 같이 관리합니다.

합본 원칙:
- 편집 대상은 `README.md`, `lessons/*/README.md`, `LESSON_TEMPLATE.md`
- 최종 합본은 `COMBINED.md`
- 합본은 직접 편집하지 않고 스크립트로 다시 생성합니다.
- workshop 문서는 docs 정본을 직접 참조하고, `ol/` 문서는 별도 브리지로 검증합니다.

생성 명령:

```bash
bash scripts/build_combined.sh
```

이 명령만 `COMBINED.md`를 다시 쓴다. quality gate는 최신성만 검사하고 파일을 직접 다시 만들지 않는다.

## 6. Quality Gate 실행

문서 / lesson 자산을 수정한 뒤에는 아래 게이트를 실행합니다.

```bash
bash scripts/run_quality_gate.sh
```

이 게이트는 아래 두 검증을 함께 실행합니다.
- `bash scripts/validate_course.sh`
- `bash scripts/validate_vibeworkers_ol.sh`

해석 기준:
- `PASS`(exit code 0): course 자산과 OL bridge의 Must 완료 조건을 함께 충족
- `FAIL`(exit code 1): 미완료. 로그에 나온 실패 항목부터 수정 후 재실행
- `FAIL` 중 `COMBINED.md was stale before gate`가 나오면 `bash scripts/build_combined.sh`를 먼저 실행한 뒤 다시 검사한다
