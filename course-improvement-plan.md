# Course Design Plan: Basic Statistics for PhD Students

> **Prepared:** May 2, 2026  
> **Audience:** PhD students in biomedical and clinical/epidemiology labs — human/clinical data, mouse and animal experiments, genomics (statistical concepts only), survey data, and longitudinal studies  
> **Software:** R only  
> **Tone:** Friendly and approachable, like a mentor — with practical R code and real output as the main vehicle  
> **Depth:** Conceptual + practical — explain *why* it works, then show *how* to run it  
> **Format:** Primarily self-paced; sessions also work for live workshops  
> **Pace:** ~1–2 hours per week over several weeks; students can go faster or slower  

---

## 1. Design Principles

These principles govern every session. When building or revising any session, every decision is checked against this list.

### 1.1 Always Answer "When Do I Use This?"
Every session must open with a concrete scenario from the student's world. Not "this session covers t-tests" — but "you measured body weight in two groups of mice on different diets and want to know if the difference is real. That is when you use a t-test." This applies to every method, including advanced ones. Before any R code appears, the student understands what problem this method solves.

### 1.2 Two Data Contexts per Method
Every session demonstrates the method on at least two datasets from different research contexts. A student doing a mouse feeding experiment should not have to mentally translate a human clinical example. The primary contexts are:
- Human/clinical data (`survival::pbc`, NHANES, `MASS::birthwt`)
- Mouse or animal experimental data (simulated inline or from the Mouse Phenome Database)
- Genomics/omics (statistical framing only — no bioinformatics pipelines)
- Agricultural/plant data when relevant (`agridat`, `PlantGrowth`)
- Survey/questionnaire data when relevant

### 1.3 Public Data Embedded, Not Isolated
Each session that introduces a new type of analysis includes a **"Where to Find Data Like This"** callout box with a public dataset recommendation and a working R snippet to load it. No separate dedicated session for data sources — it is built into each topic.

### 1.4 Plain English First, Technical Second
Target writing level: a smart first-year PhD student who is a non-native English speaker. Short sentences. Active voice. Jargon is explained the first time it appears. Equations are used only when they genuinely help, always accompanied by a plain-language translation.

### 1.5 Guided Early, Open Later
Sessions in Parts 1–2 are fully guided — every step shown and explained. Parts 3–6 progressively reduce scaffolding. By the final sessions, students receive a dataset and a research question and must build the analysis themselves. This mirrors real research.

### 1.6 End-of-Session Comprehension Check
Every session ends with 3–5 short quiz questions. Not trick questions — they test whether the student understood when to use the method, how to read the output, and what could go wrong. Answers are in a collapsed callout for self-checking.

### 1.7 "What Could Go Wrong" Section
Every method session includes a short section on common mistakes and assumption violations — practical, not theoretical. "If your residuals look like this, your model is probably wrong. Here is what to do instead."

### 1.8 Every Session Must Render
Non-negotiable. Every session renders completely without errors in a clean R environment. If a dataset requires authentication or a large download, a simulated fallback is provided inline using `set.seed()`.

---

## 2. Current State: What Exists and What Is Broken

### 2.1 Sessions in Good Shape (minor fixes only)

| Session File | Quality | What Needs Fixing |
|---|---|---|
| `01-descriptive-statistics.qmd` | Comprehensive | Remove `dev_code_data` refs; add "where to find data" box |
| `advanced-visualization.qmd` | Excellent | Remove `dev_code_data` refs only |
| `survival-and-time-to-event.qmd` | Excellent | Remove `dev_code_data` refs only |
| `basic-visualization.qmd` | Comprehensive | Remove refs; add colorblind palettes |
| `explore-clinical-data.qmd` | Comprehensive | Remove refs; add a mouse data example |
| `packages-libraries.qmd` | Comprehensive | Add MR and mixed model packages |
| `sampling-and-estimation.qmd` | Strong | Remove refs; add bootstrap visualization |
| `clinical-research-methods.qmd` | Moderate-Good | Remove refs; restructure around study design types |
| `vectors.qmd` | Comprehensive (orphaned) | Add to `_quarto.yml`; add data frame/tibble section |

### 2.2 Stub Sessions — No Working R Code (must be fully implemented)

| Session File | Problem |
|---|---|
| `hypothesis-testing.qmd` | Conceptual outline only; no runnable R code at all |
| `categorical-data-and-chi-square.qmd` | No R code whatsoever |
| `model-building-and-diagnostics.qmd` | Sparse outline; no diagnostic implementations |
| `correlation-and-association.qmd` | No R code; not even in `_quarto.yml` |

### 2.3 Thin Sessions (exist but need significant expansion)

| Session File | Core Gap |
|---|---|
| `02-linear-regression.qmd` | Missing: full residual diagnostics, CIs, prediction |
| `03-logistic-regression.qmd` | Missing: ROC/AUC, calibration, probability plots |
| `04-t-tests.qmd` | Missing: normality checks, non-parametric alternative, effect size |
| `05-anova.qmd` | Missing: two-way ANOVA, interaction plots, assumption checks |
| `06-multiple-regression.qmd` | Missing: VIF collinearity check, full AIC/BIC model selection |
| `power-and-sample-size.qmd` | Missing: `pwr` package, animal study sizing, power curves |
| `reproducible-research.qmd` | Missing: `renv`, `here::here()`, full project template |

### 2.4 Critical Structural Problems

| Problem | Impact |
|---|---|
| `tidy-data-wrangling.qmd` listed in `_quarto.yml` but file does not exist on disk | Broken link in published site right now |
| `_quarto.yml` has no part/section organization | One long flat list of 20 sessions — no navigation structure for students |
| 19+ files reference `dev_code_data` (a path that no longer exists) | Students following the code get errors |
| `correlation-and-association.qmd` and `vectors.qmd` not in `_quarto.yml` | Invisible to students |
| `basic-statistics.qmd` and `explore-dairy-data.qmd` are orphaned | Repository ambiguity |

### 2.5 Topics Completely Missing

