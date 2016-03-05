#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- C11
##- Caret
##- ipred

#----------
# Chapter 11

credit <- read.csv("credit.csv")

library(caret)
set.seed(300)
m <- train(default ~., data = credit, method = "C5.0")


p <- predict(m, credit)
table(p, credit$default)

?trainControl

# install.packages("ipred")
library(ipred)

set.seed(300)
mybag = bagging(default~., data = credit, nbagg = 25)

cred_predict <- predict(mybag, credit)
table(cred_predict, credit$default)

set.seed(300)
ctrl <- trainControl(method = "cv", number = 10)
train(default~., data = credit, method = "treebag", trControl = ctrl)

bagctrl <- bagControl(fit = svmBag$fit, predict = svmBag$pred, aggregate = svmBag$aggregate)

set.seed(300)
svmBag <- train(default~., data = credit, "bag", trControl = ctrl, bagControl = bagctrl)
