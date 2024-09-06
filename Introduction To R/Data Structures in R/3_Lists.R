# Task 1 -
harvard <- c(1, 1, 1, 1, 3)
stanford <- c(2, 9, 3, 4, 10)
MIT <- c(3, 3, 2, 2, 1)
cambridge <- c(4, 2, 6, 13, 48)
oxford <- c(5, 7, 12, 9, 15)
columbia <- c(6, 13, 13, 12, 4)
# (a) Create the category_names vector
category_names <- c("world_rank",
                    "quality_of_education",
                    "influence",
                    "broad_impact",
                    "patents")
# (b) Combine the university vectors into a matrix
university_matrix <- rbind(harvard, stanford, MIT, cambridge, oxford, columbia)
# (c) Modify the column names using colnames()
colnames(university_matrix) <- category_names
# (d) Check the result
university_matrix

# Task 2 - Creating lists
# (a) Create a lsit of university clubs
university_clubs <- list("ballroom dancing",
                         "rugby",
                         "bird watching",
                         "pottery")
# (b) Store the following in a list: "MIT", (3, 3, 2, 2, 1), TRUE
mit_list <- list("MIT", c(3, 3, 2, 2, 1), TRUE)
# (c) Name each element of the mit_list 
mit_named_list <- list(name = "MIT", ranking = c(3,3,2,2,1), is_in_usa = TRUE)

# Task 3
club_title <- c("Chess Club")
club_description <- c("Meets two nights a week for members to play chess. 
                      Snacks are provided.")
club_dues <- c(50, 20, 15)
meeting_days <- c("Monday", "Wednesday")
meeting_times <- c("6:00 pm", "8:00 pm")
# (a) Create a matrix containing meeting_days and meeting_times
club_meetings <- rbind(meeting_days, meeting_times)
# (b) Create a list called chess_club storing all the objects
chess_club <- list(club_title, club_description, club_dues, club_meetings)

# Task 4 - Naming objects
club_meetings <- rbind(meeting_days, meeting_times)
chess_club <- list(club_title, club_description, club_dues, club_meetings)
chess_club_names <- c("club_title",
                      "club_description",
                      "club_dues",
                      "club_meetings")
# (a) Assign the chess_club_names as names to elements of the chess club list
names(chess_club) <- chess_club_names

# Task 5 - Indexing lists
# (a) Index the 4th object in the list
meeting_matrix <- chess_club[[4]]
# (b) Index the 3rd object of the list to return the 2nd element of that object
club_second_due <- chess_club[[3]][2]

# Task 6 - Modifying list elements
# (a) Change the 3rd element of club_dues to 5
chess_club[[3]][3]  <- 5
# (b) Display 3rd element of club_dues in chess_club to check it has changed
chess_club[[3]][3]

# Task 7 - Appending elements to a list
first_years <- c(12, 15)
names(first_years) <- c("fall", "spring")
# (a) Add first_years vector as an object to the end of chess_club
chess_club[["first_years"]] <- first_years
# (b) Index chess_club to display the no. of 1st yr students involved in spring
chess_club$first_years[[2]]

# Task 8 - Removing elements from a list
chess_club <- list("club_title" = c("Chess Club"),
                   "club_description" = c("Meet 2 nights a week play chess.
                                          Snacks are provided."),
                   "club_dues" = c(50, 20, 15),
                   "club_meetings" = rbind(c("Monday", "Wednesday"),
                                           c("6:00 pm", "8:00 pm")),
                   "first_years" = c("fall" = 12, "spring" = 15))
# (a) Remove the 1st object from the list
chess_club_without_1 <- chess_club[-1]
# (b) Remove the object at the 3rd and 4th positions of the lsit
chess_club_without_34 <- chess_club[-c(3, 4)]

# Task 9 - Comining lists
# (a) Create a lists of lists within university_clubs
university_clubs <- list(rugby_club = rugby_club,
                         ballroom_dancing = ballroom_dancing,
                         chess_club = chess_club)