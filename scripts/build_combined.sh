#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_FILE="$ROOT_DIR/COMBINED.md"

case "${1:-}" in
  "")
    ;;
  --output)
    if [[ $# -ne 2 ]]; then
      echo "usage: bash scripts/build_combined.sh [--output <path>]" >&2
      exit 2
    fi
    OUT_FILE="$2"
    ;;
  *)
    echo "usage: bash scripts/build_combined.sh [--output <path>]" >&2
    exit 2
    ;;
esac

generate_combined() {
  echo "# LLM101.Learn-is-Doing Combined"
  echo
  echo "> Auto-generated file. Edit course README or lesson README files, then rebuild."
  echo
  echo "Included sources:"
  echo "- README.md"
  while IFS= read -r lesson_file; do
    echo "- ${lesson_file#$ROOT_DIR/}"
  done < <(find "$ROOT_DIR/lessons" -mindepth 2 -maxdepth 2 -name README.md | sort)
  echo
  echo "---"
  echo
  cat "$ROOT_DIR/README.md"

  while IFS= read -r lesson_file; do
    lesson_rel="${lesson_file#$ROOT_DIR/}"
    echo
    echo "---"
    echo
    echo "<!-- BEGIN ${lesson_rel} -->"
    echo
    cat "$lesson_file"
    echo
    echo "<!-- END ${lesson_rel} -->"
  done < <(find "$ROOT_DIR/lessons" -mindepth 2 -maxdepth 2 -name README.md | sort)
}

generate_combined > "$OUT_FILE"
