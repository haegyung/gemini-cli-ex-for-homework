# Implementation Requirements

## 1. Goal

`LLM101.Learn-is-Doing` 저장소를 `course root + lesson 실행 자산 + docs direct workshop reference + VibeWorkers OL 연동 정본 + 자동 검증`이 모두 닫힌 상태로 유지해, 변경 후에도 한 번의 품질 게이트 실행으로 완료/미완료를 판정할 수 있게 한다.

검증 가능한 완료 조건:
- `bash scripts/run_quality_gate.sh` 실행 결과가 `PASS`(exit code 0)여야 한다.

## 2. Rubric (Must / Should)

### Must

1. 루트 진입 문서, 검증 스크립트, 핵심 디렉터리가 모두 존재한다.
- 대상: `README.md`, `PROJECT_DEFINITION.md`, `IMPLEMENTATION_REQUIREMENTS.md`, `LESSON_TEMPLATE.md`, `COMBINED.md`, `scripts/build_combined.sh`, `scripts/validate_course.sh`, `scripts/validate_vibeworkers_ol.sh`, `scripts/run_quality_gate.sh`, `lessons/`, `ol/`
- Evidence: `scripts/validate_course.sh`

2. 루트 `README.md`가 GitHub 진입 문서 역할을 하며 핵심 경로를 모두 가리킨다.
- 대상 링크: `PROJECT_DEFINITION.md`, `lessons/*/README.md`, `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md`, `ol/README.md`
- Evidence: `scripts/validate_course.sh`

3. 모든 lesson 폴더가 실행 최소 자산을 가진다.
- 대상: `README.md`, `GEMINI.md`, `.gemini/skills/*/SKILL.md >= 1`, `.gemini/commands/**/*.toml >= 1`, `outputs/.gitkeep`, `notes/.gitkeep`
- Evidence: `scripts/validate_course.sh`

4. lesson의 필수 숨김 자산이 Git 추적 상태여야 한다.
- 대상: `GEMINI.md`, `.gemini/skills/*/SKILL.md`, `.gemini/commands/**/*.toml`, `outputs/.gitkeep`, `notes/.gitkeep`
- Evidence: `scripts/validate_course.sh`

5. workshop publishable SoT가 docs workspace에 존재하고 tools 루트에서 직접 연결된다.
- 대상: `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md`, `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-90min-run-sheet.md`, `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-90min-student-handout.md`, `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-d-1-preflight.md`
- Evidence: `scripts/validate_course.sh`

6. VibeWorkers OL 연동 정본이 존재하고 인벤토리/계약/상위 문서 매핑이 유효하다.
- 대상: `ol/README.md`, `ol/manifest.tsv`, `ol/pages/*.md`
- 조건 A: manifest header가 예상 스키마와 같아야 한다.
- 조건 B: `page_key`, `doc_id`, `url_id`는 중복되면 안 된다.
- 조건 C: `parent_key`는 manifest 내부에서 해석 가능해야 한다.
- 조건 D: 각 `ol_source_file`, `upstream_paths`는 실제 로컬 경로와 연결되어야 한다.
- Evidence: `scripts/validate_vibeworkers_ol.sh`

7. `COMBINED.md`가 현재 소스 기준으로 최신이며 결정적으로 재생성되고, quality gate가 직접 파일을 다시 쓰지 않는다.
- 조건 A: gate 시작 시점의 `COMBINED.md` 해시와 `build_combined.sh --output <tmp>` 1회 실행 후 해시가 같아야 한다.
- 조건 B: 연속 2회 재생성해도 해시가 같아야 한다.
- 조건 C: quality gate 종료 후 `COMBINED.md` 원본 해시가 바뀌지 않아야 한다.
- Evidence: `scripts/run_quality_gate.sh`

8. `COMBINED.md`에 lesson README marker가 모두 존재한다.
- 대상 marker: `<!-- BEGIN lessons/.../README.md -->`, `<!-- END lessons/.../README.md -->`
- Evidence: `scripts/validate_course.sh`

9. 충돌 마커가 문서에 남아 있지 않다.
- 대상: `*.md` 전역의 `<<<<<<<`, `=======`, `>>>>>>>`
- Evidence: `scripts/validate_course.sh`

10. 게이트 스크립트 자체가 문법적으로 유효하다.
- 대상: `scripts/*.sh`
- Evidence: `scripts/run_quality_gate.sh`의 `bash -n`

11. 통합 품질 게이트가 course 자산과 OL bridge를 함께 통과한다.
- 조건 A: `validate_course` 요약에서 `FAIL=0`
- 조건 B: `validate_vibeworkers_ol` 요약에서 `FAIL=0`
- 조건 C: `run_quality_gate.sh`가 exit code 0
- Evidence: `scripts/run_quality_gate.sh`

