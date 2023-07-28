library(quantmod)

series_name <- "UNRATE" 

UR <- getSymbols(Symbols = series_name, src = "FRED", auto.assign = FALSE)
head(UR)
##            UNRATE
## 1948-01-01    3.4
## 1948-02-01    3.8
## 1948-03-01    4.0
## 1948-04-01    3.9
## 1948-05-01    3.5
## 1948-06-01    3.6


#forecasting the rate
library(forecast) 
library(ggplot2)

UR_ts <- ts(UR[, c("UNRATE")], start = c(1948, 1), frequency = 12)

autoplot(UR_ts)
# Plot differenced data
autoplot(diff(UR_ts))
# Plot the ACF of the differenced murder rate
ggAcf(diff(UR_ts))

# Find value for lamda to transform data and stablize variance
# See DataCamp/Forecasting Using R/Forecasting with ARIMA/Transformation for variance stabilization
# Lamda should range bt -1 (strong transformation, inverse) and 1 (no transformation)
BoxCox.lambda(UR_ts)
## [1] 0.1213181

# Fit a seasonal ARIMA model 
fit1 <- auto.arima(UR_ts)
fit2 <- auto.arima(UR_ts, stepwise = FALSE) 
# stepwise = FALSE to make auto.arima() work harder to find a good model from a larger collection of models

# Summarize the fitted model
summary(fit1)
## Series: UR_ts 
## ARIMA(2,1,2)(2,0,2)[12] 
## 
## Coefficients:
##          ar1      ar2      ma1     ma2    sar1     sar2     sma1     sma2
##       1.3447  -0.4620  -1.3430  0.6011  0.4693  -0.0908  -0.7052  -0.0109
## s.e.  0.3244   0.3011   0.2962  0.2232  0.3343   0.2147   0.3371   0.2948
## 
## sigma^2 estimated as 0.03526:  log likelihood=214.14
## AIC=-410.29   AICc=-410.07   BIC=-367.73
## 
## Training set error measures:
##                       ME      RMSE       MAE          MPE     MAPE
## Training set 0.001888911 0.1867774 0.1381358 -0.005910976 2.540821
##                   MASE        ACF1
## Training set 0.1576456 -0.02143624
summary(fit2)
## Series: UR_ts 
## ARIMA(1,1,1)(2,0,1)[12] 
## 
## Coefficients:
##          ar1      ma1    sar1     sar2     sma1
##       0.9051  -0.7641  0.4742  -0.0578  -0.7353
## s.e.  0.0264   0.0364  0.1061   0.0551   0.1016
## 
## sigma^2 estimated as 0.0369:  log likelihood=193.96
## AIC=-375.92   AICc=-375.81   BIC=-347.54
## 
## Training set error measures:
##                       ME      RMSE       MAE          MPE     MAPE
## Training set 0.001565082 0.1914109 0.1384525 0.0002427166 2.550803
##                   MASE       ACF1
## Training set 0.1580071 -0.1413604

# # Check that both models have white noise residuals
checkresiduals(fit1)

## 
##  Ljung-Box test
## 
## data:  Residuals from ARIMA(2,1,2)(2,0,2)[12]
## Q* = 28.799, df = 16, p-value = 0.02533
## 
## Model df: 8.   Total lags used: 24
checkresiduals(fit2)

## 
##  Ljung-Box test
## 
## data:  Residuals from ARIMA(1,1,1)(2,0,1)[12]
## Q* = 60.392, df = 19, p-value = 3.355e-06
## 
## Model df: 5.   Total lags used: 24

