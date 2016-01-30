#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- C4
##- Naive Bayes
##- Laplace estimator
##- bag-of-words
##- package(tm)

 #install.packages("tm")

## --------
# Chapter 4

sms_raw <- read.csv("sms_spam.csv", stringsAsFactors = FALSE)

str(sms_raw)
sms_raw$type = factor(sms_raw$type)
table(sms_raw$type)

# tm could be very useful for the project
library(tm)

sms_corpus = Corpus(VectorSource(sms_raw$text))
# Corpus creates an object to store text

