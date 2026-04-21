# This script is calling the package libraries, all the packages involved will then be added to this script.
# Source this file before each session to load the packages.

library(here)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)
library(usethis)
library(snakecase)
library(usethis)
library(tidyr)
library(nlme)

# function for installing multiple packages

ipak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg))
        install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
}

# assign the packages list to a variable
recommended_packages <- c("DoseFinding", "MESS", "timereg", "HistData", "nlme", "coin", "multcomp", "sandwich", "Publish", "nlmeU", "rayshader", "survival", "prodlim")

ipak(recommended_packages)
