#print(mtcars)
dataset <- mtcars[,c("mpg", "disp", "hp", "wt")]
#dataset <- mtcars[,5]
#head(dataset)
print(dataset)


# model <- lm(mpg ~ disp + hp + wt, data = dataset)
# print(model)

# dataset2 <-data.frame(disp=221, hp=102, wt=2.91)
# predict(model, dataset2)
# dataset2 <-data.frame(disp=221, hp=102, wt=5)
# predict(model, dataset2)
