library(Metrics)
library(forecast)
library(fpp)
library(smooth)
library(tseries)

plastic<-read.csv("C:\\Data_science\\EXCLER\\My Assignments\\Forecasting\\PlasticSales.csv")
View(plastic)
plot(plastic$Sales, type = 'l')

#converting data into time series
plastic_time<-ts(plastic$Sales, frequency = 12 , start = c(61))
View(plastic_time)
plot(plastic_time)

#splitting data into train and test.

train<-plastic_time[1:47]
test<-plastic_time[48:60]

# converting into time series 
train<-ts(train,frequency = 12)
test<-ts(test,frequency = 12)

#------------HoltsWinter function-------------------------------------------------
hl_plastic_a<-HoltWinters(train,alpha = 0.2,beta = F,gamma = F)
hl_plastic_pred<-data.frame(predict(hl_plastic_a,n.ahead = 13))
plot(forecast(hl_plastic_a,h=12))
hl_plastic_a_MAPE<-MAPE(hl_plastic_pred$fit,test)*100
hl_plastic_a_MAPE

#alpha = 0.2 , beta = 0.1, gamma = 0.1

hl_plastic_abg<-HoltWinters(train,alpha = 0.2,beta = 0.1,gamma = 0.1)
hl_plastic_abg_pred<-data.frame(predict(hl_plastic_abg,n.ahead = 13))
plot(forecast(hl_plastic_abg, h = 12))
hl_plastic_abg_MAPE<-MAPE(hl_plastic_abg_pred$fit , test)*100
hl_plastic_abg_MAPE

#alpha = 0.2 , beta = 0.1
hl_plastic_ab<-HoltWinters(train,alpha = 0.2,beta = 0.1,gamma = F)
hl_plastic_ab_pred<-data.frame(predict(hl_plastic_ab,n.ahead = 13))
plot(forecast(hl_plastic_ab, h = 12))
hl_plastic_ab_MAPE<-MAPE(hl_plastic_ab_pred$fit , test)*100
hl_plastic_ab_MAPE

#final model ------------------------------------

final_model<-HoltWinters(train)
final_model_predict<-data.frame(predict(final_model, n.ahead = 13))
plot(forecast(final_model, h = 13))
final_model_MAPE<-MAPE(final_model_predict$fit, test)*100
final_model_MAPE
#---------------removing alpha --------------------
rm_aplha<-HoltWinters(train,beta = 0.1)
rm_aplha_predict<-data.frame(predict(rm_aplha , n.ahead=13))
plot(forecast(rm_aplha, h=12))
rm_alpha_MAPE<-MAPE(rm_aplha_predict$fit, test) * 100     
rm_alpha_MAPE
#------------------------final table ---------------------------------

df_mape<-data.frame(c("hl_plastic_a_MAPE","hl_plastic_abg_MAPE","hl_plastic_ab_MAPE","final_model_MAPE",
                    "rm_alpha_MAPE"),c(hl_plastic_a_MAPE,hl_plastic_abg_MAPE,hl_plastic_ab_MAPE,final_model_MAPE,
                                       rm_alpha_MAPE))
colnames(df_mape)=c("MODELS","MAPE")
View(df_mape)
#------------------------Real data --------------------------

new_model<-HoltWinters(plastic_time)
plot(forecast(new_model , h = 13))
new_model_predict<-data.frame(predict(new_model,n.ahead = 13))
new_model_predict
View(new_model_predict)
