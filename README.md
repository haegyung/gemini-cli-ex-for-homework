# LLM101.Learn-is-Doing

이 폴더는 `LLM101.Learn-is-Doing` 튜토리얼 시리즈의 하위 레슨 폴더입니다.  
현재 포함된 레슨은 `Lesson 1: 스킬을 활용해서 리서치부터 글쓰기까지` 입니다.

이제부터는 문서를 아래처럼 나눠서 관리합니다.
- 공통 진입점: `README.md`
- 현재 레슨 본문: `LESSON.md`
- 다음 레슨 작성용 공통 템플릿: `LESSON_TEMPLATE.md`
- Gemini 런타임 규칙: `GEMINI.md`

중요:
- 이 스타터팩은 `Gemini`와 `ChatGPT Codex`가 섞여 정리된 프로젝트입니다.
- 그래서 Gemini 사용자는 이 폴더를 그대로 작업 폴더로 쓰지 말고, 반드시 자기 프로젝트 폴더로 import한 뒤 실행합니다.
- 레슨별 목표, 예제 교재, 시나리오, command 예시는 `LESSON.md`를 기준으로 봅니다.

## 0. 문서 맵

### `README.md`

모든 레슨에 공통으로 적용되는 안내를 담습니다.
- Git 설치
- 폴더 받기
- 파일 구조 확인
- Gemini import
- Codex import
- Claude import
- 공통 참조 경로

### `LESSON.md`

현재 레슨의 본문입니다.
- 레슨 목표
- 기본 예제 교재
- 실제 command 예시
- 추천 실습 시나리오
- 막힐 때 쓰는 문장

### `LESSON_TEMPLATE.md`

`Lesson 2` 이후를 만들 때 복사해서 쓰는 템플릿입니다.
- 레슨 메타데이터
- 정본 문서
- 기본 예제 교재
- 핵심 Skill / command
- 산출물
- 실행 예시
- 시나리오

### `GEMINI.md`

Gemini가 import된 프로젝트에서 우선 읽는 실행 규칙입니다.

## 1. 가장 짧은 시작 순서

처음에는 아래 순서를 그대로 따르면 됩니다.

1. Git 설치
2. 이 레슨 폴더 받기
3. `homework` 폴더는 원본 스타터팩으로만 두기
4. 별도 프로젝트 폴더 만들기
5. `GEMINI.md`, `LESSON.md`, `.gemini/skills`, `.gemini/commands`를 import 하기
6. import한 프로젝트에서 사용하는 LLM 환경을 실행하기
7. `LESSON.md`를 열고 현재 레슨 예제 command 1개 실행하기
8. `outputs/`에 결과 저장하기
9. 그 다음 자기 과제에 맞게 Skill 또는 command 고치기

## 2. 실행 전에 파일 확인

이 폴더 기준으로 아래 구조가 보이면 정상입니다.

```text
GEMINI.md
README.md
LESSON.md
LESSON_TEMPLATE.md
.gemini/skills/
.gemini/commands/
outputs/
notes/
```

현재 Lesson 1에서 실제로 쓰는 예시 파일은 `LESSON.md` 안에 다시 정리돼 있습니다.

## 3. Git 설치

이 폴더를 받거나 복제하려면 먼저 Git이 있어야 합니다.

### Windows

