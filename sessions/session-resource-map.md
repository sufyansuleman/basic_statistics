# Session Resource Map

Maps every course session to its primary datasets, packages, and key resources.
All sessions use direct `library()` calls — no `source()` calls to `R/` helpers.

## Core Design Principles

- Package datasets preferred over external CSVs (more stable, no network required at render time)
- Clinical/human examples paired with mouse/animal/lab examples in every session
- `survival::pbc` (418 patients, primary biliary cholangitis RCT) is the primary clinical dataset throughout Parts 3–6
- `palmerpenguins::penguins` is the primary introductory dataset in Parts 1–2

---

## Part 1: Getting Started in R

### 1. packages-libraries.qmd (`#sec-packages-libraries`)
- **Datasets:** none (conceptual session)
- **Packages:** `tidyverse`, `BiocManager`, `devtools`, `remotes`
- **Resources:** CRAN, Bioconductor, GitHub package installation

### 2. vectors.qmd (`#sec-vectors`)
- **Datasets:** small inline examples; `palmerpenguins::penguins` (introduced)
- **Packages:** `tidyverse`
- **Key concepts:** numeric/character/logical vectors, factors, tibbles

### 3. tidy-data-wrangling.qmd (`#sec-tidy-data-wrangling`)
- **Datasets:** `palmerpenguins::penguins`, simulated mouse body-weight (inline)
- **Packages:** `tidyverse`, `naniar`, `palmerpenguins`
- **Key functions:** `filter()`, `select()`, `mutate()`, `pivot_longer()`, `left_join()`

### 4. reproducible-research.qmd (`#sec-reproducible-research`)
- **Datasets:** `palmerpenguins::penguins` (for worked Quarto report)
- **Packages:** `here`, `renv`, `quarto`
- **Key concepts:** `here::here()` paths, `renv` snapshots, Quarto render

---

## Part 2: Describing and Visualizing Data

### 5. 01-descriptive-statistics.qmd (`#sec-descriptive`)
- **Datasets:** `survival::pbc`, `palmerpenguins::penguins`
- **Packages:** `tidyverse`, `gtsummary`, `survival`
- **Key outputs:** Table 1, histogram, boxplot, summary statistics

### 6. basic-visualization.qmd (`#sec-basic-viz`)
- **Datasets:** `survival::pbc`, `palmerpenguins::penguins`
- **Packages:** `ggplot2`, `tidyverse`
- **Plot types:** scatter, histogram, boxplot, bar chart

### 7. advanced-visualization.qmd (`#sec-advanced-viz`)
- **Datasets:** `survival::pbc`, `palmerpenguins::penguins`
- **Packages:** `ggplot2`, `patchwork`, `ggrepel`, `viridis`
- **Plot types:** facets, multi-panel, annotated scatter, colour-blind-safe palettes

### 8. explore-clinical-data.qmd (`#sec-explore-clinical`)
- **Datasets:** `survival::pbc` (primary), `lme4::sleepstudy` (longitudinal demo)
- **Packages:** `tidyverse`, `gtsummary`, `naniar`, `survival`
- **Key outputs:** missingness heatmap, Table 1, stratified summaries

---

## Part 3: Inference — Testing and Estimation

### 9. sampling-and-estimation.qmd (`#sec-sampling`)
- **Datasets:** `survival::pbc`, simulated sampling (inline)
- **Packages:** `tidyverse`, `broom`
- **Key concepts:** confidence intervals, CLT simulation, bootstrap

### 10. hypothesis-testing.qmd (`#sec-hypothesis`)
- **Datasets:** `survival::pbc`, simulated two-group data
- **Packages:** `tidyverse`, `broom`
- **Key concepts:** p-value, type I/II error, one- vs two-sided tests

### 11. 04-t-tests.qmd (`#sec-ttests`)
- **Datasets:** `survival::pbc` (bilirubin by sex), simulated mouse glucose
- **Packages:** `tidyverse`, `broom`, `rstatix`
- **Tests:** one-sample, two-sample (Welch), paired t-test

### 12. nonparametric-tests.qmd (`#sec-nonparametric`)
- **Datasets:** `survival::pbc` (bilirubin; right-skewed), `boot::melanoma`
- **Packages:** `tidyverse`, `broom`, `rstatix`
- **Tests:** Mann-Whitney U, Wilcoxon signed-rank, Kruskal-Wallis, Spearman correlation

### 13. 05-anova.qmd (`#sec-anova`)
- **Datasets:** simulated mouse body-weight × diet × sex, `survival::pbc` (stage groups)
- **Packages:** `tidyverse`, `broom`, `emmeans`, `multcomp`
- **Tests:** one-way ANOVA, two-way ANOVA with interaction, Tukey post-hoc

### 14. categorical-data-and-chi-square.qmd (`#sec-chisquare`)
- **Datasets:** `survival::pbc` (treatment × stage), simulated clinical 2×2 tables
- **Packages:** `tidyverse`, `broom`, `vcd`
- **Tests:** chi-square, Fisher's exact, McNemar, relative risk, odds ratio

### 15. power-and-sample-size.qmd (`#sec-power`)
- **Datasets:** none (simulation and formula-based)
- **Packages:** `pwr`, `tidyverse`
- **Coverage:** t-test, ANOVA, logistic regression, survival; power curves

---

## Part 4: Regression and Modeling

### 16. correlation-and-association.qmd (`#sec-correlation`)
- **Datasets:** `survival::pbc`, `palmerpenguins::penguins`
- **Packages:** `tidyverse`, `broom`, `corrplot`, `GGally`
- **Methods:** Pearson r, Spearman ρ, correlation matrix, scatter matrix