| Topic | Why It Is Needed |
|---|---|
| Non-parametric tests (unified session) | Students don't know when ANOVA/t-test assumptions fail or what to do |
| Data imputation | Missing data is universal; dropping rows is usually wrong |
| Mixed models / repeated measures | Standard in animal experiments (same mouse over time), clinical trials (repeated visits) |
| Causal inference and DAGs | Half of students do observational studies; knowing what to adjust for is critical |
| Mendelian randomization | Relevant to clinical/genetics labs; natural extension of causal inference |
| Omics-specific statistics (conceptual) | Multiple testing at scale, FDR, power — common issues in genomics PhD projects |
| Statistical decision guide | Students need a "which test when" reference they can return to repeatedly |

---

## 3. Redesigned Course Structure

The course is organized into **six parts**. The progression moves from R foundations to advanced causal and omics methods.

```
Part 1: Getting Started in R
Part 2: Describing and Visualizing Data
Part 3: Inference — Testing and Estimation
Part 4: Regression and Modeling
Part 5: Advanced Methods
Part 6: Statistical Reasoning and Reference
```

Total sessions: 29 (up from 20). Every addition fills a confirmed gap — no padding.

---

### Part 1: Getting Started in R (4 sessions)

A student who cannot reliably import and reshape their data cannot analyze it. These sessions are fully guided. No statistics yet — only the R skills needed to do statistics.

| # | File | Status | Action |
|---|---|---|---|
| 1 | `sessions/packages-libraries.qmd` | Good | Add MR and mixed model packages; add Bioconductor section |
| 2 | `sessions/vectors.qmd` | Good, orphaned | Add to `_quarto.yml`; add data frame and tibble section |
| 3 | `sessions/tidy-data-wrangling.qmd` | **MISSING — create** | Full spec in §4.1 |
| 4 | `sessions/reproducible-research.qmd` | Thin | Expand: `renv`, `here::here()`, Quarto template, Git basics |

---

### Part 2: Describing and Visualizing Data (4 sessions)

Before any test, students must look at their data and describe it. These sessions are still guided. The emphasis is EDA first — model later.

| # | File | Status | Action |
|---|---|---|---|
| 5 | `sessions/01-descriptive-statistics.qmd` | Good | Fix refs; add `gtsummary` table; add "where to find data" box |
| 6 | `sessions/basic-visualization.qmd` | Good | Fix refs; add colorblind palettes; add publication-ready theme |
| 7 | `sessions/advanced-visualization.qmd` | Excellent | Fix refs only |
| 8 | `sessions/explore-clinical-data.qmd` | Good | Fix refs; add mouse data example |

---

### Part 3: Inference — Testing and Estimation (7 sessions)

The conceptual heart of the course. Students learn not just how to run a test but what a p-value means, when a test is valid, what effect size is, and how to handle multiple comparisons.

| # | File | Status | Action |
|---|---|---|---|
| 9 | `sessions/sampling-and-estimation.qmd` | Good | Fix refs |
| 10 | `sessions/hypothesis-testing.qmd` | **Stub — implement** | Full implementation; spec in §4.2 |
| 11 | `sessions/04-t-tests.qmd` | Thin | Expand: normality checks, Wilcoxon, Cohen's d; spec in §5.1 |
| 12 | `sessions/nonparametric-tests.qmd` | **MISSING — create** | New session; spec in §4.3 |
| 13 | `sessions/05-anova.qmd` | Thin | Expand: two-way ANOVA, interaction, assumption checks; spec in §5.2 |
| 14 | `sessions/categorical-data-and-chi-square.qmd` | **Stub — implement** | Full implementation; spec in §4.4 |
| 15 | `sessions/power-and-sample-size.qmd` | Thin | Full `pwr` package + power curves + animal sizing; spec in §5.3 |

---

### Part 4: Regression and Modeling (7 sessions)

Students learn to build models, not just run them. Every regression session covers the full cycle: fit → diagnose → interpret → communicate.

| # | File | Status | Action |
|---|---|---|---|
| 16 | `sessions/correlation-and-association.qmd` | **Stub — implement, add to `_quarto.yml`** | Full implementation; spec in §4.5 |
| 17 | `sessions/02-linear-regression.qmd` | Thin | Expand: full diagnostics, CIs, prediction; spec in §5.4 |
| 18 | `sessions/06-multiple-regression.qmd` | Moderate | Add VIF, AIC/BIC, stepwise caution; spec in §5.5 |
| 19 | `sessions/03-logistic-regression.qmd` | Thin | Add ROC/AUC, calibration, probability plots; spec in §5.6 |
| 20 | `sessions/model-building-and-diagnostics.qmd` | **Stub — implement** | Full diagnostic workflow; spec in §4.6 |
| 21 | `sessions/data-imputation.qmd` | **MISSING — create** | `mice`, MCAR/MAR/MNAR, pooled results; spec in §4.7 |
| 22 | `sessions/mixed-models.qmd` | **MISSING — create** | `lme4`, random intercepts/slopes, repeated measures; spec in §4.8 |

---

### Part 5: Advanced Methods (4 sessions)

Require completion of Parts 1–4. Methods that are increasingly important in PhD-level research but rarely taught in basic statistics courses. Sessions are longer and less guided.

| # | File | Status | Action |
|---|---|---|---|
| 23 | `sessions/survival-and-time-to-event.qmd` | Excellent | Fix refs only |
| 24 | `sessions/causal-inference.qmd` | **MISSING — create** | DAGs, confounders, colliders, propensity scores; spec in §4.9 |
| 25 | `sessions/mendelian-randomization.qmd` | **MISSING — create** | MR concepts, `TwoSampleMR` walkthrough; spec in §4.10 |
| 26 | `sessions/omics-statistics.qmd` | **MISSING — create** | FDR, p.adjust, volcano plot, power at scale; spec in §4.11 |

---

### Part 6: Statistical Reasoning and Reference (3 sessions)

Not new methods — tools for thinking. The decision guide is a reference card students return to for years.

| # | File | Status | Action |
|---|---|---|---|
| 27 | `sessions/statistical-decision-guide.qmd` | **MISSING — create** | Decision tables, flowchart, common mistakes; spec in §4.12 |
| 28 | `sessions/clinical-research-methods.qmd` | Moderate-Good | Fix refs; restructure around study design types |
| 29 | `sessions/help-docs.qmd` | Good | Update methods table to include all new sessions |

