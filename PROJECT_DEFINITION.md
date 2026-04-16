# PROJECT_DEFINITION

## 한 줄 정의

`LLM101.Learn-is-Doing`은 튜토리얼 시리즈 이름이고, 현재 tools workspace `LLM101.tools.Learn-is-doing/`는 [`tutorial-gemini-cli-student-workflow.md`](../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md) 의 학생 실습 흐름을 lesson 단위 실행 자산으로 옮긴 대학생용 workflow 스타터팩이며, docs workshop 정본을 직접 참조하는 운영 경로와 VibeWorkers OL 연동 정본을 함께 포함한다.

## 프로젝트가 해결하려는 문제

- 많은 초보 사용자는 LLM을 "질문-답변 도구"로만 쓰고, 실제 과제 흐름으로 연결하지 못한다.
- 큰 프레임워크나 추상 이론부터 배우면 바로 실행 가능한 첫 성공 경험을 만들기 어렵다.
- 학생이 자기 과제 1개를 기준으로 `설치 -> 규칙 작성 -> skill/command 준비 -> 첫 실행 -> 수정 loop`를 반복할 수 있는 최소 구조가 필요하다.
- 학생은 프롬프트에 `상황 정보`, `선언적 지식`, `절차적 지식`을 함께 넣어야 한다는 감각이 약해서, 실제 과제 맥락이 빠진 일반론으로 흐르기 쉽다.
- 작업을 시작할 때 현재 로컬 워크스페이스가 최신인지 확인하지 않으면, 예제와 현재 상태가 엇갈려 remix 판단이 흔들리기 쉽다.
- 같은 workflow를 `Gemini CLI`, `Codex`, `Claude Code`로 옮기더라도 핵심 과제 흐름과 산출물 구조는 유지되어야 한다.

## 대상 사용자

- 대학 과제나 발표 준비에 LLM을 처음 실전에 붙여보려는 학습자
- 기준 문서의 Gemini CLI workflow를 자기 작업에 맞게 바로 실행해 보고 싶은 사용자
- 필요하면 같은 workflow를 `Codex`나 `Claude Code`에서도 재사용하고 싶은 사용자

## 핵심 접근 방식

### 1. Canonical First

- 기준 학습 문서는 `tutorial-gemini-cli-student-workflow.md` 하나만 기준으로 본다.
- lesson 문서는 이 기준 문서의 실행 단계, 체크, 수정 loop를 lesson 형태로 다시 정리한다.
- 기준 문서에 없는 큰 이론이나 별도 커리큘럼을 먼저 늘리지 않는다.

### 2. Learn is Doing

- 이 프로젝트는 개념 설명보다 "작은 작업 하나를 실제로 끝까지 수행하는 경험"을 우선한다.
- 기본 입력은 외부 글 읽기가 아니라 `이번 주 실제 작업 1개`다.

### 3. 작은 Skill + Command 중심

- Lesson 1은 `리서치 -> 정리 -> 분석 -> 글쓰기 -> 다듬기` 흐름을 한 번 돌려보게 한다.
- Lesson 2는 Lesson 1의 예제 Skill과 command를 자기 과제에 맞게 최소 수정하되, skill을 `agent capability`로 다시 읽고 command에 있던 orchestration 역할을 `orchestration-agent` skill로 올려 보게 한다.
- 핵심은 새 구조를 과하게 늘리는 것이 아니라, 바로 실행 가능한 최소 버전을 남기는 것이다.

### 4. Prompt는 지식 + 맥락으로 가르친다

- 프롬프트는 최소한 `상황 정보 + 선언적 지식 + 절차적 지식` 3요소를 포함하도록 가르친다.
- 선언적 지식은 시작부의 문제 정의와 마지막의 `출력 계약` 두 위치로 나눠 설명할 수 있게 한다.
- lesson은 학생이 자기 작업을 이 3요소로 분해해 말할 수 있도록 돕는다.

### 5. Git Local Sync Preflight

- lesson 시작 전 현재 작업 폴더가 git repo 라면 local sync 상태를 먼저 점검한다.
- 기본 점검 순서는 `git status -sb -> git fetch origin -> git pull --ff-only` 이다.
- 로컬 변경이 있으면 pull 전에 상태를 먼저 정리하도록 안내한다.

### 6. 산출물 기반 학습

