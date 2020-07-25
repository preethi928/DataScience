forest_data<-read.csv("C:\\Data_science\\EXCLER\\My Assignments\\Support Vector Machines\\forestfires.csv")
str(forest_data)
#forest_data1<-as.factor(forest_data)
#str(forest_data1)
foresdata_train<-forest_data[0:250,]
foresdata_test<-forest_data[251:518,]
library(kernlab)
colnames(forest_data)
#-----------------linear classifier vanniladot----------------------
forestdata_classifier<-ksvm(size_category~.,data = foresdata_train, kernel = "vanilladot")
forest_prediction<-predict(forestdata_classifier,foresdata_test)
head(n=20,forest_prediction)
agreement<-forest_prediction == foresdata_test$size_category
prop.table(table(agreement))

#----------------Non linear classifier RBFDOT-------------------------

forest_data_rbf<-ksvm(size_category~., data = foresdata_train , kernel = "rbfdot" )
forest_data_rbf_predic<-predict(forest_data_rbf,foresdata_test)
head(n=20,forest_data_rbf_predic)
agreement_rbf<-forest_data_rbf_predic == foresdata_test$size_category
table(agreement_rbf)
prop.table(table(agreement_rbf))
