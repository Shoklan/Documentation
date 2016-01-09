# Load data
data(iris)

# Assign color by Species
iris$color = sapply(iris$Species, function(x) switch(as.character(x),
setosa = "red",
veriscolor = "green",
virginica = "blue"))