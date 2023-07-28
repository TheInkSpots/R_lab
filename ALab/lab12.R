# # Create data for the graph.
# x <- c(21, 62, 10, 53)
# labels <- c("London", "New York", "Singapore", "Mumbai")

# # Give the chart file a name.
# png(file = "city.png")

# # Plot the chart.
# pie(x,labels)

# # Save the file.
# dev.off()





# # Create data for the graph.
# x <- c(21, 62, 10, 53)
# labels <- c("London", "New York", "Singapore", "Mumbai")

# # Give the chart file a name.
# png(file = "city_title_colours.jpg")

# # Plot the chart with title and rainbow color pallet.
# pie(x, labels, main="City pie chart", col=rainbow(length(x)))

# # Save the file.
# dev.off()




# # Create data for the graph.
# x <-  c(21, 62, 10,53)

# piepercent<- round(100*x/sum(x), 1)

# # Give the chart file a name.
# png(file = "city_percentage_legends.jpg")

# # Plot the chart.
# pie(x, labels=piepercent, main = "City pie chart",col = rainbow(length(x)))
# legend("topright", c("London","New York","Singapore","Mumbai"), cex = 0.8,
#    fill = rainbow(length(x)))

# # Save the file.
# dev.off()





# # Get the library.
# library(plotrix)

# # Create data for the graph.
# x <-  c(21, 62, 10,53)
# lbl <-  c("London","New York","Singapore","Mumbai")

# # Give the chart file a name.
# png(file = "3d_pie_chart.jpg")

# # Plot the chart.
# pie3D(x,labels = lbl,explode = 0.1, main = "Pie Chart of Countries ")

# # Save the file.
# dev.off()


# # Create the data for the chart
# H <- c(7,12,28,3,41)

# # Give the chart file a name
# png(file = "barchart.png")

# # Plot the bar chart 
# barplot(H)

# # Save the file
# dev.off()



# # Create the data for the chart
# H <- c(7,12,28,3,41)
# M <- c("Mar","Apr","May","Jun","Jul")

# # Give the chart file a name
# png(file = "barchart_months_revenue.png")

# # Plot the bar chart 
# barplot(H,names.arg=M,xlab="Month",ylab="Revenue",col="blue",
# main="Revenue chart",border="red")

# # Save the file
# dev.off()


# Create the input vectors.
colors = c("green","orange","brown")
months <- c("Mar","Apr","May","Jun","Jul")
regions <- c("East","West","North")

# Create the matrix of the values.
Values <- matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11), nrow = 3, ncol = 5, byrow = TRUE)

# Give the chart file a name
png(file = "barchart_not_stacked.png")

# Create the bar chart
# barplot(Values, main="total revenue", names.arg=months, xlab="month", ylab="revenue", col=colors)
barplot(Values, main="total revenue", names.arg=months, xlab="month", ylab="revenue", col=colors, beside=TRUE)


# Add the legend to the chart
legend("topleft", regions, cex = 1.3, fill = colors)

# Save the file
dev.off()