12. Lesson 2는 Lesson 1의 연속선으로서 작업 진행 로그 시스템을 가진다.
- 대상: `lessons/lesson-2-remix-skill-and-command/README.md`, `lessons/lesson-2-remix-skill-and-command/GEMINI.md`, `lessons/lesson-2-remix-skill-and-command/notes/progress-log.md`, `lessons/lesson-2-remix-skill-and-command/.gemini/skills/orchestration-agent/SKILL.md`, `lessons/lesson-2-remix-skill-and-command/.gemini/commands/remix/start.toml`, `lessons/lesson-2-remix-skill-and-command/.gemini/commands/remix/review.toml`
- 조건 A: README와 GEMINI가 `Lesson 2는 Lesson 1의 연속선`이라는 점과 `notes/progress-log.md`를 명시한다.
- 조건 B: progress log 템플릿이 `Lesson 1 Baseline`, `Action / Decision`, `Evidence / Saved outputs`, `Next Action` 구조를 가진다.
- 조건 C: orchestration skill과 remix command가 주요 단계에서 progress log 갱신을 지시한다.
- Evidence: `scripts/validate_course.sh`

### Should

1. 루트 `README.md`에 `build_combined`와 quality gate 실행 명령이 문서화되어 있다.
- Evidence: `README.md`

2. 루트 `README.md`의 git preflight 안내가 dirty worktree / missing origin 예외를 설명한다.
- Evidence: `README.md`

3. `.DS_Store`가 추적되지 않도록 관리된다.
- Evidence: `.gitignore`, `scripts/validate_course.sh`

## 3. Sequence-Dependent Completion Plan (R->P->M->W->A)

### R1
- Objective: 저장소 전체 기능 범위(course, lessons, docs direct workshop reference, OL bridge, gate)를 하나의 완료 기준으로 닫는다.

### P1 Requirements Sync
- M1: 기능 범위와 판정 조건을 단일 문서로 고정
- W1: `IMPLEMENTATION_REQUIREMENTS.md` 갱신
- A1: Must/Should/Evidence를 저장소 전체 범위 기준으로 재정의

### P2 Entry Docs Sync
- M2: 사용자가 GitHub 진입점만 읽어도 실제 저장소 구조와 운영 흐름을 이해할 수 있음
- W2: `README.md` 갱신
- A2: 핵심 링크, git preflight, 구조, gate 설명을 실제 저장소 기준으로 맞춤
- W3: `PROJECT_DEFINITION.md` 갱신
- A3: 현재 범위, 성공 조건, SoT를 docs direct workshop reference / OL bridge 포함 기준으로 맞춤

### P3 Validation Coverage
- M3: 요구사항이 문서 선언에서 끝나지 않고 자동 검증으로 판정 가능
- W4: `scripts/validate_course.sh` 확장
- A4: root entry docs, docs workshop source paths, README 진입 링크를 검사
- W5: `scripts/validate_vibeworkers_ol.sh` 유지/보강
- A5: manifest / page contract / upstream mapping 판정 기준을 유지

### P4 Generated Artifact Sync
- M4: 생성 문서가 현재 root/lesson 문서와 동기화됨
- W6: `COMBINED.md` 재생성
- A6: `bash scripts/build_combined.sh` 실행 후 결과를 고정

### P5 Verify & Score
- M5: Must 100% 충족
- W7: `bash scripts/run_quality_gate.sh` 반복 실행
- A7: FAIL 원인 수정 -> 재실행 -> PASS 증거 확보

## 4. Adaptive Decision Policy

작업 중 아래 기준으로 능동 판단한다.

1. 리서치 트리거
- 판정기준: 새 top-level 디렉터리, 새 검증 스크립트, 새 운영 surface가 추가됐는데 요구사항 문서에 반영되지 않았을 때
- 액션: 관련 문서/스크립트/실행 로그를 먼저 수집하고, 그 결과를 요구사항과 검증 스크립트에 함께 반영한다.

2. 문서-게이트 드리프트 트리거
- 판정기준: README / PROJECT_DEFINITION / IMPLEMENTATION_REQUIREMENTS / gate 스크립트가 서로 다른 범위를 말할 때
- 액션: 가장 바깥 진입 문서(`README.md`)와 판정 문서(`IMPLEMENTATION_REQUIREMENTS.md`)를 먼저 맞추고, 이후 검증 스크립트를 같은 기준으로 보정한다.

3. 계획 개선 트리거
- 판정기준: Must 실패가 2회 이상 반복되거나 같은 원인이 문서와 스크립트 양쪽에서 재발할 때
- 액션: 가장 작은 변경 단위로 계획을 재배열하고, 재발 방지용 검증 항목 1개를 추가한다.

4. 설치 허용 트리거
- 판정기준: Must 검증을 수행하는 데 필수 바이너리(`bash`, `find`, `grep`, `shasum`, `mktemp`, `git`)가 없을 때
- 액션: 설치 허용 후 최소 패키지만 설치하고, 설치 이유/명령/결과를 기록한다.

## 5. Completion Rule

- `Must`가 하나라도 실패하면 완료로 선언하지 않는다.
- 완료 선언 조건:
1. `bash scripts/run_quality_gate.sh`가 exit code 0
2. `validate_course` 요약에서 `FAIL=0`
3. `validate_vibeworkers_ol` 요약에서 `FAIL=0`
4. `COMBINED.md` freshness / determinism / mutation safety가 모두 PASS
5. 잔여 갭이 문서상 0개
