#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- C5
##- J Ross Quinlan
##- RWeka
##- OneR()
##- JRip()

#----------
# Chapter 5

data = read.csv("C:\\Users\\mitcolli\\Downloads\\storage\\code\\chapter 5\\mushrooms.csv", stringsAsFactors = TRUE)

str(data)

# veil_type provides no info
data$veil_type <- NULL


table(data$type)

# edible poisonous 
# 4208      3916

# install.packages("RWeka")
library(RWeka)
?formula

data_1R <- OneR(type ~ ., data = data)
data_1R

# from RWeka package
?JRip

data_JRip <- JRip(type ~ ., data = data)
data_JRip
