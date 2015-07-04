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

z <- c(1:3, NA); ind <- is.na(z)

# R uses the notation of strings like C does
# so, it should use "This is a string,\nand so is this"
?Quotes

# Reminder: R was built with linux in mind, so it's case sensitive.

labs <- paste(c("X", "Y"), 1:10, sep="")

# indexes.
y <-x[!is.na(x)]

temp <- c(1:10)
temp[5]

c("x", "y")[rep(c(1,2,2,1), times=4)]

fruit <- c(5,10,1,20)
names(fruit) <- c("orange", "banana", "apple", "peach")
lunch <- fruit[c("apple", "orange")]

# Thus, any given vector must be unambiguously either logical, numeric, complex, character or raw.
# So, lets find out what the objects I've made are classified as:
mode(fruit)    # numeric
mode(ind)      # logical
mode(labs)     # character
mode(temp)     # numeric
mode(x)        # numeric
mode(y)        # numeric
mode(z)        # numeric

# RStudio is nice enough to list the modes

# lets play with factors a bit more.
assign("lamps", rep(c(12:15), times = 8))

# levels means unique values
lampF <- factor(lamps)
levels(lampF)

# Why is there a sample variance function, but no std dv function?
var(lamps)
sqrt(var(lamps))

x <- array(1:20, dim=c(4,5))
x

# this is awesome! You can blanket target values by building another matrix
i <- array(c(1:3,3:1), dim=c(3,2))
i

# We've built our shotgun matrix!
# This is using the i[x,y] to target which values we should touch
x[i]

# Now.... FIRE!
x[i] <- 0
x

