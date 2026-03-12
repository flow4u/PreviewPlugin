# R Large Sample Script
# This script simulates a large dataset and performs basic statistical analysis.

library(dplyr)
library(ggplot2)

# Set seed for reproducibility
set.seed(42)

# Initialize an empty list to store results
results_list <- list()

# --- Batch Process 1 ---
cat('Starting processing for batch 1...\n')
simulated_data_0 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 39, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_0 <- simulated_data_0 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[1]] <- summary_0

# --- Batch Process 2 ---
cat('Starting processing for batch 2...\n')
simulated_data_1 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 39, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_1 <- simulated_data_1 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[2]] <- summary_1

# --- Batch Process 3 ---
cat('Starting processing for batch 3...\n')
simulated_data_2 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 12, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_2 <- simulated_data_2 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[3]] <- summary_2

# --- Batch Process 4 ---
cat('Starting processing for batch 4...\n')
simulated_data_3 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 40, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_3 <- simulated_data_3 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[4]] <- summary_3

# --- Batch Process 5 ---
cat('Starting processing for batch 5...\n')
simulated_data_4 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 50, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_4 <- simulated_data_4 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[5]] <- summary_4

# --- Batch Process 6 ---
cat('Starting processing for batch 6...\n')
simulated_data_5 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 27, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_5 <- simulated_data_5 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[6]] <- summary_5

# --- Batch Process 7 ---
cat('Starting processing for batch 7...\n')
simulated_data_6 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 46, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_6 <- simulated_data_6 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[7]] <- summary_6

# --- Batch Process 8 ---
cat('Starting processing for batch 8...\n')
simulated_data_7 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 30, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_7 <- simulated_data_7 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[8]] <- summary_7

# --- Batch Process 9 ---
cat('Starting processing for batch 9...\n')
simulated_data_8 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 48, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_8 <- simulated_data_8 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[9]] <- summary_8

# --- Batch Process 10 ---
cat('Starting processing for batch 10...\n')
simulated_data_9 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 10, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_9 <- simulated_data_9 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[10]] <- summary_9

# --- Batch Process 11 ---
cat('Starting processing for batch 11...\n')
simulated_data_10 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 43, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_10 <- simulated_data_10 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[11]] <- summary_10

# --- Batch Process 12 ---
cat('Starting processing for batch 12...\n')
simulated_data_11 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 14, sd = 1),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_11 <- simulated_data_11 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[12]] <- summary_11

# --- Batch Process 13 ---
cat('Starting processing for batch 13...\n')
simulated_data_12 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 40, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_12 <- simulated_data_12 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[13]] <- summary_12

# --- Batch Process 14 ---
cat('Starting processing for batch 14...\n')
simulated_data_13 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 14, sd = 8),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_13 <- simulated_data_13 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[14]] <- summary_13

# --- Batch Process 15 ---
cat('Starting processing for batch 15...\n')
simulated_data_14 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 27, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_14 <- simulated_data_14 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[15]] <- summary_14

# --- Batch Process 16 ---
cat('Starting processing for batch 16...\n')
simulated_data_15 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 35, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_15 <- simulated_data_15 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[16]] <- summary_15

# --- Batch Process 17 ---
cat('Starting processing for batch 17...\n')
simulated_data_16 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 50, sd = 8),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_16 <- simulated_data_16 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[17]] <- summary_16

# --- Batch Process 18 ---
cat('Starting processing for batch 18...\n')
simulated_data_17 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 48, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_17 <- simulated_data_17 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[18]] <- summary_17

# --- Batch Process 19 ---
cat('Starting processing for batch 19...\n')
simulated_data_18 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 27, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_18 <- simulated_data_18 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[19]] <- summary_18

# --- Batch Process 20 ---
cat('Starting processing for batch 20...\n')
simulated_data_19 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 26, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_19 <- simulated_data_19 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[20]] <- summary_19

# --- Batch Process 21 ---
cat('Starting processing for batch 21...\n')
simulated_data_20 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_20 <- simulated_data_20 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[21]] <- summary_20

