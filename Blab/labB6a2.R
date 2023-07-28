data("USArrests")
data.scaled <- scale(USArrests)
head(data.scaled)

set.seed(123)
model <- kmeans(data.scaled, centers=4, nstart = 25)
print(model)

data.labeled <- cbind(data.scaled, cluster = model$cluster)