# Collin Mitchell
# 7/3/2015

# It looks like R uses vectors instead of variables.

# There are multiple forms of assinment:
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
assign("y", c(10.4, 5.6, 3.1, 6.4, 21.7))
c(10.4, 5.6, 3.1, 6.4, 21.7) -> z

# Example of vector values reciprical
1/x

# Vector arithmatic?
v <- 2*x + y + 1

# Looks like it can do imaginary numbers too.
# this will fail, but
sqrt(-17)

# this will work
sqrt(-17+0i)

# seq(to, from, by/step, length)
seq(-5, 5, by=.2) -> s3

# note: ALWAYS USE TRUE AND FALSE INSTEAD OF T AND F.
# T and F can be overridden.

# This functino check is something is "Not available" or, the None/NaN of R.
# I lied; R has NaN still. SO, it has a NA and NaN.
is.na(x)
# DIVIDE BY 0!!!!!!!!!!!!!!!!!1
0/0
