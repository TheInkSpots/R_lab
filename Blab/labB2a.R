dataset <- mtcars[, c("am", "cyl", "hp", "wt")]
am.model = glm(formula=am~cyl+hp+wt, data=dataset, family=binomial)
summary(am.model)

print("----------------------------------------------------------------")

input<-data.frame(cyl=6, hp=110, wt=2.62)
predict(am.model, input, type="response")

input<-data.frame(cyl=8, hp=230, wt=5.345)
predict(am.model, input, type="response")
