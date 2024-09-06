# Task 1 - Reconstruct vectors into matrices
vector_1 <- c(1, 4, 5, 9) # [1] 1 4 5 9
vector_2 <- 1:12 # [1] 1  2  .. 11 12
vector_3 <- seq(from = 2.0, to = 5.50, by = 0.25) # [1] 2.00 2.25 .. 5.25 5.50
# (a) Create a matrix by restructuring vector 1 into 2 columns and rows:
matrix_1 <- matrix(vector_1, nrow = 2, ncol = 2)
# (b) Create a matrix by restructuring vector 2 into 3 columns and 4 rows:
matrix_2 <- matrix(vector_2, nrow = 4, ncol = 3)
# (c) Create a matrix by restructuring vector 3 into 5 columns and 3 rows:
matrix_3 <- matrix(vector_3, nrow = 3, ncol = 5, byrow = TRUE)

# Task 2 - Create a matrix by combining vectors
world_rank <- c(1, 2, 3, 4, 5, 6)
quality_of_education <- c(1, 9, 3, 2, 7, 13)
influence <- c(1, 3, 2, 6, 12, 13)
broad_impact <- c(1, 4, 2, 13, 9, 12)
patents <- c(3, 10, 1, 48, 15, 4)
# (a) Create a university matrix from vectors given
university_matrix <- cbind(world_rank,
                           quality_of_education,
                           influence,
                           broad_impact,
                           patents)

# Task 3 - Rename the rows of university_matrix using university names
rownames(university_matrix) <- c("harvard",
                                 "stanford",
                                 "MIT",
                                 "cambridge",
                                 "oxford",
                                 "columbia")

# Task 4 - Indexing matrices
# (a) Access the value in the columbia row and influence column:
cell_columbia_influence <- university_matrix["columbia", "influence"]
# (b) Select elements in the cambridge row
vector_cambridge <- university_matrix["cambridge", ]
# (c) Select elements in the world-rank column
vector_world_rank <- university_matrix[, "world_rank"]
# (d) Index values in harvard, MIT, & cambridge rows,
#     and in world_rank & broad_impact columns
sub_matrix <- university_matrix[c("harvard", "MIT", "cambridge"),
                                c("world_rank", "broad_impact")]
# (e) Rank the USA universities in world_rank and patents categories
usa_universities_rankings <- university_matrix[usa_universities,
                                               c("world_rank", "patents")]

# Task 5 - Modifying elements in a matrix
# (a) Replace the element at 4th row and 5th column by 3.
university_matrix[4, 5] <- 3
# (b) Replace all rankings for USA uni's by 2
university_matrix[usa_universities] <- 2

# Task 6 - Appending elements to a matrix
california <- c(7, 5, 4, 7, 29, 43176)
# (a) Add elements in california as a new row of university_matrix
complete_university_matrix <- rbind(university_matrix, california)

# Task 7 - Removing elements from a matrix
# (a) Remove the first column from complete_university_matrix
university_matrix_wtho_first <- complete_university_matrix[, -1]
# (b) Remove the 2nd and 5th columns where broad_impact is 10 or less
below_10_university_matrix <- complete_university_matrix[broad_impact <= 10,
                                                         c(-2, -5)]

# Task 8 - Performing operations with matrices
# (a) Calculate average rankings for every category for Harvard
harvard_scores_avg <- mean(complete_university_matrix["harvard", -6])
# (b) Calculate averages for all of the uniersity scores
university_scores_avg <- rowMeans(complete_university_matrix[, -6])
# (c) Calculate averages for each category of the university
category_scores_avg <- colMeans(complete_university_matrix[, -6])
# (d) Calculate the average of each university's rankings
university_matrix_avg <- colMeans(ranks_university_matrix)