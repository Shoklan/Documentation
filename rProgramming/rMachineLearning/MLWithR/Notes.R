#-----------------------------------------------------------------
# This are my personal notes about the Text "Machine Learning with R"
# by Brett Lantz. I'll be splitting up the notes by chapters.

#-------------------------
# Quick Notes:
##- C2
# RMySQL requires libmysqlclient-dev to work.
# RODBC resquires unixodbc-dev to work.

## --------
# Chapter 2

# Installing package: libmyodbc on linux; need the mysql header to communicate.
# Not Successful.

# Installing package: r-cran-rodbc on linux.
# Not successful.

# Installing package: unixodbc on linux.
# Not successful.

# Installing package: libmyodbc on linux.
# Already installed.

# Installing package: odbc-postgresql on linux
# Not Successful.

# Installing package: r-cran-rmysql on linux.
# Not Successful

# Installing package: libmysqlclient-dev on linux.
# SUCCESS: RMySQL works; trying RODBC.
# Not Successful

# Installing package: unixodbc-devel on linux.
# SUCCESS: RODBC works.

# Developed by Mike Ripley.
install.packages("RODBC")
library("RODBC")

# I'm also bringing in RMySql.
install.packages("RMySQL")
# library("RMySQL")

print(vignette("RODBC"))
mydb = odbcConnect("my_dsn")

# Import data file: usedcars.csv
usedcars = read.csv("usedcars.csv", stringsAsFactors = FALSE)
str(usedcars)

# I already know about mean/median/summary/max;
# I'm just annoyed there isn't a mode function
IQR(usedcars[,c('year', 'price', 'mileage')])

# Quantile returns 5 Number Summary by default.
quantile(usedcars$price)

# You can use probs = to select slices of the quantile.
quantile(usedcars$price, probs = c(.01, .99))

boxplot(usedcars$price,
        main ="Boxplot of Used Car Prices",
        ylab="Price ($)")

hist(usedcars$price,
     main ="Histogram of Used Car Prices",
     xlab = "Price ($)" )

# I already know about the Variance, but the review doesn't hurt:
# Variance = 1/n * Summation(1,n) -> (xi - mew)^2
# Std      = sqrt(Variance)


# This function is actually REALLY useful.
table(usedcars$color)
help(table)

model_table = table(usedcars$model)
propTable = prop.table(model_table)

# My own playing:
sort(round(100 * propTable, 2))
# Works fine.

plot(x= usedcars$mileage, y = usedcars$price,
     main = 'Scatterplot of Price vs. Mileage',
     xlab = 'Used car Mileage',
     ylab = 'Used car Price')

