# Basic Statistics Course

This repository contains a Quarto-based course on basic statistics for biomedical and clinical research.

## Course structure

- `index.qmd` — course homepage and overview
- `sessions/` — individual session content
- `_quarto.yml` — book configuration and navigation
- `docs/` — generated HTML site output

## Rendering locally

To render the site locally, run:

```powershell
quarto render --output-dir docs
```

## Notes

- This repository uses local Quarto builds. To publish the site, render locally and commit the generated `docs/` output.
- Keep source files in `sessions/` and the homepage in `index.qmd`.

## Maintenance

To update the site content:

1. Edit the relevant `*.qmd` files.
2. Run `quarto render --output-dir docs` locally.
3. Commit and push the updated `docs/` output alongside the source files.
