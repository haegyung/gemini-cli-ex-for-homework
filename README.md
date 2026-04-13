# 리서치부터 글쓰기까지 워크숍 시작 가이드

이 폴더는 이론 설명서를 먼저 읽는 세트가 아닙니다.  
이번 주에 실제로 해야 하는 작업 1개를 골라서, `리서치 -> 정리 -> 분석 -> 초안 -> 수정` 흐름을 직접 돌려보게 하는 워크숍 시작 세트입니다.

핵심은 세 가지입니다.
- 주제가 아니라 이번 주에 실제로 해야 하는 작업을 고릅니다.
- 완벽한 결과보다 작은 성공 경험을 먼저 만듭니다.
- 예제 Skill과 command를 그대로 한 번 실행한 뒤, 자기 작업에 맞게 고칩니다.

중요:
- 이 스타터팩은 `Gemini`와 `ChatGPT Codex`가 섞여 정리된 프로젝트입니다.
- 그래서 이 폴더를 그대로 열었을 때 어디까지가 Gemini 기준 정본인지 헷갈릴 수 있습니다.
- 따라서 Gemini 사용자는 이 스타터팩을 자기 프로젝트 폴더로 `import`한 뒤에만 실행합니다.

학습 문서 정본:
- [Gemini CLI로 리서치부터 글쓰기까지](https://gyung.me/68nHrk)
- 위 링크는 현재 `ol.vibeworkers.net`의 공유 문서로 연결됩니다.
- 이 튜토리얼 시리즈에서 기본적으로 사용할 예제 교재도 위 문서입니다.

## 0. 이 폴더 안에 무엇이 있나

- `GEMINI.md`
  - 이 워크숍 폴더에서 Gemini가 우선 읽는 작업 규칙입니다.
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
  - 리서치부터 초안까지 한 번에 시작하는 예시 command
- `.gemini/commands/taskflow/revise.toml`
  - 초안을 기준으로 다듬는 예시 command
- `outputs/`
  - 실제 결과물을 쌓는 폴더
- `notes/`
  - 메모, 질문, 참고 링크를 적는 폴더

## 1. 먼저 고를 것: 이번 주에 실제로 해야 하는 작업 1개

좋은 시작 과제 예시:
- 발표 자료 조사해서 초안 만들기
- 비교 보고서 구조 잡기
- 자기소개서 문장 다듬기
- 특정 논문 2~3개 비교 정리하기

처음에는 피하는 것이 좋은 과제:
- 너무 넓은 주제 하나 전체 공부하기
- 아직 마감이나 제출 맥락이 없는 추상 주제
- 한 번에 너무 긴 최종 결과물을 만들려는 과제

워크숍에서 계속 기억할 문장:
- 리서치는 그럴듯한 문장을 만드는 단계가 아니라 근거를 모으는 단계입니다.
- 정리는 요약과 구조화를 분리하면 더 안전합니다.
- 분석은 느낌이 아니라 주장과 근거를 연결하는 일입니다.
- 초안은 완벽할 필요가 없습니다. 대신 근거가 달린 문장으로 끝까지 써보는 것이 먼저입니다.
- 작은 Skill은 큰 이론서가 아니라, 하나의 Task를 덜 막히게 하는 작은 도우미입니다.

## 2. Git 설치

이 폴더를 받거나 복제하려면 먼저 Git이 있어야 합니다.

### Windows

1. 공식 설치 페이지를 엽니다.
   - [Git for Windows](https://git-scm.com/install/windows)
2. 설치 파일을 내려받아 기본 옵션으로 설치합니다.
3. `PowerShell` 또는 `Git Bash`를 열고 아래를 실행합니다.

```bash
git --version
```

정상이라면 버전이 보입니다.

### macOS

방법 1. Homebrew가 이미 있으면:

```bash
brew install git
git --version
```

방법 2. Homebrew가 없다면:

```bash
xcode-select --install
git --version
```

공식 안내:
- [Git for macOS](https://git-scm.com/install/mac)

### Linux

배포판에 맞는 패키지 관리자를 사용합니다.

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

## 3. 워크숍 폴더 받기

배포 방식은 보통 두 가지입니다.

### 방법 A. 저장소로 받기

강의자가 저장소 주소를 줬다면:

```bash
git clone <repo-url>
cd <repo-name>/homework
```

### 방법 B. 압축 파일로 받기

1. 압축을 풉니다.
2. 터미널을 열어 `homework` 폴더로 이동합니다.

```bash
cd /path/to/homework
```

현재 폴더가 맞는지 확인합니다.

```bash
pwd
ls -la
```

## 4. 실행 전에 파일 확인

아래 파일이 보여야 정상입니다.

```text
GEMINI.md
README.md
.gemini/skills/research-task/SKILL.md
.gemini/skills/organize-task/SKILL.md
.gemini/skills/analysis-task/SKILL.md
.gemini/skills/writing-task/SKILL.md
.gemini/skills/revise-task/SKILL.md
.gemini/commands/taskflow/start.toml
.gemini/commands/taskflow/revise.toml
outputs/
notes/
```

## 5. Gemini CLI에서는 반드시 import 후 실행하기

이 스타터팩은 참고용 원본 폴더입니다.  
Gemini 사용자는 이 폴더를 작업 폴더로 직접 쓰지 말고, 자기 프로젝트 폴더로 필요한 파일을 복사한 뒤 실행합니다.

### 5-1. Gemini CLI 설치

공식 문서:
- [Gemini CLI 문서](https://google-gemini.github.io/gemini-cli/)
- [CLI Commands](https://google-gemini.github.io/gemini-cli/docs/cli/commands.html)

macOS / Linux에서 Homebrew를 쓰는 경우:

```bash
brew install gemini-cli
```

npm을 쓰는 경우:

```bash
npm install -g @google/gemini-cli
```

설치 확인:

```bash
gemini --version
```

### 5-2. 왜 import가 필요한가

이 프로젝트는 `Gemini`와 `ChatGPT Codex`가 섞여 정리됐기 때문에, 원본 폴더를 그대로 열면 아래가 불분명할 수 있습니다.
- 어떤 규칙이 Gemini용인지
- 어떤 문구가 Codex 작업 흔적인지
- 어느 폴더를 실제 작업 공간으로 써야 하는지

그래서 Gemini 쪽에서는 원칙을 단순하게 잡습니다.
- 원본 `homework` 폴더는 스타터팩 저장소로 둡니다.
- 실제 작업은 항상 별도 프로젝트 폴더에서 합니다.
- 그 프로젝트 폴더에 `GEMINI.md`, `.gemini/skills`, `.gemini/commands`를 import하고 reload해서 씁니다.

### 5-3. Gemini 프로젝트 폴더 만들기

새 폴더를 하나 만듭니다.

```bash
mkdir -p ~/my-gemini-writing-project
cd ~/my-gemini-writing-project
```

기존 프로젝트에 붙일 때는 그 프로젝트 루트로 이동하면 됩니다.

### 5-4. 스타터팩을 Gemini 프로젝트로 import 하기

가장 중요한 복사 대상은 아래 3개입니다.
- `GEMINI.md`
- `.gemini/skills/`
- `.gemini/commands/`

같이 가져가면 좋은 폴더:
- `outputs/`
- `notes/`

macOS / Linux 예시:

```bash
mkdir -p ~/my-gemini-writing-project/.gemini
mkdir -p ~/my-gemini-writing-project/outputs
mkdir -p ~/my-gemini-writing-project/notes

cp /path/to/homework/GEMINI.md ~/my-gemini-writing-project/
cp -R /path/to/homework/.gemini/skills ~/my-gemini-writing-project/.gemini/
cp -R /path/to/homework/.gemini/commands ~/my-gemini-writing-project/.gemini/
touch ~/my-gemini-writing-project/outputs/.gitkeep
touch ~/my-gemini-writing-project/notes/.gitkeep
```

Windows PowerShell 예시:

```powershell
New-Item -ItemType Directory -Force -Path .\my-gemini-writing-project\.gemini | Out-Null
New-Item -ItemType Directory -Force -Path .\my-gemini-writing-project\outputs | Out-Null
New-Item -ItemType Directory -Force -Path .\my-gemini-writing-project\notes | Out-Null

Copy-Item .\GEMINI.md .\my-gemini-writing-project\
Copy-Item .\.gemini\skills .\my-gemini-writing-project\.gemini\ -Recurse
Copy-Item .\.gemini\commands .\my-gemini-writing-project\.gemini\ -Recurse
New-Item -ItemType File -Force -Path .\my-gemini-writing-project\outputs\.gitkeep | Out-Null
New-Item -ItemType File -Force -Path .\my-gemini-writing-project\notes\.gitkeep | Out-Null
```

터미널이 익숙하지 않다면 파일 탐색기에서 아래만 직접 복사해도 됩니다.
- `GEMINI.md`
- `.gemini` 폴더 전체
- `outputs` 폴더
- `notes` 폴더

### 5-5. import한 Gemini 프로젝트에서 실행

```bash
cd ~/my-gemini-writing-project
gemini
```

필요하면 개인 Google 계정으로 로그인합니다.

### 5-6. 메모리와 예제 로드 확인

Gemini 안에서 아래 순서대로 실행합니다.

1. 현재 규칙 확인

```text
/memory show
```

2. 규칙을 다시 읽기

```text
/memory reload
```

3. Skill 다시 읽기

```text
/skills reload
```

4. command 다시 읽기

```text
/commands reload
```

### 5-7. 예제 command 실행

이번 주 실제 작업 1개를 넣어 실행합니다.
튜토리얼 시리즈에서는 사용자가 별도 교재를 정하지 않았다면 기본 예제 교재인 [Gemini CLI로 리서치부터 글쓰기까지](https://gyung.me/68nHrk)를 읽고 요약·재구성하는 작업으로 먼저 시작합니다.

```text
/taskflow:start "예시: AI가 대학 글쓰기 과제에 미치는 영향 비교 보고서 초안 만들기"
```

기본 예제 교재로 바로 시작하는 예시는 아래와 같습니다.

```text
/taskflow:start "기본 예제 교재 https://gyung.me/68nHrk 를 읽고 핵심 주장 5개, 전체 구조, 수업 적용 아이디어를 정리한 5문단 초안을 만들어줘"
```

이 command는 보통 아래 흐름으로 안내합니다.
- `research-task` 기준으로 질문과 검색 키워드를 잡기
- `organize-task` 기준으로 자료를 구조화하기
- `analysis-task` 기준으로 주장과 근거를 연결하기
- `writing-task` 기준으로 5문단 초안을 만들기

가능하면 아래 파일로 저장하면서 진행합니다.
- `outputs/01_research_plan.md`
- `outputs/02_outline.md`
- `outputs/03_argument_map.md`
- `outputs/04_draft.md`

### 5-8. 초안 다듬기

초안을 만든 뒤 아래를 실행합니다.

```text
/taskflow:revise "예시: 문장을 더 간결하게 바꾸고, 근거가 약한 문단을 표시해줘"
```

이 command는 `@outputs/04_draft.md`를 기준으로 수정 작업을 돕습니다.  
수정 결과는 보통 아래 파일로 정리하면 됩니다.

- `outputs/05_polished_draft.md`

## 6. ChatGPT Codex로 가져가기

이 폴더는 Gemini용 구조이므로, `ChatGPT Codex`나 `Codex CLI`에서는 그대로 자동 실행되지 않습니다.  
대신 이 폴더의 규칙과 예제 흐름을 `AGENTS.md`와 `Codex Skills`로 옮기면 거의 같은 방식으로 사용할 수 있습니다.

공식 문서:
- [AGENTS.md 가이드](https://developers.openai.com/codex/guides/agents-md)
- [Codex Skills](https://developers.openai.com/codex/skills)
- [ChatGPT Developer mode](https://developers.openai.com/api/docs/guides/developer-mode)

### 6-1. Codex 실행 확인

```bash
codex --version
```

### 6-2. 프로젝트 규칙 옮기기

Codex는 `GEMINI.md` 대신 `AGENTS.md`를 읽습니다.  
가장 쉬운 방법은 이 폴더의 핵심 규칙을 루트 `AGENTS.md`로 옮기는 것입니다.

옮길 핵심 내용:
- 작업 목적은 학생의 실제 과제를 진행시키는 것
- 산출물은 `outputs/`에 저장
- 흐름은 `research -> organize -> analysis -> writing -> revise`
- 불확실한 내용은 추정이라고 표시

### 6-3. Codex용 skill로 변환하기

세션에 `$skill-creator`가 보이면 아래처럼 요청합니다.  
만약 해당 생성기가 보이지 않으면, 같은 내용을 일반 프롬프트로 요청해도 됩니다.

```text
$skill-creator
이 폴더의 GEMINI.md, .gemini/skills/*, .gemini/commands/taskflow/*를 읽고
Codex용 research-writing-workflow skill을 만들어줘.
반드시 아래 흐름을 포함해줘:
research -> organize -> analysis -> writing -> revise
산출물 경로는 outputs/를 유지해줘.
```

권장 결과:
- `AGENTS.md` 생성 또는 보강
- Codex용 `SKILL.md` 생성
- 예제 시작 프롬프트와 수정 프롬프트 정리

### 6-4. Codex에서 실제 실행

Skill 생성이 끝나면 아래처럼 시작합니다.

```text
이 프로젝트의 research-writing-workflow를 사용해서
"예시: AI가 대학 글쓰기 과제에 미치는 영향 비교 보고서 초안 만들기"
작업을 시작해줘.
먼저 outputs/01_research_plan.md부터 제안해줘.
```

### 6-5. ChatGPT 웹에서 MCP를 붙이고 싶다면

원격 MCP를 같이 쓰고 싶다면, ChatGPT 웹에서는 `Developer mode`를 켠 뒤 앱을 만들 수 있습니다.

순서:
1. ChatGPT 웹에서 `Settings -> Apps -> Advanced settings -> Developer mode` 활성화
2. MCP 서버를 앱으로 추가
3. 대화에서 필요한 도구만 선택해서 사용

## 7. Claude Code로 가져가기

Claude Code도 이 폴더를 그대로 Gemini command처럼 실행하지는 않습니다.  
대신 `CLAUDE.md`, custom commands, skills로 같은 흐름을 옮길 수 있습니다.

공식 문서:
- [Claude Code Memory](https://code.claude.com/docs/en/memory)
- [Claude Code Commands](https://code.claude.com/docs/en/commands)
- [Claude Code Skills](https://code.claude.com/docs/en/skills)

### 7-1. Claude Code 실행 확인

```bash
claude --version
```

### 7-2. 프로젝트 메모리 만들기

워크숍 폴더에서 Claude를 실행합니다.

```bash
cd /path/to/homework
claude
```

그다음 Claude 안에서:

```text
/init
```

이 단계에서 `CLAUDE.md`를 만들고, `GEMINI.md`의 핵심 규칙을 옮깁니다.

### 7-3. Claude용 skill 또는 command 만들기

Claude Code는 보통 `CLAUDE.md`, skills, custom commands 조합으로 가져가는 편이 안정적입니다.  
별도 생성기가 보이지 않으면 아래 프롬프트를 그대로 붙여넣어도 됩니다.

```text
이 폴더의 GEMINI.md와 .gemini/skills/*, .gemini/commands/taskflow/*를 읽고
Claude Code용 skill과 custom command 구조로 옮겨줘.
research -> organize -> analysis -> writing -> revise 흐름은 유지하고,
산출물은 outputs/에 저장하게 해줘.
```

권장 결과:
- `CLAUDE.md`에 프로젝트 규칙 반영
- Claude용 skill 문서 생성
- 시작용 command와 수정용 command 생성

### 7-4. Claude에서 실제 실행

아래처럼 바로 시작할 수 있습니다.

```text
이 프로젝트의 research-writing workflow를 사용해서
"예시: AI가 대학 글쓰기 과제에 미치는 영향 비교 보고서 초안 만들기"
작업을 시작해줘.
먼저 리서치 질문 3개와 검색 키워드 10개부터 제안해줘.
```

## 8. 처음 실행할 때 가장 안전한 순서

처음에는 아래 순서를 그대로 따라가면 됩니다.

1. Git 설치
2. 워크숍 폴더 받기
3. `homework`는 원본 스타터팩으로만 두기
4. 별도 Gemini 프로젝트 폴더 만들기
5. `GEMINI.md`, `.gemini/skills`, `.gemini/commands`를 import 하기
6. 이번 주 실제 과제 1개 고르기
7. import한 프로젝트 폴더에서 `Gemini CLI`를 실행
8. `outputs/01~04` 중 가능한 만큼 저장
9. `revise` 단계까지 1회 돌려보기
10. 그 다음 자기 작업에 맞게 Skill 또는 command를 고치기
11. 필요하면 Codex 또는 Claude Code로 같은 흐름을 옮기기

처음부터 모든 환경에 동시에 옮기지 않는 것이 좋습니다.  
한 번은 Gemini에서 성공 경험을 만든 뒤, 그 성공 흐름을 다른 환경으로 가져가는 편이 훨씬 덜 막힙니다.

## 9. 추천 실습 시나리오

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

## 10. 막힐 때 쓰는 문장

아래 문장을 그대로 복사해서 써도 됩니다.

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

## 11. 검증한 로컬 실행 예시

이 폴더를 정리하면서 아래 실행 파일 존재는 확인했습니다.

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

주의:
- 각 도구 안에서 로그인까지 끝난 상태는 사용자 환경마다 다를 수 있습니다.
- `Gemini CLI`의 `/skills reload`, `/commands reload`는 이 폴더 구조 기준으로 설명했습니다.
- `Codex`, `Claude Code`는 이 폴더를 그대로 읽기보다, 각 환경의 기본 규칙 파일과 skill 구조로 옮겨 쓰는 방식이 안정적입니다.

## 12. 참고 문서

공식 문서:
- Git 설치
  - [Windows](https://git-scm.com/install/windows)
  - [macOS](https://git-scm.com/install/mac)
  - [Linux](https://git-scm.com/install/linux)
- Gemini CLI
  - [Gemini CLI 문서](https://google-gemini.github.io/gemini-cli/)
  - [CLI Commands](https://google-gemini.github.io/gemini-cli/docs/cli/commands.html)
- ChatGPT Codex
  - [AGENTS.md 가이드](https://developers.openai.com/codex/guides/agents-md)
  - [Codex Skills](https://developers.openai.com/codex/skills)
  - [ChatGPT Developer mode](https://developers.openai.com/api/docs/guides/developer-mode)
- Claude Code
  - [Memory](https://code.claude.com/docs/en/memory)
  - [Commands](https://code.claude.com/docs/en/commands)
  - [Skills](https://code.claude.com/docs/en/skills)

학습 문서 정본:
- [Gemini CLI로 리서치부터 글쓰기까지](https://gyung.me/68nHrk)

검증 메모:
- `https://gyung.me/68nHrk`는 현재 `https://ol.vibeworkers.net/s/8e5d2267-8bf2-4e3e-8f4f-6fa75cf04983`로 리다이렉트됩니다.
- 해당 문서의 페이지 제목은 `Gemini CLI로 리서치부터 글쓰기까지`입니다.

이 README는 위 학습 문서의 취지를 워크숍 시작용 폴더에 맞게 단계별 실행 가이드로 다시 정리한 버전입니다.

추가 원칙:
- 이 프로젝트는 `Gemini`와 `ChatGPT Codex`가 섞여 작업된 스타터팩이므로, Gemini 사용자는 원본 폴더를 직접 작업 공간으로 쓰지 않고 반드시 자기 프로젝트로 import해서 사용합니다.
