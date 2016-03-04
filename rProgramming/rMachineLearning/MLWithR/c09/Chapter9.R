#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- C9
##- Apriori Principle
##- Sparse Matrix
##- arules package
#----------
# Chapter 9

teens <- read.csv("snsdata.csv")
str(teens)

# NAs don't show up in table
table(teens$gender)
table(teens$gender, useNA = "ifany")
 
teens$age <- ifelse(teens$age >= 13 & teens$age < 20, teens$age, NA)
summary(teens$age)

teens$female    <- ifelse(teens$gender == "F" & !is.na(teens$gender), 1, 0)
teens$no_gender <- ifelse(is.na(teens$gender), 1, 0)

mean(teens$age)
mean(teens$age, na.rm = TRUE)

aggregate(data = teens, age ~ gradyear, mean, na.rm = TRUE)
?ave

ave_age <- ave(teens$age, teens$gradyear, FUN = function(x) mean(x, na.rm = TRUE) )
teens$age <- ifelse(is.na(teens$age), ave_age, teens$age)

interests <- teens[5:40]
interests_z <- as.data.frame(lapply(interests, scale))
interests_z

teen_clusters <- kmeans(interests_z, 5)
teen_clusters$size
teen_clusters$centers

mean(teen_clusters$centers[1,])
mean(teen_clusters$centers[2,])
mean(teen_clusters$centers[3,])
mean(teen_clusters$centers[4,])
mean(teen_clusters$centers[5,])

# Adding cluster data to the dataframe
teens$cluster <- teen_clusters$cluster

# Expected
aggregate(data = teens, age ~ cluster, mean)

# predict gender
aggregate(data = teens, female ~ cluster, mean)

# friend predict?
aggregate(data = teens, friends ~ cluster, mean)

