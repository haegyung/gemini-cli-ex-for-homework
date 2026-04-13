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

## 2. lesson 메타데이터

- lesson 번호: `Lesson N`
- lesson 제목: `[제목]`
- 한 줄 목표: `[이 lesson에서 끝까지 돌려볼 작업 1문장]`
- 대상 작업: `[과제 / 발표 / 보고서 / 프로젝트 / 실습]`

## 3. 정본 문서와 기본 예제 교재

학습 문서 정본:
- `[문서 제목](https://example.com)`

기본 예제 교재:
- `[사용자가 교재를 지정하지 않았을 때 기본으로 쓰는 텍스트 또는 링크]`

원칙:
- 사용자가 별도 교재를 지정하지 않으면 위 자료를 기준 텍스트로 사용한다.

## 4. 이 lesson 폴더에서 실제로 쓰는 파일

- `README.md`
- `GEMINI.md`
- `.gemini/skills/[skill-name]/SKILL.md`
- `.gemini/commands/[command-group]/[command].toml`
- `outputs/`
- `notes/`

## 5. lesson 목표

- 이 lesson의 핵심 흐름 1개를 적는다.
- 학습자가 이번 lesson에서 남겨야 할 최소 산출물 1개를 적는다.
- 완벽한 결과보다 먼저 체감해야 할 성공 경험 1개를 적는다.

## 6. 시작하기 전에 고를 것

좋은 시작 과제 예시:
- `[예시 1]`
- `[예시 2]`

처음에는 피하는 것이 좋은 과제:
- `[비권장 예시 1]`
- `[비권장 예시 2]`

## 7. Gemini에서 실행하기

### 7-1. 시작 command

```text
/[command] "[lesson 시작 예시]"
```

### 7-2. 기본 예제 교재 command

```text
/[command] "[기본 예제 교재를 이용한 시작 예시]"
```

### 7-3. 추천 산출물

- `outputs/01_[name].md`
- `outputs/02_[name].md`
- `outputs/03_[name].md`

### 7-4. 수정 command

```text
/[command] "[수정 예시]"
```

## 8. 다른 LLM 환경으로 옮길 때

공통 원칙:
- 공통 흐름은 현재 lesson 폴더의 `README.md`를 기준으로 본다.
- runtime 규칙은 현재 lesson 폴더의 `GEMINI.md`에서 가져간다.
- skill / command는 각 환경의 기본 skill creator로 다시 만든다.

### 8-1. Codex 예시 요청

```text
$skill-creator
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Codex용 lesson skill을 만들어줘.
산출물은 outputs/를 유지하고, lesson 목표와 예시는 현재 lesson 폴더 README.md를 기준으로 맞춰줘.
```

### 8-2. Claude 예시 요청

```text
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Claude Code용 skill과 custom command 구조로 옮겨줘.
공통 규칙은 CLAUDE.md로, lesson 목표와 예시는 현재 lesson 폴더 README.md를 기준으로 맞춰줘.
```

## 9. 추천 실습 시나리오

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
