#Hotel 
getwd()
hotel5porcent<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hotel5porcent){
    #original estimation
    hotel5porcent[1:183]<-rweibull(n=183, shape=2.2959, scale = 33.665)
    #break 1
    hotel5porcent[184:365]<-rweibull(n=182, shape=2.181105, scale = 31.98175)
    #break 2
    hotel5porcent[366:548]<-rweibull(n=183, shape=2.07204975, scale = 30.3826625)
    #break 3
    hotel5porcent[549:730]<- rweibull(n=182, shape=1.96844726, scale = 28.8635294)
    #break 4
    hotel5porcent[731:914]<- rweibull(n=183, shape=1.8700249, scale = 27.4203529)
    mypath <- file.path("/Users/martasantos/Desktop/NewData/weibull/5porCentoNewData/dataHotel",paste("hotelBreaks5PorcentWeibull", file_list, ".csv"))
  }  
  write.csv2(hotel5porcent,  file = mypath)
  file_list<-file_list+1;
}

#weibull 10% quebras
hotel10porcent<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hotel10porcent){
    #original estimation
    hotel10porcent[1:183]<-rweibull(n=183, shape=2.2959, scale = 33.665)
    #break 1
    hotel10porcent[184:365]<-rweibull(n=182, shape=2.06631, scale = 30.2985)
    #break 2
    hotel10porcent[366:548]<-rweibull(n=183, shape=1.859679, scale = 37.26865)
    #break 3
    hotel10porcent[549:730]<- rweibull(n=182, shape=1.6737111, scale = 24.541785)
    #break 4
    hotel10porcent[731:914]<- rweibull(n=183, shape=1.50633999, scale = 22.0876065)
    mypath <- file.path("/Users/martasantos/Desktop/NewData/weibull/10porCentoNewData/dataHotel",paste("hotelBreaks10PorcentWeibull", file_list, ".csv"))
  }  
  write.csv2(hotel10porcent,  file = mypath)
  file_list<-file_list+1;
}

#weibull 25% quebras
hotel25porcent<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hotel25porcent){
    #original estimation
    hotel25porcent[1:183]<-rweibull(n=183, shape=2.2959, scale = 33.665)
    #break 1
    hotel25porcent[184:365]<-rweibull(n=182, shape=1.721925, scale = 25.24875)
    #break 2
    hotel25porcent[366:548]<-rweibull(n=183, shape=1.29144375, scale = 18.9365625)
    #break 3
    hotel25porcent[549:730]<- rweibull(n=182, shape=0.96858281, scale = 14.2024219)
    #break 4
    hotel25porcent[731:914]<- rweibull(n=183, shape=0.72643711, scale = 10.6518164)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/weibull/25porCentoNewData/dataHotel",paste("hotelBreaks25PorcentWeibull", file_list, ".csv"))
  }  
  write.csv2(hotel25porcent, file=mypath)
  file_list<-file_list+1;
}

#weibull 50% quebras
hotel50porcent<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hotel50porcent){
    #original estimation
    hotel50porcent[1:183]<-rweibull(n=183, shape=2.2959, scale = 33.665)
    #break 1
    hotel50porcent[184:365]<-rweibull(n=182, shape=1.14795, scale = 16.8325)
    #break 2
    hotel50porcent[366:548]<-rweibull(n=183, shape=0.573975, scale = 8.41625)
    #break 3
    hotel50porcent[549:730]<- rweibull(n=182, shape=0.2869875, scale = 4.208125)
    #break 4
    hotel50porcent[731:914]<- rweibull(n=183, shape=0.14349375, scale = 2.1040625)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/weibull/50porCentoNewData/dataHotel",paste("hotelBreaks50PorcentWeibull", file_list, ".csv"))
  }  
  write.csv2(hotel50porcent,  file = mypath)
  file_list<-file_list+1;
}
