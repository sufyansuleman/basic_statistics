# scripts/fetch_data.R
# Helper script to create small, local copies of datasets used in sessions.
# Run once to populate `data/` with curated subsets for offline use.

if (!dir.exists("data")) dir.create("data")

library(dplyr)
library(janitor)
library(survival)

# pbc subset
pbc <- survival::pbc %>%
  as_tibble() %>%
  janitor::clean_names() %>%
  mutate(stage = factor(stage))

# keep a small subset of useful columns
pbc_subset <- pbc %>% select(id, age, sex, bili, albumin, stage)
save(pbc_subset, file = "data/pbc_subset.rda")
message("Saved data/pbc_subset.rda")