# --- Batch Process 22 ---
cat('Starting processing for batch 22...\n')
simulated_data_21 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 42, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_21 <- simulated_data_21 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[22]] <- summary_21

# --- Batch Process 23 ---
cat('Starting processing for batch 23...\n')
simulated_data_22 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 45, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_22 <- simulated_data_22 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[23]] <- summary_22

# --- Batch Process 24 ---
cat('Starting processing for batch 24...\n')
simulated_data_23 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 28, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_23 <- simulated_data_23 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[24]] <- summary_23

# --- Batch Process 25 ---
cat('Starting processing for batch 25...\n')
simulated_data_24 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_24 <- simulated_data_24 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[25]] <- summary_24

# --- Batch Process 26 ---
cat('Starting processing for batch 26...\n')
simulated_data_25 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 14, sd = 8),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_25 <- simulated_data_25 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[26]] <- summary_25

# --- Batch Process 27 ---
cat('Starting processing for batch 27...\n')
simulated_data_26 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 33, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_26 <- simulated_data_26 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[27]] <- summary_26

# --- Batch Process 28 ---
cat('Starting processing for batch 28...\n')
simulated_data_27 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 40, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_27 <- simulated_data_27 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[28]] <- summary_27

# --- Batch Process 29 ---
cat('Starting processing for batch 29...\n')
simulated_data_28 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 41, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_28 <- simulated_data_28 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[29]] <- summary_28

# --- Batch Process 30 ---
cat('Starting processing for batch 30...\n')
simulated_data_29 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 47, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_29 <- simulated_data_29 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[30]] <- summary_29

# --- Batch Process 31 ---
cat('Starting processing for batch 31...\n')
simulated_data_30 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_30 <- simulated_data_30 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[31]] <- summary_30

# --- Batch Process 32 ---
cat('Starting processing for batch 32...\n')
simulated_data_31 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 48, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_31 <- simulated_data_31 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[32]] <- summary_31

# --- Batch Process 33 ---
cat('Starting processing for batch 33...\n')
simulated_data_32 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 21, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_32 <- simulated_data_32 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[33]] <- summary_32

# --- Batch Process 34 ---
cat('Starting processing for batch 34...\n')
simulated_data_33 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 22, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_33 <- simulated_data_33 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[34]] <- summary_33

# --- Batch Process 35 ---
cat('Starting processing for batch 35...\n')
simulated_data_34 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 37, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_34 <- simulated_data_34 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[35]] <- summary_34

# --- Batch Process 36 ---
cat('Starting processing for batch 36...\n')
simulated_data_35 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 29, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_35 <- simulated_data_35 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[36]] <- summary_35

# --- Batch Process 37 ---
cat('Starting processing for batch 37...\n')
simulated_data_36 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 36, sd = 1),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_36 <- simulated_data_36 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[37]] <- summary_36

# --- Batch Process 38 ---
cat('Starting processing for batch 38...\n')
simulated_data_37 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 33, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_37 <- simulated_data_37 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[38]] <- summary_37

# --- Batch Process 39 ---
cat('Starting processing for batch 39...\n')
simulated_data_38 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 23, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_38 <- simulated_data_38 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[39]] <- summary_38

# --- Batch Process 40 ---
cat('Starting processing for batch 40...\n')
simulated_data_39 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 47, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_39 <- simulated_data_39 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[40]] <- summary_39

# --- Batch Process 41 ---
cat('Starting processing for batch 41...\n')
simulated_data_40 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 41, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_40 <- simulated_data_40 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[41]] <- summary_40

# --- Batch Process 42 ---
cat('Starting processing for batch 42...\n')
simulated_data_41 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 22, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_41 <- simulated_data_41 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[42]] <- summary_41

# --- Batch Process 43 ---
cat('Starting processing for batch 43...\n')
simulated_data_42 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 41, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_42 <- simulated_data_42 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[43]] <- summary_42

