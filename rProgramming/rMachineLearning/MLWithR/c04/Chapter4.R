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

# The latest version of tm (0.60) made it so you can't
# use functions with tm_map that operate on simple character
# values any more. So the problem is your tolower step since
# that isn't a "canonical" transformation (See getTransformations()).
# Just replace it with:
#       corpus <- tm_map(corpus, content_transformer(tolower))
#
# Source: http://stackoverflow.com/questions/24771165/r-project-no-applicable-method-for-meta-applied-to-an-object-of-class-charact

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

# 
print(sms_corpus)

# tm_map is what is used to alter 
# corpus_clean = tm_map(sms_corpus, tolower) // This is what works from the older version; now use this:
corpus_clean = tm_map(sms_corpus, content_transformer(tolower))
corpus_clean = tm_map(corpus_clean, removeNumbers)

# removeWords require the stopwords function/list
corpus_clean <- tm_map(corpus_clean, removeWords, stopwords())

# Not sure why 
corpus_clean <- tm_map(corpus_clean, stripWhitespace)

sms_dtm = DocumentTermMatrix(corpus_clean)