---

## 4. New Sessions — Full Specifications

### 4.1 `sessions/tidy-data-wrangling.qmd`

**Title:** Importing, Cleaning, and Reshaping Data  
**Part:** Part 1  

**Opening scenario:** "You received a spreadsheet of mouse body weights measured every week for 12 weeks. Column names are `Week1`, `Week2`, ..., `Week12`. Before you can run any analysis, you need to reshape this into a format R can work with — one row per measurement, not one row per mouse."

**Learning objectives:**
- Import CSV and Excel files into R
- Recognize tidy data and reshape wide data to long format
- Clean common data problems: missing values, wrong column types, inconsistent labels
- Join two datasets by a shared ID column
- Use `dplyr` verbs fluently for filtering, grouping, and summarizing

**Content outline:**
1. Tidy data principles — one row per observation, one column per variable; why this matters for ggplot2 and every statistical test
2. Importing: `read_csv()`, `read_excel()`, `read_delim()` — column types, skip rows, NA strings
3. `dplyr` core verbs: `filter()`, `select()`, `mutate()`, `rename()`, `group_by()` + `summarise()`, `arrange()`
4. Reshaping: `pivot_longer()` to go from wide (one column per week) to long (one row per week per mouse) — required for mixed models and repeated measures ANOVA
5. Handling missing values: `is.na()`, `complete.cases()`, `drop_na()`, counting NAs, `naniar::vis_miss()`
6. Joining: `left_join()`, `inner_join()` — matching patient IDs or mouse IDs across files
7. Factors: `factor()`, `fct_relevel()`, `fct_recode()` — controlling reference groups in regression

**Datasets:** Simulated mouse weight data (wide → long); `palmerpenguins::penguins` (real NA values, categorical variables)  
**Where to find data box:** "Your own lab Excel file. For public examples: the `palmerpenguins` package. The Mouse Phenome Database at phenome.jax.org has downloadable CSV files for hundreds of mouse studies."  
**Exercise style:** Fully guided  
**Quiz (3 questions):** "What is wrong with this wide data frame?" / "Which function reshapes wide to long?" / "What does `group_by() |> summarise()` return?"

---

### 4.2 `sessions/hypothesis-testing.qmd` — Full Rewrite

**Title:** Hypothesis Testing: Framework, p-values, and Effect Sizes  
**Part:** Part 3  

**Opening scenario:** "You ran an experiment. You got a result. Is the result real, or could it have happened by chance? Hypothesis testing is how scientists answer that question — but there are many ways to misunderstand what a p-value means, and those misunderstandings lead to wrong conclusions."

**Content outline:**
1. The framework: null hypothesis, alternative hypothesis, test statistic — explained via a coin flip simulation before any formula
2. P-value: a simulation to show what p=0.04 actually means — run 10,000 experiments under the null and show where the observed result falls in that distribution
3. What a p-value is NOT — "not the probability the null is true"; worked debunking of the three most common misinterpretations
4. Effect size: Cohen's d for two groups, correlation r for associations — "statistical significance vs. practical importance" with clinical examples
5. Confidence intervals as a better communication tool than p-values alone
6. Type I (false positive) and Type II (false negative) errors — consequences in research
7. Multiple testing: testing 20 genes with p<0.05 gives ~1 false positive on average; `p.adjust()` with Bonferroni, Holm, Benjamini-Hochberg

**R code sections:**
- Simulation of p-value distribution under the null with `replicate()`
- `t.test()` output with line-by-line interpretation
- `effsize::cohen.d()` for effect sizes
- `p.adjust()` with a 100-gene genomics-style example

**Quiz (3 questions):** "A p-value of 0.03 means [multiple choice]" / "You test 50 proteins at α=0.05. How many false positives do you expect?" / "Which correction controls the false discovery rate?"

---

### 4.3 `sessions/nonparametric-tests.qmd` — New Session

**Title:** Non-Parametric Tests: When Your Data Violates Assumptions  
**Part:** Part 3  

**Opening scenario:** "You measured tumor volume in mice, but a few tumors are very large and most are small — a strongly skewed distribution. A t-test assumes approximately normal data. What do you do?"

**Content outline:**
1. What assumptions do t-tests and ANOVA make? — visual examples of violated assumptions
2. How to check: Shapiro-Wilk, QQ-plot, histogram — practical guidance on which to trust
3. The non-parametric family:
   - Wilcoxon rank-sum (Mann-Whitney): `wilcox.test()` — alternative to two-sample t-test
   - Wilcoxon signed-rank: `wilcox.test(paired=TRUE)` — alternative to paired t-test
   - Kruskal-Wallis: `kruskal.test()` — alternative to one-way ANOVA
   - Dunn test for post-hoc: `dunn.test::dunn.test()`
   - Spearman correlation: `cor.test(method="spearman")`
4. Log transformation as an alternative to non-parametric tests — when each approach is better
5. Tradeoffs: non-parametric tests are safer but slightly less powerful when data actually is normal

**Datasets:** Simulated skewed mouse tumor volume data; `survival::pbc` bilirubin values (right-skewed by nature)  
**Where to find data box:** "Mouse Phenome Database (phenome.jax.org) — many phenotype measures (plasma lipids, body fat) are non-normally distributed and available as public CSV downloads."  
**Quiz (3 questions):** "Your histogram shows this shape [right-skewed]. Which test do you use?" / "What does the Kruskal-Wallis test compare — means or ranks?" / "When is log transformation preferable to a non-parametric test?"

---

### 4.4 `sessions/categorical-data-and-chi-square.qmd` — Full Implementation

**Title:** Categorical Data: Proportions, Contingency Tables, and Chi-square Tests  
**Part:** Part 3  

**Opening scenario:** "You ran a mouse experiment where each mouse either developed obesity (yes/no) on one of three diets. Your outcome is not a number — it is a category. Chi-square tests are designed exactly for this."

