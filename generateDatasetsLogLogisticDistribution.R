#Hotel 
#-5%
hotel5porcentLlogis<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hotel5porcentLlogis){
    #original estimation
    hotel5porcentLlogis[1:183]<-rllogis(n=183, shape=3.5626, scale = 27.2463)
    #break 1
    hotel5porcentLlogis[184:365]<-rllogis(n=182, shape=3.38447, scale = 25.883985)
    #break 2
    hotel5porcentLlogis[366:548]<-rllogis(n=183, shape=3.2152465, scale = 24.58978575)
    #break 3
    hotel5porcentLlogis[549:730]<- rllogis(n=182, shape=3.054484175, scale = 23.36029646)
    #break 4
    hotel5porcentLlogis[731:914]<- rllogis(n=183, shape=2.901759966, scale = 22.19228164)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/logLogistic/5porCentoNewData/dataHotel",paste("hotelBreaks5PorcentLlogistic", file_list, ".csv"))
  }  
  write.csv2(hotel5porcentLlogis,  file = mypath)
  file_list<-file_list+1;
}

#-10%
hotel10porcentLlogis<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hotel10porcentLlogis){
    #original estimation
    hotel10porcentLlogis[1:183]<-rllogis(n=183, shape=3.5626, scale = 27.2463)
    #break 1
    hotel10porcentLlogis[184:365]<-rllogis(n=182, shape=3.20634, scale = 24.52167)
    #break 2
    hotel10porcentLlogis[366:548]<-rllogis(n=183, shape=2.885706, scale = 22.069503)
    #break 3
    hotel10porcentLlogis[549:730]<- rllogis(n=182, shape=2.5971354, scale = 19.8625527)
    #break 4
    hotel10porcentLlogis[731:914]<- rllogis(n=183, shape=2.33742186, scale = 17.87629743)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/logLogistic/10porCentoNewData/dataHotel",paste("hotelBreaks10PorcentLlogistic", file_list, ".csv"))
  }  
  write.csv2(hotel10porcentLlogis,  file = mypath)
  file_list<-file_list+1;
}

#-25%
hotel25porcentLlogis<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hotel25porcentLlogis){
    #original estimation
    hotel25porcentLlogis[1:183]<-rllogis(n=183, shape=3.5626, scale = 27.2463)
    #break 1
    hotel25porcentLlogis[184:365]<-rllogis(n=182, shape=2.67195, scale = 20.434725)
    #break 2
    hotel25porcentLlogis[366:548]<-rllogis(n=183, shape=2.0039625, scale = 15.32604375)
    #break 3
    hotel25porcentLlogis[549:730]<- rllogis(n=182, shape=1.502971875, scale = 11.49453281)
    #break 4
    hotel25porcentLlogis[731:914]<- rllogis(n=183, shape=1.127228906, scale = 8.620899609)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/logLogistic/25porCentoNewData/dataHotel",paste("hotelBreaks25PorcentLlogistic", file_list, ".csv"))
  }  
  write.csv2(hotel25porcentLlogis,  file =mypath)
  file_list<-file_list+1;
}

#-50%
hotel50porcentLlogis<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hotel50porcentLlogis){
    #original estimation
    hotel50porcentLlogis[1:183]<-rllogis(n=183, shape=3.5626, scale = 27.2463)
    #break 1
    hotel50porcentLlogis[184:365]<-rllogis(n=182, shape=1.7813, scale = 13.62315)
    #break 2
    hotel50porcentLlogis[366:548]<-rllogis(n=183, shape=0.89065, scale = 6.811575)
    #break 3
    hotel50porcentLlogis[549:730]<- rllogis(n=182, shape=0.445325, scale = 4.4057875)
    #break 4
    hotel50porcentLlogis[731:914]<- rllogis(n=183, shape=0.2226625, scale = 1.70289375)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/logLogistic/50porCentoNewData/dataHotel",paste("hotelBreaks50PorcentLlogistic", file_list, ".csv"))
    
  }  
  write.csv2(hotel50porcentLlogis,  file = mypath)
  file_list<-file_list+1;
}
getwd()
