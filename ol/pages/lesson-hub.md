# OL Source Contract: LLM101.Learn-is-Doing Lesson

- remote doc id: `efb80cca-e614-42a7-8439-ced61048916b`
- remote url id: `JiQ9FuSV3l`
- remote url: `/doc/llm101learn-is-doing-lesson-JiQ9FuSV3l`
- parent key: `-`
- collection: `UrbanTech-Vibe`
- page role: `lesson hub`
- last verified against OL: `2026-04-16`

## Purpose

이 페이지는 학생이 `어디서 시작해야 하는지`, `Lesson 1과 Lesson 2 중 어디로 가야 하는지`, `작업 폴더를 어떻게 열어야 하는지`를 가장 먼저 정리하는 OL 상위 안내 페이지다.

## Upstream Local SoT

- `README.md`
- `PROJECT_DEFINITION.md`
- `LESSON_TEMPLATE.md`

## Must Sections

1. 이 페이지의 역할 설명
2. Lesson 1 / Lesson 2 빠른 선택
3. 작업 폴더에서 바로 시작하는 step-by-step
4. OS별 작업 폴더 열기 가이드
5. 산출물 기준과 핵심 glossary
6. 프롬프트 최소 구조
7. GitHub 정본 문서와 OL 길찾기 문서의 역할 분리
8. local 폴더와 OL 문서의 역할 분리
9. 운영 참고 링크

## Drift-Sensitive Facts

- git preflight 순서는 `git status -sb -> git fetch origin -> git pull --ff-only`
- 학생 기본 surface는 local 전체가 아니라 lesson 문서와 OL 본문이다
- Lesson 1은 `리서치 -> 정리 -> 분석 -> 글쓰기 -> 다듬기`
- Lesson 2는 `skill-as-agent remix + orchestration-agent`
- workspace 구조 정본은 GitHub root `README.md`, `IDENTITY.md`다
- 운영 참고 링크는 `GitHub root docs`, `workshop`, tools quality gate로 닫힌다

## Remote Snapshot Notes

- 빠른 선택 섹션에서 `Lesson 1`, `Lesson 2`를 첫 진입 링크로 두고, 구조 설명은 허브 본문 안에서 직접 닫는다
- 학생용 시작 문장 예시를 짧게 직접 제공한다
- Windows/WSL, macOS, Linux 시작 순서를 별도 섹션으로 둔다
- `local 폴더와 OL 문서의 역할` 섹션을 명시해 surface를 분리한다

## Sync Notes

- 상위 허브 링크가 바뀌면 하위 모든 OL 페이지의 상단 backlink도 함께 재검토한다
- OS 가이드를 늘릴 때는 local README보다 OL 허브의 진입성 유지가 우선이다
