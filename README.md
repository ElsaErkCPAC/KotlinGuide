# KotlinGuide: Android-Only Handbook (Kotlin + Jetpack)

This repository contains a polished beginner handbook for building Android-only apps in **Android Studio** with **Kotlin** and modern **Android Jetpack**.

## Handbook files

- **Editable source (Markdown):**  
  [`handbook/android-kotlin-jetpack-handbook.md`](handbook/android-kotlin-jetpack-handbook.md)
- **Generated PDF:**  
  [`handbook/output/android-kotlin-jetpack-handbook.pdf`](handbook/output/android-kotlin-jetpack-handbook.pdf)
- **Generated DOCX:**  
  [`handbook/output/android-kotlin-jetpack-handbook.docx`](handbook/output/android-kotlin-jetpack-handbook.docx)
- **Generated HTML (intermediate/readable):**  
  [`handbook/output/android-kotlin-jetpack-handbook.html`](handbook/output/android-kotlin-jetpack-handbook.html)

## Prerequisites

Install:

- `pandoc`
- `wkhtmltopdf`
- `node` + `npx` (for link checking)

Ubuntu example:

```bash
sudo apt-get update
sudo apt-get install -y pandoc wkhtmltopdf nodejs npm
```

## One-command local build

From repository root:

```bash
./scripts/build-handbook.sh
```

Outputs are written to `handbook/output/`.

## Validation

Run link validation (internal/local links):

```bash
./scripts/check-links.sh
```

## CI workflow

GitHub Actions workflow:

- `.github/workflows/handbook-build.yml`

It builds PDF + DOCX and uploads them as downloadable workflow artifacts.
