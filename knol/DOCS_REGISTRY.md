# Knol Docs Registry

## Purpose

이 문서는 `knol/` 아래 공유 지식 문서의 도메인별 SoT를 정의합니다.

## Domain SoT

- `agent-skills/`
  - scope: skill, subagent, open standard, lesson 2 공용 해설
  - canonical entry: [agent-skills/README.md](./agent-skills/README.md)
  - source map: [agent-skills/official-source-map.md](./agent-skills/official-source-map.md)
  - source archive: [agent-skills/source-archive/README.md](./agent-skills/source-archive/README.md)
  - source manifest: [agent-skills/source-archive/manifest.json](./agent-skills/source-archive/manifest.json)
  - synthesis guide: [agent-skills/skill-as-agent-shared-guide.md](./agent-skills/skill-as-agent-shared-guide.md)

## Maintenance Rules

- 새로운 공유 주제가 생기면 먼저 도메인 폴더를 만들고 여기 등록합니다.
- 공식 소스가 있는 문서는 도메인별 `official-source-map.md`에 URL과 용도를 먼저 적습니다.
- 공식 소스가 있는 도메인은 `source-archive/manifest.json`과 로컬 capture 산출물을 함께 유지합니다.
- lesson이나 course 문서에서는 가능한 한 vendor 문서에 직접 흩어져 링크하지 말고, 먼저 `knol/`의 합성 가이드를 참조합니다.
- vendor별 사실 변경이 있으면 요약 문서와 inventory의 `last_reviewed`를 함께 갱신합니다.