**R code sections to add:**
1. `table()`, `xtabs()`, `addmargins()` — building contingency tables
2. `chisq.test()` — output interpretation, expected counts, warnings for small cell sizes
3. `fisher.test()` — when to use (any expected cell count < 5); exact p-value
4. Risk measures: risk difference, risk ratio, odds ratio — manual calculation and `epitools::riskratio()`, `epitools::oddsratio()`
5. `vcd::mosaic()` — mosaic plot; proportional bar chart with ggplot2
6. Simpson's paradox: a stratified analysis example showing why marginal tables can mislead

**Datasets:** `datasets::Titanic` (built-in, classic 2×2); simulated mouse diet × obesity data  
**Where to find data box:** "The UCI Machine Learning Repository (archive.ics.uci.edu) and Kaggle have many clinical and biological datasets with categorical outcomes. For animal studies, the IMPC (mousephenotype.org) reports binary phenotype outcomes."  
**Quiz (3 questions):** "Your 2×2 table has an expected count of 2. Chi-square or Fisher?" / "An odds ratio of 3.5 means..." / "What does Simpson's paradox demonstrate?"

---

### 4.5 `sessions/correlation-and-association.qmd` — Full Implementation

**Title:** Correlation and Association  
**Part:** Part 4  

**Opening scenario:** "You measured both BMI and fasting glucose in 200 patients. Are these two variables related? As BMI goes up, does glucose go up too? Correlation answers that question — but it cannot tell you which direction the causality runs, or whether there is any causality at all."

**R code sections to add:**
1. Pearson correlation: assumptions, `cor.test(method="pearson")`, output interpretation
2. Spearman rank correlation: when to use, `cor.test(method="spearman")`
3. Correlation matrix: `cor()` visualized with `corrplot::corrplot()`
4. `GGally::ggpairs()` for exploratory multi-variable association plots
5. Interpreting r: small (0.1–0.3), medium (0.3–0.5), large (>0.5) — and why a large r can still be practically meaningless
6. Correlation ≠ causation: explicit section with classical examples; preview of causal inference session

**Datasets:** `survival::pbc` (bilirubin vs. albumin); `MASS::birthwt` (birthweight and maternal factors)  
**Where to find data box:** NHANES via `nhanesA` package — continuous measurements with known associations  
**Quiz (3 questions):** "Pearson r = −0.7. What does this mean?" / "Your data is right-skewed. Which method?" / "r = 0.95. Does that mean one variable causes the other?"

---

### 4.6 `sessions/model-building-and-diagnostics.qmd` — Full Implementation

**Title:** Model Building and Diagnostics  
**Part:** Part 4  

**Opening scenario:** "You built a regression model. But how do you know it is any good? Model diagnostics is how you check your work before reporting results."

**R code sections to add:**
1. The model building cycle: explore → fit → diagnose → refine → report
2. Residuals: what they are, what they should look like
3. `plot(model)` — all four panels with annotated interpretation:
   - Residuals vs. Fitted: linearity and homoscedasticity
   - Normal Q-Q: normality of residuals
   - Scale-Location: homoscedasticity
   - Residuals vs. Leverage: influential observations
4. Cook's distance: `cooks.distance(model)`, threshold interpretation
5. Collinearity: `car::vif()` — when VIF > 5, what to do
6. Model comparison: `AIC()`, `BIC()`, likelihood ratio test with `lmtest::lrtest()`
7. Clean output: `broom::tidy()` and `broom::glance()`
8. Variable selection strategy: why stepwise selection is dangerous; theory-driven approach

**Datasets:** `MASS::birthwt`; simulated mouse growth data with a known outlier  
**Quiz (3 questions):** "Your residuals vs. fitted plot shows a fan shape. What does this mean?" / "Cook's distance for one observation is 0.8. What do you do?" / "AIC for model A is 342, model B is 336. Which is better?"

---

### 4.7 `sessions/data-imputation.qmd` — New Session

**Title:** Handling Missing Data: Imputation with `mice`  
**Part:** Part 4  

**Opening scenario:** "Your clinical dataset has 200 patients, but 40 are missing BMI measurements. If you delete those rows, you lose 20% of your data — and if sicker patients are more likely to have missing values, your results will be biased. Multiple imputation is the correct solution."

**Content outline:**
1. Types of missingness (visual explanations, not jargon first):
   - MCAR: missing completely at random — random technical failures
   - MAR: older patients more likely to have missing lab values — missingness related to observed data
   - MNAR: sicker patients don't come for follow-up — missingness related to the missing value itself
2. Why complete-case analysis is often biased; why mean imputation underestimates variance
3. Multiple imputation with `mice`:
   - `mice(data, m=5, method="pmm")` — predictive mean matching
   - Inspecting imputed values with `stripplot()`
   - Running models: `with(imp, lm(...))`
   - Pooling: `pool()`, interpreting `summary(pool(...))`
4. Visualizing missingness: `naniar::gg_miss_var()`, `naniar::vis_miss()`
5. When NOT to impute: MNAR without sensitivity analysis; outcomes missing (not just predictors)
6. How to describe imputation in a methods section (for writing)

**Datasets:** `survival::pbc` (known NAs); simulated mouse data with induced missingness  
**Where to find data box:** "NHANES via `nhanesA` is a large US health survey with realistic real-world missingness patterns — ideal for practicing imputation."  
**Packages:** `mice`, `naniar`  
**Quiz (3 questions):** "Missing BMI is more common in older patients. What type of missingness is this?" / "You run `mice(m=5)`. How many imputed datasets do you get?" / "After pooling, coefficient = 1.3 (95% CI: 0.8, 1.8). Is this significant?"

---

### 4.8 `sessions/mixed-models.qmd` — New Session

**Title:** Mixed Models for Repeated Measures and Clustered Data  
**Part:** Part 4  

**Opening scenario:** "You measured body weight in 20 mice every week for 8 weeks across two treatment groups. You cannot use a standard ANOVA — the measurements from the same mouse are not independent. Mixed models are designed for exactly this situation."

