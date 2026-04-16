# Lesson 1. 스킬을 활용해서 리서치부터 글쓰기까지

이 문서는 `LLM101.tools.Learn-is-doing/lessons/lesson-1-research-writing/` 폴더의 정본 lesson guide 입니다.  
시리즈 이름은 `LLM101.Learn-is-Doing`이지만, 현재 lesson 자산의 실제 경로는 위 tools workspace 기준입니다.  
course 공통 안내는 상위 폴더의 `../../README.md`를 보고, 현재 lesson 실행은 이 파일을 기준으로 진행합니다.

## 1. 이 lesson의 목표

이번 lesson의 목적은 하나입니다.
- 작은 Skill과 command를 써서 `리서치 -> 정리 -> 분석 -> 글쓰기 -> 다듬기` 흐름을 한 번 끝까지 돌려보는 것

핵심은 세 가지입니다.
- 입력은 외부 글 읽기가 아니라 `이번 주에 실제로 해야 하는 작업 1개`입니다.
- 완벽한 결과보다 작은 성공 경험을 먼저 만듭니다.
- 예제 Skill과 command를 그대로 한 번 실행한 뒤, 자기 작업에 맞게 고칩니다.

## 1-1. 쉬운 말 풀이

- `workflow`
  - 이 lesson에서 따라갈 작업 순서
- `Skill`
  - 특정 작업을 덜 막히게 해 주는 작은 전문 도우미
- `command`
  - 자주 쓰는 요청을 바로 실행하는 짧은 호출문
- `runtime`
  - 지금 실제로 쓰는 환경. 예: `Gemini CLI`, `Codex`, `Claude Code`
- `revise`
  - 한 번 만든 결과를 다시 다듬는 단계

## 2. 기준 학습 문서와 기본 연습 과제

기준 학습 문서:
- [학생 실습용: Gemini CLI 작업 워크플로](../../../LLM101.docs.Learn-is-doing/canonical/markdown/tutorial-gemini-cli-student-workflow.md)

이 lesson이 옮긴 기준 단계:
- `5) GEMINI.md 작성`
- `6) Task용 작은 SKILL 제작 (5개)`
- `7) 오케스트레이션용 custom command 2개 만들기`
- `8) 실제 작업에 적용`
- `9) 결과 수정 루프`

기본 연습 과제:
- `AI 윤리 수업 발표를 위해 최근 생성형 AI의 저작권 논쟁 사례를 조사하고, 5분 발표용 개요와 초안을 만들기`

원칙:
- 사용자가 별도 과제를 지정하지 않으면 위 기본 연습 과제로 시작합니다.
- lesson의 목표와 출력 형식은 기준 학습 문서의 학생 workflow를 그대로 따릅니다.
- local 폴더의 내용을 전부 학습자에게 펼쳐 보이는 것을 기본값으로 두지 않고, 필요한 내용만 이 본문에 노출합니다.
- 계속 참고해야 하는 실행 안내는 로컬 폴더 탐색보다 VibeWorkers OL 본문에 적어 다시 볼 수 있게 정리합니다.
- `Codex`와 `Claude Code` 안내가 필요하더라도, 같은 workflow와 outputs를 유지한 채 필요한 차이만 따로 적습니다.

## 3. 이 lesson 폴더에서 실제로 쓰는 파일

- `README.md`
  - 현재 lesson 실행 안내문
- `GEMINI.md`
  - 이 lesson이 Gemini에서 어떻게 움직일지 적어 둔 실행 규칙
- `.gemini/skills/research-task/SKILL.md`
  - 리서치 시작용 예시 Skill
- `.gemini/skills/organize-task/SKILL.md`
  - 정리용 예시 Skill
- `.gemini/skills/analysis-task/SKILL.md`
  - 분석용 예시 Skill
- `.gemini/skills/writing-task/SKILL.md`
  - 초안 작성용 예시 Skill
- `.gemini/skills/revise-task/SKILL.md`
  - 수정용 예시 Skill
- `.gemini/commands/taskflow/start.toml`
  - 리서치부터 초안까지 시작하는 예시 호출문
- `.gemini/commands/taskflow/revise.toml`
  - 초안을 기준으로 다시 다듬는 예시 호출문
- `outputs/`
  - lesson 산출물 저장 폴더
- `notes/`
  - lesson 메모 폴더

## 4. 먼저 고를 것: 이번 주에 실제로 해야 하는 작업 1개

좋은 시작 과제 예시:
- 발표 자료 조사해서 초안 만들기
- 비교 보고서 구조 잡기
- 사회심리학 과제 초안 쓰기
- 팀플 발표용 5분 스크립트 초안 만들기

처음에는 피하는 것이 좋은 과제:
- 너무 넓은 주제 하나 전체 공부하기
- 아직 마감이나 제출 맥락이 없는 추상 주제
- 한 번에 너무 긴 최종 결과물을 만들려는 과제

계속 기억할 문장:
- 리서치는 그럴듯한 문장을 만드는 단계가 아니라 근거를 모으는 단계입니다.
- 정리는 요약과 구조화를 분리하면 더 안전합니다.
- 분석은 느낌이 아니라 주장과 근거를 연결하는 일입니다.
- 초안은 완벽할 필요가 없습니다. 대신 근거가 달린 문장으로 끝까지 써보는 것이 먼저입니다.
- 작은 Skill은 큰 이론서가 아니라, 하나의 Task를 덜 막히게 하는 작은 도우미입니다.

## 5. Lesson 1 실행하기

