# Lesson 1. 스킬을 활용해서 리서치부터 글쓰기까지

이 문서는 `LLM101.Learn-is-Doing`의 현재 레슨 본문입니다.  
`README.md`가 공통 안내라면, 이 파일은 `Lesson 1`의 실제 학습 흐름과 실행 예시를 담습니다.

## 1. 이 레슨의 목표

이번 레슨의 목적은 하나입니다.
- 작은 Skill과 command를 써서 `리서치 -> 정리 -> 분석 -> 글쓰기 -> 다듬기` 흐름을 한 번 끝까지 돌려보는 것

핵심은 세 가지입니다.
- 주제가 아니라 이번 주에 실제로 해야 하는 작업을 고릅니다.
- 완벽한 결과보다 작은 성공 경험을 먼저 만듭니다.
- 예제 Skill과 command를 그대로 한 번 실행한 뒤, 자기 작업에 맞게 고칩니다.

## 2. 학습 문서 정본과 기본 예제 교재

학습 문서 정본:
- [Gemini CLI로 리서치부터 글쓰기까지](https://gyung.me/68nHrk)

검증 메모:
- 위 링크는 현재 `ol.vibeworkers.net` 공유 문서로 연결됩니다.
- 페이지 제목은 `Gemini CLI로 리서치부터 글쓰기까지`입니다.

기본 원칙:
- 이 튜토리얼 시리즈에서 기본적으로 사용할 예제 교재는 위 문서입니다.
- 사용자가 별도 교재를 지정하지 않으면 `https://gyung.me/68nHrk`를 기준 텍스트로 사용합니다.

## 3. 이 레슨에서 실제로 쓰는 파일

- `GEMINI.md`
  - Gemini가 import된 프로젝트에서 읽는 규칙
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
  - 리서치부터 초안까지 한 번에 시작하는 예시 command
- `.gemini/commands/taskflow/revise.toml`
  - 초안을 기준으로 다듬는 예시 command

## 4. 먼저 고를 것: 이번 주에 실제로 해야 하는 작업 1개

좋은 시작 과제 예시:
- 발표 자료 조사해서 초안 만들기
- 비교 보고서 구조 잡기
- 자기소개서 문장 다듬기
- 특정 논문 2~3개 비교 정리하기

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

## 5. Lesson 1을 Gemini에서 실행하기

### 5-1. 예제 command 실행

이번 주 실제 작업 1개를 넣어 실행합니다.

```text
/taskflow:start "예시: AI가 대학 글쓰기 과제에 미치는 영향 비교 보고서 초안 만들기"
```

별도 교재를 정하지 않았다면, 기본 예제 교재로 먼저 시작합니다.

```text
/taskflow:start "기본 예제 교재 https://gyung.me/68nHrk 를 읽고 핵심 주장 5개, 전체 구조, 수업 적용 아이디어를 정리한 5문단 초안을 만들어줘"
```

이 command는 보통 아래 흐름으로 안내합니다.
- `research-task` 기준으로 질문과 검색 키워드를 잡기
- `organize-task` 기준으로 자료를 구조화하기
- `analysis-task` 기준으로 주장과 근거를 연결하기
- `writing-task` 기준으로 5문단 초안을 만들기

### 5-2. 추천 산출물

가능하면 아래 파일로 저장하면서 진행합니다.
- `outputs/01_research_plan.md`
- `outputs/02_outline.md`
- `outputs/03_argument_map.md`
- `outputs/04_draft.md`

### 5-3. 초안 다듬기

초안을 만든 뒤 아래를 실행합니다.

```text
/taskflow:revise "예시: 문장을 더 간결하게 바꾸고, 근거가 약한 문단을 표시해줘"
```

수정 결과는 보통 아래 파일로 정리하면 됩니다.
- `outputs/05_polished_draft.md`

## 6. Lesson 1을 다른 LLM 환경으로 옮길 때

공통 원칙은 간단합니다.
- 공통 규칙은 `GEMINI.md`에서 가져갑니다.
- 현재 레슨의 목표와 예시는 `LESSON.md`를 기준으로 봅니다.
- Gemini Skill / command는 각 환경의 기본 skill creator로 다시 만듭니다.

### 6-1. Codex 예시 요청

```text
$skill-creator
이 프로젝트의 GEMINI.md, LESSON.md, .gemini/skills/*, .gemini/commands/*를 읽고
Codex용 lesson-1 research-writing skill을 만들어줘.
산출물은 outputs/를 유지하고,
레슨 목표와 예시는 LESSON.md를 기준으로 맞춰줘.
```

실행 예시:

```text
이 프로젝트의 lesson-1 research-writing workflow를 사용해서
"기본 예제 교재 https://gyung.me/68nHrk 를 읽고 핵심 주장 5개와 5문단 초안 만들기"
작업을 시작해줘.
먼저 outputs/01_research_plan.md부터 제안해줘.
```

### 6-2. Claude Code 예시 요청

```text
이 프로젝트의 GEMINI.md, LESSON.md, .gemini/skills/*, .gemini/commands/*를 읽고
Claude Code용 Lesson 1 skill과 custom command 구조로 옮겨줘.
공통 규칙은 CLAUDE.md로, 레슨 목표와 예시는 LESSON.md를 기준으로 맞춰줘.
산출물은 outputs/에 저장하게 해줘.
```

실행 예시:

```text
이 프로젝트의 lesson-1 research-writing workflow를 사용해서
"기본 예제 교재 https://gyung.me/68nHrk 를 읽고 핵심 주장 5개와 5문단 초안 만들기"
작업을 시작해줘.
먼저 리서치 질문 3개와 검색 키워드 10개부터 제안해줘.
```

## 7. Lesson 1을 처음 실행할 때 가장 안전한 순서

1. 이번 주 실제 과제 1개 고르기
2. 교재를 따로 정하지 않았다면 기본 예제 교재 `https://gyung.me/68nHrk`로 시작하기
3. `Gemini CLI`에서 `start` command 1회 실행하기
4. `outputs/01~04` 중 가능한 만큼 저장하기
5. `revise` 단계까지 1회 돌려보기
6. 그 다음 자기 작업에 맞게 Skill 또는 command를 고치기
7. 필요하면 Codex 또는 Claude Code로 같은 흐름을 옮기기

처음부터 모든 환경에 동시에 옮기지 않는 것이 좋습니다.  
한 번은 Gemini에서 성공 경험을 만든 뒤, 그 성공 흐름을 다른 환경으로 가져가는 편이 훨씬 덜 막힙니다.

## 8. 추천 실습 시나리오

### 시나리오 0. 기본 예제 교재로 시작

```text
/taskflow:start "기본 예제 교재 https://gyung.me/68nHrk 를 읽고, 핵심 개념 요약 -> 구조 정리 -> 내 과제 적용 아이디어 -> 5문단 초안 순서로 진행해줘"
```

### 시나리오 A. 발표 준비

```text
/taskflow:start "AI 윤리와 대학 수업 변화 발표 자료 초안 만들기"
```

### 시나리오 B. 비교 보고서

```text
/taskflow:start "생성형 AI 찬반 논거 비교 보고서 초안 만들기"
```

### 시나리오 C. 자기소개서 문장 개선

```text
/taskflow:start "자기소개서 1번 문항 구조 잡고 초안 만들기"
/taskflow:revise "문장을 더 자연스럽게 바꾸고 과장된 표현은 줄여줘"
```

## 9. 막힐 때 쓰는 문장

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
완벽한 글 말고 끝까지 갈 수 있는 5문단 초안으로 먼저 써줘.
근거가 약한 문장은 표시해줘.
```

### 수정이 막힐 때

```text
강점 3개, 리스크 3개, 문장 수정 예시 10개로 나눠서 보여줘.
```
