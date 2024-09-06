# Task 1-
library(tidyverse)
# Supply col_types = cols() to suppress column specification output
recent_grads <- read_csv("recent_grads.csv", col_types = cols())
glimpse(recent_grads)
names(recent_grads)
# Get the number of rows
num_rows <- nrow(recent_grads)
# Get the number of columns
num_cols <- ncol(recent_grads)

# Task 2 - Selecting columns
# (a) Create dataset with only rank and major columns from recent_grads dataset
rank_major_tibble <- select(recent_grads, Rank, Major)
# Create a dataset removing major_code column from recent_grads dataset
no_major_code_tibble <- select(recent_grads, -Major_code)

# Task 3 - Filtering rows
library(tidyverse)
recent_grads <- read_csv("recent_grads.csv", col_types = cols())
# (a) Filter recent_grads data for those with a sample_size larger than 100
large_sample_majors <- filter(recent_grads, Sample_size > 100)
# (b) Filter the recent_grads data where:
#     Total is less than or equal to 70,000
#     Median is greater than 40,000
#     Major_category isn't Engineering
non_engineering_majors <- filter(recent_grads,
                                 Total <= 70000,
                                 Median > 40000,
                                 Major_category != "Engineering")

# Task 4 - Piping With The %>% Operator
# A pipe operator, %>%, allows us to chain data manipulation functions together
# (a) Starting with recent_grads, create a pipeline that does the following:
#   Remove the Rank and Major columns
#   Filters majors with a Median pay less than 50000
pipeline_output <- recent_grads %>%
  select(-Rank, -Major) %>%
  filter(Median < 50000)

# Task 5 - Creating new columns
# Create 3 new columns in recent_grads
# (a) Proportion of people employed by major
# (b) Proportion of women in the major
# (c) Proportion of women greater than proportion employed by major
new_recent_grads <- recent_grads %>%
  mutate(
    prop_employed = Employed / Total,
    prop_women = Women / Total,
    prop_women_gt_employed = prop_women > prop_employed
  )

# Task 6 - Sorting data
# (a) What major has the lowest proportion of employed graduates
least_employed_major <- recent_grads %>%
  mutate(
    prop_employed = Employed / Total
  ) %>%
  arrange(prop_employed) %>%
  select(Major, Employed, Total, prop_employed)
head(least_employed_major)
least_employed_major <- "MILITARY TECHNOLOGIES"

# Task 7 - Summarising data
# (a) Create a new tibble that calculates the min and max Median values
minmax_median_income <- recent_grads %>%
  summarise(
    min_income = min(Median, na.rm = TRUE),
    max_income = max(Median, na.rm = TRUE)
  )
# (b) Create a new tibble calculating the min and max Median values by Major
minmax_median_income_by_major <- recent_grads %>%
  group_by(Major) %>%
  summarise(
    min_income = min(Median, na.rm = TRUE),
    max_income = max(Median, na.rm = TRUE)
  )

# Task 8 - Tibble columns as vectors
# (a) Take the median col from recent_grads and assign it medians
medians <- recent_grads %>%
  pull(Median)
#(b) Find the highest value present in medians
highest_median <- max(medians, na.rm = TRUE)