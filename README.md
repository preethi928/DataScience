# DataScience
#package required for CI
install.packages("gmodels")
library("gmodels")
#package for data set 
install.packages("nycflights13")
library(nycflights13)
#loads the data from the package
data("flights")
View(flights)
dep_delay<-flights$dep_delay
sum(is.na(dep_delay))
flight1<-na.omit(flights)
sum(is.na(flight1))
#CI construction for CI
ci(flight1$dep_delay,confidence = 0.95)
