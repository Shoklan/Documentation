#  Author: Collin Mitchell
#    Date: 2016/3/11
# Purpose: GGvis Tutorial at Data Camp
#--------------------------------------


# install.packages("ggvis")
library(ggvis)

#---------
# Part 1
#---------
# change the code below to plot the disp variable of mtcars on the x axis
# Source: mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
mtcars %>% ggvis(~disp, ~mpg) %>% layer_points()

# Change the code below to make a graph with red points
#Source: mtcars %>% ggvis(~wt, ~mpg, fill := "blue") %>% layer_points()
mtcars %>% ggvis(~wt, ~mpg, fill := "red") %>% layer_points()

# Change the code below draw smooths instead of points
#Source: mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()

# Change the code below to make a graph containing both points and a smoothed summary line
#Source: mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>% layer_smooths()

#---------
# Part 2
#---------
# Make a scatterplot of the pressure dataset
pressure %>% ggvis(~temperature, ~pressure) %>% layer_points()

# Adapt the code you wrote for the first challenge: show bars instead of points
pressure %>% ggvis(~temperature, ~pressure) %>% layer_bars()

# Adapt the code you wrote for the first challenge: show lines instead of points
pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines()

# Adapt the code you wrote for the first challenge: map the fill property to the temperature variable
pressure %>% ggvis(~temperature, ~pressure, fill = ~temperature) %>% layer_points()

# Extend the code you wrote for the previous challenge: map the size property to the pressure variable
pressure %>% ggvis(~temperature, ~pressure, fill = ~temperature, size = ~pressure) %>% layer_points()

#---------
# Part 2
#---------
