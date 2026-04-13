# Implementation Requirements

## 1. Goal

`LLM101.Learn-is-Doing` 코스를 "문서 정본 + lesson 실행 자산 + 자동 검증"이 모두 닫힌 상태로 유지해, 변경 후에도 한 번의 품질 게이트 실행으로 완료/미완료를 판정할 수 있게 한다.

검증 가능한 완료 조건:
- `scripts/run_quality_gate.sh` 실행 결과가 `PASS`(exit code 0)여야 한다.

## 2. Rubric (Must / Should)

### Must

1. 루트 정본 파일이 모두 존재한다.
- 대상: `README.md`, `PROJECT_DEFINITION.md`, `LESSON_TEMPLATE.md`, `COMBINED.md`, `scripts/build_combined.sh`
- Evidence: `scripts/validate_course.sh`

2. 모든 lesson 폴더가 실행 최소 자산을 가진다.
- 대상: `README.md`, `GEMINI.md`, `.gemini/skills/*/SKILL.md >= 1`, `.gemini/commands/**/*.toml >= 1`, `outputs/.gitkeep`, `notes/.gitkeep`
- Evidence: `scripts/validate_course.sh`

3. `COMBINED.md`가 현재 소스 기준으로 최신이며 결정적으로 재생성된다.
- 조건 A: gate 시작 시점의 `COMBINED.md` 해시와 `build_combined.sh` 1회 실행 후 해시가 같아야 한다.
- 조건 B: 연속 2회 재생성해도 해시가 같아야 한다.
- Evidence: `scripts/run_quality_gate.sh`

4. `COMBINED.md`에 lesson README marker가 모두 존재한다.
- 대상 marker: `<!-- BEGIN lessons/.../README.md -->`, `<!-- END lessons/.../README.md -->`
- Evidence: `scripts/validate_course.sh`

5. 충돌 마커가 문서에 남아 있지 않다.
- 대상: `*.md` 전역의 `<<<<<<<`, `=======`, `>>>>>>>`
- Evidence: `scripts/validate_course.sh`

6. 게이트 스크립트 자체가 문법적으로 유효하다.
- 대상: `scripts/*.sh`
- Evidence: `scripts/run_quality_gate.sh`의 `bash -n`

### Should

1. 루트 `README.md`에 품질 게이트 실행 명령이 문서화되어 있다.
- Evidence: `README.md` 섹션

2. `.DS_Store`가 추적되지 않도록 관리된다.
- Evidence: `.gitignore`, `scripts/validate_course.sh` 경고

## 3. Sequence-Dependent Completion Plan (R->P->M->W->A)

### R1
- Objective: 코스 운영 완결성(요구사항 정의 + 자동 검증 + 문서 진입점) 확보

### P1 Requirements Fix
- M1: 요구사항/판정조건/완료기준을 단일 문서로 고정
- W1: `IMPLEMENTATION_REQUIREMENTS.md` 작성
- A1: Must/Should + Evidence 명시

### P2 Validation Implementation
- M2: 구조/정합성 검증 스크립트 구현
- W2: `scripts/validate_course.sh` 구현
- A2: lesson 자산, marker, 충돌 마커 검증
- W3: `scripts/run_quality_gate.sh` 구현
- A3: freshness/determinism/syntax/gate orchestration 구현

### P3 Integration
- M3: 운영 문서에서 게이트 진입 가능
- W4: `README.md`에 quality gate 실행 절차 반영
- A4: 실행 명령/해석 기준 추가

### P4 Verify & Score
- M4: Must 100% 충족
- W5: `scripts/run_quality_gate.sh` 반복 실행
- A5: FAIL 원인 수정 후 재실행, PASS 증거 확보

## 4. Adaptive Decision Policy

작업 중 아래 기준으로 능동 판단한다.

1. 리서치 트리거
- 판정기준: 요구사항을 코드/문서/실행증거만으로 해석하기 어려울 때
- 액션: 관련 파일 + 실행 로그를 먼저 수집하고, 부족하면 외부 1차 문서 확인

2. 계획 개선 트리거
- 판정기준: Must 실패가 2회 이상 반복되거나 동일 원인 재발
- 액션: 가장 작은 변경 단위로 계획을 재배열하고, 재발 방지 규칙 1개를 추가

3. 설치 허용 트리거
- 판정기준: Must 검증을 수행하는 데 필수 바이너리(`bash`, `find`, `grep`, `shasum`)가 없을 때
- 액션: 설치 허용 후 최소 패키지만 설치하고, 설치 이유/명령/결과를 기록

## 5. Completion Rule

- `Must`가 하나라도 실패하면 완료로 선언하지 않는다.
- 완료 선언 조건:
1. `scripts/run_quality_gate.sh`가 exit code 0
2. `validate_course` 요약에서 `FAIL=0`
3. 잔여 갭이 문서상 0개
