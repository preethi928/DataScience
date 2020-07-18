library("arules")
gross<-read.csv("C:\\Data_science\\EXCLER\\My Assignments\\groceries.csv")
str(gross)
#No need to use as.factor because the data is already in factors.
rules<-apriori(gross)
arules::inspect(rules)
sorted.rules<-sort(rules,by="lift")
arules::inspect(sorted.rules)
# there are no lhs or rhs value found in the given data set , the data set given is invalid 

