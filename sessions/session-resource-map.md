Canonical session → public datasets (dev_code_data replaced)

1. 01-descriptive-statistics.qmd
     - Datasets:
         - Built-in: `iris` — load with `data(iris)`
         - Public CSV: Palmer Penguins — https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv
     - Example load:
         - `penguins <- readr::read_csv('https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv')`

2. sampling-and-estimation.qmd
     - Dataset:
         - Gapminder (public CSV) — https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv
     - Example load:
         - `gapminder <- readr::read_csv('https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv')`

3. tidy-data-wrangling.qmd
     - Dataset:
         - `nycflights13::flights` (install `nycflights13` from CRAN)
     - Example load:
         - `install.packages('nycflights13'); library(nycflights13); flights <- nycflights13::flights`

4. basic-visualization.qmd
     - Datasets:
         - `penguins` (see 01)
         - `iris` (built-in)
     - Example:
         - `ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point()`

5. advanced-visualization.qmd
     - Dataset:
         - Gapminder (see 02) — use for time-series, faceting, and animated plots

6. hypothesis-testing.qmd
     - Dataset:
         - `ToothGrowth` (built-in) — `data(ToothGrowth)`

7. 04-t-tests.qmd
     - Dataset:
         - `ToothGrowth` or appropriate subsets of `iris`

8. categorical-data-and-chi-square.qmd
     - Dataset:
         - Titanic (public CSV) — https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv
     - Example load:
         - `titanic <- readr::read_csv('https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv')`

9. 02-linear-regression.qmd
     - Dataset:
         - `mtcars` (built-in) — `data(mtcars)`

10. 06-multiple-regression.qmd
        - Dataset:
            - `mtcars` or `ggplot2::diamonds` (install `ggplot2`)

11. 03-logistic-regression.qmd
        - Dataset:
            - Pima Indians Diabetes (public CSV) — https://raw.githubusercontent.com/selva86/datasets/master/PimaIndiansDiabetes.csv
        - Example load:
            - `diabetes <- readr::read_csv('https://raw.githubusercontent.com/selva86/datasets/master/PimaIndiansDiabetes.csv')`

12. model-building-and-diagnostics.qmd
        - Dataset:
            - `mtcars`; recommended packages: `broom`, `modelr`, `tidymodels`

13. 05-anova.qmd
        - Dataset:
            - `PlantGrowth` (built-in) — `data(PlantGrowth)`

14. power-and-sample-size.qmd
        - Tools / examples:
            - Use the `pwr` package for power calculations (no external dataset required)
            - Example: `library(pwr); pwr.t.test(d = 0.5, power = 0.8)`

15. reproducible-research.qmd
        - Guidance:
            - Show how to load data from stable URLs (see list below), cache to `data/`, and use `pins` or `targets` for reproducible data access
            - Example cache: `if (!dir.exists('data')) dir.create('data'); readr::write_csv(penguins, 'data/penguins.csv')`

16. packages-libraries.qmd
        - Packages/datasets to demonstrate:
            - `palmerpenguins`, `nycflights13`, `gapminder`, `ggplot2`, `dplyr`

17. clinical-research-methods.qmd
        - Dataset:
            - `survival::lung` — `data(lung, package = 'survival')`

18. survival-and-time-to-event.qmd
        - Datasets:
            - `survival::lung`, `survival::ovarian`

19. explore-clinical-data.qmd
        - Datasets:
            - `MASS::birthwt` — `data(birthwt, package = 'MASS')`
            - Option: the `NHANES` package for US survey examples (install from CRAN)
        - Note: if you want to preserve the simulated SCD dataset, add a cleaned CSV to `data/` (not `dev_code_data`) so it is versioned with the course

20. help-docs.qmd
        - Course support pages and reference links:
            - StackOverflow: https://stackoverflow.com
            - CRAN: https://cran.r-project.org

Key public dataset URLs (stable examples):
- Palmer Penguins CSV: https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv
- Gapminder CSV: https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv
- Titanic CSV: https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv
- Pima Diabetes CSV: https://raw.githubusercontent.com/selva86/datasets/master/PimaIndiansDiabetes.csv

Notes:
- `dev_code_data` has been removed; canonical example scripts should be migrated into `R/` or `scripts/` and reference public datasets or package datasets as above.
- If you want, I can (a) replace file references in each QMD with `readr::read_csv(URL)` calls, (b) add small cleaned CSV(s) to `data/` for any private simulated data to keep in-repo, or (c) generate a `data_sources.md` with direct download and citation instructions.
