library(data.table)
# The data.table package is pre-loaded

# Create my_first_data_table
my_first_data_table = data.table(x = c("a", "b", "c", "d", "e"), y = c(1,2,3,4,5))

# Create a data.table using recycling
DT = data.table(a = as.integer(c(1,2)), b = c('A', 'B', 'C', 'D'))

# Print the third row to the console
DT[3]

# Print the second and third row to the console, but do not commas
DT[2:3]