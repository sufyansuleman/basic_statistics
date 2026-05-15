# Basic Statistics Course

This repository contains a Quarto-based course on basic statistics for biomedical and clinical research.

## Course structure

- `index.qmd` — course homepage and overview
- `sessions/` — individual session content
- `_quarto.yml` — book configuration and navigation
- `docs/` — generated HTML site output
- `.github/workflows/publish-book.yml` — GitHub Actions workflow that renders and publishes the site on push

## How publishing works

A GitHub Actions workflow is configured to automatically:

1. Render the Quarto book
2. Publish the generated site from `docs/`
3. Deploy it to the `gh-pages` branch

### GitHub Pages settings

In your repository settings, configure GitHub Pages as follows:

- Source: `gh-pages` branch
- Folder: `/ (root)`

After this is enabled, the published site URL will usually be:

`https://sufyansuleman.github.io/basic_statistics/`

If GitHub indicates a different custom domain, use the URL shown in the Pages settings.

## Rendering locally

To render the site locally, run:

```powershell
quarto render --output-dir docs
```

## Notes

- The workflow triggers automatically on every push to `main`.
- No additional GitHub secret is required; the workflow uses `GITHUB_TOKEN`.
- Keep source files in `sessions/` and the homepage in `index.qmd`.

## Maintenance

To update the site content:

1. Edit the relevant `*.qmd` files.
2. Commit and push to `main`.
3. GitHub Actions will automatically rebuild and publish the site.