**Content outline:**
1. Why the independence assumption fails for repeated measurements — illustrated with mouse weight data
2. Fixed effects vs. random effects in plain language:
   - Fixed: treatment group, time, sex — effects you want to estimate and report
   - Random: individual mouse, litter, cage — effects you want to account for but not report
   - Analogy: students within classrooms; mice within cages
3. Random intercept model: `lmer(weight ~ time * treatment + (1 | mouse_id), REML=TRUE)`
   - Each mouse has its own baseline; the treatment effect is shared
4. Random slope model: `lmer(weight ~ time * treatment + (1 + time | mouse_id))` — when the effect of time varies per individual
5. Getting p-values: `lmerTest` package; `anova()` for likelihood ratio tests
6. Model comparison: AIC between random intercept and random slope
7. Visualization: individual trajectories + group means with ggplot2
8. Brief: `glmer()` for binary outcomes in clustered data
9. Checking assumptions: residuals, random effects normality

**Datasets:** Simulated mouse longitudinal weight data (generated inline); `nlme::Orthodont` (clean repeated dental measurements)  
**Where to find data box:** "Mouse Phenome Database (phenome.jax.org) has many longitudinal phenotype studies with repeated measurements on individual mice."  
**Packages:** `lme4`, `lmerTest`, `broom.mixed`  
**Quiz (3 questions):** "You measure the same patient 5 times. What does the random intercept account for?" / "Mouse weight increases differently over time in each mouse. Do you need a random slope?" / "What does `(1 | subject_id)` mean in a model formula?"

---

### 4.9 `sessions/causal-inference.qmd` — New Session

**Title:** Causal Inference: DAGs, Confounding, and Observational Studies  
**Part:** Part 5  

**Opening scenario:** "You observe that people who exercise more have lower blood sugar. But they also eat healthier, are younger, and have less stress. Does exercise *cause* lower blood sugar — or are you just seeing a correlation driven by those differences? Causal inference is how you answer that question rigorously."

**Note on audience:** Taught to all students. Students running randomized experiments still need this — to understand why their results are easier to interpret causally, and to critically read observational papers.

**Content outline:**
1. Association vs. causation: three clear examples from clinical and animal research; why "controlling for everything" is not the right instinct
2. Directed Acyclic Graphs (DAGs): nodes, directed arrows; drawing in R with `dagitty` + `ggdag`
3. Three fundamental structures:
   - Chain (A → B → C): adjusting for B blocks the causal path — a common mistake (mediator)
   - Fork (A ← B → C): B is a confounder — you must adjust for it
   - Collider (A → B ← C): adjusting for B creates a spurious association — the counterintuitive case
4. The backdoor criterion: using `dagitty::adjustmentSets()` to identify which variables to adjust for
5. The "birth weight paradox" as the classic collider example
6. Propensity score matching: `MatchIt::matchit()` — when you cannot randomize
7. What DAGs cannot fix: unmeasured confounding, selection bias

**Datasets:** Simulated observational cohort data; adapted mouse experiment with observational structure  
**Packages:** `dagitty`, `ggdag`, `MatchIt`  
**Quiz (3 questions):** "Smoking → Cancer ← Age. You adjust for Age. What have you done?" / "BMI is a mediator between diet and diabetes. Should you include BMI in the regression?" / "What is a confounder?"

---

### 4.10 `sessions/mendelian-randomization.qmd` — New Session

**Title:** Mendelian Randomization: Using Genetics to Infer Causality  
**Part:** Part 5  
**Prerequisites:** Causal inference session (specifically: instrumental variables concept)

**Opening scenario:** "You want to know if high LDL cholesterol causes heart disease. An RCT would take 20 years. Mendelian randomization uses genetic variants that naturally raise or lower LDL — since people are randomly assigned their genes at conception, this gives you something close to a natural experiment."

**Content outline:**
1. The MR idea: genes as instruments; the genetic lottery; why this satisfies the three IV assumptions
2. The three assumptions plainly explained, with examples of violations (horizontal pleiotropy)
3. Two-sample MR: exposure and outcome GWAS from different studies — the most common approach
4. Accessing MR-Base via `TwoSampleMR`:
   - `available_outcomes()` — browse traits
   - `extract_instruments("ieu-a-2")` — LDL SNPs
   - `extract_outcome_data()` — CAD association
   - `harmonise_data()` — align alleles
   - `mr()` — run IVW, Egger, weighted median
5. Reading output: causal estimate, confidence interval, method agreement
6. Sensitivity analyses: MR-Egger intercept test, funnel plot, leave-one-out
7. Limitations: population stratification, winner's curse, weak instruments

**Datasets:** LDL → coronary artery disease (public MR-Base); BMI → Type 2 diabetes  
**Where to find data box:** "MR-Base at mrbase.org — GWAS summary statistics for hundreds of exposures and outcomes. Browse with `TwoSampleMR::available_outcomes()`."  
**Packages:** `TwoSampleMR`  
**Quiz (3 questions):** "MR-Egger intercept test p=0.03. What does this suggest?" / "Your instrument explains 0.1% of exposure variance. What problem does this indicate?" / "Can MR estimate the effect of a non-heritable environmental exposure?"

---

### 4.11 `sessions/omics-statistics.qmd` — New Session

**Title:** Statistical Concepts in Omics and High-Dimensional Data  
**Part:** Part 5  

**Note:** This session covers statistical *concepts only* — not bioinformatics pipeline tools (DESeq2, limma, STAR, etc.). It explains what those tools are doing statistically.

**Opening scenario:** "You ran an RNA-seq experiment comparing treated vs. control mice. You have 20,000 genes. If you test each at p<0.05, you expect 1,000 false positives just by chance. Omics research requires different statistical thinking — the same tools you already know, applied at a very different scale."

**Content outline:**
1. Scale: from 10 tests to 20,000 — how the false positive rate explodes; calculation to make this visceral
2. FWER (family-wise error rate): Bonferroni — appropriate when each false positive is costly; very conservative
3. FDR (false discovery rate): Benjamini-Hochberg — standard in omics; controls expected proportion of false discoveries among rejections
4. Applying both: `p.adjust(p_values, method="bonferroni")`, `p.adjust(p_values, method="BH")`
5. Volcano plots: log2 fold change vs. -log10(p-value); built in ggplot2 with simulated data
6. Power in omics: why n=3 per group is often severely underpowered; relationship between n, effect size, and FDR
7. Independent filtering concept: removing low-expression genes before testing improves power
8. "This is the same `p.adjust()` you use for any multiple testing problem — not a bioinformatics-specific concept"

