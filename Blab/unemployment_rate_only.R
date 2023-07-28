library(quantmod)
library(forecast) 
library(ggplot2)


unemploy <- getSymbols(Symbols = "UNRATE", src = "FRED", auto.assign = FALSE)
print(head(unemploy))

rainfall <- unemploy[, c("UNRATE")]  #only get the unemployment rate
ts <- ts(rainfall, start = c(1948, 1), frequency = 12)

#autoplot(ts)
#autoplot(diff(ts))
#ggAcf(diff(ts))

BoxCox.lambda(ts) #[1] 1.5168

fit0 <- auto.arima(ts)
fit1 <- auto.arima(ts, stepwise = FALSE) 

summary(fit0)
print("\n\r ===summary==== \n\r")
summary(fit1)

#checkresiduals(fit0)
#checkresiduals(fit1)

fit0 %>% forecast(h = 12)
print("\n\r ===forecast==== \n\r")
fit1 %>% forecast(h = 12)
#fit0 %>% forecast(h = 12) %>% autoplot() + ylab("fit0 Unemployment Rate Forecasting")
#fit1 %>% forecast(h = 12) %>% autoplot() + ylab("fit1 Unemployment Rate Forecasting")