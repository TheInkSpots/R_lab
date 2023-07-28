data(iris)
library("caret")
set.seed(12)

#split the data
train.ratio <- createDataPartition(iris$Species, p=0.8, list=FALSE)
train.data <- iris[train.ratio, ]
test.data <- iris[-train.ratio, ]

#normalize the data
train.data.scaled <- scale(train.data[, 1:4])
test.data.scaled <- scale(test.data[, 1:4])
