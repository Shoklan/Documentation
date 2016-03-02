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