1. 공식 설치 페이지를 엽니다.
   - [Git for Windows](https://git-scm.com/install/windows)
2. 설치 파일을 내려받아 기본 옵션으로 설치합니다.
3. `PowerShell` 또는 `Git Bash`를 열고 아래를 실행합니다.

```bash
git --version
```

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

## 4. 레슨 폴더 받기

배포 방식은 보통 두 가지입니다.

### 방법 A. 저장소로 받기

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

## 5. Gemini CLI에서는 반드시 import 후 실행하기

이 스타터팩은 참고용 원본 폴더입니다.  
Gemini 사용자는 이 폴더를 직접 작업 폴더로 쓰지 말고, 자기 프로젝트 폴더로 필요한 파일을 복사한 뒤 실행합니다.

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
- 어떤 문구가 다른 LLM 작업 흔적인지
- 어느 폴더를 실제 작업 공간으로 써야 하는지

그래서 Gemini 쪽에서는 원칙을 단순하게 잡습니다.
- 원본 `homework` 폴더는 스타터팩 저장소로 둡니다.
- 실제 작업은 항상 별도 프로젝트 폴더에서 합니다.
- 그 프로젝트 폴더에 `GEMINI.md`, `LESSON.md`, `.gemini/skills`, `.gemini/commands`를 import해서 씁니다.

### 5-3. Gemini 프로젝트 폴더 만들기

```bash
mkdir -p ~/my-gemini-project
cd ~/my-gemini-project
```

### 5-4. 스타터팩을 Gemini 프로젝트로 import 하기

필수 복사 대상:
- `GEMINI.md`
- `LESSON.md`
- `.gemini/skills/`
- `.gemini/commands/`

같이 가져가면 좋은 폴더:
- `README.md`
- `outputs/`
- `notes/`

macOS / Linux 예시:

```bash
mkdir -p ~/my-gemini-project/.gemini
mkdir -p ~/my-gemini-project/outputs
mkdir -p ~/my-gemini-project/notes

cp /path/to/homework/GEMINI.md ~/my-gemini-project/
cp /path/to/homework/LESSON.md ~/my-gemini-project/
cp /path/to/homework/README.md ~/my-gemini-project/
cp -R /path/to/homework/.gemini/skills ~/my-gemini-project/.gemini/
cp -R /path/to/homework/.gemini/commands ~/my-gemini-project/.gemini/
touch ~/my-gemini-project/outputs/.gitkeep
touch ~/my-gemini-project/notes/.gitkeep
```

Windows PowerShell 예시:

```powershell
New-Item -ItemType Directory -Force -Path .\my-gemini-project\.gemini | Out-Null
New-Item -ItemType Directory -Force -Path .\my-gemini-project\outputs | Out-Null
New-Item -ItemType Directory -Force -Path .\my-gemini-project\notes | Out-Null

Copy-Item .\GEMINI.md .\my-gemini-project\
Copy-Item .\LESSON.md .\my-gemini-project\
Copy-Item .\README.md .\my-gemini-project\
Copy-Item .\.gemini\skills .\my-gemini-project\.gemini\ -Recurse
Copy-Item .\.gemini\commands .\my-gemini-project\.gemini\ -Recurse
New-Item -ItemType File -Force -Path .\my-gemini-project\outputs\.gitkeep | Out-Null
New-Item -ItemType File -Force -Path .\my-gemini-project\notes\.gitkeep | Out-Null
```

### 5-5. import한 Gemini 프로젝트에서 실행

```bash
cd ~/my-gemini-project
gemini
```

필요하면 개인 Google 계정으로 로그인합니다.

### 5-6. 메모리와 예제 로드 확인

Gemini 안에서 아래 순서대로 실행합니다.

1. 현재 규칙 확인

```text
/memory show
```

2. 규칙 다시 읽기

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

5. `LESSON.md`를 옆에 두고 현재 레슨 예제 command를 실행

## 6. ChatGPT Codex로 가져가기

이 폴더는 Gemini용 구조이므로, `ChatGPT Codex`나 `Codex CLI`에서는 그대로 자동 실행되지 않습니다.  
대신 공통 규칙은 `AGENTS.md`로, 레슨 본문은 `LESSON.md`로, Gemini Skill/command는 Codex용 skill과 프롬프트로 옮겨 사용합니다.

공식 문서:
- [AGENTS.md 가이드](https://developers.openai.com/codex/guides/agents-md)
- [Codex Skills](https://developers.openai.com/codex/skills)
- [ChatGPT Developer mode](https://developers.openai.com/api/docs/guides/developer-mode)

### 6-1. Codex 실행 확인

```bash
codex --version
```

### 6-2. 공통 규칙 옮기기

Codex는 `GEMINI.md` 대신 `AGENTS.md`를 읽습니다.

옮길 공통 내용:
- 학생의 실제 작업을 진행시키는 것
- 산출물은 `outputs/`에 저장
- 불확실한 내용은 추정이라고 표시
- 현재 레슨의 세부 작업은 `LESSON.md`를 기준으로 따른다

### 6-3. 레슨 구조 옮기기

Codex 프로젝트 루트에 아래를 두는 방식이 가장 단순합니다.
- `AGENTS.md`
- `LESSON.md`
- Codex용 skill 폴더 또는 skill 문서
- 필요한 프롬프트 파일

`$skill-creator`가 보이면 아래처럼 요청합니다.

```text
$skill-creator
이 프로젝트의 GEMINI.md, LESSON.md, .gemini/skills/*, .gemini/commands/*를 읽고
Codex용 skill과 실행 프롬프트 구조로 옮겨줘.
산출물은 outputs/를 유지하고, 현재 레슨의 단계는 LESSON.md를 기준으로 맞춰줘.
```

### 6-4. Codex에서 실행

1. `AGENTS.md`와 lesson 관련 skill을 준비합니다.
2. `LESSON.md`를 열어 현재 레슨 command 예시를 확인합니다.
3. 그 예시를 Codex용 프롬프트로 바꿔 실행합니다.

## 7. Claude Code로 가져가기

Claude Code도 이 폴더를 그대로 Gemini command처럼 실행하지는 않습니다.  
대신 공통 규칙은 `CLAUDE.md`, 레슨 본문은 `LESSON.md`, 실행 구조는 skills와 custom commands로 옮깁니다.

공식 문서:
- [Claude Code Memory](https://code.claude.com/docs/en/memory)
- [Claude Code Commands](https://code.claude.com/docs/en/commands)
- [Claude Code Skills](https://code.claude.com/docs/en/skills)

### 7-1. Claude Code 실행 확인

```bash
claude --version
```

### 7-2. 공통 규칙 옮기기

1. Claude 프로젝트 루트에서 `claude`를 실행합니다.
2. `/init`으로 `CLAUDE.md`를 만듭니다.
3. `GEMINI.md`의 공통 실행 규칙을 `CLAUDE.md`로 옮깁니다.
4. `LESSON.md`는 레슨별 작업 지침으로 같이 둡니다.

### 7-3. 레슨 구조 옮기기

별도 생성기가 보이지 않으면 아래 프롬프트를 그대로 붙여넣어도 됩니다.

```text
이 프로젝트의 GEMINI.md, LESSON.md, .gemini/skills/*, .gemini/commands/*를 읽고
Claude Code용 skill과 custom command 구조로 옮겨줘.
공통 규칙은 CLAUDE.md로, 현재 레슨의 단계와 예시는 LESSON.md 기준으로 맞춰줘.
산출물은 outputs/에 저장하게 해줘.
```

### 7-4. Claude에서 실행

1. `CLAUDE.md`와 lesson 관련 skill/command를 준비합니다.
2. `LESSON.md`를 열어 현재 레슨 시작 예시를 확인합니다.
3. 그 예시를 Claude용 요청으로 바꿔 실행합니다.

## 8. 파일 소유권과 정본 경로

문서를 나눈 뒤의 정본 경로는 아래입니다.

- 공통 안내 SoT: `README.md`
- 현재 레슨 본문 SoT: `LESSON.md`
- 다음 레슨 작성 템플릿 SoT: `LESSON_TEMPLATE.md`
- Gemini 실행 규칙 SoT: `GEMINI.md`
- 실제 산출물 SoT: `outputs/`
- 메모 SoT: `notes/`

새 레슨을 만들 때는 기존 `README.md`를 복제하지 말고, `LESSON_TEMPLATE.md`를 복사해 새 레슨 본문을 만듭니다.

## 9. 검증한 로컬 실행 예시

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
- 실제 Lesson 1 예시는 `LESSON.md`를 기준으로 봅니다.

## 10. 참고 문서

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

레슨별 학습 문서와 예제 교재는 `LESSON.md`에서 관리합니다.