# --- Batch Process 44 ---
cat('Starting processing for batch 44...\n')
simulated_data_43 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 22, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_43 <- simulated_data_43 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[44]] <- summary_43

# --- Batch Process 45 ---
cat('Starting processing for batch 45...\n')
simulated_data_44 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 41, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_44 <- simulated_data_44 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[45]] <- summary_44

# --- Batch Process 46 ---
cat('Starting processing for batch 46...\n')
simulated_data_45 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 22, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_45 <- simulated_data_45 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[46]] <- summary_45

# --- Batch Process 47 ---
cat('Starting processing for batch 47...\n')
simulated_data_46 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 34, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_46 <- simulated_data_46 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[47]] <- summary_46

# --- Batch Process 48 ---
cat('Starting processing for batch 48...\n')
simulated_data_47 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 29, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_47 <- simulated_data_47 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[48]] <- summary_47

# --- Batch Process 49 ---
cat('Starting processing for batch 49...\n')
simulated_data_48 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 13, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_48 <- simulated_data_48 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[49]] <- summary_48

# --- Batch Process 50 ---
cat('Starting processing for batch 50...\n')
simulated_data_49 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 42, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_49 <- simulated_data_49 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[50]] <- summary_49

# --- Batch Process 51 ---
cat('Starting processing for batch 51...\n')
simulated_data_50 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 42, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_50 <- simulated_data_50 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[51]] <- summary_50

# --- Batch Process 52 ---
cat('Starting processing for batch 52...\n')
simulated_data_51 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 16, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_51 <- simulated_data_51 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[52]] <- summary_51

# --- Batch Process 53 ---
cat('Starting processing for batch 53...\n')
simulated_data_52 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 24, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_52 <- simulated_data_52 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[53]] <- summary_52

# --- Batch Process 54 ---
cat('Starting processing for batch 54...\n')
simulated_data_53 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 18, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_53 <- simulated_data_53 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[54]] <- summary_53

# --- Batch Process 55 ---
cat('Starting processing for batch 55...\n')
simulated_data_54 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 18, sd = 1),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_54 <- simulated_data_54 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[55]] <- summary_54

# --- Batch Process 56 ---
cat('Starting processing for batch 56...\n')
simulated_data_55 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 41, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_55 <- simulated_data_55 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[56]] <- summary_55

# --- Batch Process 57 ---
cat('Starting processing for batch 57...\n')
simulated_data_56 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 1),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_56 <- simulated_data_56 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[57]] <- summary_56

# --- Batch Process 58 ---
cat('Starting processing for batch 58...\n')
simulated_data_57 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 12, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_57 <- simulated_data_57 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[58]] <- summary_57

# --- Batch Process 59 ---
cat('Starting processing for batch 59...\n')
simulated_data_58 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 49, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_58 <- simulated_data_58 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[59]] <- summary_58

# --- Batch Process 60 ---
cat('Starting processing for batch 60...\n')
simulated_data_59 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 42, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_59 <- simulated_data_59 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[60]] <- summary_59

# --- Batch Process 61 ---
cat('Starting processing for batch 61...\n')
simulated_data_60 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 36, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_60 <- simulated_data_60 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[61]] <- summary_60

# --- Batch Process 62 ---
cat('Starting processing for batch 62...\n')
simulated_data_61 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 27, sd = 1),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_61 <- simulated_data_61 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[62]] <- summary_61

# --- Batch Process 63 ---
cat('Starting processing for batch 63...\n')
simulated_data_62 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 43, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_62 <- simulated_data_62 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[63]] <- summary_62

# --- Batch Process 64 ---
cat('Starting processing for batch 64...\n')
simulated_data_63 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 16, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_63 <- simulated_data_63 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[64]] <- summary_63

# --- Batch Process 65 ---
cat('Starting processing for batch 65...\n')
simulated_data_64 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 38, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_64 <- simulated_data_64 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[65]] <- summary_64

