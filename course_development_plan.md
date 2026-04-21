# PhD Course Development Plan

This document defines the phased plan for converting the existing `basic_statistics` course into a research-grade PhD-level course.

## Objectives

- Transition course content from beginner-focused base R to advanced dplyr-style workflows.
- Refactor the course into research-oriented modules with reproducible workflows.
- Preserve existing sessions where relevant while upgrading them for PhD-level depth.
- Keep `dev_code_data/` as a development-only folder and exclude it from course publication.
- Improve data, exercises, and assessments with clinical research relevance.

## Phase 1: Repository Hygiene

### 1.1 Ignore development-only files
- Add `dev_code_data/` to `.gitignore`.
- Keep `dev_code_data/` available for authoring, but exclude it from rendered course content.

### 1.2 Confirm tracked files
- Verify `dev_code_data/` is not tracked in the published course.
- Do not add development-only files into course chapters.

## Phase 2: Course Structure and Syllabus

### 2.1 Redesign the main course outline
- Update `index.qmd` to describe a PhD-level clinical research course.
- Rework learning objectives toward reproducible research, advanced modeling, and dplyr-based workflows.

### 2.2 Update `_quarto.yml`
- Keep the book structure, but prepare to extend sessions to advanced topics.
- Add new advanced session files as needed.

## Phase 3: Content Upgrade

### 3.1 Rewrite sessions in dplyr style
- Replace base R examples with `dplyr`, `tidyr`, `purrr`, and modern `ggplot2`.
- Use pipe-based analysis throughout.
- Standardize code style in `R/load-packages.R` and `R/functions.R`.

### 3.2 Add PhD-level depth
- Each session should include:
  - theoretical context
  - clinical research motivation
  - reproducible analysis guidance
  - advanced exercises

### 3.3 Focus on real data
- Prefer realistic clinical datasets from `data/` or `dev_code_data/data/`.
- Add documentation for dataset sources and variable meaning.

## Phase 4: Advanced Research Topics

### 4.1 Add new modules
- Tidy data wrangling and functional programming
- Advanced visualization and storytelling
- Mixed models and longitudinal analysis
- Survival analysis and time-to-event methods
- Causal inference and study design
- Reproducible pipelines and reporting

### 4.2 Design assessments
- Replace simple tasks with replication-style assignments.
- Add research project rubric and reproducible analysis deliverables.

## Phase 5: Reproducibility and Build

### 5.1 Environment management
- Ensure `renv` is configured and working.
- Keep `renv/settings.json` up-to-date.

### 5.2 Validation
- Build the site with `quarto render`.
- Ensure no references to `dev_code_data/` in published output.

### 5.3 Automation
- Add CI tooling later to verify build, linting, and reproducibility.

## Immediate Next Tasks

1. Confirm `dev_code_data/` is ignored and excluded from publication.
2. Create a development audit of existing sessions and new advanced topics.
3. Rewrite `index.qmd` for PhD-level scope.
4. Add new advanced session placeholders under `sessions/`.
5. Refactor reusable helper code into the `R/` folder.

## Notes

- `dev_code_data/` is intentionally development-only.
- The published course should remain clean and focused on learning materials.
- This is a living plan; it can be updated as the course evolves.
