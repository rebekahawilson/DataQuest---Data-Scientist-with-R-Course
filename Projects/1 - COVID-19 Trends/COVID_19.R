library(readr)

covid_df <- read_csv("Projects/1 - COVID-19 Trends/COVID19_Data.csv")

# Displaying the dimension of the data
dim(covid_df)

# Storing the column names in a variable
vector_cols <- colnames(covid_df)

# Displaying the variable vector_cold
vector_cols

# Showing the first few rows of the dataset
head(covid_df)

# Showing a global view of the dataset.
library(tibble)

glimpse(covid_df)

# INFORMATION
# This dataset contains 14 columns and 10,903 rows.
# Info on the number of COVID 19 cases (per day and cumulatively),
# deaths, tests, and hospitalisations per country.

# Isolating the required rows
library(dplyr)

# Filter the "All States" Province states and remove the `Province_State` column
covid_df_all_states <- covid_df %>%
  filter(Province_State == "All States") %>%
  select(-Province_State)

# Isolating the Columns We Need
# Creating a dataset for the daily columns from `covid_df_all_states` dataframe

# Selecting the columns with cumulative numbers
covid_df_all_states_daily <- covid_df_all_states %>%
  select(Date,
         Country_Region,
         active,
         hospitalizedCurr,
         daily_tested,
         daily_positive)

head(covid_df_all_states_daily)

# Extracting the top 10 countries for the number of tested cases
#   Summarising data based on 'country_region'
covid_df_all_states_daily_sum <- covid_df_all_states_daily %>%
  group_by(Country_Region) %>%
  summarise(tested = sum(daily_tested),
            positive = sum(daily_positive),
            active = sum(active),
            hospitalized = sum(hospitalizedCurr)) %>%
  arrange(desc(tested))

covid_df_all_states_daily_sum # Displaying data frame
#   Extracting and displaying the top 10
covid_top_10 <- head(covid_df_all_states_daily_sum, 10)
covid_top_10

# Identifying the highest postive against tested cases
#   Creating vectors
countries <- covid_top_10$Country_Region
tested_cases <- covid_top_10$tested
positive_cases <- covid_top_10$positive
active_cases <- covid_top_10$active
hospitalized_cases <- covid_top_10$hospitalized
#   Naming vectors
names(positive_cases) <- countries
names(tested_cases) <- countries
names(active_cases) <- countries
names(hospitalized_cases) <- countries
#   Idenitfying
positive_cases
sum(positive_cases)
mean(positive_cases)
positive_cases / sum(positive_cases)
positive_cases / tested_cases
positive_tested_top_3 <- c("United Kingdom" = 0.11,
                           "United States" = 0.10,
                           "Turkey" = 0.08)

# Creating vectors
united_kingdom <- c(0.11, 1473672, 166909, 0, 0)
united_states <- c(0.10, 17282363, 1877179, 0, 0)
turkey <- c(0.08, 2031192, 163941, 2980960, 0)

# Creating the matrix combining the vectors
covid_mat <- rbind(united_kingdom, united_states, turkey)

# Naming columns
colnames(covid_mat) <- c("Ratio",
                         "tested",
                         "positive",
                         "active",
                         "hospitalized")

# Displaying the matrix
covid_mat

# Putting it all together
question <- "Which countries have had the highest number of positive
             cases against the number of tests?"

answer <- c("Positive tested cases" = positive_tested_top_3)

# List containing the dataframes
datasets <- list(
  original = covid_df,
  allstates = covid_df_all_states,
  daily = covid_df_all_states_daily,
  top_10 = covid_top_10
)

# Lists containing matrices and vectors
matrices <- list(covid_mat)
vectors <- list(vector_cols, countries)

# list for data structure
data_structure_list <- list("dataframe" = datasets,
                            "matrix" = matrices,
                            "vector" = vectors)

# List containing question, answer and data structure
covid_analysis_list <- list(question,
                            answer,
                            data_structure_list)
# Displaying the list
covid_analysis_list