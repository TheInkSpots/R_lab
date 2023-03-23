# myString = "stinghello"
# print(myString)


# vec = c(1,2,3,4,5,6)
# class(vec)


# obj = {4L}
# list1 = list(c(1,2,3,4),21,"helo",obj, TRUE)
# print(list1)


# matrix(vec, nrow = 3, ncol = 2 , byrow = TRUE)


# array(vec, dim= c(3,3,2))


apple_colors =  c("red","yellow","red","green","green","red","green","red","red","red","green")
appleFactor = factor(apple_colors)
print(appleFactor)
print(nlevels(appleFactor))


BMI = data.frame(
    sex= c("M","M","M","M","M","M","F","M","F"),
    height=c(123,123,123,123,123,123,123,123,321),
    weight=c(234,234,234,234,234,432,432,432,234), 
    row.names = NULL,
    check.rows = FALSE,
    check.names = TRUE,
    stringsAsFactors = FALSE
)

print(BMI)