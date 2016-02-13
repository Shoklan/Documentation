#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- Regression
##- cor()
##- pairs.panels()
##- rpart
##- MAE

#----------
# Chapter 6

insurance = read.csv("insurance.csv", stringsAsFactors = TRUE)
str(insurance)

summary(insurance$charges)
hist(insurance$charges)

table(insurance$region)

cor(insurance[c("age", "bmi", "children", "charges")])

#         age       bmi       children   charges
#age      1.0000000 0.1092719 0.04246900 0.29900819
#bmi      0.1092719 1.0000000 0.01275890 0.19834097
#children 0.0424690 0.0127589 1.00000000 0.06799823
#charges  0.2990082 0.1983410 0.06799823 1.00000000

pairs(insurance[c("age", "bmi", "children", "charges")])

pairs.panels(insurance[c("age", "bmi", "children", "charges")])

# ins_model <- lm(charges ~ age + children + bmi + sex +smoker + region, data = insurance)
ins_model <- lm(charges ~ ., data = insurance)
ins_model

summary(ins_model)

## Entering advanced Regression
# Polynomial relation
insurance$age2 <- insurance$age^2

# Binomial relationship
insurance$bmi30 <- ifelse(insurance$bmi >= 30, 1, 0)

# bmi30 * smoker shows interaction in the formula; stands for ~ bmi + smokeryes + bmi:smokeryes

ins_model2 <- lm(charges ~ age + age2 + children + bmi + sex +
                   bmi30*smoker + region, data = insurance)
summary(ins_model2)


############
# WINE
####

wine <- read.csv("whitewines.csv")

str(wine)

hist(wine$quality)

wine_train = wine[1:3750, ]
wine_test  = wine[3750:4898, ]

library(rpart)
m.rpart <- rpart(quality ~., data = wine_train)

m.rpart

# Mean Absolute Error:
MAE <- function(actual, predicted){
  mean(abs(actual - predicted))
}

library(RWeka)
m.m5p <- M5P(quality ~ ., data = wine_train)

p.m5p <- predict(m.m5p, wine_test)
summary(p.m5p)
cor(p.m5p, wine_test$quality)

