# This script loads the packages used across the course.
# It is sourced at the start of each session.

source(here::here("R/functions.R"))

# Recommended packages for the course.
recommended_packages <- c(
  "here",
  "tidyverse",
  "janitor",
  "readxl",
  "writexl",
  "survival",
  "survminer",
  "broom",
  "broom.mixed",
  "gtsummary",
  "gt",
  "glue",
  "lubridate",
  "targets",
  "tarchetypes",
  "patchwork",
  "cowplot",
  "modelr"
)

# Load course packages.
load_packages(recommended_packages)
