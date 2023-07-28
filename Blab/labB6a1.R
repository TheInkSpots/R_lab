data(iris)

set.seed(123)
iris_no_label <- iris[, -5]
model <- kmeans(iris_no_label, centers=3, nstart=20)
print(model)

iris_clustered <- cbind(iris_no_label, cluster=model$cluster)
print(iris_clustered[c(1:4, 70:74, 110:104), ])
fg
cm <- table(iris$Species, model$cluster)
print(cm)

library("cluster")

# clusplot(iris_no_label[, c("Petal.Length", "Petal.Width")], 
# 	model$cluster, 
# 	lines=0, 
# 	main="Clustering of Plants",
# 	xlab="Petal.Length",
# 	ylab="Petal.Width",
# 	color=T)
