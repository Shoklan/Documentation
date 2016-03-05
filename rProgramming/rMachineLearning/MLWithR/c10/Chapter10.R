#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- C10
##- Confusion Matrix
##- VCD

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

# install.packages("vcd")
library("vcd")

#           Pr(Actual) - Pr(Error)
# Kappa =  --------------------------
#                1 - Pr(Error)
#
#   Kappa is similar, if not the same, as accuracy


Kappa(table(sms_results$actual_type, sms_results$predict_type))

# install.packages("irr")
library(irr) 

# what is kappa2?
?kappa2
kappa2(sms_results[1:2])

#                       True Positive
# Sensitivity = ------------------------------
#               True Positive + False Negative

#                         True Negative
# Specificity = ------------------------------
#                True Negative + False Positive

sens <- 154 / (154 + 29)
spec <- 1202 / (1202 + 5)

sens
spec

# caret can already do this, but it's good to know
library(caret)

sensitivity(sms_results$predict_type, sms_results$actual_type, positive = "spam")
specificity(sms_results$predict_type, sms_results$actual_type, negative = "ham")


#                      True Positive
# precision = -------------------------------
#              True Positive + False Positive

#                   True Positive
# recall = --------------------------------
#            True Positive + False Negative

# recall == sensitivity?

# F-Score; This is a big formula
##
#              2* precision * recall                       2 * True Positive
# F-Measure =  --------------------- = -----------------------------------------------------
#               recall + precision       2 * True Positive + False Positive + False Negative

# install.packages("ROCR")
library(ROCR)

pred <- prediction(predictions = sms_results$prob_spam, labels = sms_results$actual_type)


# Receiver Operating Characteristics (ROC)
perf <- performance(pred, measure = "tpr", x.measure = "fpr")

# Plot of the ROC curve; also the concept of the Area Under the Curve(AUC)
plot(perf, main = "ROC curve for SMS spam filter", col = "blue", lwd = 3)
# reference line for function with no predictive power
abline(a = 0, b = 1, lwd = 2, lty = 2)

# ROCR package can generate AUC number.
perf.auc <- performance(pred, measure = "auc")

# ?? S4 Object
str(perf.auc)

# unlist the object and then use @ to access it.
unlist(perf.auc@y.values)

# what do we get when we remove the unlist?
perf.auc@y.values

# --------------------------------------------------------------------------------------------------------
credit <- read.csv("credit.csv")

# caret has a better way of partitioning the data using createDataPartition(), so I'm not interested in including
# their version. - which they then use on the next page~

# install.packages("C50")
library(C50)

# ensure results are reproducible
set.seed(123)
folds <- createFolds(credit$default, k = 10)

cv_results <- lapply(folds, function(x){
  credit_train  <- credit[x, ]
  credit_test   <- credit[-x, ]
  credit_model  <- C5.0(default ~ ., data = credit_train)
  credit_pred   <- predict(credit_model, credit_test)
  credit_actual <- credit_test$default
  kappa <- kappa2(data.frame(credit_actual, credit_pred))$value
  return(kappa)
})

mean(unlist(cv_results))
