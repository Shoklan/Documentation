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
##- package(e1071) | naiveBayes()

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
corpus_clean <- tm_map(corpus_clean, removePunctuation)

# removeWords require the stopwords function/list
corpus_clean <- tm_map(corpus_clean, removeWords, stopwords())

# Not sure why 
corpus_clean <- tm_map(corpus_clean, stripWhitespace)

sms_dtm = DocumentTermMatrix(corpus_clean)

# Test / Train
sms_raw_train <- sms_raw[1:4169, ]
sms_raw_test  <- sms_raw[4170:5559, ]

# match up with DocumentTermMatrix
sms_dtm_train <- sms_dtm[1:4169, ]
sms_dtm_test  <- sms_dtm[4170:5559, ]

# Finally, match up with corpus
sms_corpus_train <- corpus_clean[1:4169]
sms_corpus_test  <- corpus_clean[4170:5559]

# What do we need all three for?

# Make sure the data split are represetnative:
prop.table(table(sms_raw_train$type))
# ham      spam 
# 0.8647158 0.1352842

prop.table(table(sms_raw_test$type))
#  ham      spam 
# 0.8683453 0.1316547

# There is a negative pushback agaisnt word clouds, so I'll need to figure out why that is
# install.packages("wordcloud")
library(wordcloud)

# Still pretty cool.
wordcloud(sms_corpus_train, min.freq = 40, random.order = FALSE)

# This shouldn't be that hard to do; it's just a size adjustment based on a normalization of the freq counts.
# The hard part would be drawing it as a plot.

spam <- subset(sms_raw_train, type == "spam")
ham  <- subset(sms_raw_train, type == "ham")

wordcloud(spam$text, max.words = 40, scale = c(3, 0.5))
wordcloud(ham$text, max.words = 40, scale = c(3, 0.5))

# depends: tm
findFreqTerms(sms_dtm_train, 5)

# collect and store words
sms_dict <- Dictionary(findFreqTerms(sms_dtm_train, 5))
# I can't find this function...
# 

#################################################################################################
# Anything past this point wont work until I can figure out where Dictionary() is and install it.

sms_train <- DocumentTermMatrix(sms_corpus_train, list(dictionary = sms_dict))
sms_test  <- DocumentTermMatrix(sms_corpus_test, list(dictionary = sms_dict))


convert_counts <- function(x) {
  x <- ifelse(x > 0, 1, 0)
  x <- factor(x, levels = c(0, 1), labels = c("No", "Yes"))
  return(x)
}

sms_train <- apply(sms_train, MARGIN = 2, convert_counts)
sms_test  <- apply(sms_test, MARGIN = 2, convert_counts)

# install.packages("e1071")
library(e1071)

# This is the Naive Bayes Model object
sms_classifier <- naiveBayes(sms_train, sms_raw_train$type)

# this is the prediction
sms_test_pred <- predict(sms_classifier, sms_test)

# install.packages("gmodels")
library(gmodels)
CrossTable(sms_test_pred, sms_raw_test$type,
             prop.chisq = FALSE, prop.t = FALSE,
             dnn = c('predicted', 'actual'))

# Add the laplace transform
sms_classifier2 <- naiveBayes(sms_train, sms_raw_train$type, laplace = 1)
sms_test_pred2 <- predict(sms_classifier2, sms_test)

CrossTable(sms_test_pred2, sms_raw_test$type,
           prop.chisq = FALSE, prop.t = FALSE, prop.r = FALSE,
           dnn = c('predicted', 'actual'))
