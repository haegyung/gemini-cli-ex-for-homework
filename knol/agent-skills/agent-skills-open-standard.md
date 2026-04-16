# Agent Skills Open Standard

last_reviewed: `2026-04-15`

primary sources:
- [Agent Skills Home](https://agentskills.io/home)
- [What Are Skills](https://agentskills.io/what-are-skills)
- [Skill Specification](https://agentskills.io/specification)
- [Skill Creation Best Practices](https://agentskills.io/skill-creation/best-practices)

## What The Standard Is For

Agent Skills는 특정 벤더 제품이 아니라, 여러 agent 런타임에서 재사용 가능한 skill 형식을 공유하기 위한 open standard다.

프로젝트에서 중요한 점:
- `skill`을 단순 프롬프트 조각보다 큰 `capability package`로 읽게 만든다.
- 벤더별 디렉터리 이름이 달라도, 내부 구조를 공통 프레임으로 설명할 수 있다.
- lesson 2에서 `Gemini / Codex / Claude`를 하나의 비교 표로 가르칠 때 기준점이 된다.

## Minimum Structure

공식 specification 기준 skill의 최소 구조는 아래다.

- skill은 디렉터리다
- 최소 파일은 `SKILL.md`다
- `SKILL.md`는 YAML frontmatter + Markdown body 구조다

optional directories:
- `scripts/`
- `references/`
- `assets/`

즉, 핵심은 `짧은 중심 문서 + 필요할 때만 여는 보조 자산`이다.

## Required And Optional Fields

공식 specification 기준:
- required
  - `name`
    - 1~64자
    - lowercase letters, numbers, hyphens only
    - parent directory name과 일치해야 한다
  - `description`
    - 1~1024자
    - skill이 무엇을 하고 언제 써야 하는지 설명해야 한다
- optional
  - `license`
  - `compatibility`
  - `metadata`
  - `allowed-tools`

특히 `description`은 단순 소개문이 아니라 `언제 이 skill을 activate할지`를 agent가 판단하게 돕는 핵심 필드다.

## Best-Practice Reading For This Workspace

이 워크스페이스에서는 open standard를 아래처럼 해석해 쓰는 것이 맞다.

- `name`
  - 역할 식별자다. lesson에서는 학생이 바로 기억할 수 있는 작업 이름이어야 한다.
- `description`
  - 소개문이 아니라 trigger contract다.
- `SKILL.md`
  - 선언적 지식, 절차적 지식, 출력 계약이 만나는 중심 문서다.
- `references/`
  - 긴 배경지식을 분리해 본문 인지 부하를 줄인다.
- `scripts/`
  - 반복 작업을 실제로 바로 실행할 수 있게 만든다.

best practices에서 lesson 2에 직접 중요한 포인트:
- real expertise에서 추출할 것
- generic best practice보다 project artifact에서 합성할 것
- concise, stepwise guidance를 우선할 것
- 긴 내용은 progressive disclosure로 `references/`나 `assets/`로 분리할 것
- output template, gotchas, validation loop를 명시할 것

## Teaching Implication

open standard는 `skill = 작은 agent capability`라는 비유를 강하게 지지한다. 다만 이 표준은 어디까지나 `형식`을 제공하는 것이지, 모든 런타임이 동일한 실행 모델을 가진다는 뜻은 아니다.

그래서 lesson 2에서는 아래처럼 설명하는 편이 정확하다.
- 공통 구조는 open standard로 설명한다.
- 실행 모델 차이는 vendor별 문서로 보정한다.
