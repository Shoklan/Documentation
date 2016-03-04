#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- C10
##- Confusion Matrix
#----------
# Chapter 10

sms_results <- read.csv("sms_results.csv")
head(sms_results)

# Accuracy:
#         True Positive + True Negative
#  Acc = ------------------------------
#                  Total

# Error Rate = 1 - Acc

# Create Confusion Matrix
table(sms_results$actual_type, sms_results$predict_type)

#install.packages("gmodels")
library(gmodels)

# use awesome CrossTable
CrossTable(sms_results$actual_type, sms_results$predict_type)

#install.packages("caret")
library(caret)

confusionMatrix(sms_results$predict_type, sms_results$actual_type, positive = "spam")