# --- Batch Process 66 ---
cat('Starting processing for batch 66...\n')
simulated_data_65 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 18, sd = 8),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_65 <- simulated_data_65 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[66]] <- summary_65

# --- Batch Process 67 ---
cat('Starting processing for batch 67...\n')
simulated_data_66 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_66 <- simulated_data_66 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[67]] <- summary_66

# --- Batch Process 68 ---
cat('Starting processing for batch 68...\n')
simulated_data_67 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 33, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_67 <- simulated_data_67 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[68]] <- summary_67

# --- Batch Process 69 ---
cat('Starting processing for batch 69...\n')
simulated_data_68 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 18, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_68 <- simulated_data_68 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[69]] <- summary_68

# --- Batch Process 70 ---
cat('Starting processing for batch 70...\n')
simulated_data_69 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 22, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_69 <- simulated_data_69 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[70]] <- summary_69

# --- Batch Process 71 ---
cat('Starting processing for batch 71...\n')
simulated_data_70 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 41, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_70 <- simulated_data_70 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[71]] <- summary_70

# --- Batch Process 72 ---
cat('Starting processing for batch 72...\n')
simulated_data_71 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 20, sd = 8),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_71 <- simulated_data_71 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[72]] <- summary_71

# --- Batch Process 73 ---
cat('Starting processing for batch 73...\n')
simulated_data_72 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 16, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_72 <- simulated_data_72 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[73]] <- summary_72

# --- Batch Process 74 ---
cat('Starting processing for batch 74...\n')
simulated_data_73 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_73 <- simulated_data_73 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[74]] <- summary_73

# --- Batch Process 75 ---
cat('Starting processing for batch 75...\n')
simulated_data_74 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 15, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_74 <- simulated_data_74 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[75]] <- summary_74

# --- Batch Process 76 ---
cat('Starting processing for batch 76...\n')
simulated_data_75 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 10, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_75 <- simulated_data_75 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[76]] <- summary_75

# --- Batch Process 77 ---
cat('Starting processing for batch 77...\n')
simulated_data_76 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 43, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_76 <- simulated_data_76 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[77]] <- summary_76

# --- Batch Process 78 ---
cat('Starting processing for batch 78...\n')
simulated_data_77 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 26, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_77 <- simulated_data_77 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[78]] <- summary_77

# --- Batch Process 79 ---
cat('Starting processing for batch 79...\n')
simulated_data_78 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 26, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_78 <- simulated_data_78 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[79]] <- summary_78

# --- Batch Process 80 ---
cat('Starting processing for batch 80...\n')
simulated_data_79 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 42, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_79 <- simulated_data_79 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[80]] <- summary_79

# --- Batch Process 81 ---
cat('Starting processing for batch 81...\n')
simulated_data_80 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 47, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_80 <- simulated_data_80 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[81]] <- summary_80

# --- Batch Process 82 ---
cat('Starting processing for batch 82...\n')
simulated_data_81 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 15, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_81 <- simulated_data_81 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[82]] <- summary_81

# --- Batch Process 83 ---
cat('Starting processing for batch 83...\n')
simulated_data_82 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 36, sd = 1),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_82 <- simulated_data_82 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[83]] <- summary_82

# --- Batch Process 84 ---
cat('Starting processing for batch 84...\n')
simulated_data_83 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 28, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_83 <- simulated_data_83 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[84]] <- summary_83

# --- Batch Process 85 ---
cat('Starting processing for batch 85...\n')
simulated_data_84 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 33, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_84 <- simulated_data_84 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[85]] <- summary_84

# --- Batch Process 86 ---
cat('Starting processing for batch 86...\n')
simulated_data_85 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 16, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_85 <- simulated_data_85 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[86]] <- summary_85

# --- Batch Process 87 ---
cat('Starting processing for batch 87...\n')
simulated_data_86 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 35, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_86 <- simulated_data_86 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[87]] <- summary_86

# --- Batch Process 88 ---
cat('Starting processing for batch 88...\n')
simulated_data_87 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 29, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_87 <- simulated_data_87 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[88]] <- summary_87

