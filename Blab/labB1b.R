data(cars)
head(cars)
cor(cars$speed, cars$dist)

model <- lm(dist ~ speed, cars)
print(model)

predict(model, data.frame(speed=20))

# Give the chart file a name.
# png(file = "yyyyylinearregression.png")

# # Plot the chart.
# plot(predictor.x, response.y, col = "blue", main="Height & Weight Regression",
# abline(lm(response.y ~ predictor.x)), xlab="Height in cm", ylab="Weight in Kg")

# # Save the file.
# dev.off()