
file_path <- here::here("data/simulated_scd_data.txt")
scd_simulated_data <- read.table(file_path, header = TRUE, sep = "\t") %>%
    dplyr::rename_all(to_snake_case)

# Assuming scd_simulated_data is your dataset
save(scd_simulated_data, file = "data/scd_simulated_data.rda")

load("data/scd_simulated_data.rda")
