# Collin Mitchell
# 7/23/2015

# What does rnorm do?
# Density, distribution function, quantile function
# and random generation for the normal distribution 
# with mean equal to mean and standard deviation equal to sd.
?rnorm
n <- rnorm(1)

# ls can filter items
ls(pat="n")

# ls.str() will list extra data
ls.str()

n1 <- 10
n2 <- 10
name <- "Carmen"
m <- .5

M <- data.frame(n1, n2, m)

# Confirmed: "A vector is a variable in the commonly admitted meaning" p.11

# I want numbers from 1-200, with a 2# step.
sequence<- seq(1,200, 2)

# I NEED TO DEFINE ALL OF THESE AT SOME POINT
#############################################
# Gaussian (normal) rnorm(n, mean=0, sd=1)
# exponential rexp(n, rate=1)
# gamma rgamma(n, shape, scale=1)
# Poisson rpois(n, lambda)
# Weibull rweibull(n, shape, scale=1)
# Cauchy rcauchy(n, location=0, scale=1)
# beta rbeta(n, shape1, shape2)
# ‘Student’ (t) rt(n, df)
# Fisher–Snedecor (F) rf(n, df1, df2)
# Pearson (χ2) rchisq(n, df)
# binomial rbinom(n, size, prob)
# multinomial rmultinom(n, size, prob)
# geometric rgeom(n, prob)
# Hypergeometric rhyper(nn, m, n, k)
# logistic rlogis(n, location=0, scale=1)
# lognormal rlnorm(n, meanlog=0, sdlog=1)
# negative binomial rnbinom(n, size, prob)
# uniform runif(n, min=0, max=1)
# Wilcoxon’s statistics rwilcox(nn, m, n), rsignrank(nn, n)

# Factors
factorVariable <- factor(1:3)

# Factors tell you what is in a vector as well as the unique value.

# Matrices
matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)
# Always remember that R uses rows then columns for everything.
# Let's mess around with matrices
m <- matrix(1:20, 5, 4)


# What is ts() for?

# Expressions are awesome!
quadraticExpP <- expression(-b + (sqrt(b*b -4*a*c)/2))
quadraticExpM <- expression(-b - (sqrt(b*b -4*a*c)/2))

# Remember that b,a,c needs to be defined!
b <- 10; a <- 5; c <- 2;

# eval will then use the expression!
eval(quadraticExpP)
eval(quadraticExpM)

# let's put them in a function so it returns them both when you put them in.
quadratic <- function(a,b,c){
  c(eval(quadraticExpP), eval(quadraticExpM))
}

# It works, but doesn't include a case for negative numbers. But, oh well.

# Changing object Types:
##### Numeric:   as.numeric()
#        FALSE - 0
#         TRUE - 1
#          "7" - 7
#          "a" - NA
##### Logical:   as.logical()
#            0 - FALSE
#     #'s != 0 - TRUE
#      "FALSE" - FALSE
#       "TRUE" - TRUE
#      "CHARS" - NA
##### Character  as.character()
#          1,2 - "1", "2"
#        FALSE - "TRUE"
#         TRUE - "TRUE"

# Boolean comparison's are applied against all items in a vector.

# ACCESSING DATA! FINALLY!
# Indexing with vectors is easy.
# A matrix data can be acessed using m[i,j], where i=row;j=col.
#    Make sure to include the comma at all time.

# Negative indexes can be used to suppress rows/columns.

# NOTE: You can use Boolean expressions to select against index values!
#
#  MATRIX
#    col names: 
#                 name1    name 2
#    row names: 
#       name 3      a       y
#
#       name 4      x       b
#
#   To get b, call MATRIX["name 4", "name 2"]

# Whoa, there is a GUI data edit prog?
# data.entry(x) ?
data.entry(m)

# That's pretty cool!
data <- c(1,5,7987,10,7,1,5)

# This will return the indexes instead of the elements.
which.max(data)
which.min(data)

# We're going to go for a few test runs on cor()
# dataset 2
data2 <- c(1,1,1,5,1,1,1)
cor(data,data2)

# which is used for selection from a vector
which(data == 1)


# I don't know as much about matrixes and I'd like;
# I could probably use the Khan academy lectures to teach myself this along with;
# some R/Python code. Probably R since I can graph stuff faster.

library(ggplot2)
ggplot2(data)
?ggplot2

# GRRRR I need to learn about matrixes; I'm sure I have a ebook on it in my collection.
?diag

# GRAPHS!
demo(graphics)

mat <- matrix(1:4,2,2)

# Practical example
x <- rnorm(10)
y <- rnorm(10)
plot(x,y)


# Skipping around a bit since I wont be using most of these graph types!
# Statistics time at last!

# Chapter 5 | Statistical Analyses with R

data(InsectSprays)
aov.spray <- aov(sqrt(InsectSprays$count) ~ InsectSprays$spray)

x <- y <- rnorm(5)


# 