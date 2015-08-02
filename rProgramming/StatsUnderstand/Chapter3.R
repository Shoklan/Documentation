# AUTHOR: COLLIN MITCHELL
# DATE: 2015/7/26
# PURPOSE:
#        | This folder is for teaching myself Statistics using the textbook from my
#        | Statistics 101 class from Monroe Community College.
#        | This is for Chapter 3 of the book.
####################################################################################

# 3.1 Measure of Central Tendency
#   Mean: A number that is the cumulative over total datapoints.
# Median: The middle number of a sorted dataset
#   Mode: A Number that occurs the most

lettersInSentence <- c(5,3,7,2,4,4,2,4,8,3,4,3,4)
# R does not seam to have a mode function?
# Creating function statMode.
lettersMode <- statMode(lettersInSentence)
print(lettersMode)

# Median exists
pricePerOunce <- c(19,19,27,28,18,35)
print(median(pricePerOunce))

creditHours <- c(17,12,14,17,13,16,18,20,13,12,
                 12,17,16,15,14,12,12,13,17,14,
                 15,12,15,16,12,18,20,19,12,15,
                 18,14,16,17,15,19,12,13,12,15)
hoursSorted <- sort(creditHours)

# This list has the medain and the mode for the dataset.
answers <- list(median=median(hoursSorted), mode=statMode(creditHours))
print(answers)

# The Mean is (sum of all data/tota number of data points)
grades <- c(58, 67, 60, 84, 93, 98, 100)
print(mean(grades))

# Don't forget about the 5% trimmed mean!
# 1] Order the data.
# 2] CUt off 5% off top and bottom.
# 3] Calculate mean!

# Weighted Mean!
# You just use the decimal version of the amount of weight.
# I.e. if a number is 50%, then you'd take the number - 70 -
# and multiply the number via the weight for all numbers.
# So, it would be .5 * 70.

# 3.2 Measures of Variation
# Range, Variance, Standard Deviation
# Range: the difference between the largest and the smallest values.

# We're going to us the computational formula for getting the variance and
# standard deviation
# variance = (SumOfSquares - SquareofSums/total)/(total-1)
data <- c(2,3,3,8,10,10)
variance <- calcVariance(data)
standardDeviation <- calcStd(data)

# Coefficient of Variation?
# The standard deviation in as a percentage of the sample/population mean
CoV <- calcStd(data)/xBar(data)

# Chebyshev's Theorum is really cool.
# Summed up, as the number of standard deviations increases the amount of data
# drastically increases. It will cover this soon, but 94% of data falls within
# 3 standard deviations.
# 75% > 88.9% > 93.8%
k <- c(1,2,3,4)

chebyTheorum <- (1 - 1/k^2)
print(chebyTheorum)

# 3.3 Percentiles and Box-And-Whisker Plots
# Interpret the meaning of percentile scores.
# Compute the median, quartiles, and five-number summary from raw data
# Make a box-and-whisker plot.
# Describe how a box-and-whisker plot indicates spread of data about the median.


# Q1 is the 25th percentile, [Median of lower half]
# Q2 is the median,
# Q3 is the 75th percentile. [Median of upper half]
quartile<- c(.99, 1.07, 1.00, .5, .37, 1.03, 1.07, 1,07, .97, .63, .33, .5, .97, 1.08, .47, .84, 1.23, .25, .5, .4, .33, .35, .17, .38, .2, .18, .16)
boxplot(quartile)

# The interquartile range is Q3-Q1 .




# Functions:
  # Calculate mode
statMode <- function(x){
  temp <- table(as.vector(x))
  names(temp)[temp == max(temp)]
}

  # Calualte xBar of the dataset.
xBar <- function(data){
  sum(data)/length(data)
}

  # Calculate variance
calcVariance <- function(data){
  ((sum(data*data) - (sum(data)^2)/length(data))/(length(data)-1))
}
  # Calculate the Standard Deviation
calcStd <- function(data){
  sqrt(calcVariance(data))
}
