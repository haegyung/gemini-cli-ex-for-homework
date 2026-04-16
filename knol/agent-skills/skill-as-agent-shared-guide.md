# Skill-As-Agent Shared Guide

last_reviewed: `2026-04-15`

related documents:
- [official-source-map.md](./official-source-map.md)
- [agent-skills-open-standard.md](./agent-skills-open-standard.md)
- [openai-codex.md](./openai-codex.md)
- [anthropic-claude-code.md](./anthropic-claude-code.md)
- [google-gemini-cli.md](./google-gemini-cli.md)

## Scope

이 문서는 lesson 2와 course 문서에서 공통으로 재사용할 `skill을 agent처럼 이해하는 설명`의 정리본이다.

주의:
- 아래 내용 중 vendor별 사실은 공식 문서 요약이다.
- `상황 정보 -> 앞 선언적 지식 -> 절차적 지식 -> 뒤 선언적 지식` 프롬프트 구조는 이 워크스페이스의 teaching frame이며, 특정 벤더가 같은 표현을 공식 용어로 쓰는 것은 아니다.

## Core Teaching Message

학생에게는 skill을 `재사용 가능한 마이크로 에이전트 역량`으로 가르친다.

이 표현이 유효한 이유:
- Agent Skills 표준은 skill을 capability package로 읽게 만든다.
- Gemini CLI는 skill을 self-contained expertise and workflow unit으로 설명한다.
- Codex는 skill을 reusable workflow, task-specific capability로 설명한다.
- Claude Code도 skill을 지원하지만, 공식 문서에서 subagent를 별도 실행 단위로 더 뚜렷하게 구분한다.

## Vendor Comparison

| runtime | skill reading | subagent relation | lesson note |
|---|---|---|---|
| Agent Skills | open standard capability package | runtime-specific | 벤더 중립 기준점 |
| Gemini CLI | self-contained skill unit | 별도 문서 축이 약함 | `skill as agent capability` 설명이 가장 직접적 |
| Codex | reusable workflow and capability | subagent를 별도 문서로 구분 | skill과 delegated execution을 나눠 설명 |
| Claude Code | reusable skill with standard alignment | subagent를 specialized AI assistant로 분리 | `skill = playbook`, `subagent = delegated unit`이 더 정확 |

## Official Minimum Common Ground

공식 문서를 교집합으로 읽으면, skill은 대체로 아래 공통점을 가진다.

1. `디렉터리 + SKILL.md`
   - Codex, Gemini CLI, Agent Skills는 모두 skill을 `SKILL.md`가 있는 디렉터리로 설명한다.
   - Claude Code도 `.claude/skills/<name>/SKILL.md` 구조를 기준으로 쓴다.
2. `메타데이터 + 본문`
   - Gemini CLI, Claude Code, Agent Skills는 YAML frontmatter + Markdown body를 공식 구조로 둔다.
   - Codex는 `SKILL.md`에 `name`, `description`이 필요하다고 직접 명시한다.
3. `description은 trigger contract`
   - Codex는 implicit invocation이 `description`에 달려 있다고 적는다.
   - Claude Code와 Gemini CLI도 `description`을 자동 호출 판단의 핵심 설명으로 쓴다.
4. `supporting files는 optional`
   - `scripts/`, `references/`, `assets/`는 공통적으로 optional supporting files다.
   - 긴 배경지식은 skill 본문에 몰아넣기보다 progressive disclosure로 분리하는 편이 공식 권장과 맞는다.

## Official Minimum Vs Teaching Schema

공식 최소 요구사항과 lesson용 설명 구조는 같은 층위가 아니다.

- 공식 최소 요구사항
  - 런타임이 실제로 읽는 파일 구조와 필수 필드
- teaching schema
  - 학생이 skill을 빠르게 해석하고 remix하도록 돕는 설명 프레임

즉, lesson 2의 `8개 블록`은 공식 형식 자체가 아니라 `공식 형식을 학생이 읽기 쉽게 펼친 번역 레이어`다.

## Skill Structure To Teach

이 프로젝트에서는 skill을 아래 8개 블록으로 설명한다.

1. `Identity`
2. `Trigger`
3. `Input Contract`
4. `Output Contract`
5. `Procedure`
6. `Resources`
7. `Guardrails`
8. `Verification`

이 구조는 open standard와 vendor 문서를 함께 읽어 추린 공용 teaching schema다.

공식 최소 구조와의 대응은 아래처럼 읽는다.

| teaching block | official anchor |
|---|---|
| `Identity` | `name`, 역할 문장, body 첫 문단 |
| `Trigger` | `description`, `when_to_use`, invocation policy |
| `Input Contract` | body 안의 입력 조건, required context |
| `Output Contract` | body 안의 결과 형식, template, 예시 |
| `Procedure` | step-by-step instructions, scripts |
| `Resources` | `references/`, `assets/`, `scripts/` |
| `Guardrails` | gotchas, constraints, allowed-tools, disable-model-invocation |
| `Verification` | checklists, validation loop, test prompts |

## Prompt Structure To Teach

프롬프트는 기본적으로 아래 4층으로 가르친다.

1. 상황 정보
2. 앞 선언적 지식
3. 절차적 지식
4. 뒤 선언적 지식

프로젝트 해석:
- 상황 정보
  - 현재 과제, 파일, runtime, 막힌 지점, 기존 산출물 상태
- 앞 선언적 지식
  - 역할, 목표, 용어, 제약, 입력 범위
- 절차적 지식
  - 단계, 분기, 도구, 판단 규칙
- 뒤 선언적 지식
  - 산출물 계약, 루브릭, 예시, 금지 형식

짧게 요약하면:
- 상황 정보는 지금 어떤 일을 다루는지 분명하게 잡아 준다.
- 앞 선언적 지식은 무엇을 풀어야 하는지 또렷하게 보여 준다.
- 절차적 지식은 어떤 순서와 규칙으로 움직일지 정해 준다.
- 뒤 선언적 지식은 어떤 결과를 내야 하는지 분명하게 정해 준다.

## Recommended Wording For Course Docs

수업 문서에서는 아래 문장을 재사용하면 된다.

`공식 문서 기준 skill의 최소 구조는 SKILL.md와 메타데이터, 그리고 필요 시 supporting files로 이루어진 reusable capability package다. 이 course에서는 학생 이해를 위해 이를 역할·트리거·절차·자원·출력 계약을 가진 재사용 가능한 마이크로 에이전트 역량으로 펼쳐 설명한다. 다만 Claude Code처럼 공식적으로 skill과 subagent를 분리하는 환경에서는, skill을 agent를 움직이는 playbook으로 이해하는 편이 더 정확하다.`
