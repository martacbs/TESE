#house 
#-5%
house5porcentLnorm<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in house5porcentLnorm){
    #original estimation
    house5porcentLnorm[1:183]<-rlnorm(n=183, meanlog=1.62, sdlog = 4.51)
    #break 1
    house5porcentLnorm[184:365]<-rlnorm(n=182, meanlog=1.539, sdlog = 4.2845)
    #break 2
    house5porcentLnorm[366:548]<-rlnorm(n=183, meanlog=1.46205, sdlog = 4.070275)
    #break 3
    house5porcentLnorm[549:730]<- rlnorm(n=182, meanlog=1.3889475, sdlog = 3.86676125)
    #break 4
    house5porcentLnorm[731:914]<- rlnorm(n=183, meanlog=1.319500125, sdlog = 3.673423188)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/logNormal/5porCentoNewData/dataHouse",paste("houseBreaks5PorcentLnormal", file_list, ".csv"))
  }  
  write.csv2(house5porcentLnorm,  file = mypath)
  file_list<-file_list+1;
}

#-10%
house10porcentLnorm<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in house10porcentLnorm){
    #original estimation
    house10porcentLnorm[1:183]<-rlnorm(n=183, meanlog=1.62, sdlog = 4.51)
    #break 1
    house10porcentLnorm[184:365]<-rlnorm(n=182, meanlog=1.458, sdlog = 4.059)
    #break 2
    house10porcentLnorm[366:548]<-rlnorm(n=183, meanlog=1.3122, sdlog = 3.6531)
    #break 3
    house10porcentLnorm[549:730]<- rlnorm(n=182, meanlog=1.18098, sdlog = 3.28779)
    #break 4
    house10porcentLnorm[731:914]<- rlnorm(n=183, meanlog=1.062882, sdlog = 2.959011)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/logNormal/10porCentoNewData/dataHouse",paste("houseBreaks10PorcentLnormal", file_list, ".csv"))
  }  
  write.csv2(house10porcentLnorm,  file = mypath)
  file_list<-file_list+1;
}

#-25%
house25porcentLnorm<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in house25porcentLnorm){
    #original estimation
    house25porcentLnorm[1:183]<-rlnorm(n=183, meanlog=1.62, sdlog = 4.51)
    #break 1
    house25porcentLnorm[184:365]<-rlnorm(n=182, meanlog=1.215, sdlog = 3.3825)
    #break 2
    house25porcentLnorm[366:548]<-rlnorm(n=183, meanlog=0.91125, sdlog = 2.536875)
    #break 3
    house25porcentLnorm[549:730]<- rlnorm(n=182, meanlog=0.6834375, sdlog = 1.90265625)
    #break 4
    house25porcentLnorm[731:914]<- rlnorm(n=183, meanlog=0.512578125, sdlog = 1.426992188)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/logNormal/25porCentoNewData/dataHouse",paste("houseBreaks25PorcentLnormal", file_list, ".csv"))
  }  
  write.csv2(house25porcentLnorm,  file =mypath)
  file_list<-file_list+1;
}

#-50%
house50porcentLnorm<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in house50porcentLnorm){
    #original estimation
    house50porcentLnorm[1:183]<-rlnorm(n=183, meanlog=1.62, sdlog = 4.51)
    #break 1
    house50porcentLnorm[184:365]<-rlnorm(n=182, meanlog=0.81, sdlog = 2.255)
    #break 2
    house50porcentLnorm[366:548]<-rlnorm(n=183, meanlog=0.405, sdlog = 1.1275)
    #break 3
    house50porcentLnorm[549:730]<- rlnorm(n=182, meanlog=0.2025, sdlog = 0.56375)
    #break 4
    house50porcentLnorm[731:914]<- rlnorm(n=183, meanlog=0.10125, sdlog = 0.281875)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/logNormal/50porCentoNewData/dataHouse",paste("houseBreaks50PorcentLnormal", file_list, ".csv"))
    
  }  
  write.csv2(house50porcentLnorm,  file = mypath)
  file_list<-file_list+1;
}
getwd()