# --- Batch Process 89 ---
cat('Starting processing for batch 89...\n')
simulated_data_88 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 48, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_88 <- simulated_data_88 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[89]] <- summary_88

# --- Batch Process 90 ---
cat('Starting processing for batch 90...\n')
simulated_data_89 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 40, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_89 <- simulated_data_89 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[90]] <- summary_89

# --- Batch Process 91 ---
cat('Starting processing for batch 91...\n')
simulated_data_90 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_90 <- simulated_data_90 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[91]] <- summary_90

# --- Batch Process 92 ---
cat('Starting processing for batch 92...\n')
simulated_data_91 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 44, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_91 <- simulated_data_91 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[92]] <- summary_91

# --- Batch Process 93 ---
cat('Starting processing for batch 93...\n')
simulated_data_92 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 46, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_92 <- simulated_data_92 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[93]] <- summary_92

# --- Batch Process 94 ---
cat('Starting processing for batch 94...\n')
simulated_data_93 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 28, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_93 <- simulated_data_93 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[94]] <- summary_93

# --- Batch Process 95 ---
cat('Starting processing for batch 95...\n')
simulated_data_94 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 32, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_94 <- simulated_data_94 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[95]] <- summary_94

# --- Batch Process 96 ---
cat('Starting processing for batch 96...\n')
simulated_data_95 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 34, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_95 <- simulated_data_95 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[96]] <- summary_95

# --- Batch Process 97 ---
cat('Starting processing for batch 97...\n')
simulated_data_96 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 46, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_96 <- simulated_data_96 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[97]] <- summary_96

# --- Batch Process 98 ---
cat('Starting processing for batch 98...\n')
simulated_data_97 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 40, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_97 <- simulated_data_97 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[98]] <- summary_97

# --- Batch Process 99 ---
cat('Starting processing for batch 99...\n')
simulated_data_98 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 40, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_98 <- simulated_data_98 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[99]] <- summary_98

# --- Batch Process 100 ---
cat('Starting processing for batch 100...\n')
simulated_data_99 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 48, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_99 <- simulated_data_99 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[100]] <- summary_99

# --- Batch Process 101 ---
cat('Starting processing for batch 101...\n')
simulated_data_100 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 13, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_100 <- simulated_data_100 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[101]] <- summary_100

# --- Batch Process 102 ---
cat('Starting processing for batch 102...\n')
simulated_data_101 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 50, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_101 <- simulated_data_101 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[102]] <- summary_101

# --- Batch Process 103 ---
cat('Starting processing for batch 103...\n')
simulated_data_102 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 48, sd = 8),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_102 <- simulated_data_102 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[103]] <- summary_102

# --- Batch Process 104 ---
cat('Starting processing for batch 104...\n')
simulated_data_103 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 39, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_103 <- simulated_data_103 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[104]] <- summary_103

# --- Batch Process 105 ---
cat('Starting processing for batch 105...\n')
simulated_data_104 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 39, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_104 <- simulated_data_104 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[105]] <- summary_104

# --- Batch Process 106 ---
cat('Starting processing for batch 106...\n')
simulated_data_105 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 28, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_105 <- simulated_data_105 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[106]] <- summary_105

# --- Batch Process 107 ---
cat('Starting processing for batch 107...\n')
simulated_data_106 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 38, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_106 <- simulated_data_106 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[107]] <- summary_106

# --- Batch Process 108 ---
cat('Starting processing for batch 108...\n')
simulated_data_107 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 22, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_107 <- simulated_data_107 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[108]] <- summary_107

# --- Batch Process 109 ---
cat('Starting processing for batch 109...\n')
simulated_data_108 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 28, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_108 <- simulated_data_108 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[109]] <- summary_108

# --- Batch Process 110 ---
cat('Starting processing for batch 110...\n')
simulated_data_109 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 39, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_109 <- simulated_data_109 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[110]] <- summary_109

