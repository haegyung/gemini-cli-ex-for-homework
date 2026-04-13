# Lesson Template

이 파일은 `LLM101.Learn-is-Doing`의 새 레슨을 만들 때 복사해서 쓰는 공통 템플릿입니다.  
`README.md`를 복사하지 말고, 이 파일을 기준으로 레슨 본문을 만듭니다.

## 1. 레슨 메타데이터

- 레슨 번호: `Lesson N`
- 레슨 제목: `[제목]`
- 한 줄 목표: `[이 레슨에서 끝까지 돌려볼 작업 1문장]`
- 대상 작업: `[과제 / 발표 / 보고서 / 프로젝트 / 실습]`

## 2. 정본 문서와 기본 예제 교재

학습 문서 정본:
- `[문서 제목](https://example.com)`

기본 예제 교재:
- `[사용자가 교재를 지정하지 않았을 때 기본으로 쓰는 텍스트 또는 링크]`

원칙:
- 사용자가 별도 교재를 지정하지 않으면 위 자료를 기준 텍스트로 사용한다.

## 3. 이 레슨에서 실제로 쓰는 파일

- `GEMINI.md`
- `.gemini/skills/[skill-name]/SKILL.md`
- `.gemini/commands/[command-group]/[command].toml`
- `outputs/`
- `notes/`

## 4. 레슨 목표

- 이 레슨의 핵심 흐름 1개를 적는다.
- 학습자가 이번 레슨에서 남겨야 할 최소 산출물 1개를 적는다.
- 완벽한 결과보다 먼저 체감해야 할 성공 경험 1개를 적는다.

## 5. 시작하기 전에 고를 것

좋은 시작 과제 예시:
- `[예시 1]`
- `[예시 2]`

처음에는 피하는 것이 좋은 과제:
- `[비권장 예시 1]`
- `[비권장 예시 2]`

## 6. Gemini에서 실행하기

### 6-1. 시작 command

```text
/[command] "[레슨 시작 예시]"
```

### 6-2. 기본 예제 교재 command

```text
/[command] "[기본 예제 교재를 이용한 시작 예시]"
```

### 6-3. 추천 산출물

- `outputs/01_[name].md`
- `outputs/02_[name].md`
- `outputs/03_[name].md`

### 6-4. 수정 command

```text
/[command] "[수정 예시]"
```

## 7. 다른 LLM 환경으로 옮길 때

공통 원칙:
- 공통 규칙은 `GEMINI.md`에서 가져간다.
- 레슨 목표와 예시는 현재 레슨 문서를 기준으로 본다.
- Skill / command는 각 환경의 기본 skill creator로 다시 만든다.

### 7-1. Codex 예시 요청

```text
$skill-creator
이 프로젝트의 GEMINI.md, LESSON.md, .gemini/skills/*, .gemini/commands/*를 읽고
Codex용 lesson skill을 만들어줘.
산출물은 outputs/를 유지하고, 레슨 목표와 예시는 LESSON.md를 기준으로 맞춰줘.
```

### 7-2. Claude 예시 요청

```text
이 프로젝트의 GEMINI.md, LESSON.md, .gemini/skills/*, .gemini/commands/*를 읽고
Claude Code용 skill과 custom command 구조로 옮겨줘.
공통 규칙은 CLAUDE.md로, 레슨 목표와 예시는 LESSON.md 기준으로 맞춰줘.
```

## 8. 추천 실습 시나리오

### 시나리오 0. 기본 예제 교재

```text
/[command] "[기본 예제 교재로 시작하는 예시]"
```

### 시나리오 A

```text
/[command] "[시나리오 A]"
```

### 시나리오 B

```text
/[command] "[시나리오 B]"
```

## 9. 막힐 때 쓰는 문장

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