- 각 lesson은 `outputs/`와 `notes/`를 기본 저장 위치로 둔다.
- 학습 결과는 대화가 아니라 파일 산출물로 남긴다.
- local 폴더 전체를 학습자에게 그대로 펼쳐 보이는 것을 기본값으로 삼지 않는다.
- 학습에 필요한 실행 정보만 lesson 문서나 VibeWorkers OL 본문에 노출하고, local 폴더는 정본/작업 자산 저장소로 유지한다.

### 7. 환경 차이는 최소 안내

- `Gemini CLI`는 기준 문서에 나온 절차를 그대로 따른다.
- `Codex`와 `Claude Code`는 같은 workflow와 outputs를 유지한 채 runtime 파일명과 skill / command 구조 차이만 별도 안내한다.
- 환경별 차이를 별도 커리큘럼으로 분리하지 않는다.

### 8. 쉬운 말 우선

- 학생-facing 문서에서 전문 용어나 기술 용어가 나오면 처음 등장할 때 쉬운 말로 바로 풀어 쓴다.
- 가능하면 `용어 -> 익숙한 한국어 설명 -> 짧은 예시` 순서로 안내한다.
- 설명 없이 줄임말이나 내부 운영 용어만 던지지 않는다.
- 예를 들어 `workflow`는 `작업 순서`, `preflight`는 `시작 전 점검`, `orchestration`은 `여러 단계를 순서대로 묶어 움직이게 하는 일`처럼 적는다.
- 학생이 계속 다시 보는 OL 본문에는 필요한 용어 풀이를 짧게 올리고, 더 깊은 정의는 local 정본이나 심화 문서로 내린다.

## 현재 범위

- course 공통 안내 문서
- lesson 템플릿
- lesson 1: student task workflow 실행
- lesson 2: skill-as-agent remix
- docs 기준 workshop 운영 문서 direct reference
- VibeWorkers OL bridge 문서와 인벤토리
- 합본 문서 생성 스크립트
- course / OL 자동 검증 스크립트

## 범위 밖

- 특정 모델 하나에만 고정된 전용 프레임워크
- 정답 생성만을 목표로 하는 답안 생산기
- 모든 과제를 자동 채점하거나 자동 제출하는 시스템
- 기준 문서와 무관한 별도 이론 코스 확장

## 성공 조건

- 사용자가 lesson 폴더 하나를 import해서 실제 작업 1개를 문장으로 적고 시작할 수 있다.
- 사용자가 현재 작업을 `상황 정보 + 선언적 지식 + 절차적 지식`으로 다시 설명할 수 있다.
- 필요하면 lesson 시작 전에 현재 git local 상태를 점검하고 기준선을 맞출 수 있다.
- 최소 1개의 작업 산출물을 `outputs/`에 남길 수 있다.
- 결과를 보고 `GEMINI.md`, `SKILL.md`, command 중 하나를 1회 이상 수정할 수 있다.
- Lesson 2 수준에서는 command에 있던 orchestration 로직을 `SKILL.md`로 끌어올린 `orchestration-agent` 예시 1개를 남길 수 있다.
- 운영자는 `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md`에서 90분 워크숍 패키지를 바로 열 수 있다.
- `ol/manifest.tsv`와 `ol/pages/*.md`가 로컬 정본과 연결된 상태로 로컬 검증을 통과할 수 있다.
- 필요하면 같은 workflow를 `Codex` 또는 `Claude Code` 구조로 옮길 수 있다.

## 현재 정본 기준

- course 공통 안내 SoT: `README.md`
- project definition SoT: `PROJECT_DEFINITION.md`
- implementation requirements SoT: `IMPLEMENTATION_REQUIREMENTS.md`
- lesson 템플릿 SoT: `LESSON_TEMPLATE.md`
- 합본 SoT: `COMBINED.md`
- course validation SoT: `scripts/validate_course.sh`
- OL validation SoT: `scripts/validate_vibeworkers_ol.sh`
- quality gate SoT: `scripts/run_quality_gate.sh`
- lesson 실행 SoT: 각 lesson 폴더의 `README.md`
- runtime 규칙 SoT: 각 lesson 폴더의 `GEMINI.md`
- workshop SoT: `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md`, `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-*.md`
- VibeWorkers OL SoT: `ol/README.md`, `ol/manifest.tsv`, `ol/pages/*.md`
- 기준 학습 문서 SoT: `../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md`
