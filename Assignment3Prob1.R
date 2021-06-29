
# Libraries

install.packages("gdata")
install.packages( "AER" )
install.packages( "car")
install.packages( "lmtest" )
install.packages( "zoo"  )

library(gdata)
library(AER)
library(car)
library(lmtest)
library(zoo)
load("/Users/chrisvaisnor/Documents/UC Davis/ARE 107/Assignment 3/Guns.Rdata")

regpols<-lm(vio~shall,data=mydata) # Column 1
regfes<-lm(vio~shall+factor(stateid),data=mydata) # Column 2
regfesy<-lm(vio~shall+factor(year)+factor(stateid),data=mydata) # Column 3
regfesyt<-lm(vio~shall+factor(year)+factor(stateid)+factor(stateid):year,data=mydata) # Column 4
regfesytmulti<-lm(vio~shall+density+avginc+incarc_rate+pm1029+factor(year)+factor(stateid),data=mydata) # Column 5

# Installing Stargazer
install.packages("stargazer")
library(stargazer)

stargazer(regpols, regfes, regfesy, regfesyt, regfesytmulti, type = "text") # Table 1

###################################################
####Now using plm package instead of lm #######

install.packages("Formula")
install.packages("plm")
library(plm)
library(Formula)
mydatap<-pdata.frame(mydata,c("stateid","year")) # Makes dataset -> panel data

pregpols<-plm(vio~shall,model="pooling",data=mydatap) # Column 1

pregfes<-plm(vio~shall,model="within",data=mydatap) # Column 2

pregfesy<-plm(vio~shall,effect="twoway",model="within",data=mydatap) # Column 3

pregfesymulti<-plm(vio~shall+density+avginc+incarc_rate+pm1029,effect="twoway",model="within",data=mydatap) # Column 4

stargazer(pregpols, pregfes, pregfesy, pregfesymulti, type = "text") # Table 2
