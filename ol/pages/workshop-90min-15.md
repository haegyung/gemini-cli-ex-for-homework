# OL Source Contract: Workshop (90분 / 15명) 운영 패키지

- remote doc id: `f2176792-467e-4d6f-a477-e7b83d94b5a9`
- remote url id: `CmRHYrxr2u`
- remote url: `/doc/workshop-90-15-CmRHYrxr2u`
- parent key: `lesson-hub`
- collection: `UrbanTech-Vibe`
- page role: `operator guide`
- last verified against OL: `2026-04-16`

## Purpose

이 페이지는 학생용 lesson 안내와 분리된 강사/운영자용 OL 문서로, 현장에서 바로 참고할 `오프닝 메시지`, `90분 진행 순서`, `PASS 기준`, `운영 트러블슈팅`을 짧고 실행 가능하게 제공한다.

## Upstream Publishable SoT

- `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md`
- `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-90min-run-sheet.md`
- `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-90min-student-handout.md`
- `../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-d-1-preflight.md`

## Must Sections

1. 이 문서가 학생용이 아니라 운영용이라는 설명
2. 강사용 3분 시작
3. 학생이 먼저 열어야 할 문서 순서
4. 오프닝 문장과 PASS 기준
5. 실제 작업 1문장 고정
6. 작업 폴더 / git 상태 맞추기
7. Lesson 1 / Lesson 2 라우팅 기준
8. 90분 step-by-step 운영안
9. PASS / SHOULD 평가 조건
10. 정본 경로와 검증 명령

## Drift-Sensitive Facts

- 학생은 local 전체가 아니라 OL 허브와 lesson 페이지부터 본다
- PASS 기준은 `research 1개 + draft/revision 1개 + what-i-changed 1개`
- git preflight 순서는 hub/lesson과 동일해야 한다
- 검증 명령은 `bash scripts/run_workspace_gate.sh tools-only`
- publishable workshop SoT 경로는 docs `canonical/markdown/` 아래 문서들이다
- tools repo는 workshop 로컬 미러를 두지 않고 docs 정본을 직접 참조한다

## Remote Snapshot Notes

- 상단에 hub 페이지로 돌아가는 링크가 있다
- `강사용 3분 시작`과 `워크숍 운영 step-by-step tutorial`이 분리돼 있다
- `학생에게 먼저 전달할 것`, `쉬운 말 풀이`, `트러블슈팅`, `품질 게이트` 섹션이 있다
- 운영 참고에서 로컬 경로와 게이트 명령을 함께 제시한다

## Sync Notes

- workshop 산출물 평가 기준이 바뀌면 docs workshop 정본과 OL PASS 기준을 같이 바꿔야 한다
- 학생용 문서와 운영용 문서가 섞이지 않도록 앞부분은 항상 운영 흐름 중심으로 유지한다
