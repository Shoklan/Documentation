# AUTHOR: COLLIN MITCHELL
# DATE: 2015/8/15
# PURPOSE:
#        | This folder is for teaching myself Statistics using the textbook from my
#        | Statistics 101 class from Monroe Community College.
#        | This is for Chapter 5 of the book.
####################################################################################

#  Chapter 5 | The Binomial Probability Distribution and RElated Topics |

# 5.1 Introduction to Random Variables and Probability Distributions
### Check points
#   Distinguish between discrete and continuous random variables.
#   Graph discrete probability  distributions
#   Compute mew and sigma for a discrete probability Distribution.
#   Compute mew and sigma for a linear function of a random variable x.
#   Compute mew and sigma for a linear combination of two independent random variables.

# Random Variable:
##   a quantitative object x that has a possible chance of being selected.
# Discrete Random Variables: 
##   finite number of values
# Continuous Random Variables:
##   countless number of values in a line interval.

# Properties of a probability distribution:
# 1] There exists distinct probabilities for events.
# 2] Th sum of all events is 1.

# Dr. Mendoza's samples.
bordomTestResults <- c(rep(0, 1400), rep(1,2600), rep(2,3600), rep(3,6000), rep(4,4400), rep(5,1600), rep(6,400))
hist(bordomTestResults)

# The Greek letter mew for the population mean.
# The Greek letter sigma for the Population Standard Deviation.
# x Bar is for the sample probability mean.
# s is for the sample probability mean.

# mew   = Sum(P(x))| The summation of the probabilities of event X
# sigma = sqrt(Sum(x-Mew)^2P(x))

# Simulate finding the Standard Deviation of Tv purchasers
# Vector positions are = # of times infomercial viewed; 5 is actually 5+ views.
buyersVector <- c(.27, .31, .18, .09, .15)
mew <- sum(buyersVector * 1:5)
std <- sum( (1:5 - mew)^2 * buyersVector)


# 5.2 Binomial Probabilities
### Check points
# 