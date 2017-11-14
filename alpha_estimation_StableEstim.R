#THis code takes approximately 80 minutes to run on a Late 2011 MacBook Pro 
library(readr)
library("StableEstim")
hr_greater_than_200ABcsv <- read_csv("~/Documents/School/Fall 2017/Econometrics 3/hr_greater_than_200ABcsv.csv")
homeruns <- hr_greater_than_200ABcsv$hr
homeruns <- sort(homeruns)
View(homeruns)
a=1.00 
b=1
c=log(mad(homeruns)) 
d=median(homeruns)
theta = c(a,b,c,d)

Estim(EstimMethod = c("ML", "GMM", "Cgmm", "Kout"), homeruns, theta0 = theta,
      ComputeCov = FALSE, HandleError = TRUE)