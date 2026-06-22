# Zihan Wu — CV

LaTeX source for Zihan Wu's curriculum vitae. The repository keeps **one shared
infrastructure** and several **content branches**, each tailored to a target.

## Branch structure

| Branch | Purpose |
|---|---|
| `main` | Base infrastructure only (this README, `financecv.cls`, `Makefile`, CI, `.gitignore`). No specific CV content; both mainlines inherit their build setup from here. |
| `tech-mainline` | Tech / AI engineering CV (coding agents, ML research). |
| `quant-researcher-mainline` | Quant **researcher** CV (finance line). |
| `quant-developer-mainline` | Quant **developer** CV (finance line). |

Archived variants are frozen as `archive/*` git tags rather than live branches.

## Infrastructure consistency

`financecv.cls`, `Makefile`, `.github/workflows/release.yml`, and `.gitignore`
are identical across `main` and all content branches. Only `main.tex` differs
per branch. When the infrastructure changes, update it on `main` first, then
fast-forward / cherry-pick into each content branch.

## Build

```bash
make            # latexmk → main.pdf
make watch      # continuous preview build
make clean      # remove intermediates (keep PDF)
make distclean  # remove everything generated, including the PDF
```

Requires a TeX Live distribution with `latexmk` and `pdflatex`.

## PDFs & releases

PDFs are **never committed** (see `.gitignore`). Every push triggers
`.github/workflows/release.yml`, which compiles `main.tex` and publishes the
resulting PDF as a per-branch GitHub Release asset
(`Zihan_WU_CV_<branch>.pdf`, release tag `cv-<branch>`). Download the latest CV
from the repository's **Releases** page.
