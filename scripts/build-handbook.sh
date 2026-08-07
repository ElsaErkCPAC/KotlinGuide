#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT_DIR/handbook/android-kotlin-jetpack-handbook.md"
CSS_SRC="$ROOT_DIR/handbook/assets/handbook.css"
OUT_DIR="$ROOT_DIR/handbook/output"
CSS_OUT="$OUT_DIR/handbook.css"
HTML_OUT="$OUT_DIR/android-kotlin-jetpack-handbook.html"
PDF_OUT="$OUT_DIR/android-kotlin-jetpack-handbook.pdf"
DOCX_OUT="$OUT_DIR/android-kotlin-jetpack-handbook.docx"

for cmd in pandoc wkhtmltopdf; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required tool: $cmd"
    echo "Install prerequisites, then re-run."
    exit 1
  fi
done

mkdir -p "$OUT_DIR"
cp "$CSS_SRC" "$CSS_OUT"

pandoc "$SRC" \
  --standalone \
  --from gfm \
  --to html5 \
  --toc \
  --number-sections \
  --css "handbook.css" \
  --metadata title="Android-Only App Handbook (Kotlin + Jetpack)" \
  -o "$HTML_OUT"

wkhtmltopdf \
  --enable-local-file-access \
  "$HTML_OUT" "$PDF_OUT"

pandoc "$SRC" \
  --from gfm \
  --to docx \
  --toc \
  --number-sections \
  -o "$DOCX_OUT"

echo "Built:"
echo "  $HTML_OUT"
echo "  $PDF_OUT"
echo "  $DOCX_OUT"
