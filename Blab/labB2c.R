# install.packages("caret")
library("caret")
# install.packages("mlbench")
data(BreastCancer, package="mlbench")
# str(BreastCancer)
cancer.cleaned = BreastCancer[complete.cases(BreastCancer), ]
train.ratio <- createDataPartition(cancer.cleaned$Class, p=0.7, list=FALSE)
train.data <- cancer.cleaned[train.ratio, ]
test.data <- cancer.cleaned[-train.ratio, ]

print(cancer.cleaned)

# # head(train.ratio)
# model<-glm(Class~Cell.shape, family="binomial", data=train.data)
# print(model)

# input<-data.frame(test.data)
# # write.csv(predict(model, input, type="response"), "output.csv")
# # write.csv(test.data, "data.csv")
# input<-data.frame(Cell.shape=factor(c("4")))
# predict(model, input, type="response")
