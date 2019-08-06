# Setup ---------------------------------------------------------------


seed <- sample.int(1e3, 1)
message("Seed used:", seed)
set.seed(seed)

library(ggplot2)

## Functions are defined in R/
my_funs <- list.files("R", "\\.R$", full.names = TRUE)
for (fun in my_funs) source(fun)



# Loading data --------------------------------------------------------


## Data are defined in data/
model1data <- readRDS("data/first_db.rds")
model2data <- readRDS("data/second_db.rds")
model_c_data <- readRDS("data/combined_db.rds")



# Analyses ------------------------------------------------------------


model1data %>%
    setup_datamodel() %>%
    produce_plot(eb = TRUE, ea = TRUE,
        save_file = TRUE
    )

model2data %>%
    setup_datamodel() %>%
    produce_plot(ex = TRUE,
        save_file = TRUE,
        filename = "p_modeldata-2.pdf"
    )

model_c_data %>%
    setup_datamodel() %>%
    produce_plot()
