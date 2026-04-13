#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0

pass() {
  echo "[PASS][MUST] $1"
  PASS_COUNT=$((PASS_COUNT + 1))
}

fail() {
  echo "[FAIL][MUST] $1"
  FAIL_COUNT=$((FAIL_COUNT + 1))
}

warn() {
  echo "[WARN][SHOULD] $1"
  WARN_COUNT=$((WARN_COUNT + 1))
}

check_file() {
  local rel="$1"
  if [[ -f "$ROOT_DIR/$rel" ]]; then
    pass "file exists: $rel"
  else
    fail "missing file: $rel"
  fi
}

check_dir() {
  local rel="$1"
  if [[ -d "$ROOT_DIR/$rel" ]]; then
    pass "directory exists: $rel"
  else
    fail "missing directory: $rel"
  fi
}

echo "== Validate course root files =="
check_file "README.md"
check_file "PROJECT_DEFINITION.md"
check_file "LESSON_TEMPLATE.md"
check_file "COMBINED.md"
check_file "IMPLEMENTATION_REQUIREMENTS.md"
check_file "scripts/build_combined.sh"
check_file "scripts/validate_course.sh"
check_file "scripts/run_quality_gate.sh"
check_dir "lessons"

echo
echo "== Validate lesson assets =="
LESSON_DIRS=()
while IFS= read -r lesson_path; do
  LESSON_DIRS+=("$lesson_path")
done < <(find "$ROOT_DIR/lessons" -mindepth 1 -maxdepth 1 -type d | sort)
if ((${#LESSON_DIRS[@]} == 0)); then
  fail "at least one lesson directory is required under lessons/"
fi

for lesson_dir in "${LESSON_DIRS[@]}"; do
  lesson_rel="${lesson_dir#$ROOT_DIR/}"
  lesson_readme_rel="$lesson_rel/README.md"

  check_file "$lesson_readme_rel"
  check_file "$lesson_rel/GEMINI.md"
  check_file "$lesson_rel/outputs/.gitkeep"
  check_file "$lesson_rel/notes/.gitkeep"
  check_dir "$lesson_rel/.gemini/skills"
  check_dir "$lesson_rel/.gemini/commands"

  skill_files=()
  while IFS= read -r skill_path; do
    skill_files+=("$skill_path")
  done < <(find "$lesson_dir/.gemini/skills" -mindepth 2 -maxdepth 2 -type f -name "SKILL.md" | sort)
  if ((${#skill_files[@]} > 0)); then
    pass "lesson has skill definitions: $lesson_rel (.gemini/skills/*/SKILL.md)"
  else
    fail "lesson missing skill definitions: $lesson_rel"
  fi

  command_files=()
  while IFS= read -r command_path; do
    command_files+=("$command_path")
  done < <(find "$lesson_dir/.gemini/commands" -type f -name "*.toml" | sort)
  if ((${#command_files[@]} > 0)); then
    pass "lesson has command definitions: $lesson_rel (.gemini/commands/**/*.toml)"
  else
    fail "lesson missing command definitions: $lesson_rel"
  fi

  if grep -Fq "$lesson_readme_rel" "$ROOT_DIR/README.md"; then
    pass "root README references lesson: $lesson_readme_rel"
  else
    fail "root README does not reference lesson: $lesson_readme_rel"
  fi

  begin_marker="<!-- BEGIN $lesson_readme_rel -->"
  end_marker="<!-- END $lesson_readme_rel -->"
  if grep -Fq "$begin_marker" "$ROOT_DIR/COMBINED.md" && grep -Fq "$end_marker" "$ROOT_DIR/COMBINED.md"; then
    pass "COMBINED.md includes markers for lesson: $lesson_readme_rel"
  else
    fail "COMBINED.md missing lesson markers: $lesson_readme_rel"
  fi
done

echo
echo "== Validate conflict markers in markdown =="
TMP_MARKER_FILE="$(mktemp)"
if grep -R --line-number -E '^(<<<<<<< |=======$|>>>>>>> )' --exclude-dir='.git' --include='*.md' "$ROOT_DIR" >"$TMP_MARKER_FILE"; then
  fail "unresolved merge conflict markers found in markdown files"
  cat "$TMP_MARKER_FILE"
else
  pass "no unresolved merge conflict markers in markdown files"
fi
rm -f "$TMP_MARKER_FILE"

echo
echo "== SHOULD checks =="
if grep -Fq "scripts/run_quality_gate.sh" "$ROOT_DIR/README.md"; then
  echo "[PASS][SHOULD] README documents quality gate command"
else
  warn "README should document scripts/run_quality_gate.sh"
fi

if git -C "$ROOT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if git -C "$ROOT_DIR" ls-files | grep -Fxq ".DS_Store"; then
    warn ".DS_Store is tracked by git; it should stay ignored"
  else
    echo "[PASS][SHOULD] .DS_Store is not tracked"
  fi
fi

echo
echo "== Summary =="
echo "PASS=$PASS_COUNT FAIL=$FAIL_COUNT WARN=$WARN_COUNT"

if ((FAIL_COUNT > 0)); then
  exit 1
fi
