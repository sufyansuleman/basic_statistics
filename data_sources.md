# Public data sources for the course

This file lists curated, modern, publicly available datasets (clinical, animal, and other) that are suitable for teaching the course. Each entry includes a short description, why it's relevant to a session/concept, and a small R snippet showing how to load the data.

## How to use
- Prefer loading data from stable URLs or CRAN/Bioconductor packages.
- For private or simulated datasets, keep a small cleaned CSV under `data/` (versioned in the repo).
- Citations and data license notes should be added where needed.

## Packages and resource guidance
- Use package datasets when available to keep examples reproducible and dependency-driven. Example package datasets include `survival::pbc`, `nycflights13::flights`, `MASS::birthwt`, `ToothGrowth`, and `plantgrowth`.
- Install only CRAN packages needed for the lesson and document them clearly in session setup code.
- If a dataset comes from an external URL, note the source and cache a copy in `data/` where the course requires repeatable local access.
- For session resources, prefer these package categories:
  - data import and cleaning: `readr`, `janitor`, `tidyverse`
  - visualization: `ggplot2`, `gganimate`, `patchwork`
  - modeling: `survival`, `broom`, `modelr`, `tidymodels`, `lme4`, `pwr`
  - clinical/public-health: `NHANES`, `palmerpenguins`, `nycflights13`

---

## Clinical / public-health datasets (recommended)

1) Our World in Data — COVID-19 (global, time-series)
- URL: https://covid.ourworldindata.org/data/owid-covid-data.csv
- Description: Comprehensive, frequently-updated country-level time series (cases, deaths, tests, vaccinations, demographics). Great for time-series, rates, standardization, and policy-effect examples.
- Relevance: visualization, smoothing, per-capita rates, Poisson/negative-binomial regression, interrupted time-series.
- Load (R):
```r
covid <- readr::read_csv('https://covid.ourworldindata.org/data/owid-covid-data.csv')
```

2) The New York Times — US COVID-19 (county/state time series)
- URL: https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv
- Description: Daily county-level counts of cases and deaths in the US. Good for geographic aggregation and hierarchical models.
- Relevance: spatial aggregation, rate smoothing, hierarchical models, small-area estimation.
- Load (R):
```r
nytimes_counties <- readr::read_csv('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')
```

3) CDC NHANES (survey data)
- Package: `NHANES` (CRAN) or `nhanesA` (CRAN) to fetch specific tables
- Description: National Health and Nutrition Examination Survey — clinical measurements, labs, demographics, survey weights. Modern waves include laboratory biomarkers and questionnaires.
- Relevance: survey-weighted analysis, missingness, labs vs. demographics, regression and classification with clinical covariates.
- Load (R):
```r
install.packages('NHANES')
library(NHANES)
data(NHANES) # package contains a curated sample dataset
# or use nhanesA to pull specific tables directly from CDC
```

4) Pima Indians Diabetes (clinical classification)
- URL: https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.data.csv
- Description: Classic diabetes cohort from UCI; suitable for logistic regression, predictive modelling, ROC curves.
- Relevance: logistic regression, classification metrics, calibration, feature selection.
- Load (R):
```r
pima <- readr::read_csv(
  'https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.data.csv',
  col_names = c(
    'pregnant', 'glucose', 'pressure', 'triceps', 'insulin',
    'bmi', 'pedigree', 'age', 'diabetes'
  )
)
```

5) Survival datasets (built-in / small public samples)
- Examples: `survival::lung`, `survival::ovarian`, `survival::pbc`
- Description: Well-documented clinical survival datasets for time-to-event methods. `pbc` shows liver disease covariates and is built into the `survival` package; `lung` contains oncology patients.
- Relevance: Kaplan–Meier, log-rank test, Cox proportional hazards, model diagnostics.
- Load (R):
```r
library(survival)
data(lung)
# or
pbc <- survival::pbc
```
- Local fallback: if the course repository includes `data/scd_simulated_data.rda`, load it with:
```r
load(here::here("data","scd_simulated_data.rda"))
```

6) HHS / OWID / US aggregated public health data (hospitalizations, vaccinations)
- Example (OWID vaccinations): https://github.com/owid/covid-19-data
- Relevance: public-health policy, rates, multi-country comparisons.

7) PhysioNet small public datasets (selected examples)
- Website: https://physionet.org
- Description: Physiological and clinical datasets (ECG, ICU records). Many require an account for sensitive datasets; some smaller open datasets are available without credentialing.
- Relevance: time-series physiological data, signal processing, survival and clinical prediction.
- Note: check access rules and cite PhysioNet.

---

## Animal / ecological datasets (modern and well-maintained)

1) Palmer Penguins (ecology, animal morphology)
- URL: https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv
- Description: Measurements for penguin species; modern replacement for `iris` for teaching visualization and tidy data.
- Relevance: visualization, group comparisons, missingness handling, ANOVA-like examples.
- Load (R):
```r
penguins <- readr::read_csv('https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv')
```

