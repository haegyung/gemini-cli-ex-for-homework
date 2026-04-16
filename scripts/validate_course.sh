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

check_absent_dir() {
  local rel="$1"
  if [[ -d "$ROOT_DIR/$rel" ]]; then
    fail "directory should be absent: $rel"
  else
    pass "directory absent as expected: $rel"
  fi
}

check_tracked() {
  local rel="$1"
  if git -C "$ROOT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1 &&
    git -C "$ROOT_DIR" ls-files --error-unmatch "$rel" >/dev/null 2>&1; then
    pass "git tracks: $rel"
  else
    fail "git does not track: $rel"
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
check_file "scripts/validate_vibeworkers_ol.sh"
check_file "scripts/run_quality_gate.sh"
check_dir "lessons"
check_dir "ol"
check_absent_dir "workshop"

echo
echo "== Validate root entry links =="
if grep -Fq "./PROJECT_DEFINITION.md" "$ROOT_DIR/README.md"; then
  pass "root README references project definition"
else
  fail "root README does not reference project definition"
fi

if grep -Fq "../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md" "$ROOT_DIR/README.md"; then
  pass "root README references docs workshop index"
else
  fail "root README does not reference docs workshop index"
fi

if grep -Fq "./workshop/README.md" "$ROOT_DIR/README.md"; then
  fail "root README still references removed local workshop mirror"
else
  pass "root README no longer references local workshop mirror"
fi

if grep -Fq "./ol/README.md" "$ROOT_DIR/README.md"; then
  pass "root README references OL index"
else
  fail "root README does not reference OL index"
fi

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
  check_tracked "$lesson_rel/GEMINI.md"
  check_tracked "$lesson_rel/outputs/.gitkeep"
  check_tracked "$lesson_rel/notes/.gitkeep"

  skill_files=()
  while IFS= read -r skill_path; do
    skill_files+=("$skill_path")
  done < <(find "$lesson_dir/.gemini/skills" -mindepth 2 -maxdepth 2 -type f -name "SKILL.md" | sort)
  if ((${#skill_files[@]} > 0)); then
    pass "lesson has skill definitions: $lesson_rel (.gemini/skills/*/SKILL.md)"
    for skill_path in "${skill_files[@]}"; do
      skill_rel="${skill_path#$ROOT_DIR/}"
      check_tracked "$skill_rel"
    done
  else
    fail "lesson missing skill definitions: $lesson_rel"
  fi

  command_files=()
  while IFS= read -r command_path; do
    command_files+=("$command_path")
  done < <(find "$lesson_dir/.gemini/commands" -type f -name "*.toml" | sort)
  if ((${#command_files[@]} > 0)); then
    pass "lesson has command definitions: $lesson_rel (.gemini/commands/**/*.toml)"
    for command_path in "${command_files[@]}"; do
      command_rel="${command_path#$ROOT_DIR/}"
      check_tracked "$command_rel"
    done
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

  if [[ "$lesson_rel" == "lessons/lesson-2-remix-skill-and-command" ]]; then
    progress_log_rel="$lesson_rel/notes/progress-log.md"
    check_file "$progress_log_rel"
    check_tracked "$progress_log_rel"

    if grep -Fq "Lesson 2는 Lesson 1의 연속선" "$ROOT_DIR/$lesson_readme_rel"; then
      pass "lesson 2 README states Lesson 1 continuity"
    else
      fail "lesson 2 README must state Lesson 1 continuity"
    fi

    if grep -Fq "notes/progress-log.md" "$ROOT_DIR/$lesson_readme_rel"; then
      pass "lesson 2 README documents progress log"
    else
      fail "lesson 2 README must document progress log"
    fi

    if grep -Fq "notes/progress-log.md" "$ROOT_DIR/$lesson_rel/GEMINI.md"; then
      pass "lesson 2 GEMINI documents progress log"
    else
      fail "lesson 2 GEMINI must document progress log"
    fi

    if grep -Fq "Lesson 1 Baseline" "$ROOT_DIR/$progress_log_rel" &&
      grep -Fq "Action / Decision" "$ROOT_DIR/$progress_log_rel" &&
      grep -Fq "Evidence / Saved outputs" "$ROOT_DIR/$progress_log_rel" &&
      grep -Fq "Next Action" "$ROOT_DIR/$progress_log_rel"; then
      pass "lesson 2 progress log template has required sections"
    else
      fail "lesson 2 progress log template missing required sections"
    fi

    if grep -Fq "notes/progress-log.md" "$ROOT_DIR/$lesson_rel/.gemini/skills/orchestration-agent/SKILL.md"; then
      pass "lesson 2 orchestration skill references progress log"
    else
      fail "lesson 2 orchestration skill must reference progress log"
    fi

    if grep -Fq "notes/progress-log.md" "$ROOT_DIR/$lesson_rel/.gemini/commands/remix/start.toml" &&
      grep -Fq "notes/progress-log.md" "$ROOT_DIR/$lesson_rel/.gemini/commands/remix/review.toml"; then
      pass "lesson 2 remix commands reference progress log"
    else
      fail "lesson 2 remix commands must reference progress log"
    fi
  fi
done

echo
echo "== Validate workshop docs direct references =="
check_file "../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md"
check_file "../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-90min-run-sheet.md"
check_file "../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-90min-student-handout.md"
check_file "../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-d-1-preflight.md"

if grep -Fq "../LLM101.docs.Learn-is-doing/canonical/markdown/workshop-materials.md" "$ROOT_DIR/PROJECT_DEFINITION.md"; then
  pass "project definition references docs workshop SoT"
else
  fail "project definition does not reference docs workshop SoT"
fi

echo
echo "== Validate OL entry assets =="
check_file "ol/README.md"
check_tracked "ol/README.md"

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
