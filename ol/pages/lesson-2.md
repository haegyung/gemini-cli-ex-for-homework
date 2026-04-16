# OL Source Contract: Lesson 2. Skill을 에이전트처럼 이해하고 내 과제에 맞게 remix하기

- remote doc id: `cfe23176-c0a2-4a41-8181-60200b96cbd7`
- remote url id: `AAarnQbRfx`
- remote url: `/doc/lesson-2-skill-remix-AAarnQbRfx`
- parent key: `lesson-hub`
- collection: `UrbanTech-Vibe`
- page role: `student remix guide`
- last verified against OL: `2026-04-16`

## Purpose

이 페이지는 Lesson 2를 Lesson 1의 연속선으로 유지한 채, `어디를 그대로 두고 어디를 바꿀지`, `command의 orchestration 판단을 skill 쪽으로 어떻게 올릴지`, `그 판단을 progress log로 어떻게 남길지`를 학생이 빠르게 판단하게 하는 OL 가이드다.

## Upstream Local SoT

- `lessons/lesson-2-remix-skill-and-command/README.md`
- `lessons/lesson-2-remix-skill-and-command/notes/progress-log.md`
- `knol/agent-skills/skill-as-agent-shared-guide.md`

## Must Sections

1. 이 문서가 무엇을 도와주는지
2. 학생용 3분 시작
3. Lesson 1 baseline과 progress log를 먼저 잡는 방법
4. Lesson 1에서 안 맞았던 지점 1개를 고르는 방법
5. 그대로 둘 것 / 바꿀 것 분리
6. skill을 역할/트리거/절차/자원/출력 계약으로 다시 읽는 법
7. 프롬프트를 상황 정보/선언적 지식/절차적 지식/출력 계약으로 분해하는 법
8. orchestration-agent 초안 만들기
9. command를 얇게 남기는 기준
10. review 기준과 결과물 예시

## Drift-Sensitive Facts

- Lesson 2의 핵심 산출물은 `orchestration-agent skill 1개 + 얇은 command 1개`
- Lesson 2는 Lesson 1의 연속선이며 `notes/progress-log.md`에 baseline과 오늘의 판단을 남긴다
- command보다 skill 쪽에 판단과 절차가 더 많이 있어야 한다
- 프롬프트 최소 구조는 `상황 정보 -> 앞 선언적 지식 -> 절차적 지식 -> 뒤 선언적 지식(출력 계약)`
- git repo인 경우 local sync preflight를 먼저 본다
- vendor 차이는 runtime별 구조 차이로만 다루고 workflow는 유지한다

## Remote Snapshot Notes

- hub로 돌아가는 링크가 있다
- 학생용 3분 시작과 상세 tutorial이 모두 있다
- `skill의 공식 최소 구조`와 `agent capability처럼 읽는 학습용 틀`을 구분해 설명한다
- 결과물 예시는 `outputs/01...`부터 `outputs/05...`까지 순서를 제안하고, `notes/progress-log.md`를 함께 갱신한다

## Sync Notes

- lesson 2 README에서 orchestration-agent 기준이 바뀌면 이 페이지의 review 기준을 함께 갱신한다
- progress log 계약이 바뀌면 이 페이지의 Lesson 1 baseline / continuity 안내를 함께 갱신한다
- shared guide의 runtime 비교가 바뀌면 vendor 차이 설명을 다시 검토한다