### 17. 02-linear-regression.qmd (`#sec-linear-regression`)
- **Datasets:** `survival::pbc` (bilirubin → albumin), simulated mouse insulin
- **Packages:** `tidyverse`, `broom`, `ggplot2`
- **Coverage:** SLR, OLS, diagnostics, confidence bands

### 18. 06-multiple-regression.qmd (`#sec-multiple-regression`)
- **Datasets:** `survival::pbc`, simulated energy expenditure data
- **Packages:** `tidyverse`, `broom`, `car`
- **Coverage:** MLR, multicollinearity, VIF, interaction terms, model comparison

### 19. 03-logistic-regression.qmd (`#sec-logistic-regression`)
- **Datasets:** `survival::pbc` (death as binary outcome), `MASS::birthwt`
- **Packages:** `tidyverse`, `broom`, `pROC`
- **Coverage:** log-odds, OR, ROC/AUC, Hosmer-Lemeshow, calibration

### 20. model-building-and-diagnostics.qmd (`#sec-model-diagnostics`)
- **Datasets:** `survival::pbc`, simulated lipid data
- **Packages:** `tidyverse`, `broom`, `car`, `performance`
- **Coverage:** stepwise, AIC/BIC, residual plots, Cook's distance, cross-validation

### 21. data-imputation.qmd (`#sec-imputation`)
- **Datasets:** `survival::pbc` (has missingness), simulated MAR data
- **Packages:** `mice`, `naniar`, `tidyverse`
- **Coverage:** MCAR/MAR/MNAR taxonomy, multiple imputation, complete-case comparison

### 22. mixed-models.qmd (`#sec-mixed-models`)
- **Datasets:** `lme4::sleepstudy`, simulated longitudinal mouse data
- **Packages:** `lme4`, `lmerTest`, `broom.mixed`, `tidyverse`
- **Coverage:** random intercept, random slope, GLMM for binary outcomes

---

## Part 5: Advanced Methods

### 23. survival-and-time-to-event.qmd (`#sec-survival`)
- **Datasets:** `survival::pbc` (primary), `boot::melanoma` (secondary)
- **Packages:** `survival`, `ggsurvfit`, `broom`, `tidyverse`
- **Coverage:** Kaplan-Meier, log-rank test, Cox PH, `cox.zph()`, Schoenfeld residuals

### 24. causal-inference.qmd (`#sec-causal`)
- **Datasets:** `survival::pbc` (DAG and IPTW), simulated collider bias
- **Packages:** `dagitty`, `ggdag`, `tidyverse`, `broom`
- **Coverage:** DAGs, confounders/mediators/colliders, propensity scores, IPTW

### 25. mendelian-randomization.qmd (`#sec-mr`)
- **Datasets:** simulated one-sample MR (LDL → ALT), `TwoSampleMR` (eval: false)
- **Packages:** `tidyverse`, `broom`, `AER`, `TwoSampleMR` (eval: false)
- **Coverage:** IV assumptions, Wald ratio, 2SLS, two-sample MR, MR-Egger, pleiotropy

### 26. omics-statistics.qmd (`#sec-omics`)
- **Datasets:** simulated gene expression matrix (5,000 genes × 20 samples)
- **Packages:** `tidyverse`, `limma`, `clusterProfiler` (eval: false)
- **Coverage:** multiple testing (FDR/BH), limma eBayes, volcano plots, pathway enrichment

---

## Part 6: Reference and Resources

### 27. statistical-decision-guide.qmd (`#sec-statistical-decision-guide`)
- **Datasets:** small simulated examples (paired BP, NAFLD cohort)
- **Packages:** `tidyverse`, `broom`, `knitr`
- **Coverage:** decision tables (outcome type × comparison type), assumption check reference

### 28. clinical-research-methods.qmd (`#sec-clinical-methods`)
- **Datasets:** `survival::pbc` (Table 1 + adjusted logistic), `MASS::birthwt`, simulated confounding
- **Packages:** `tidyverse`, `survival`, `broom`, `gtsummary`, `MASS`
- **Coverage:** PICO, study design hierarchy, three biases, Bradford Hill criteria

### 29. help-docs.qmd (`#sec-help-docs`)
- **Datasets:** none
- **Packages:** base R only
- **Coverage:** R help system, common errors, debugging functions, online resources, course method map

---

## Package Installation Summary

```r
# Core tidyverse
install.packages(c("tidyverse", "here", "renv"))

# Visualisation
install.packages(c("patchwork", "ggrepel", "viridis", "corrplot", "GGally", "ggsurvfit"))

# Statistics and modelling
install.packages(c("broom", "broom.mixed", "rstatix", "emmeans", "multcomp",
                   "car", "performance", "pROC", "pwr", "vcd"))

# Survival and clinical
install.packages(c("survival", "gtsummary", "MASS"))

# Regression and mixed models
install.packages(c("lme4", "lmerTest", "AER"))

# Missing data
install.packages(c("mice", "naniar"))

# Omics
install.packages(c("palmerpenguins", "boot"))
if (!requireNamespace("BiocManager")) install.packages("BiocManager")
BiocManager::install(c("limma", "clusterProfiler", "org.Mm.eg.db"))

# Causal / MR (optional — requires API for TwoSampleMR)
install.packages(c("dagitty", "ggdag"))
# TwoSampleMR from GitHub (optional):
# remotes::install_github("MRCIEU/TwoSampleMR")
```
