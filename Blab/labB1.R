# Create the predictor (height) and response variable (weight).
predictor.x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
response.y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Build the linear regression model
linear.model <- lm(response.y ~ predictor.x)

# Make a prediction using the linear model by inputting the height value
input <- data.frame(predictor.x=170)
predicted.value <- predict(linear.model, input)
print(predicted.value)

# self !!!! give it a vector to data frame
predicted.value <- predict(linear.model, data.frame(predictor.x=c(123,123,234,345,456)))
print(predicted.value)


# # Give the chart file a name.
# png(file = "linearregression.png")

# # Plot the chart.
# plot(predictor.x, response.y, col = "blue", main="Height & Weight Regression",
# abline(lm(response.y ~ predictor.x)), xlab="Height in cm", ylab="Weight in Kg")

# # Save the file.
# dev.off()


print(linear.model)