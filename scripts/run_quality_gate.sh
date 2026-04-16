#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMBINED_FILE="$ROOT_DIR/COMBINED.md"

checksum() {
  local file="$1"
  if [[ -f "$file" ]]; then
    shasum -a 256 "$file" | awk '{print $1}'
  else
    echo "missing"
  fi
}

temp_file() {
  mktemp "${TMPDIR:-/tmp}/llm101-combined.XXXXXX"
}

cleanup() {
  rm -f "${TMP_ONE:-}" "${TMP_TWO:-}"
}

trap cleanup EXIT

echo "== Quality Gate: COMBINED freshness =="
before_hash="$(checksum "$COMBINED_FILE")"
TMP_ONE="$(temp_file)"
bash "$ROOT_DIR/scripts/build_combined.sh" --output "$TMP_ONE"
after_first_hash="$(checksum "$TMP_ONE")"

freshness_fail=0
if [[ "$before_hash" == "$after_first_hash" ]]; then
  echo "[PASS][MUST] COMBINED.md was up-to-date before gate"
else
  echo "[FAIL][MUST] COMBINED.md was stale before gate"
  echo "before=$before_hash"
  echo "after =$after_first_hash"
  echo "fix  = bash scripts/build_combined.sh"
  freshness_fail=1
fi

echo
echo "== Quality Gate: COMBINED determinism =="
TMP_TWO="$(temp_file)"
bash "$ROOT_DIR/scripts/build_combined.sh" --output "$TMP_TWO"
after_second_hash="$(checksum "$TMP_TWO")"
determinism_fail=0
if [[ "$after_first_hash" == "$after_second_hash" ]]; then
  echo "[PASS][MUST] COMBINED.md generation is deterministic"
else
  echo "[FAIL][MUST] COMBINED.md generation is not deterministic"
  echo "1st=$after_first_hash"
  echo "2nd=$after_second_hash"
  determinism_fail=1
fi

echo
echo "== Quality Gate: COMBINED mutation safety =="
after_gate_hash="$(checksum "$COMBINED_FILE")"
mutation_fail=0
if [[ "$before_hash" == "$after_gate_hash" ]]; then
  echo "[PASS][MUST] quality gate did not rewrite COMBINED.md"
else
  echo "[FAIL][MUST] quality gate rewrote COMBINED.md unexpectedly"
  echo "before=$before_hash"
  echo "after =$after_gate_hash"
  mutation_fail=1
fi

echo
echo "== Quality Gate: script syntax =="
syntax_fail=0
while IFS= read -r script_file; do
  if bash -n "$script_file"; then
    echo "[PASS][MUST] syntax ok: ${script_file#$ROOT_DIR/}"
  else
    echo "[FAIL][MUST] syntax error: ${script_file#$ROOT_DIR/}"
    syntax_fail=1
  fi
done < <(find "$ROOT_DIR/scripts" -maxdepth 1 -type f -name "*.sh" | sort)

echo
echo "== Quality Gate: course validation =="
if bash "$ROOT_DIR/scripts/validate_course.sh"; then
  validation_fail=0
else
  validation_fail=1
fi

echo
echo "== Quality Gate: VibeWorkers OL validation =="
if bash "$ROOT_DIR/scripts/validate_vibeworkers_ol.sh"; then
  ol_fail=0
else
  ol_fail=1
fi

echo
echo "== Quality Gate Summary =="
echo "freshness_fail=$freshness_fail determinism_fail=$determinism_fail mutation_fail=$mutation_fail syntax_fail=$syntax_fail validation_fail=$validation_fail ol_fail=$ol_fail"

if ((freshness_fail || determinism_fail || mutation_fail || syntax_fail || validation_fail || ol_fail)); then
  exit 1
fi

echo "[PASS] quality gate complete"
