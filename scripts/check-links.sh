#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOC="$ROOT_DIR/handbook/android-kotlin-jetpack-handbook.md"
CONFIG="$ROOT_DIR/.markdown-link-check.json"
EXTERNAL_CONFIG="$ROOT_DIR/.markdown-link-check.external.json"

if ! command -v npx >/dev/null 2>&1; then
  echo "npx is required to run markdown-link-check"
  exit 1
fi

if [[ "${CHECK_EXTERNAL_LINKS:-0}" == "1" ]]; then
  npx --yes markdown-link-check "$DOC" --config "$EXTERNAL_CONFIG"
else
  npx --yes markdown-link-check "$DOC" --config "$CONFIG"
fi
