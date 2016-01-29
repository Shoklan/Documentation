#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- C3
# 
library(data.table)

## --------
# Chapter 3

data = read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)
str(data)

# Always remove ID vars
data = data[-1]

# Result we're looking for
table(data$diagnosis)

# replace diag with meaning values; ML classifiers prefer factor vars
data$diagnosis = factor(data$diagnosis, levels = c("B", "M"),
                        labels = c("Benign", "Malignant"))

# percents?
round(prop.table(table(data$diagnosis)) * 100, digits =1)

# summary data
summary(data[c("radius_mean", "area_mean", "smoothness_mean")])

# Time to normalize
normalize <- function(x){
  return((x - min(x))/(max(x) - min(x)))
}

# now normalize them
data_n <- as.data.frame(lapply(data[2:31], normalize))

# Check to ensure that they actually did:
summary(data_n$area_mean)
# Confirmed

# Splitting into train/set sets
data_train <- data_n[1:469,]
data_test <- data_n[1:469,]

# collection diagnosis values
data_train_labels <- data[1:469, 1]
data_test_labels <- data[470:569, 1]

library(class)