**Datasets:** Simulated RNA-seq-like count data with known differentially expressed genes (generated inline with `set.seed()`)  
**Quiz (3 questions):** "You test 10,000 genes at p<0.05 uncorrected. How many false positives do you expect?" / "FDR = 0.05 means..." / "Your volcano plot shows 500 genes with BH-adjusted p<0.05. What does this mean practically?"

---

### 4.12 `sessions/statistical-decision-guide.qmd` — New Session

**Title:** Statistical Decision Guide: Which Method to Use and When  
**Part:** Part 6  

This session is a reference document — not a tutorial. Students return to it throughout their PhD.

**Content:**

**1. Decision flowchart** (implemented as a visual in Quarto):

```
What type of outcome variable do you have?
│
├── Continuous
│   ├── How many groups/predictors?
│   │   ├── 1 group vs. known value → one-sample t-test
│   │   ├── 2 independent groups → Welch t-test (or Wilcoxon if non-normal)
│   │   ├── 2 paired groups → paired t-test (or Wilcoxon signed-rank)
│   │   └── 3+ groups → ANOVA (or Kruskal-Wallis if non-normal)
│   ├── Predicting from other variables?
│   │   ├── 1 predictor → simple linear regression
│   │   └── Multiple predictors → multiple regression
│   └── Same subject over time or clustered data? → mixed model
│
├── Binary (yes/no, success/failure)
│   ├── Association between two variables → chi-square / Fisher's exact
│   └── Predicting probability → logistic regression
│
└── Time until event occurs → survival analysis (Cox regression)

Additional:
├── Observational study with confounders → regression + DAG
├── Causal inference with genetic data → Mendelian randomization
├── Missing data present (>5%) → multiple imputation with mice
└── Testing 100+ hypotheses → FDR correction with p.adjust()
```

**2. Complete reference table:**

| Research Question | Outcome | Design | Method | R Function | Session |
|---|---|---|---|---|---|
| Is this mean different from a known value? | Continuous | 1 group | One-sample t-test | `t.test(mu=)` | 11 |
| Are 2 independent groups different? | Continuous, normal | 2 groups | Welch t-test | `t.test(var.equal=FALSE)` | 11 |
| Are 2 independent groups different? | Continuous, non-normal | 2 groups | Mann-Whitney | `wilcox.test()` | 12 |
| Are 2 paired measurements different? | Continuous | Paired | Paired t-test | `t.test(paired=TRUE)` | 11 |
| Are 3+ groups different? | Continuous | ≥3 independent | One-way ANOVA | `aov()` + `TukeyHSD()` | 13 |
| Do two factors interact? | Continuous | 2 factors | Two-way ANOVA | `aov(y ~ A * B)` | 13 |
| Same subject measured over time | Continuous | Repeated/longitudinal | Mixed model | `lmer()` | 22 |
| Are two continuous variables related? | Both continuous | Association | Pearson/Spearman | `cor.test()` | 16 |
| Predict continuous outcome (1 predictor) | Continuous | 1 predictor | Simple linear regression | `lm()` | 17 |
| Predict with multiple predictors | Continuous | Multiple predictors | Multiple regression | `lm()` | 18 |
| Predict a yes/no outcome | Binary | Any | Logistic regression | `glm(family=binomial)` | 19 |
| Are proportions different across groups? | Categorical | 2+ groups | Chi-square / Fisher | `chisq.test()` / `fisher.test()` | 14 |
| Time until event occurs | Survival time | Groups/covariates | Cox regression | `coxph()` | 23 |
| Does X cause Y? (observational study) | Any | Observational | Regression + DAG | `dagitty` + `lm/glm` | 24 |
| Does X cause Y? (genetic instrument) | Any | GWAS summary | Mendelian randomization | `TwoSampleMR` | 25 |
| Dataset has missing values | Any | Any | Multiple imputation | `mice()` | 21 |
| 3+ groups, non-normal | Continuous, non-normal | ≥3 groups | Kruskal-Wallis | `kruskal.test()` | 12 |
| Testing 1000+ hypotheses | Any | High-dimensional | FDR correction | `p.adjust(method="BH")` | 26 |

**3. Ten common mistakes — with a fix for each:**

1. Running a t-test without checking normality → check with QQ-plot; use Wilcoxon if violated
2. Adjusting for a mediator in a regression → draw a DAG first; mediators should not be in the model
3. Interpreting p>0.05 as "no effect" → it means "insufficient evidence"; report CI and effect size
4. Treating multiple testing as if each test is independent → use `p.adjust()` when running many tests
5. Dropping rows with missing data without checking why → use `naniar` to diagnose, `mice` to impute
6. Using repeated ANOVA on repeated measurements → use mixed models; standard ANOVA assumes independence
7. Reporting only p-values, not effect sizes → always report Cohen's d, OR, or HR alongside p
8. Using stepwise regression for variable selection → choose variables based on theory and DAG, not stepwise algorithms
9. Interpreting correlation as causation → correlation requires a causal explanation; draw a DAG
10. Using the same dataset to select a model and evaluate it → use AIC/BIC for selection; report fit metrics honestly

---

## 5. Sessions to Expand — Specifications

### 5.1 `sessions/04-t-tests.qmd`

Add before running any test:
- `shapiro.test()` output and interpretation; note its unreliability for n > 50
- `ggplot(aes(sample=x)) + stat_qq() + stat_qq_line()` — how to read a QQ-plot
- Histogram check as the most practical normality diagnostic for typical lab sample sizes

Add after the t-test section:
- `effsize::cohen.d()` — interpretation (small=0.2, medium=0.5, large=0.8)
- Wilcoxon/Mann-Whitney as non-parametric alternative: side-by-side comparison on same data showing when conclusions differ

