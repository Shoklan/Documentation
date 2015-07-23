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