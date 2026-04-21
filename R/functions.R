# Shared helper functions for the course

# Load a specific package, installing it if necessary.
load_package <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    repos <- getOption("repos")
    if (is.null(repos) || repos["CRAN"] == "@CRAN@" || repos["CRAN"] == "") {
      repos <- c(CRAN = "https://cloud.r-project.org")
    }
    lib_path <- Sys.getenv("R_LIBS_USER")
    if (lib_path == "") {
      lib_path <- file.path(Sys.getenv("HOME", unset = Sys.getenv("USERPROFILE")), "R", "library")
    }
    if (!dir.exists(lib_path)) {
      dir.create(lib_path, recursive = TRUE, showWarnings = FALSE)
    }
    pkg_type <- if (.Platform$OS.type == "windows") "binary" else "source"
    install.packages(pkg, dependencies = TRUE, repos = repos, lib = lib_path, type = pkg_type)
    .libPaths(c(lib_path, .libPaths()))
  }
  library(pkg, character.only = TRUE)
}

# Load a vector of packages.
load_packages <- function(pkgs) {
  pkgs <- unique(pkgs)
  invisible(lapply(pkgs, load_package))
}

# Load a CSV file safely with a consistent set of readr defaults.
safe_read_csv <- function(path, ...) {
  readr::read_csv(path, show_col_types = FALSE, progress = FALSE, ...)
}

# Clean column names consistently.
clean_names_df <- function(df) {
  janitor::clean_names(df)
}

# Save reproducible session metadata.
save_session_info <- function(path = "session-info.txt") {
  info <- utils::sessionInfo()
  capture.output(info, file = path)
}

# Use here() to resolve a path relative to the project root.
root_path <- function(...) {
  here::here(...)
}

# Load standard packages for course examples.
all_course_packages <- c(
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

# Load or install all standard course packages.
load_courses_packages <- function() {
  load_packages(all_course_packages)
}
