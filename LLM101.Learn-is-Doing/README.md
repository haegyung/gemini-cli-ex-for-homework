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
