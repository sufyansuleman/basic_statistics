# Basic Statistics Course

A practical, Quarto-based course for researchers who need to understand statistics in real biomedical and clinical settings.

## What this course is

This course teaches core statistical concepts through examples, code, and interpretation. It is designed around real-world workflows so you can learn:

- how to choose the right analysis
- how to fit and interpret regression models
- how to check assumptions and diagnose problems
- how to communicate results clearly and accurately

The course is organized as a book-style website with self-contained sessions in `sessions/`.

## Who is this for

This course is ideal for:

- biomedical researchers who want to analyse data with confidence
- clinicians learning applied statistics for research
- graduate students in health and life sciences
- researchers who prefer practical examples over theory-heavy textbooks

## Why this course

Instead of abstract formulas, this course focuses on:

- data-driven examples with clinical and ecological datasets
- clear interpretation of models and statistical output
- the most useful methods for everyday research
- a lightweight Quarto website you can run locally or publish from `docs/`

## Course contents

- `index.qmd` — course landing page
- `sessions/setup.qmd` — setup and package installation
- `sessions/` — session content for inference, regression, modeling, and advanced methods
- `docs/` — generated website output after running Quarto

## Preview the course locally

Render the website on your machine with:

```powershell
quarto render --output-dir docs
```

Then open `docs/index.html` in your browser.

## Website address

Once published, the course can be made available at:

https://sufyansuleman.github.io/basic_statistics/

If the site is not yet published, use the local preview above.

## Keep it simple

This repo is intended for local authorship and manual publishing. The source content lives in `sessions/`, and the built site lives in `docs/`.

## Update the course

1. Edit the relevant `*.qmd` files.
2. Run `quarto render --output-dir docs`.
3. Commit both source and updated `docs/` output.