# --- Batch Process 111 ---
cat('Starting processing for batch 111...\n')
simulated_data_110 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 49, sd = 8),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_110 <- simulated_data_110 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[111]] <- summary_110

# --- Batch Process 112 ---
cat('Starting processing for batch 112...\n')
simulated_data_111 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 40, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_111 <- simulated_data_111 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[112]] <- summary_111

# --- Batch Process 113 ---
cat('Starting processing for batch 113...\n')
simulated_data_112 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 46, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_112 <- simulated_data_112 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[113]] <- summary_112

# --- Batch Process 114 ---
cat('Starting processing for batch 114...\n')
simulated_data_113 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 20, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_113 <- simulated_data_113 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[114]] <- summary_113

# --- Batch Process 115 ---
cat('Starting processing for batch 115...\n')
simulated_data_114 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 23, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_114 <- simulated_data_114 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[115]] <- summary_114

# --- Batch Process 116 ---
cat('Starting processing for batch 116...\n')
simulated_data_115 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 43, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_115 <- simulated_data_115 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[116]] <- summary_115

# --- Batch Process 117 ---
cat('Starting processing for batch 117...\n')
simulated_data_116 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 21, sd = 1),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_116 <- simulated_data_116 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[117]] <- summary_116

# --- Batch Process 118 ---
cat('Starting processing for batch 118...\n')
simulated_data_117 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 15, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_117 <- simulated_data_117 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[118]] <- summary_117

# --- Batch Process 119 ---
cat('Starting processing for batch 119...\n')
simulated_data_118 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 34, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_118 <- simulated_data_118 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[119]] <- summary_118

# --- Batch Process 120 ---
cat('Starting processing for batch 120...\n')
simulated_data_119 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 34, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_119 <- simulated_data_119 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[120]] <- summary_119

# --- Batch Process 121 ---
cat('Starting processing for batch 121...\n')
simulated_data_120 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 28, sd = 2),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_120 <- simulated_data_120 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[121]] <- summary_120

# --- Batch Process 122 ---
cat('Starting processing for batch 122...\n')
simulated_data_121 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 31, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_121 <- simulated_data_121 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[122]] <- summary_121

# --- Batch Process 123 ---
cat('Starting processing for batch 123...\n')
simulated_data_122 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 41, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_122 <- simulated_data_122 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[123]] <- summary_122

# --- Batch Process 124 ---
cat('Starting processing for batch 124...\n')
simulated_data_123 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 14, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_123 <- simulated_data_123 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[124]] <- summary_123

# --- Batch Process 125 ---
cat('Starting processing for batch 125...\n')
simulated_data_124 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 16, sd = 8),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_124 <- simulated_data_124 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[125]] <- summary_124

# --- Batch Process 126 ---
cat('Starting processing for batch 126...\n')
simulated_data_125 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 21, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_125 <- simulated_data_125 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[126]] <- summary_125

# --- Batch Process 127 ---
cat('Starting processing for batch 127...\n')
simulated_data_126 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 49, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_126 <- simulated_data_126 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[127]] <- summary_126

# --- Batch Process 128 ---
cat('Starting processing for batch 128...\n')
simulated_data_127 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 31, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_127 <- simulated_data_127 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[128]] <- summary_127

# --- Batch Process 129 ---
cat('Starting processing for batch 129...\n')
simulated_data_128 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 48, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_128 <- simulated_data_128 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[129]] <- summary_128

# --- Batch Process 130 ---
cat('Starting processing for batch 130...\n')
simulated_data_129 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 44, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_129 <- simulated_data_129 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[130]] <- summary_129

# --- Batch Process 131 ---
cat('Starting processing for batch 131...\n')
simulated_data_130 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 28, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_130 <- simulated_data_130 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[131]] <- summary_130

# --- Batch Process 132 ---
cat('Starting processing for batch 132...\n')
simulated_data_131 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 47, sd = 10),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_131 <- simulated_data_131 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[132]] <- summary_131