2) Open data from Dryad / Zenodo (example repositories)
- Description: Many animal experiment datasets are archived on Dryad or Zenodo with stable DOIs; pick individual datasets relevant to the lesson (mouse phenotyping, behavioral assays, etc.).
- Relevance: depending on the dataset, use for t-tests, mixed models, time-series, or imaging examples.
- Note: include DOI citation and check license before redistribution.

---

## Other modern, interesting public datasets

1) Gapminder (socioeconomic / health indicators)
- URL: https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv
- Description: Country-level time-series for life expectancy, GDP, population. Useful for regression, data transformations, and visualization.
- Relevance: examples on sampling, confidence intervals, transformations, and regression with interactions.
- Load (R):
```r
gapminder <- readr::read_csv('https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv')
```

2) Our World in Data — health & development indicators
- Many CSVs at https://github.com/owid/owid-datasets and https://ourworldindata.org

3) NYT / Johns Hopkins COVID time series
- Useful for quick, modern, globally relevant examples.

---

## Session → dataset mapping (current 29-session course)

### Part 1: Getting Started in R
- `packages-libraries.qmd` — no dataset; conceptual
- `vectors.qmd` — `palmerpenguins::penguins` (introduced)
- `tidy-data-wrangling.qmd` — `palmerpenguins::penguins`, simulated mouse weight data
- `reproducible-research.qmd` — `palmerpenguins::penguins`

### Part 2: Describing and Visualizing Data
- `01-descriptive-statistics.qmd` — `survival::pbc`, `palmerpenguins::penguins`
- `basic-visualization.qmd` — `survival::pbc`, `palmerpenguins::penguins`
- `advanced-visualization.qmd` — `survival::pbc`, `palmerpenguins::penguins`
- `explore-clinical-data.qmd` — `survival::pbc`, `lme4::sleepstudy`

### Part 3: Inference — Testing and Estimation
- `sampling-and-estimation.qmd` — `survival::pbc`, simulated sampling
- `hypothesis-testing.qmd` — `survival::pbc`, simulated two-group data
- `04-t-tests.qmd` — `survival::pbc` (bilirubin by sex), simulated mouse glucose
- `nonparametric-tests.qmd` — `survival::pbc`, `boot::melanoma`
- `05-anova.qmd` — simulated mouse body weight × diet, `survival::pbc`
- `categorical-data-and-chi-square.qmd` — `survival::pbc` (treatment × stage)
- `power-and-sample-size.qmd` — simulation only; `pwr` package

### Part 4: Regression and Modeling
- `correlation-and-association.qmd` — `survival::pbc`, `palmerpenguins::penguins`
- `02-linear-regression.qmd` — `survival::pbc`, simulated mouse insulin
- `06-multiple-regression.qmd` — `survival::pbc`, simulated energy expenditure
- `03-logistic-regression.qmd` — `survival::pbc`, `MASS::birthwt`
- `model-building-and-diagnostics.qmd` — `survival::pbc`, simulated lipid data
- `data-imputation.qmd` — `survival::pbc` (has native missingness), simulated MAR data
- `mixed-models.qmd` — `lme4::sleepstudy`, simulated longitudinal mouse data

### Part 5: Advanced Methods
- `survival-and-time-to-event.qmd` — `survival::pbc`, `boot::melanoma`
- `causal-inference.qmd` — `survival::pbc`, simulated collider bias
- `mendelian-randomization.qmd` — simulated one-sample MR; `TwoSampleMR` (eval: false)
- `omics-statistics.qmd` — simulated gene expression matrix; `limma`

### Part 6: Reference and Resources
- `statistical-decision-guide.qmd` — small simulated examples
- `clinical-research-methods.qmd` — `survival::pbc`, `MASS::birthwt`, simulated confounding
- `help-docs.qmd` — no dataset
- `hypothesis-testing.qmd` / `04-t-tests.qmd` / `05-anova.qmd`: `NHANES` subsets, `PlantGrowth` or small experimental animal datasets from Dryad.
- `02-linear-regression.qmd` / `06-multiple-regression.qmd`: `mtcars`, `pbc`, or `gapminder` GDP-life expectancy relationships.
- `03-logistic-regression.qmd`: Pima Diabetes dataset.
- `survival-and-time-to-event.qmd`: `survival::lung`, `survival::pbc`, or small clinical trial follow-up datasets.

---

## Next steps I can take for you
1. Create `data_sources.md` in the repo (this file).  
2. Automatically update QMDs to replace `load(url(...))` and `dev_code_data` references with safe public-load snippets and a short data description block.  
3. Add small, cleaned sample CSVs for any dataset that requires local access (e.g., simulated SCD) into `data/` and update QMDs to use them.  

Which next step would you like me to take? (I can update the QMD files in-place with the suggested load+description snippets.)
