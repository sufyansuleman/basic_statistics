# Audit Report: Repository Structure and Cleanup Recommendations

## 1. Repository Overview

This repository is a Quarto-based statistics course project. It includes:

- `sessions/` source content with 20+ QMD lesson files.
- `docs/` generated site output and published documentation.
- `data/` dataset assets and sample data.
- `R/` and `scripts/` code supporting analysis and data processing.
- `_quarto.yml` configuration for book output.
- `_freeze/` cached execution state and build artifacts.

## 2. Published Session Order

The published book order is defined in `_quarto.yml` under `book.chapters[0].part: Sessions`.

Current session order includes:

1. `sessions/01-descriptive-statistics.qmd`
2. `sessions/sampling-and-estimation.qmd`
3. `sessions/tidy-data-wrangling.qmd`
4. `sessions/basic-visualization.qmd`
5. `sessions/advanced-visualization.qmd`
6. `sessions/hypothesis-testing.qmd`
7. `sessions/04-t-tests.qmd`
8. `sessions/categorical-data-and-chi-square.qmd`
9. `sessions/02-linear-regression.qmd`
10. `sessions/06-multiple-regression.qmd`
11. `sessions/03-logistic-regression.qmd`
12. `sessions/model-building-and-diagnostics.qmd`
13. `sessions/05-anova.qmd`
14. `sessions/power-and-sample-size.qmd`
15. `sessions/reproducible-research.qmd`
16. `sessions/packages-libraries.qmd`
17. `sessions/clinical-research-methods.qmd`
18. `sessions/survival-and-time-to-event.qmd`
19. `sessions/explore-clinical-data.qmd`
20. `sessions/help-docs.qmd`

## 3. Orphan Session Files

The following files exist in `sessions/` but are not part of the current `_quarto.yml` book flow:

- `sessions/basic-statistics.qmd`
- `sessions/correlation-and-association.qmd`
- `sessions/explore-dairy-data.qmd`
- `sessions/vectors.qmd`

These orphaned files create a potential mismatch between the repository contents and the published site structure.

## 4. Major Cleanup Issues

### 4.1 Legacy `dev_code_data` References

Multiple files still reference `dev_code_data`, indicating leftover legacy guidance even though the repository has been reorganized.

Affected files include:

- `sessions/session-resource-map.md`
- `data_sources.md`
- A large number of `sessions/*.qmd` files, including:
  - `sessions/01-descriptive-statistics.qmd`
  - `sessions/02-linear-regression.qmd`
  - `sessions/03-logistic-regression.qmd`
  - `sessions/04-t-tests.qmd`
  - `sessions/05-anova.qmd`
  - `sessions/06-multiple-regression.qmd`
  - `sessions/advanced-visualization.qmd`
  - `sessions/basic-statistics.qmd`
  - `sessions/basic-visualization.qmd`
  - `sessions/categorical-data-and-chi-square.qmd`
  - `sessions/correlation-and-association.qmd`
  - `sessions/explore-clinical-data.qmd`
  - `sessions/hypothesis-testing.qmd`
  - `sessions/model-building-and-diagnostics.qmd`
  - `sessions/packages-libraries.qmd`
  - `sessions/power-and-sample-size.qmd`
  - `sessions/reproducible-research.qmd`
  - `sessions/sampling-and-estimation.qmd`
  - `sessions/survival-and-time-to-event.qmd`

### 4.2 Orphan Support and Mapping Issues

- `sessions/help-docs.qmd` references `basic-statistics.qmd` even though it is not in the current published book flow.
- `sessions/session-resource-map.md` appears to be a developer-facing audit document and is not included in `_quarto.yml`.

### 4.3 Generated Output and Build Artifacts

- `docs/` contains generated site output alongside source files.
- `_quarto.yml` outputs to `docs/` and uses `execute: freeze: auto`.
- `_freeze/` contains cached execution state, suggesting Quarto build artifacts are stored in the repository.

These are not inherently errors, but they should be reviewed to determine whether generated content should remain versioned.

### 4.4 Additional Cleanup Flags

- `data_sources.md` still contains guidance for migrating old or broken links and legacy scripts.
- `data/scd_simulated_data.rda` may be a legacy dataset asset needing clarification or documentation.
- `scripts/` and `R/` appear intended for canonical code, but their exact coverage versus legacy references should be verified.

## 5. Recommended Audit Focus

1. Confirm the intended published session order and archive, remove, or document unused session files.
2. Remove or replace all `dev_code_data` references with current `scripts/`, `R/`, or direct dataset loading instructions.
3. Align `data_sources.md` with the current repository structure and remove outdated migration notes.
4. Decide whether `docs/` and `_freeze/` artifacts should remain versioned or be excluded from source control.
5. Review the status of `sessions/basic-statistics.qmd`, `sessions/correlation-and-association.qmd`, `sessions/explore-dairy-data.qmd`, and `sessions/vectors.qmd`.

## 6. Summary

The repository has a strong Quarto course structure, but it carries several legacy and orphaned references. The highest priority cleanup actions are: removing stale `dev_code_data` guidance, aligning session files with the published book order, and clarifying generated artifact retention.
