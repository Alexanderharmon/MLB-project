#This code may take over 3 hours to run, depending on hardware!
library(readr)
library("StableEstim")
#Data from Lahma's Baseball Database
hr_greater_than_200ABcsv <- read_csv("~/Documents/School/Fall 2017/Econometrics 3/hr_greater_than_200ABcsv.csv")
homeruns <- hr_greater_than_200ABcsv$hr
homeruns <- sort(homeruns)
View(homeruns)
a=1.00 
b=1
c=log(mad(homeruns)) 
d=median(homeruns)
guesses = c(a,b,c,d)

round1 <- Estim(EstimMethod = c("ML", "GMM", "Cgmm", "Kout"), homeruns, theta0 = guesses,
      ComputeCov = FALSE, HandleError = TRUE)
round2 <- MLParametersEstim(x=homeruns, theta0 = guesses,
                            pm = 0, PrintTime = TRUE)
