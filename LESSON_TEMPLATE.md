# Lesson Template

이 파일은 `LLM101.Learn-is-Doing`의 새 lesson 폴더를 만들 때 복사해서 쓰는 공통 템플릿입니다.

## 1. lesson 폴더 기본 구조

새 lesson은 아래 구조를 기본으로 합니다.

```text
lessons/lesson-n-topic/
├── README.md
├── GEMINI.md
├── .gemini/
├── outputs/
└── notes/
```

- 이전 lesson이나 기존 초안에서 이어받는 연속형 lesson이면 `notes/progress-log.md`를 추가한다.

## 2. lesson 메타데이터

- lesson 번호: `Lesson N`
- lesson 제목: `[제목]`
- 한 줄 목표: `[이 lesson에서 끝까지 돌려볼 작업 1문장]`
- 대상 작업: `[과제 / 발표 / 보고서 / 프로젝트 / 실습]`

## 3. 기준 학습 문서와 기본 연습 과제

기준 학습 문서:
- `[문서 제목](https://example.com 또는 상대경로)`

기본 연습 과제:
- `[사용자가 자기 과제를 아직 정하지 않았을 때 바로 시작해 볼 작업 1문장]`

원칙:
- 기준 문서는 `실행 순서`, `체크`, `수정 loop`를 설명하는 문서 1개만 기준으로 본다.
- lesson 본문은 기준 문서의 어느 단계들을 lesson 형태로 옮긴 것인지 적는다.
- 사용자가 별도 과제를 지정하지 않으면 위 기본 연습 과제로 시작한다.
- local 폴더 전체를 기본 학습 surface로 쓰지 않고, 필요한 내용만 lesson 본문에 노출한다.
- 계속 참조해야 하는 안내는 로컬 경로를 늘어놓기보다 VibeWorkers OL 본문에 직접 적는다.
- 프롬프트 설명이 필요하면 `상황 정보 + 선언적 지식 + 절차적 지식`을 구분하고, `출력 계약`은 선언적 지식의 닫기 단계로 적는다.
- 현재 작업 폴더가 git repo 라면 lesson 시작 전에 local sync preflight를 먼저 안내한다.
- 여러 작은 skill과 command를 조율하는 lesson이라면, 최종 산출물은 `오케스트레이션 에이전트를 skill로 구현한 예시`까지 만들어 보는 것을 우선한다.
- 이전 lesson의 산출물을 이어받는 lesson이라면 `무엇을 그대로 두고 무엇을 바꾸는지`를 `notes/progress-log.md`에 남긴다.
- `Codex`와 `Claude Code` 안내가 필요하더라도, workflow와 outputs 설명은 기준 문서를 중심으로 유지한다.
- 전문 용어나 기술 용어가 나오면 처음 등장할 때 쉬운 말로 풀어 쓰고, 필요하면 `쉬운 말 풀이` 또는 `Glossary` 블록을 짧게 넣는다.

## 4. 이 lesson 폴더에서 실제로 쓰는 파일

- `README.md`
- `GEMINI.md`
- `.gemini/skills/[skill-name]/SKILL.md`
- `.gemini/skills/orchestration-agent/SKILL.md` (필요한 lesson에 한함)
- `.gemini/commands/[command-group]/[command].toml`
- `outputs/`
- `notes/`
- `notes/progress-log.md` (이전 lesson의 연속선이 있는 lesson에 한함)

## 4-1. 쉬운 말 풀이

필요한 lesson에만 아래 형식으로 3~7개 정도 적는다.

- `workflow`
  - 이 lesson에서 끝까지 따라갈 작업 순서
- `skill`
  - 특정 작업을 도와주는 작은 전문 도우미
- `command`
  - 자주 쓰는 요청을 바로 실행하는 짧은 호출문
- `runtime`
  - 지금 쓰는 실행 환경
- `preflight`
  - 시작 전에 먼저 확인하는 점검 단계

## 5. lesson 목표

- 이 lesson의 핵심 흐름 1개를 적는다.
- 학습자가 이번 lesson에서 남겨야 할 최소 산출물 1개를 적는다.
- 흐름 조율이 핵심인 lesson이라면, 최소 산출물은 `orchestration-agent` skill 1개까지 만든다고 적는다.
- 완벽한 결과보다 먼저 체감해야 할 성공 경험 1개를 적는다.

## 6. 시작하기 전에 고를 것

좋은 시작 과제 예시:
- `[예시 1]`
- `[예시 2]`

처음에는 피하는 것이 좋은 과제:
- `[비권장 예시 1]`
- `[비권장 예시 2]`

## 7. 시작 전 preflight

현재 lesson 자산이 git repo 안에 있다면 시작 전에 아래를 먼저 점검한다.

```bash
git status -sb
git fetch origin
git pull --ff-only
```

- working tree가 깨끗하지 않으면 pull 전에 현재 변경부터 정리한다고 적는다.
- git repo가 아니라면 이 단계는 건너뛴다고 적는다.

## 8. 실행하기

### 7-1. 공통 시작 요청

```text
[먼저 현재 작업 폴더가 git repo라면 local sync 필요 여부를 확인해줘.
이 lesson workflow를 사용해서 "[실제 작업 1개]"를 시작해줘.]
```

### 7-2. 기본 연습 과제 요청

```text
[먼저 현재 작업 폴더가 git repo라면 local sync 필요 여부를 확인해줘.
이 lesson workflow를 사용해서 "[기본 연습 과제]"를 시작해줘.]
```

### 7-3. 추천 산출물

- `outputs/[name].md`
- `outputs/[name].md`
- `outputs/[name].md`
- `notes/progress-log.md` (연속형 lesson이면 함께 갱신)

### 7-4. Gemini CLI

- `.gemini`를 그대로 사용한다.
- 필요하면 `/memory reload`, `/skills reload`, `/commands reload`를 안내한다.
- native command가 있으면 아래처럼 예시를 적는다.

```text
/[command] "[실제 작업 1개]"
```

### 7-5. Codex / Claude Code가 필요할 때만

- workflow와 outputs는 그대로 두고 runtime 파일과 skill / command 구조만 옮긴다고 적는다.
- `Codex`: `GEMINI.md` -> `AGENTS.md`
- `Claude Code`: `GEMINI.md` -> `CLAUDE.md`
- orchestration 로직이 길다면 command보다 skill에 넣고, command는 얇은 launcher/review wrapper 로 남긴다고 적는다.
- native command가 없으면 같은 뜻의 plain prompt를 적는다.

### 7-6. 수정 요청

```text
[이 lesson workflow를 사용해서 "[수정 예시]"를 다듬어줘.
필요하면 프롬프트를 상황 정보 / 선언적 지식 / 절차적 지식으로 다시 나눠줘.]
```

## 9. 추천 실습 시나리오

### 시나리오 0. 기본 연습 과제

```text
[이 lesson workflow를 사용해서 "[기본 연습 과제]"를 시작해줘.]
```

### 시나리오 A

```text
[이 lesson workflow를 사용해서 "[시나리오 A]"를 시작해줘.]
```

### 시나리오 B

```text
[이 lesson workflow를 사용해서 "[시나리오 B]"를 시작해줘.]
```

## 10. 막힐 때 쓰는 문장

### 시작이 막힐 때

```text
[문장 1]
[문장 2]
```

### 구조가 막힐 때

```text
[문장 1]
[문장 2]
```

### 수정이 막힐 때

```text
[문장 1]
[문장 2]
```

## 11. 합본 갱신 규칙

lesson 문서를 수정한 뒤에는 course root에서 아래를 실행합니다.

```bash
bash scripts/build_combined.sh
```
