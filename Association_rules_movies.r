library("arules")
movies<-read.csv("C:\\Data_science\\EXCLER\\My Assignments\\Association Rules\\my_movies.csv")
str(movies)
movies$Sixth.Sense = as.factor(movies$Sixth.Sense)
movies$Gladiator = as.factor(movies$Gladiator)
movies$LOTR = as.factor(movies$LOTR)
movies$LOTR1 = as.factor(movies$LOTR1)
movies$LOTR2 = as.factor(movies$LOTR2)
movies$Harry.Potter1 = as.factor(movies$Harry.Potter1)
movies$Harry.Potter2 = as.factor(movies$Harry.Potter2)
movies$Patriot = as.factor(movies$Patriot)
movies$Braveheart = as.factor(movies$Braveheart)
movies$Green.Mile = as.factor(movies$Green.Mile)
str(movies)
#--------------------------Model 1-----------------------------------------------
rules<-apriori(movies)
arules::inspect(rules)
rules2<-apriori(movies , parameter = list(minlen=1, maxlen=15, supp=0.2,conf=0.6),
                appearance = list(lhs="V1=Sixth Sense"))
arules::inspect(head(rules2, n =5,by = 'lift'))

#------------------------Model 2-------------------------------------------------
rules3<-apriori(movies)
arules::inspect(head(n=100,rules3))
sorted.rules3<-sort(rules3, by="lift")
rules3<-apriori(movies , parameter = list(minlen=1, maxlen=15, supp=0.5,conf=0.6),
                appearance = list(rhs="Braveheart=0"))
arules::inspect(head(rules3, n =100,by = 'lift'))
#---------------------same model with different support and confidence values --------

rules3<-apriori(movies)
arules::inspect(head(n=100,rules3))
sorted.rules3<-sort(rules3, by="lift")
rules3<-apriori(movies , parameter = list(minlen=1, maxlen=15, supp=0.7,conf=0.9),
                appearance = list(rhs="Braveheart=0"))
arules::inspect(head(rules3, n =100,by = 'lift'))

# there is only one strong rule for conf=0.9
#-------------------------changing support value-------------------

rules3<-apriori(movies)
arules::inspect(head(n=100,rules3))
sorted.rules3<-sort(rules3, by="lift")
rules3<-apriori(movies , parameter = list(minlen=1, maxlen=15, supp=0.5,conf=0.9),
                appearance = list(rhs="Braveheart=0"))
arules::inspect(head(rules3, n =100,by = 'lift'))

#-----------------------Increasing confidence to 2.0----------------
rules3<-apriori(movies)
arules::inspect(head(n=100,rules3))
sorted.rules3<-sort(rules3, by="lift")
rules3<-apriori(movies , parameter = list(minlen=1, maxlen=15, supp=0.7,conf=0.9),
                appearance = list(rhs="Braveheart=0"))
arules::inspect(head(rules3, n =100,by = 'lift'))

# maximum support and confidence values can be 0.9 and 0.9 




