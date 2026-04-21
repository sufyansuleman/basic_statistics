# Course Audit for PhD-Level Redesign

This audit captures the current session material, identifies the role of each session, and maps the existing content to a PhD-level course structure.

## Existing Sessions

### 1. `sessions/introduction.qmd`
- Current scope: R and RStudio overview, why R, basic environment introduction.
- PhD upgrade path: Convert to research context, reproducible research workflows, overview of clinical data analysis pipeline, and why R is used in advanced research.
- Recommendation: Keep as an introduction module, add context for PhD-level data science, and emphasize reproducibility, version control, and project planning.

### 2. `sessions/basic-syntax.qmd`
- Current scope: arithmetic operators, basic operations, beginner syntax.
- PhD upgrade path: Replace with advanced data manipulation idioms, use tidyverse conventions, and minimize base R teaching.
- Recommendation: Retarget to "Tidyverse syntax for data science" or keep as a short refresher if truly needed.

### 3. `sessions/rmarkdown-basics.qmd`
- Current scope: introduction to R Markdown, code chunks, and reproducible documents.
- PhD upgrade path: Enhance to Quarto, reproducible reports, parameterized documents, and scientific manuscript-ready output.
- Recommendation: Keep and extend with PhD-level reproducible research examples.

### 4. `sessions/vectors.qmd`
- Current scope: vectors and factors, basic vector creation.
- PhD upgrade path: This is low-level; it can be shortened or moved to an appendix.
- Recommendation: Keep only if necessary as a quick reference, otherwise focus on tibble-based data structures and tidy data.

### 5. `sessions/df-lists.qmd` (explore-dairy-data.qmd)
- Current scope: data frames and lists with dairy/clinical examples, uses dplyr/ggplot2.
- PhD upgrade path: Expand into advanced data wrangling, table structure, nested tibbles, and multi-level clinical data.
- Recommendation: Retain and strengthen as a core data wrangling session.

### 6. `sessions/packages-libraries.qmd`
- Current scope: introduction to packages and libraries.
- PhD upgrade path: Add `renv`, package management strategies, project environments, and dependency control.
- Recommendation: Keep and upgrade to research-grade environment management.

### 7. `sessions/basic-import.qmd`
- Current scope: basic data import.
- PhD upgrade path: Add tidy import workflows, reading clinical data formats, Excel import, metadata, and data validation.
- Recommendation: Keep and enrich.

### 8. `sessions/basic-visualization.qmd`
- Current scope: ggplot2 basics, layered plots.
- PhD upgrade path: Add advanced visualization, grouping, faceting, publication-quality figures, and communication.
- Recommendation: Keep and extend.

### 9. `sessions/help-docs.qmd`
- Current scope: documentation and R help tools.
- PhD upgrade path: This is useful for workflow but can be a shorter reference section.
- Recommendation: Keep as support material or refer to as a skills appendix.

### 10. `sessions/explore-clinical-data.qmd`
- Current scope: clinical dataset exploration, uses dplyr and ggplot2.
- PhD upgrade path: Build into a research-oriented case study with rigour, clinical inference, and report-style analysis.
- Recommendation: Keep as a key applied case-study session.

### 11. `sessions/explore-dairy-data.qmd`
- Current scope: applied analysis using tidyverse on dairy/clinical data.
- PhD upgrade path: Either make it an advanced case study on mixed data or move to a secondary example set.
- Recommendation: Keep for applied data practice, or use as a secondary case study.

## Development Folder: `dev_code_data/`

### Contents
- `data/` and `data-raw/`: raw data, survival analysis examples, README.
- `doc/`: assignments, lecture notes, project summaries, and clinical/exercise PDFs.
- `R/`: many scripts and exercise files from earlier course versions.

### Role
- This folder is authoring material, not published course material.
- It should remain as a private development resource and not be rendered into the course book.

### Recommendation
- Keep in the repo for author reference and future course enrichment.
- Exclude from site rendering with `.gitignore` and Quarto publish/exclude settings if necessary.

## Suggested Module Mapping

### Module A: Foundations for Reproducible Research
- `index.qmd` update
- `packages-libraries.qmd` → renv, environments
- `rmarkdown-basics.qmd` → Quarto and reproducibility
- `help-docs.qmd` → research help and documentation

### Module B: Tidy Data Wrangling
- `basic-syntax.qmd` → shorten or refactor into tidyverse idioms
- `explore-dairy-data.qmd` / `df-lists.qmd` → advanced wrangling
- `explore-clinical-data.qmd` → case study

### Module C: Visualization and Communication
- `basic-visualization.qmd` → advanced ggplot2, publication-ready plots

### Module D: Clinical Research Workflows
- New session: survival analysis, time-to-event methods
- New session: causal inference and mixed models

### Module E: Reproducible Projects
- New session: targets/pipeline workflow
- New session: package and project organization

## Immediate Step 1 Deliverable

- Created this audit file.
- Confirmed `dev_code_data/` is ignored and safe to keep for development.
- Next step: convert the course syllabus and `index.qmd` toward PhD-level structure.
