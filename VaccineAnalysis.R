library(tidyverse)
# read data, i need to make sure to use forward slashes for the directory because R doesnt read reg slashes
data <- read.csv("C:/Users/rodri/OneDrive/Área de Trabalho/UMD/INST314/hw2/biontech_adolescents.csv")

# just a simple check to see the data loaded
head(data)
str(data)

# filtering the data for the vaccine and placebo groups
vaccine_group <- data %>% filter(group == "vaccine")
placebo_group <- data %>% filter(group == "placebo")
# checkig the results
head(vaccine_group)
head(placebo_group)

# counting succcesses and trials
# vac first
vaccine_successes <- sum(vaccine_group$outcome == "COVID-19")
vaccine_trials <- nrow(vaccine_group)
# placebo second
placebo_successes <- sum(placebo_group$outcome == "COVID-19")
placebo_trials <- nrow(placebo_group)

# performing bin test case
vaccine_test <- binom.test(vaccine_successes, vaccine_trials, alternative = "less")
placebo_test <- binom.test(placebo_successes, placebo_trials)
vaccine_test
placebo_test
