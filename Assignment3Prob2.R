# Assignment 3 Problem 2

install.packages("forecast")

library("forecast")

install.packages("glmnet")

library("glmnet")

# Setting variables for LASSO

X = model.matrix(Sales~.,mydata)
y = mydata$Sales

# Making Regressions

regt = lm(Sales ~ TV,data = mydata)
regr = lm(Sales ~ Radio,data = mydata)
regn = lm(Sales ~ Newspaper,data = mydata)
regtr = lm(Sales ~ TV + Radio,data = mydata)
regtn = lm(Sales ~ TV + Newspaper,data = mydata)
regrn = lm(Sales ~ Radio + Newspaper,data = mydata)
regall = lm(Sales ~ TV + Radio + Newspaper,data = mydata)

# Cross Validation and AIC and BIC Reports

CV(regt)
CV(regr)
CV(regn)
CV(regtr)
CV(regtn)
CV(regrn)
CV(regall)

# LASSO

lassoreg = cv.glmnet(X, y, alpha = 1)

predict(lassoreg, type = "coefficients")
