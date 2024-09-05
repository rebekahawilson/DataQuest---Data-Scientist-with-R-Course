# Using data provided in course
# Task 1 - 
# (a) Check if apples sold were greater than the lemons in day 2:
188L > 476L
# (b) Check if the purchase price of apples is the same as mangoes:
10.50 == 21.15

# Task 2 - 
# (a) Store total cost of sold apples on day 2
apple_sold <- 12.10 * 12L
# (b) Store total cost of sold lemons on day 2
lemon_sold <- 4.99 * 24L
# (c) Check if no. apples sold is equal to lemons sold.
logical_var <- apple_sold == lemon_sold

# Task 3 - Logical operations
# (a) Write the operation that performs TRUE OR FALSE.
TRUE || FALSE 
# (b) Write the operation that performs FALSE AND TRUE.
FALSE && TRUE 
# (c) Write the operation that performs NOT FALSE.
!FALSE

# Task 4 - Compare profits from day 2
# (a) Calculate the profit of apples, mangoes, and lemons, individually
apple_profit <- 12.10 - 10.50 
mango_profit <- 24.90 - 21.15
lemon_profit <- 4.99 - 3.20
# (b) Compare the 3 profits
logical_var <- apple_profit <= mango_profit || apple_profit >= lemon_profit 
