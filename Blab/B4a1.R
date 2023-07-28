# install.packages("party")
# library("party") ; library("caret") 
library("party")
library("caret")

#selet data iris , seet randomness , split data to train / test ,
# species = results, p = ratio of train/tset
data(iris)
set.seed(12)
train.ratio <- createDataPartition(iris$Species, p=0.8, list=FALSE)
train.data <- iris[train.ratio, ]
test.data <- iris[-train.ratio, ]


model = ctree(formula=Species~., data=train.data) # train the model

# plot(model) #gen gragphy

test.result <- predict(model, test.data)
print(test.result)
cm = confusionMatrix(test.data$Species, test.result) # detail of the testing result (accuracy)
print(cm)



input <- data.frame(Sepal.Length=5.0, Sepal.Width=2.0, Petal.Length=1.5, Petal.Width=3)
predict(model, input)
