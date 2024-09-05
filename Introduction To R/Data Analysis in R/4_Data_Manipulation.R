# Tools are called functions which are bundled together in packages.
# A popular one is called tidyverse.

# Task 1 - Describing dataset given
# (a) How many columns are in this dataset?
dataset_n_cols <- 5L
# (b) What is the name of the third column?
col_3_name <- "salary_min"
# (c) What is the data type of the fourth column?
col_4_type <- "numeric"

# Task 2 -
# (a) Import the file monster_jobs_clean.csv into R
monster_jobs_clean <- read_csv("monster_jobs_clean.csv")

# Task 3 
# (a) How many columns are there?
n_cols_clean <- ncol(monster_jobs_clean)
# (b) How many rows?
n_rows_clean <- nrow(monster_jobs_clean)
# (c) What are the names of the columns?
names_clean <- colnames(monster_jobs_clean)
# Receive first lines from the dataframe
monster_jobs_clean_head <- head(monster_jobs_clean)
# Receive last lines from the dataframe
monster_jobs_clean_tail <- tail(monster_jobs_clean)

#Task 4 - 
# (a) Show the maximum salary for all job posts
library(ggplot2)
ggplot(monster_jobs_clean, aes(x = job_id, y = salary_max))
# (b) Show it by job type
library(ggplot2)
ggplot(monster_jobs_clean, aes(x = job_id, y = salary_max, color = job_type)) + geom_point()