Add second dataset example:
- Mouse body weight comparison between two diet groups (simulated inline with `set.seed()`)

---

### 5.2 `sessions/05-anova.qmd`

Add:
- `car::leveneTest()` for homogeneity of variance — what to do if violated
- Residual QQ-plot after fitting the model
- Two-way ANOVA: `aov(outcome ~ factor1 * factor2)` with a biological motivation (diet × sex interaction in mice)
- Interaction plot: `interaction.plot()` and ggplot2 version
- Post-hoc for two-way: `emmeans::emmeans()` and `pairs()`
- `agridat` example: two factors (treatment × field location) in a plant growth context

---

### 5.3 `sessions/power-and-sample-size.qmd`

Replace the thin outline with:
- Conceptual explanation: power, sample size, effect size, and α — how they are connected
- `pwr::pwr.t.test()` — two-group comparison at several effect sizes
- `pwr::pwr.anova.test()` — for ANOVA designs
- `pwr::pwr.chisq.test()` — for categorical outcomes
- Power curve visualization: ggplot2 plot of power vs. n (shows where you get diminishing returns)
- Animal study sizing example: "You expect a 20% difference in tumor size (SD=15%). How many mice per group?"
- Clinical trial sizing: minimum clinically meaningful difference as the anchor for effect size

---

### 5.4 `sessions/02-linear-regression.qmd`

Add:
- Full `plot(model)` walkthrough — all 4 panels with annotations
- `confint(model)` — confidence intervals on coefficients
- `predict(model, newdata=..., interval="prediction")` — point predictions with uncertainty
- Checking linearity before fitting: scatterplot + `geom_smooth(method="loess")`
- The meaning of R-squared — and why a high R-squared does not mean the model is good
- Mouse example: predicting body weight from caloric intake and cage activity (simulated)

---

### 5.5 `sessions/06-multiple-regression.qmd`

Add:
- `car::vif()` — collinearity check; what to do when VIF > 5 (combine, drop, or use ridge regression)
- AIC/BIC comparison across nested models with a worked example
- A clear caution against stepwise selection — explain why it overfits and is unreliable for inference
- `broom::tidy()` and `broom::glance()` for clean, publishable model output tables

---

### 5.6 `sessions/03-logistic-regression.qmd`

Add:
- Predicted probability visualization: `geom_smooth(method="glm", method.args=list(family=binomial))`
- `pROC::roc()`, `pROC::auc()`, `plot(roc_object)` — ROC curve construction and interpretation
- AUC interpretation scale: 0.5 = no better than chance; 0.7 = acceptable; 0.8+ = good; 0.9+ = excellent
- Hosmer-Lemeshow calibration concept — is the model predicting probabilities accurately?
- NHANES example: predicting diabetes from BMI, age, and glucose values

---

## 6. Session Template

Every session must follow this structure. Consistency means students always know where to find what they need.

```markdown
---
title: "Session Title"
---

## When Do You Use This? {.callout-tip}

> One concrete scenario. "Use [method] when you have [this kind of 
> data] and want to answer [this kind of question]. Example: ..."

## Learning Objectives

After completing this session you will be able to:

- Objective 1
- Objective 2
- Objective 3

## Background

[Plain-language explanation. Intuition first, formula second.
300–500 words. Short paragraphs. Define jargon on first use.]

## Worked Example 1: [Clinical / Human Data]

### The Data
[Load dataset. Show first rows. Explain each relevant column.]

### Exploratory Visualization
[Look before you test. Always.]

### The Analysis
[Step-by-step annotated R code with output.]

### Interpreting the Output
[Plain-language translation of each piece of the R output.]

## Worked Example 2: [Mouse / Animal / Plant Data]

[Same structure as Example 1.]

## Where to Find Data Like This {.callout-note}

> [2–4 sentences. Public dataset recommendation.
> Working R snippet to load it.]

## What Can Go Wrong {.callout-warning}

[3–5 concrete failure modes. What violated assumption looks like.
What to do instead.]

## Exercises

**Exercise 1 (Guided):** [Step-by-step walkthrough]

**Exercise 2 (Semi-guided):** [Setup given; analysis to complete]

**Exercise 3 (Open):** [Dataset + question; student builds analysis]
(Only in sessions from Part 3 onward)

::: {.callout-note collapse="true"}
### Exercise Solutions
[Solutions here]
:::

## Comprehension Check

1. [Question 1]
2. [Question 2]
3. [Question 3]
4. [Question 4]
5. [Question 5]

::: {.callout-note collapse="true"}
### Answers
1. [Answer]
...
:::

## Further Reading

- [Resource 1] — one sentence
- [Resource 2]
```

---

## 7. Structural Changes Required

### 7.1 `_quarto.yml` New Structure

```yaml
book:
  title: "Basic Statistics for Research"
  subtitle: "Foundations of statistical reasoning, data interpretation, and evidence-based decision making"
  chapters:
    - index.qmd
    - part: "Part 1: Getting Started in R"
      chapters:
        - sessions/packages-libraries.qmd
        - sessions/vectors.qmd
        - sessions/tidy-data-wrangling.qmd
        - sessions/reproducible-research.qmd
    - part: "Part 2: Describing and Visualizing Data"
      chapters:
        - sessions/01-descriptive-statistics.qmd
        - sessions/basic-visualization.qmd
        - sessions/advanced-visualization.qmd
        - sessions/explore-clinical-data.qmd
    - part: "Part 3: Inference — Testing and Estimation"
      chapters:
        - sessions/sampling-and-estimation.qmd
        - sessions/hypothesis-testing.qmd
        - sessions/04-t-tests.qmd
        - sessions/nonparametric-tests.qmd
        - sessions/05-anova.qmd
        - sessions/categorical-data-and-chi-square.qmd
        - sessions/power-and-sample-size.qmd
    - part: "Part 4: Regression and Modeling"
      chapters:
        - sessions/correlation-and-association.qmd
        - sessions/02-linear-regression.qmd
        - sessions/06-multiple-regression.qmd
        - sessions/03-logistic-regression.qmd
        - sessions/model-building-and-diagnostics.qmd
        - sessions/data-imputation.qmd
        - sessions/mixed-models.qmd
    - part: "Part 5: Advanced Methods"
      chapters:
        - sessions/survival-and-time-to-event.qmd
        - sessions/causal-inference.qmd
        - sessions/mendelian-randomization.qmd
        - sessions/omics-statistics.qmd
    - part: "Part 6: Reference and Resources"
      chapters:
        - sessions/statistical-decision-guide.qmd
        - sessions/clinical-research-methods.qmd
        - sessions/help-docs.qmd
```

