# Assignment 3 Problem 3

install.packages("xts")
install.packages("dyn")
install.packages("forecast")
install.packages("tseries")
install.packages("zoo")
install.packages("lmtest")
install.packages("timeSeries")
install.packages("sandwich")
library(xts)
library(dyn)
library(zoo)
library(lmtest)
library(stats)
library(forecast)
library(tseries)
library(timeSeries)
library(sandwich)

regsp<-lm(SP500~SP500L,data=mydata)
summary(regsp)
coeftest(regsp,vcov=NeweyWest(regsp,lag=1))
mydata$SP500t<-ts(mydata$SP500)
plot(mydata$SP500t,ylab="S&P500")


regsd<-lm(SP500D~SP500D1,data=mydata)
summary(regsd)
coeftest(regsd,vcov=NeweyWest(regsd,lag=1))
mydata$SP500Dt<-ts(mydata$SP500D)
plot(mydata$SP500Dt,ylab="Changes in S&P500")

regsr<-lm(SP500R~SP500RL,data=mydata)
summary(regsr)
coeftest(regsr,vcov=NeweyWest(regsr,lag=1))
mydata$SP500Rt<-ts(mydata$SP500R)
plot(mydata$SP500Rt,ylab="Returns on S&P500")

install.packages("stargazer")
library("stargazer")

stargazer(regsp, regsd, regsr, type = "text")
