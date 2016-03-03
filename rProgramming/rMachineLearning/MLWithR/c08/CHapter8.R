#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- C8
##- Apriori Principle
##- Sparse Matrix
##- arules package
#----------
# Chapter 8

# Set Theory rears its head and, thankfully, I'm reasonably versed in it.

data = read.csv("groceries.csv")
head(data)

# install.packages("arules")
library(arules)

groceries <- read.transactions("groceries.csv", sep= ",")
summary(groceries)




image(sample(groceries, 100))

groceryrules = apriori(groceries, parameter = list(support = .006, confidence = .25, minlen = 2))
groceryrules

summary(groceryrules)

# This package is awesome; that I can use transactions basically as vectors is really clever.
inspect(groceryrules[1:3])

# arules has a sort function of its own.
inspect( sort(groceryrules, by = "lift")[1:5] )

berryrules <- subset(groceryrules, items %in% "berries")
inspect(berryrules)

# %ain% and %pin% are interesting too; a = all, p = partial
# these are used in conjunction with subset()

# I already know about write and I don't want to include it
write(groceryrules, file = "groceryrules.csv", sep = ",", quote = TRUE, row.names = FALSE)

