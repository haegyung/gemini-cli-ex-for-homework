# LLM101.Learn-is-Doing Combined

> Auto-generated file. Edit course README or lesson README files, then rebuild.

Included sources:
- README.md
- lessons/lesson-1-research-writing/README.md

---

# LLM101.Learn-is-Doing

이 폴더는 `LLM101.Learn-is-Doing` 튜토리얼 시리즈의 정본(course root)입니다.  
이제부터는 이 코스를 레슨 폴더 단위로 분리해서 관리합니다.

현재 포함된 레슨:
- [Lesson 1. 스킬을 활용해서 리서치부터 글쓰기까지](./lessons/lesson-1-research-writing/README.md)

## 0. 구조

이 코스의 정본 경로는 아래처럼 나눕니다.
- course 공통 안내 SoT: `README.md`
- lesson 템플릿 SoT: `LESSON_TEMPLATE.md`
- 합본 SoT: `COMBINED.md`
- 합본 생성 스크립트 SoT: `scripts/build_combined.sh`
- lesson 1 본문 SoT: `lessons/lesson-1-research-writing/README.md`
- lesson 1 runtime 규칙 SoT: `lessons/lesson-1-research-writing/GEMINI.md`

현재 폴더 구조:

```text
LLM101.Learn-is-Doing/
├── README.md
├── LESSON_TEMPLATE.md
├── COMBINED.md
├── scripts/
│   └── build_combined.sh
└── lessons/
    └── lesson-1-research-writing/
        ├── README.md
        ├── GEMINI.md
        ├── .gemini/
        ├── outputs/
        └── notes/
```

## 1. 어떻게 쓰나

기본 원칙은 단순합니다.
- course 공통 안내는 이 `README.md`를 봅니다.
- 실제 실습은 각 lesson 폴더의 `README.md`를 봅니다.
- Gemini runtime 규칙은 각 lesson 폴더의 `GEMINI.md`를 봅니다.
- lesson 업데이트가 끝나면 `COMBINED.md`를 다시 만듭니다.

## 2. 가장 짧은 시작 순서

1. Git 설치
2. 이 저장소를 받기
3. 사용할 lesson 폴더를 하나 고르기
4. 그 lesson 폴더를 자기 LLM 작업 폴더로 import 하기
5. lesson 폴더의 `README.md`를 열고 예제 command 1개 실행하기
6. `outputs/`에 결과 저장하기
7. lesson 문서가 바뀌면 마지막에 `COMBINED.md` 갱신하기

현재 시작 lesson:
- `lessons/lesson-1-research-writing/`

## 3. Git 설치

이 저장소를 받거나 복제하려면 먼저 Git이 있어야 합니다.

### Windows

