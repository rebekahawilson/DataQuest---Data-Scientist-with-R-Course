# Importing libraries
library(readr)
library(dplyr)
library(ggplot2)

# Loading the dataset
covid_df <- read_csv("Projects/1 - COVID-19 Trends/COVID19_Data.csv")

# Displaing the dimension of the data:
dim(covid_df)

# Storing the column names in a variable
vector_cols <- colnames(covid_df)

# Displaing the variable vector_cols
vector_cols

# Showing the first few rows of the dataset
head(covid_df)

# Showing a global view of the dataset.
library(tibble)

glimpse(covid_df)


# Isolating the Data We Need
#   Filter the "All States" Province states & remove the `Province_State` column
covid_df_all_states <- covid_df %>%
  filter(Province_State == "All States") %>%
  select(-Province_State)

## Creating a dataset for the cumulative columns and
#  another for the daily columns
# Selecting the columns with cumulative numbers
covid_df_all_states_cumulative <- covid_df_all_states %>%
  select(Date,
         Continent_Name,
         Two_Letter_Country_Code,
         positive,
         hospitalized,
         recovered,
         death,
         total_tested)

# Selecting the columns with cumulative numbers
covid_df_all_states_daily <- covid_df_all_states %>%
  select(Date,
         Country_Region, active,
         hospitalizedCurr,
         daily_tested,
         daily_positive)

# Identifying the Highest Fatality Rates Countries

#    Summarizing the data based on the `Continent_Name` and
#   `Two_Letter_Country_Code` columns
covid_df_all_states_cum_max <- covid_df_all_states_cumulative %>% 
  group_by(Continent_Name, Two_Letter_Country_Code) %>%
  summarise(max = max(death)) %>%
  filter(max > 0)

covid_df_all_states_cum_max

#    Displaying the maximum number of death by country, colored by continent
ggplot(data = covid_df_all_states_cum_max,
       aes(x = Two_Letter_Country_Code,
           y = max,
           col = Continent_Name)) +
  geom_point()

# Which countries have had the highest fatality (mortality) rates?
death_top_3 <- c("US", "IT", "GB")

# Extracting the top 10 countries in the number of tested cases
#  Summarising the data based on the `Country_Region` column.
covid_df_all_states_daily_sum <- covid_df_all_states_daily %>%
  group_by(Country_Region) %>%
  summarise(tested = sum(daily_tested),
            positive = sum(daily_positive),
            active = sum(active),
            hospitalized = sum(hospitalizedCurr)) %>%
  arrange(desc(tested))

covid_df_all_states_daily_sum

# Getting the top 10
covid_top_10 <- head(covid_df_all_states_daily_sum, 10)

# Identifying the Highest Positive Against Tested Cases
# Creating vectors
countries <- covid_top_10$Country_Region
tested_cases <- covid_top_10$tested
positive_cases <- covid_top_10$positive
active_cases <- covid_top_10$active
hospitalized_cases <- covid_top_10$hospitalized

# Naming vectors
names(positive_cases) <- countries
names(tested_cases) <- countries
names(active_cases) <- countries
names(hospitalized_cases) <- countries

# Calculations
positive_cases
sum(positive_cases)
mean(positive_cases)
positive_cases / sum(positive_cases)
positive_cases / tested_cases

# Answer
positive_tested_top_3 <- c("United Kingdom" = 0.11,
                           "United States" = 0.10,
                           "Turkey" = 0.08)

# Identifying Affected Countries Related to their Population
# Creating the matrix covid_mat
covid_mat <- cbind(tested_cases,
                   positive_cases,
                   active_cases,
                   hospitalized_cases)

# Creating the population vector:
# https://www.worldometers.info/world-population/population-by-country/
population <- c(331002651,
                145934462,
                60461826,
                1380004385,
                84339067,
                37742154,
                67886011,
                25499884,
                32971854,
                37846611)

# Dividing the matrix by the population vector
covid_mat <- covid_mat * 100 / population

covid_mat

# Ranking the matrix
tested_cases_rank <- rank(covid_mat[, "tested_cases"])
positive_cases_rank <- rank(covid_mat[, "positive_cases"])
active_cases_rank <- rank(covid_mat[, "active_cases"])
hospitalized_cases_rank <- rank(covid_mat[, "hospitalized_cases"])

covid_mat_rank <- rbind(tested_cases_rank,
                        positive_cases_rank,
                        active_cases_rank,
                        hospitalized_cases_rank)

covid_mat_rank

covid_mat_rank[1, ]
covid_mat_rank[-1, ]

colSums(covid_mat_rank[-1, ])

# Answers
best_effort_tested_cased_top_3 <- c("India",
                                    "United Kingdom",
                                    "Turkey")
most_affected_country <- "Italy"
least_affected_country <- "India"

# Putting it all together
question_list <- list(
  "Which countries have had the highest fatality (mortality) rates?",
  "Which countries have had the highest number of positive cases against the number of tests?",
  "Which countries have made the best effort in terms of the number of tests conducted related to their population?",
  "Which countries were ultimately the most and least affected related to their population?"
)

answer_list <- list(
  "Death" = death_top_3,
  "Positive tested cases" = positive_tested_top_3,
  "The Best effort in test related to the population" = best_effort_tested_cased_top_3,
  "The most affected country related to its population" = most_affected_country,
  "The least affected country related to its population" = least_affected_country
)

answer_list

datasets <- list(
  original = covid_df,
  allstates = covid_df_all_states,
  cumulative = covid_df_all_states_cumulative,
  daily = covid_df_all_states_daily
)

matrices <- list(covid_mat,
                 covid_mat_rank)

vectors <- list(vector_cols,
                population,
                countries)

data_structure_list <- list("data frame" = datasets,
                            "matrix" = matrices,
                            "vector" = vectors)

covid_analysis_list <- list(question_list,
                            answer_list,
                            data_structure_list)