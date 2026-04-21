# This script loads the packages used across the course.
# It is sourced at the start of each session.

source(here::here("R/functions.R"))

# Core packages for most sessions.
recommended_packages <- c(
  "here",
  "dplyr",
  "tidyr",
  "ggplot2",
  "readr",
  "purrr",
  "stringr",
  "forcats",
  "tibble",
  "janitor",
  "glue",
  "lubridate",
  "readxl",
  "writexl",
  "broom",
  "patchwork",
  "cowplot"
)

# Load core course packages.
load_packages(recommended_packages)
