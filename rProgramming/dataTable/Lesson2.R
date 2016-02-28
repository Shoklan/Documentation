library(data.table)
# DT and the data.table package are pre-loaded

# Print the penultimate row of DT using .N
DT[.N-1]

# Print the column names of DT, and number of rows and number of columns
colnames(DT)
dim(DT)

# Select row 2 twice and row 3, returning a data.table with three rows where row 2 is a duplicate of row 1.
DT[c(2,2,3)]