세 환경 공통 원칙:
- 실제 작업 1개를 먼저 적습니다.
- 사용자가 별도 과제를 주지 않았다면 기본 연습 과제를 그대로 씁니다.
- 산출물 의미는 `research -> outline -> analysis -> draft -> revision` 순서를 유지합니다.

### 5-1. 공통 시작 요청

환경과 상관없이 아래 뜻으로 시작하면 됩니다.

```text
이 lesson-1 research-writing workflow를 사용해서
"예시: AI 윤리 수업 발표를 위해 최근 생성형 AI의 저작권 논쟁 사례를 조사하고, 5분 발표용 개요와 초안을 만들기"
작업을 시작해줘.
가능하면 outputs/research.md부터 제안해줘.
```

이 요청은 보통 아래 흐름으로 이어집니다.
- `research-task` 기준으로 질문과 검색 키워드를 잡기
- `organize-task` 기준으로 자료를 구조화하기
- `analysis-task` 기준으로 주장과 근거를 연결하기
- `writing-task` 기준으로 초안을 만들기

### 5-2. Gemini CLI

`.gemini`를 그대로 사용하고 아래 command를 실행합니다.

```text
/taskflow:start "AI 윤리 수업 발표를 위해 최근 생성형 AI의 저작권 논쟁 사례를 조사하고, 5분 발표용 개요와 초안을 만들기"
```

필요하면 아래를 다시 읽습니다.

```text
/memory reload
/skills reload
/commands reload
```

### 5-3. Codex / Claude Code가 필요할 때만

공통 원칙:
- 같은 workflow와 outputs를 유지합니다.
- `GEMINI.md` 규칙을 현재 환경 runtime 파일로 옮깁니다.
- native command가 없으면 같은 뜻의 plain prompt를 사용합니다.

`Codex`
- `GEMINI.md` -> `AGENTS.md`
- `.gemini/skills/*`, `.gemini/commands/*`를 Codex 구조로 옮깁니다.

```text
$skill-creator
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Codex용 lesson-1 research-writing skill과 command 구조를 만들어줘.
산출물 의미는 research -> outline -> analysis -> draft -> revision 순서를 유지해줘.
```

`Claude Code`
- `GEMINI.md` -> `CLAUDE.md`
- `.gemini/skills/*`, `.gemini/commands/*`를 Claude Code 구조로 옮깁니다.

```text
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Claude Code용 Lesson 1 skill과 custom command 구조로 옮겨줘.
산출물 의미는 research -> outline -> analysis -> draft -> revision 순서를 유지해줘.
```

### 5-4. 추천 산출물

가능하면 아래 파일로 저장하면서 진행합니다.
- `outputs/research.md`
- `outputs/outline.md`
- `outputs/analysis.md`
- `outputs/draft.md`

### 5-5. 초안 다듬기

초안을 만든 뒤에는 세 환경 모두 아래 뜻으로 다듬으면 됩니다.

```text
이 lesson-1 revise workflow를 사용해서
"문장을 더 짧고 명확하게. 근거 없는 부분은 확인 필요로 표시. 발표용으로 읽기 쉽게."
작업을 진행해줘.
```

`Gemini CLI`에서는 아래 command를 그대로 실행할 수 있습니다.

```text
/taskflow:revise "문장을 더 짧고 명확하게. 근거 없는 부분은 확인 필요로 표시. 발표용으로 읽기 쉽게."
```

수정 결과는 보통 아래 파일로 정리하면 됩니다.
- `outputs/revision.md`

## 6. Lesson 1을 처음 실행할 때 가장 안전한 순서

1. 이번 주 실제 과제 1개 고르기
2. 현재 환경에서 lesson 자산을 한 번 불러오기
3. `start` 단계에 해당하는 시작 요청을 1회 실행하기
4. `outputs/research.md`부터 `outputs/draft.md`까지 가능한 만큼 저장하기
5. `revise` 단계까지 1회 돌려보기
6. 결과를 보고 `GEMINI.md` 또는 해당 Skill 1개를 작은 수정으로 고치기

## 7. 추천 실습 시나리오

### 시나리오 0. 기본 연습 과제

```text
이 lesson-1 research-writing workflow를 사용해서
"AI 윤리 수업 발표를 위해 최근 생성형 AI의 저작권 논쟁 사례를 조사하고, 5분 발표용 개요와 초안을 만들기"
작업을 시작해줘.
```

### 시나리오 A. 사회심리학 과제 초안

```text
이 lesson-1 research-writing workflow를 사용해서
"사회심리학 과제 초안을 쓰기 위해 관련 논문 3편 비교표와 5문단 초안을 만들기"
작업을 시작해줘.
```

### 시나리오 B. 팀플 발표 스크립트

```text
이 lesson-1 research-writing workflow를 사용해서
"팀플 발표용 5분 스크립트 초안을 만들기"
작업을 시작해줘.
```

## 8. 막힐 때 쓰는 문장

### 리서치가 막힐 때

```text
주제를 더 작은 작업 단위로 바꿔줘.
이번 주 안에 끝낼 수 있는 질문 3개로 줄여줘.
```

### 정리가 막힐 때

```text
요약과 구조화를 분리해서 해줘.
먼저 핵심 5줄 요약, 그 다음 분류 체계를 제안해줘.
```

### 분석이 막힐 때

```text
주장, 근거, 반론, 한계를 분리해서 보여줘.
느낌이 아니라 근거 연결로 다시 써줘.
```

### 초안이 막힐 때

```text
처음부터 완벽하게 쓰려 하지 말고, 일단 초안을 끝까지 써줘.
근거가 약한 문장은 표시해줘.
```

### 수정이 막힐 때

```text
강점 3개, 리스크 3개, 문장 수정 예시 10개로 나눠서 보여줘.
```