# --- Batch Process 133 ---
cat('Starting processing for batch 133...\n')
simulated_data_132 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 22, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_132 <- simulated_data_132 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[133]] <- summary_132

# --- Batch Process 134 ---
cat('Starting processing for batch 134...\n')
simulated_data_133 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 14, sd = 8),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_133 <- simulated_data_133 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[134]] <- summary_133

# --- Batch Process 135 ---
cat('Starting processing for batch 135...\n')
simulated_data_134 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 4),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_134 <- simulated_data_134 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[135]] <- summary_134

# --- Batch Process 136 ---
cat('Starting processing for batch 136...\n')
simulated_data_135 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 45, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_135 <- simulated_data_135 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[136]] <- summary_135

# --- Batch Process 137 ---
cat('Starting processing for batch 137...\n')
simulated_data_136 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 37, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_136 <- simulated_data_136 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[137]] <- summary_136

# --- Batch Process 138 ---
cat('Starting processing for batch 138...\n')
simulated_data_137 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_137 <- simulated_data_137 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[138]] <- summary_137

# --- Batch Process 139 ---
cat('Starting processing for batch 139...\n')
simulated_data_138 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 11, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_138 <- simulated_data_138 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[139]] <- summary_138

# --- Batch Process 140 ---
cat('Starting processing for batch 140...\n')
simulated_data_139 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 48, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_139 <- simulated_data_139 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[140]] <- summary_139

# --- Batch Process 141 ---
cat('Starting processing for batch 141...\n')
simulated_data_140 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 30, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_140 <- simulated_data_140 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[141]] <- summary_140

# --- Batch Process 142 ---
cat('Starting processing for batch 142...\n')
simulated_data_141 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 25, sd = 6),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_141 <- simulated_data_141 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[142]] <- summary_141

# --- Batch Process 143 ---
cat('Starting processing for batch 143...\n')
simulated_data_142 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 40, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_142 <- simulated_data_142 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[143]] <- summary_142

# --- Batch Process 144 ---
cat('Starting processing for batch 144...\n')
simulated_data_143 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 23, sd = 9),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_143 <- simulated_data_143 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[144]] <- summary_143

# --- Batch Process 145 ---
cat('Starting processing for batch 145...\n')
simulated_data_144 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 26, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_144 <- simulated_data_144 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[145]] <- summary_144

# --- Batch Process 146 ---
cat('Starting processing for batch 146...\n')
simulated_data_145 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 32, sd = 3),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_145 <- simulated_data_145 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[146]] <- summary_145

# --- Batch Process 147 ---
cat('Starting processing for batch 147...\n')
simulated_data_146 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 50, sd = 5),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_146 <- simulated_data_146 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[147]] <- summary_146

# --- Batch Process 148 ---
cat('Starting processing for batch 148...\n')
simulated_data_147 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 12, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_147 <- simulated_data_147 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[148]] <- summary_147

# --- Batch Process 149 ---
cat('Starting processing for batch 149...\n')
simulated_data_148 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 23, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_148 <- simulated_data_148 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[149]] <- summary_148

# --- Batch Process 150 ---
cat('Starting processing for batch 150...\n')
simulated_data_149 <- data.frame(
  id = 1:1000,
  group = sample(LETTERS[1:4], 1000, replace = TRUE),
  value_x = rnorm(1000, mean = 49, sd = 7),
  value_y = runif(1000, min = 0, max = 100)
)

# Calculate summary statistics
summary_149 <- simulated_data_149 %>%
  group_by(group) %>%
  summarise(
    mean_x = mean(value_x),
    sd_x = sd(value_x),
    cor_xy = cor(value_x, value_y)
  )

results_list[[150]] <- summary_149

# Combine all results
final_results <- bind_rows(results_list)
print(head(final_results))

# Plotting final summary
p <- ggplot(final_results, aes(x = group, y = mean_x, fill = group)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = 'Aggregated Means Across Batches', y = 'Mean X', x = 'Group')
print(p)