### 7.2 Files to Archive

Move to `_archive/` folder (not deleted — may contain reusable code):

| File | Reason |
|---|---|
| `sessions/basic-statistics.qmd` | Fully duplicated by individual sessions in the new structure |
| `sessions/explore-dairy-data.qmd` | Not relevant to the target audience |

### 7.3 `dev_code_data` Sweep

All 19+ affected files: replace `dev_code_data` paths with direct `library()` calls, built-in dataset references, or public URL loading.

### 7.4 `index.qmd` Rewrite

The current index is a stub. Rewrite it as a proper course welcome that:
- Explains what this course is and who it is for (PhD students in biomedical and clinical labs)
- Shows the six-part course map with one-sentence description of each part
- States prerequisites clearly (R and RStudio installed; basic R familiarity from Part 1)
- Links to the Statistical Decision Guide as the course's central reference card

---

## 8. Package Reference — Complete List

| Part / Topic | Packages |
|---|---|
| All sessions | `tidyverse` (dplyr, ggplot2, tidyr, readr), `here` |
| Data import | `readxl`, `janitor` |
| EDA | `skimr`, `gtsummary`, `palmerpenguins` |
| Visualization | `ggthemes`, `patchwork`, `scales`, `ggpubr` |
| Missing data | `naniar`, `VIM` |
| Hypothesis testing | `effsize` |
| Non-parametric | `dunn.test` |
| ANOVA + contrasts | `car`, `emmeans`, `rstatix` |
| Categorical data | `epitools`, `vcd`, `epiR` |
| Correlation | `corrplot`, `GGally` |
| Regression diagnostics | `car`, `lmtest`, `broom` |
| Logistic regression | `pROC` |
| Multiple imputation | `mice` |
| Mixed models | `lme4`, `lmerTest`, `broom.mixed`, `nlme` |
| Power / sample size | `pwr`, `WebPower` |
| Survival analysis | `survival`, `survminer` |
| Causal inference | `dagitty`, `ggdag`, `MatchIt` |
| Mendelian randomization | `TwoSampleMR` |
| Agricultural data | `agridat` |
| Public health data | `nhanesA` |
| Genomics data access | `GEOquery` (Bioconductor) |
| Reproducible research | `renv`, `here` |

---

## 9. Complete Work Inventory

### Group A: Structural Fixes (unblock everything else)

| Item | Action |
|---|---|
| `tidy-data-wrangling.qmd` | Create from scratch — file is missing, site has broken link |
| `_quarto.yml` | Rewrite with 6-part structure |
| `index.qmd` | Rewrite as proper course welcome page |
| `dev_code_data` sweep | Fix all 19 affected files |
| Archive `basic-statistics.qmd` and `explore-dairy-data.qmd` | Move to `_archive/` |

### Group B: Stub Sessions → Full Implementation

| File | Key Content to Add |
|---|---|
| `hypothesis-testing.qmd` | p-value simulation, effect sizes, `p.adjust()` multiple correction |
| `categorical-data-and-chi-square.qmd` | Full R code: chi-square, Fisher, risk ratios, mosaic plots |
| `model-building-and-diagnostics.qmd` | `plot(model)` diagnostics, Cook's distance, VIF, AIC/BIC |
| `correlation-and-association.qmd` | Pearson, Spearman, `corrplot`, causation discussion |

### Group C: Thin Sessions → Substantial Expansion

| File | Key Additions |
|---|---|
| `04-t-tests.qmd` | Normality checks, Wilcoxon alternative, Cohen's d, mouse example |
| `05-anova.qmd` | Two-way ANOVA, interaction plot, Levene's test, `emmeans` |
| `02-linear-regression.qmd` | Full `plot(model)` diagnostics, CIs, prediction |
| `03-logistic-regression.qmd` | ROC/AUC, probability plots, calibration |
| `06-multiple-regression.qmd` | VIF, AIC/BIC, stepwise caution |
| `power-and-sample-size.qmd` | `pwr` package, power curve, animal sizing |
| `reproducible-research.qmd` | `renv`, `here::here()`, Quarto project template |

### Group D: New Sessions → Create from Scratch

| File | Core Content |
|---|---|
| `nonparametric-tests.qmd` | Wilcoxon, Kruskal-Wallis, Dunn post-hoc, when to use |
| `data-imputation.qmd` | `mice`, `naniar`, MCAR/MAR/MNAR, pooled results |
| `mixed-models.qmd` | `lme4`, random intercepts/slopes, `lmerTest`, trajectories |
| `causal-inference.qmd` | DAGs, `dagitty`/`ggdag`, confounders, colliders, `MatchIt` |
| `mendelian-randomization.qmd` | `TwoSampleMR`, MR-Base, sensitivity analyses |
| `omics-statistics.qmd` | FDR, `p.adjust()`, volcano plot, power at scale |
| `statistical-decision-guide.qmd` | Decision table, flowchart, 10 common mistakes |

### Group E: Minor Updates (remaining existing sessions)

| File | Action |
|---|---|
| `sampling-and-estimation.qmd` | Fix refs; add bootstrap CI visualization |
| `survival-and-time-to-event.qmd` | Fix `dev_code_data` refs only |
| `advanced-visualization.qmd` | Fix refs only |
| `basic-visualization.qmd` | Fix refs; add colorblind palettes |
| `explore-clinical-data.qmd` | Fix refs; add mouse data example |
| `packages-libraries.qmd` | Add MR and mixed model packages |
| `vectors.qmd` | Add data frame/tibble section |
| `clinical-research-methods.qmd` | Fix refs; restructure around study design types |
| `help-docs.qmd` | Update methods table for all new sessions |