1. 공식 설치 페이지를 엽니다.
   - [Git for Windows](https://git-scm.com/install/windows)
2. 설치 파일을 내려받아 기본 옵션으로 설치합니다.
3. `PowerShell` 또는 `Git Bash`를 열고 아래를 실행합니다.

```bash
git --version
```

### macOS

Homebrew가 있으면:

```bash
brew install git
git --version
```

Homebrew가 없다면:

```bash
xcode-select --install
git --version
```

공식 안내:
- [Git for macOS](https://git-scm.com/install/mac)

### Linux

Ubuntu / Debian:

```bash
sudo apt update
sudo apt install git
git --version
```

Fedora:

```bash
sudo dnf install git
git --version
```

Arch Linux:

```bash
sudo pacman -S git
git --version
```

공식 안내:
- [Git for Linux](https://git-scm.com/install/linux)

## 4. lesson 폴더 받기

배포 방식은 보통 두 가지입니다.

### 방법 A. 저장소로 받기

```bash
git clone <repo-url>
cd <repo-name>/LLM101.Learn-is-Doing
```

### 방법 B. 압축 파일로 받기

1. 압축을 풉니다.
2. 터미널을 열어 `LLM101.Learn-is-Doing` 폴더로 이동합니다.

```bash
cd /path/to/LLM101.Learn-is-Doing
```

## 5. Gemini CLI에서는 lesson 폴더를 import 후 실행하기

이 코스는 `Gemini`와 `ChatGPT Codex`가 섞여 정리된 스타터팩입니다.  
그래서 Gemini 사용자는 course root 전체를 직접 작업 폴더로 쓰지 말고, 필요한 lesson 폴더를 자기 프로젝트로 import한 뒤 실행합니다.

### 5-1. Gemini CLI 설치

공식 문서:
- [Gemini CLI 문서](https://google-gemini.github.io/gemini-cli/)
- [CLI Commands](https://google-gemini.github.io/gemini-cli/docs/cli/commands.html)

Homebrew:

```bash
brew install gemini-cli
```

npm:

```bash
npm install -g @google/gemini-cli
```

설치 확인:

```bash
gemini --version
```

### 5-2. import 대상

현재 Lesson 1을 import할 때는 아래 lesson 폴더를 기준으로 합니다.

```text
LLM101.Learn-is-Doing/lessons/lesson-1-research-writing/
```

필수 복사 대상:
- `README.md`
- `GEMINI.md`
- `.gemini/`

같이 가져가면 좋은 폴더:
- `outputs/`
- `notes/`

### 5-3. macOS / Linux 예시

```bash
LESSON_DIR=/path/to/LLM101.Learn-is-Doing/lessons/lesson-1-research-writing

mkdir -p ~/my-gemini-project
cp "$LESSON_DIR/README.md" ~/my-gemini-project/
cp "$LESSON_DIR/GEMINI.md" ~/my-gemini-project/
cp -R "$LESSON_DIR/.gemini" ~/my-gemini-project/
cp -R "$LESSON_DIR/outputs" ~/my-gemini-project/
cp -R "$LESSON_DIR/notes" ~/my-gemini-project/
cd ~/my-gemini-project
gemini
```

Gemini 안에서는 아래를 다시 읽습니다.

```text
/memory reload
/skills reload
/commands reload
```

그 다음 lesson 폴더의 `README.md`에 있는 예제 command를 실행합니다.

### 5-4. Windows PowerShell 예시

```powershell
$LessonDir = ".\\LLM101.Learn-is-Doing\\lessons\\lesson-1-research-writing"

New-Item -ItemType Directory -Force -Path .\my-gemini-project | Out-Null
Copy-Item "$LessonDir\\README.md" .\my-gemini-project\
Copy-Item "$LessonDir\\GEMINI.md" .\my-gemini-project\
Copy-Item "$LessonDir\\.gemini" .\my-gemini-project\ -Recurse
Copy-Item "$LessonDir\\outputs" .\my-gemini-project\ -Recurse
Copy-Item "$LessonDir\\notes" .\my-gemini-project\ -Recurse
Set-Location .\my-gemini-project
gemini
```

## 6. Codex와 Claude Code로 옮길 때

공통 원칙:
- 공통 흐름은 lesson 폴더 `README.md`를 기준으로 본다.
- Gemini runtime 규칙은 lesson 폴더 `GEMINI.md`를 기준으로 본다.
- `.gemini` 자산은 각 환경의 기본 skill creator로 재구성한다.

### Codex

공식 문서:
- [AGENTS.md 가이드](https://developers.openai.com/codex/guides/agents-md)
- [Codex Skills](https://developers.openai.com/codex/skills)

Codex에서는 lesson 폴더의 `GEMINI.md`를 `AGENTS.md`로 옮기고, lesson 폴더의 `README.md`를 작업 지침으로 같이 둡니다.

### Claude Code

공식 문서:
- [Memory](https://code.claude.com/docs/en/memory)
- [Commands](https://code.claude.com/docs/en/commands)
- [Skills](https://code.claude.com/docs/en/skills)

Claude Code에서는 lesson 폴더의 `GEMINI.md`를 `CLAUDE.md`로 옮기고, lesson 폴더 `README.md`를 레슨 실행 가이드로 같이 둡니다.

## 7. 합본 정책

이 코스는 업데이트가 끝날 때마다 합본을 같이 관리합니다.

합본 원칙:
- 편집 대상은 `README.md`, `lessons/*/README.md`, `LESSON_TEMPLATE.md`
- 최종 합본은 `COMBINED.md`
- 합본은 직접 편집하지 않고 스크립트로 다시 생성합니다.

생성 명령:

```bash
bash scripts/build_combined.sh
```

합본에는 아래가 들어갑니다.
- course 공통 안내 `README.md`
- 각 lesson 폴더의 `README.md`

## 8. 검증한 로컬 실행 예시

이 저장소를 정리하면서 아래 실행 파일 존재는 확인했습니다.

```bash
git --version
gemini --version
codex --version
claude --version
```

확인된 예시 버전:
- `git 2.53.0`
- `gemini 0.37.1`
- `codex-cli 0.120.0`
- `claude 2.1.92`

---

<!-- BEGIN lessons/lesson-1-research-writing/README.md -->

# Lesson 1. 스킬을 활용해서 리서치부터 글쓰기까지

이 문서는 `LLM101.Learn-is-Doing/lessons/lesson-1-research-writing/` 폴더의 정본 lesson guide 입니다.  
course 공통 안내는 상위 폴더의 `../../README.md`를 보고, 현재 lesson 실행은 이 파일을 기준으로 진행합니다.

## 1. 이 lesson의 목표

이번 lesson의 목적은 하나입니다.
- 작은 Skill과 command를 써서 `리서치 -> 정리 -> 분석 -> 글쓰기 -> 다듬기` 흐름을 한 번 끝까지 돌려보는 것

핵심은 세 가지입니다.
- 주제가 아니라 이번 주에 실제로 해야 하는 작업을 고릅니다.
- 완벽한 결과보다 작은 성공 경험을 먼저 만듭니다.
- 예제 Skill과 command를 그대로 한 번 실행한 뒤, 자기 작업에 맞게 고칩니다.

## 2. 학습 문서 정본과 기본 예제 교재

학습 문서 정본:
- [Gemini CLI로 리서치부터 글쓰기까지](https://gyung.me/68nHrk)

기본 원칙:
- 이 튜토리얼 시리즈에서 기본적으로 사용할 예제 교재는 위 문서입니다.
- 사용자가 별도 교재를 지정하지 않으면 `https://gyung.me/68nHrk`를 기준 텍스트로 사용합니다.

## 3. 이 lesson 폴더에서 실제로 쓰는 파일

- `README.md`
  - 현재 lesson 실행 가이드
- `GEMINI.md`
  - Gemini runtime 규칙
- `.gemini/skills/research-task/SKILL.md`
  - 리서치 시작용 예시 Skill
- `.gemini/skills/organize-task/SKILL.md`
  - 정리용 예시 Skill
- `.gemini/skills/analysis-task/SKILL.md`
  - 분석용 예시 Skill
- `.gemini/skills/writing-task/SKILL.md`
  - 초안 작성용 예시 Skill
- `.gemini/skills/revise-task/SKILL.md`
  - 수정용 예시 Skill
- `.gemini/commands/taskflow/start.toml`
  - 리서치부터 초안까지 시작하는 예시 command
- `.gemini/commands/taskflow/revise.toml`
  - 초안을 기준으로 다듬는 예시 command
- `outputs/`
  - lesson 산출물 저장 폴더
- `notes/`
  - lesson 메모 폴더

## 4. 먼저 고를 것: 이번 주에 실제로 해야 하는 작업 1개

좋은 시작 과제 예시:
- 발표 자료 조사해서 초안 만들기
- 비교 보고서 구조 잡기
- 자기소개서 문장 다듬기
- 특정 논문 2~3개 비교 정리하기

처음에는 피하는 것이 좋은 과제:
- 너무 넓은 주제 하나 전체 공부하기
- 아직 마감이나 제출 맥락이 없는 추상 주제
- 한 번에 너무 긴 최종 결과물을 만들려는 과제

계속 기억할 문장:
- 리서치는 그럴듯한 문장을 만드는 단계가 아니라 근거를 모으는 단계입니다.
- 정리는 요약과 구조화를 분리하면 더 안전합니다.
- 분석은 느낌이 아니라 주장과 근거를 연결하는 일입니다.
- 초안은 완벽할 필요가 없습니다. 대신 근거가 달린 문장으로 끝까지 써보는 것이 먼저입니다.
- 작은 Skill은 큰 이론서가 아니라, 하나의 Task를 덜 막히게 하는 작은 도우미입니다.

## 5. Lesson 1을 Gemini에서 실행하기

### 5-1. 예제 command 실행

이번 주 실제 작업 1개를 넣어 실행합니다.

```text
/taskflow:start "예시: AI가 대학 글쓰기 과제에 미치는 영향 비교 보고서 초안 만들기"
```

별도 교재를 정하지 않았다면, 기본 예제 교재로 먼저 시작합니다.

```text
/taskflow:start "기본 예제 교재 https://gyung.me/68nHrk 를 읽고 핵심 주장 5개, 전체 구조, 수업 적용 아이디어를 정리한 5문단 초안을 만들어줘"
```

이 command는 보통 아래 흐름으로 안내합니다.
- `research-task` 기준으로 질문과 검색 키워드를 잡기
- `organize-task` 기준으로 자료를 구조화하기
- `analysis-task` 기준으로 주장과 근거를 연결하기
- `writing-task` 기준으로 5문단 초안을 만들기

### 5-2. 추천 산출물

가능하면 아래 파일로 저장하면서 진행합니다.
- `outputs/01_research_plan.md`
- `outputs/02_outline.md`
- `outputs/03_argument_map.md`
- `outputs/04_draft.md`

### 5-3. 초안 다듬기

초안을 만든 뒤 아래를 실행합니다.

```text
/taskflow:revise "예시: 문장을 더 간결하게 바꾸고, 근거가 약한 문단을 표시해줘"
```

수정 결과는 보통 아래 파일로 정리하면 됩니다.
- `outputs/05_polished_draft.md`

## 6. 다른 LLM 환경으로 옮길 때

공통 원칙:
- 공통 흐름은 현재 lesson 폴더의 `README.md`를 기준으로 봅니다.
- Gemini runtime 규칙은 현재 lesson 폴더의 `GEMINI.md`에서 가져갑니다.
- `.gemini` 자산은 각 환경의 기본 skill creator로 다시 만듭니다.

### 6-1. Codex 예시 요청

```text
$skill-creator
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Codex용 lesson-1 research-writing skill을 만들어줘.
산출물은 outputs/를 유지하고, 레슨 목표와 예시는 이 폴더의 README.md를 기준으로 맞춰줘.
```

실행 예시:

```text
이 프로젝트의 lesson-1 research-writing workflow를 사용해서
"기본 예제 교재 https://gyung.me/68nHrk 를 읽고 핵심 주장 5개와 5문단 초안 만들기"
작업을 시작해줘.
먼저 outputs/01_research_plan.md부터 제안해줘.
```

### 6-2. Claude Code 예시 요청

```text
이 lesson 폴더의 README.md, GEMINI.md, .gemini/skills/*, .gemini/commands/*를 읽고
Claude Code용 Lesson 1 skill과 custom command 구조로 옮겨줘.
공통 규칙은 CLAUDE.md로, 레슨 목표와 예시는 현재 lesson 폴더 README.md를 기준으로 맞춰줘.
산출물은 outputs/에 저장하게 해줘.
```

실행 예시:

```text
이 프로젝트의 lesson-1 research-writing workflow를 사용해서
"기본 예제 교재 https://gyung.me/68nHrk 를 읽고 핵심 주장 5개와 5문단 초안 만들기"
작업을 시작해줘.
먼저 리서치 질문 3개와 검색 키워드 10개부터 제안해줘.
```

## 7. Lesson 1을 처음 실행할 때 가장 안전한 순서

1. 이번 주 실제 과제 1개 고르기
2. 교재를 따로 정하지 않았다면 기본 예제 교재 `https://gyung.me/68nHrk`로 시작하기
3. `Gemini CLI`에서 `start` command 1회 실행하기
4. `outputs/01~04` 중 가능한 만큼 저장하기
5. `revise` 단계까지 1회 돌려보기
6. 그 다음 자기 작업에 맞게 Skill 또는 command를 고치기
7. 필요하면 Codex 또는 Claude Code로 같은 흐름을 옮기기

## 8. 추천 실습 시나리오

### 시나리오 0. 기본 예제 교재로 시작

```text
/taskflow:start "기본 예제 교재 https://gyung.me/68nHrk 를 읽고, 핵심 개념 요약 -> 구조 정리 -> 내 과제 적용 아이디어 -> 5문단 초안 순서로 진행해줘"
```

### 시나리오 A. 발표 준비

```text
/taskflow:start "AI 윤리와 대학 수업 변화 발표 자료 초안 만들기"
```

### 시나리오 B. 비교 보고서

```text
/taskflow:start "생성형 AI 찬반 논거 비교 보고서 초안 만들기"
```

### 시나리오 C. 자기소개서 문장 개선

```text
/taskflow:start "자기소개서 1번 문항 구조 잡고 초안 만들기"
/taskflow:revise "문장을 더 자연스럽게 바꾸고 과장된 표현은 줄여줘"
```

## 9. 막힐 때 쓰는 문장

### 리서치가 막힐 때

```text
주제를 더 작은 작업 단위로 바꿔줘.
이번 주 안에 끝낼 수 있는 질문 3개로 줄여줘.
```

### 정리가 막힐 때

```text
요약과 구조화를 분리해서 해줘.
먼저 핵심 5줄 요약, 그 다음 분류 체계를 제안해줘.
```

### 분석이 막힐 때

```text
주장, 근거, 반론, 한계를 분리해서 보여줘.
느낌이 아니라 근거 연결로 다시 써줘.
```

### 초안이 막힐 때

```text
완벽한 글 말고 끝까지 갈 수 있는 5문단 초안으로 먼저 써줘.
근거가 약한 문장은 표시해줘.
```

### 수정이 막힐 때

```text
강점 3개, 리스크 3개, 문장 수정 예시 10개로 나눠서 보여줘.
```

<!-- END lessons/lesson-1-research-writing/README.md -->
