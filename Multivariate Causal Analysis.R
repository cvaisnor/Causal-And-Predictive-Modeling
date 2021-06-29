#library(gdata)
library(AER)
library(car)
library(lmtest)
library(zoo)
library(stargazer)

# Column 1
regqpsr<-lm(Q~PCHICK,data=chick)

# Column 2
regqplr<-lm(Q~PCHICK+Y+POP+CPI+MEATEX+PBEEF,data=chick)


# I'm making my own correlation matrix
cor(chick, method = c("pearson"))

regyp<-lm(Y~PCHICK,data=chick)

regpp<-lm(POP~PCHICK,data=chick)

regcp<-lm(CPI~PCHICK,data=chick)

regmp<-lm(MEATEX~PCHICK,data=chick)

regbp<-lm(PBEEF~PCHICK,data=chick)

stargazer(regyp,regpp,regcp,regmp,regbp, type = 'text')

# Column 3
ivqp<-ivreg(Q~PCHICK+Y+POP+CPI+MEATEX+PBEEF|PF+Y+POP+CPI+MEATEX+PBEEF,data=chick)

regfs<-lm(PCHICK~PF+Y+POP+CPI+MEATEX+PBEEF,data=chick)
summary(regfs)
stargazer(regqpsr, regqplr, ivqp, type = 'text') # columns 1, 2, 3

problemG<-ivreg(Q~PCHICK+PBEEF+Y+POP+CPI|PF+Y+POP+CPI+MEATEX,data=chick)
summary(problemG)

stargazer(problemG, type = 'text') #??? 