# Plot 2-year forecasts
fit1 %>% forecast(h = 24)
##          Point Forecast    Lo 80    Hi 80    Lo 95    Hi 95
## Oct 2017       4.243962 4.003299 4.484624 3.875900 4.612023
## Nov 2017       4.270298 3.929667 4.610929 3.749348 4.791248
## Dec 2017       4.261995 3.824174 4.699815 3.592406 4.931583
## Jan 2018       4.221709 3.679064 4.764354 3.391805 5.051613
## Feb 2018       4.256149 3.601555 4.910744 3.255033 5.257266
## Mar 2018       4.277793 3.507373 5.048213 3.099537 5.456049
## Apr 2018       4.325431 3.438592 5.212270 2.969128 5.681734
## May 2018       4.390572 3.389204 5.391941 2.859111 5.922033
## Jun 2018       4.359569 3.247162 5.471977 2.658289 6.060850
## Jul 2018       4.399400 3.180324 5.618476 2.534985 6.263816
## Aug 2018       4.386916 3.065908 5.707923 2.366609 6.407222
## Sep 2018       4.516604 3.098430 5.934778 2.347694 6.685515
## Oct 2018       4.559578 3.067441 6.051715 2.277551 6.841604
## Nov 2018       4.620212 3.056681 6.183743 2.228997 7.011427
## Dec 2018       4.638899 3.008781 6.269018 2.145848 7.131951
## Jan 2019       4.640089 2.948535 6.331643 2.053080 7.227098
## Feb 2019       4.692802 2.944498 6.441105 2.019002 7.366601
## Mar 2019       4.744136 2.943049 6.545224 1.989610 7.498662
## Apr 2019       4.793256 2.942626 6.643887 1.962961 7.623551
## May 2019       4.846264 2.948703 6.743825 1.944195 7.748334
## Jun 2019       4.830489 2.888100 6.772879 1.859861 7.801118
## Jul 2019       4.865784 2.880269 6.851298 1.829202 7.902366
## Aug 2019       4.854201 2.826962 6.881439 1.753807 7.954594
## Sep 2019       4.939538 2.871748 7.007329 1.777126 8.101951
fit2 %>% forecast(h = 24)
##          Point Forecast    Lo 80    Hi 80    Lo 95    Hi 95
## Oct 2017       4.196178 3.949991 4.442365 3.819668 4.572689
## Nov 2017       4.206283 3.832776 4.579789 3.635054 4.777511
## Dec 2017       4.183841 3.696976 4.670705 3.439245 4.928436
## Jan 2018       4.132665 3.538417 4.726914 3.223841 5.041490
## Feb 2018       4.158730 3.460575 4.856885 3.090994 5.226466
## Mar 2018       4.173643 3.374069 4.973218 2.950800 5.396487
## Apr 2018       4.206775 3.307836 5.105714 2.831967 5.581583
## May 2018       4.252683 3.256240 5.249127 2.728754 5.776613
## Jun 2018       4.201224 3.109046 5.293401 2.530882 5.871565
## Jul 2018       4.223483 3.037303 5.409663 2.409377 6.037588
## Aug 2018       4.188048 2.909578 5.466517 2.232797 6.143298
## Sep 2018       4.302299 2.933241 5.671357 2.208505 6.396092
## Oct 2018       4.335754 2.898628 5.772879 2.137860 6.533647
## Nov 2018       4.378796 2.876269 5.881323 2.080879 6.676712
## Dec 2018       4.386525 2.820965 5.952086 1.992207 6.780843
## Jan 2019       4.378336 2.751867 6.004805 1.890867 6.865805
## Feb 2019       4.416264 2.730810 6.101718 1.838585 6.993943
## Mar 2019       4.452808 2.710121 6.195494 1.787598 7.118017
## Apr 2019       4.490509 2.692197 6.288822 1.740228 7.240791
## May 2019       4.532732 2.680276 6.385188 1.699645 7.365819
## Jun 2019       4.515824 2.610596 6.421051 1.602030 7.429618
## Jul 2019       4.544178 2.587456 6.500901 1.551629 7.536727
## Aug 2019       4.532469 2.525443 6.539495 1.462988 7.601950
## Sep 2019       4.608057 2.551844 6.664270 1.463350 7.752764

fit1 %>% forecast(h = 24) %>% autoplot()

fit2 %>% forecast(h = 24) %>% autoplot() + ylab("Number of Startups")