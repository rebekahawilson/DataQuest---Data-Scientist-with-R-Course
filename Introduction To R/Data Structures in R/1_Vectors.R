# Task 1
# (a) Create a vector storing 4, repeated 10 times
vector_1 <- rep(4, times = 10)
# (b) Create a range of values from 1 to 12
vector_2 <- rep(1:12)
# (c) Create a sequence from 2 to 5.5 by 0.25
vector_3 <- seq(from = 2.0, to = 5.50, by = 0.25)

# Task 2
# (a) Create integer vector containing Exams, Homework, and Project grades
math_grades <- c(92L, 87L, 85L)
# (b) Create double vector containing Exam grades for all classes
exam_grades <- c(92.0, 90.0, 84.0, 95.0, 77.0, 92.0, 85.0)
# (c) Create logical vector containing if it is a STEM class or not
is_stem_classes <- c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)

# Task 3
math_grades <- c(92L, 87L, 85L)
exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
# (a) Index the 1st element of the vector math_grades
math_exam_grade <- math_grades[c(1)]
# (b) Index the 2nd, 3rd, 6th positions of exam_grades
desired_exam_grades <- exam_grades[c(2,3,6)]
# (c) Select the 3rd - 7th elements of exam_grades
non_stem_exam_grades <- exam_grades[c(3:7)]

# Task 4
is_stem_classes <- c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
# (a) Create a vector containing homework grades
homework_grades <- c(87, 81, 95, 86, 85, 90, 88)
# (b) Select grades of STEM classes
preferred_homework_grades <- homework_grades[is_stem_classes]

# Task 5
math_grades <- c(92L, 87L, 85L)
exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
is_stem_classes <- c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
# (a) Replace the second element in math_grades by 80L
math_grades[c(2)] <- 80L
# (b) Replace the STEM exam grades with 92
exam_grades[is_stem_classes] <- 92

# Task 6
# (a) Create vector containing STEM information
extra_is_stem_classes <- c(TRUE, FALSE, FALSE)
# (b) Add elements to the end of is_stem_classes
new_is_stem_classes_end <- c(is_stem_classes, extra_is_stem_classes)
# (c) Add elements to the beginning of is_stem_classes
new_is_stem_classes_start <- c(extra_is_stem_classes, is_stem_classes)

# Task 7
math_grades <- c(92L, 87L, 85L)
exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
# (a) Remove first element form math_grades vector
math_without_exam_grades <- math_grades[c(-1)]
# (b) Remove exam grades less than 90 (positions 3rd, 5th, 7th)
above_90_exam_grades <- math_grades[-c(3, 5, 7)]

# Task 8
exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
homework_grades <- c(87, 81, 95, 86, 85, 90, 88)
project_grades <- c(85, 92, 79, 93, 90, 91, 95)
# (a) Sum of the score for each class
class_scores_sum <- exam_grades + homework_grades + project_grades
# (b) Calculate avg score for each class
class_scores_avg <- class_scores_sum / 3

# Task 9
exam_grades <- c(92, 90, 84)
homework_grades <- c(87, 81, 95, 86, 85, 90, 88)
project_grades <- c(85, 92, 79, 93, 90, 91, 95)
# (a) Sum of the score for each class
class_scores_sum_recycled <- exam_grades + homework_grades + project_grades
# (b) Calculate avg score for each class
class_scores_avg_recycled <- class_scores_sum_recycled / 3