# Agent Skills Source Archive

이 폴더는 `knol/agent-skills`가 전역 지식으로 쓰이기 전에 필요한 `공식 원문 로컬 보존 계층`입니다.

목적:
- `official-source-map.md`에 등록된 공식 URL을 실제 로컬 파일로 보존합니다.
- agent가 긴 원문을 단계적으로 읽을 수 있도록 `raw -> normalized -> modules` 구조로 분해합니다.
- 요약 문서가 사실을 잃거나 드리프트했을 때 원문으로 역추적할 수 있게 만듭니다.

구성:
- `manifest.json`
  - source archive SoT
  - 수집 대상 URL, source id, vendor, group을 정의합니다.
- `raw-html/`
  - 직접 fetch한 HTML 원문과 HTTP 메타데이터를 둡니다.
- `reader-markdown/`
  - Jina Reader로 정규화한 텍스트/마크다운과 메타데이터를 둡니다.
- `normalized/`
  - source별 frontmatter + 전체 원문 markdown 정본입니다.
- `modules/`
  - `normalized/*.md`를 H2 기준으로 쪼갠 모듈 문서와 index입니다.
- `capture-report.json`
  - 마지막 수집 시점의 산출물 요약입니다.

재생성:

```bash
python3 scripts/refresh_knol_source_archive.py --manifest knol/agent-skills/source-archive/manifest.json
```

검증:

```bash
python3 scripts/validate_knol_source_archive.py
bash scripts/validate_knol.sh
```

운영 규칙:
- URL 추가/삭제는 먼저 `manifest.json`을 수정합니다.
- 요약 문서를 갱신할 때는 필요하면 `normalized/` 또는 `modules/`에서 근거를 다시 확인합니다.
- course 문서에는 긴 원문을 직접 복제하지 않고, `knol` 합성 가이드에서만 요약을 재사용합니다.
