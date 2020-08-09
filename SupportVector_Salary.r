salary_data_test<-read.csv("C:\\Data_science\\EXCLER\\My Assignments\\Support Vector Machines\\SalaryData_Test(1).csv")
salary_data_train<-read.csv("C:\\Data_science\\EXCLER\\My Assignments\\Support Vector Machines\\SalaryData_Train(1).csv")
library(kernlab)
#library(e1071)
library(caret)
#svm plot for 2 variables#
day_of_week <- c(0,1,2,3,4,5,6)
holiday <- factor( c(T, F, F, F, F, F, T) )
model <- svm(day_of_week, holiday)
plot(model, day_of_week, holiday)

#-------------------linear kernel-------------------
salary_data<-ksvm(Salary~.,data = salary_data_train, kernel = "vanilladot")
#visualizing the svm data 

#kernlab::plot(salary_data,data=salary_data_test,x="age",y="Salary")
salary_predict<-predict(salary_data , salary_data_test)
head(n=20,salary_predict)
tab<-salary_predict == salary_data_test$Salary
prop.table(table(tab))



#-------------------non linear--------------------------
salary_data_rbf<-ksvm(Salary~.,data = salary_data_train, kernel = "rbfdot")
salary_predict_rbf<-predict(salary_data_rbf , salary_data_test)
head(n=20,salary_predict_rbf)
tab<-salary_predict_rbf == salary_data_test$Salary
prop.table(table(tab))


#------------------poly-----------------------------------
salary_data_rbf<-ksvm(Salary~.,data = salary_data_train, kernel = "poly")
salary_predict_rbf<-predict(salary_data_rbf , salary_data_test)
head(n=20,salary_predict_rbf)
tab<-salary_predict_rbf == salary_data_test$Salary
prop.table(table(tab))