#Hospital 
?rgamma
#-5%
hosp5porcentGamma<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hosp5porcentGamma){
    #original estimation
    hosp5porcentGamma[1:183]<-rgamma(n=183, shape=26.03366, rate = 0.51305)
    #break 1
    hosp5porcentGamma[184:365]<-rgamma(n=182, shape=24.731977, rate = 0.4873975)
    #break 2
    hosp5porcentGamma[366:548]<-rgamma(n=183, shape=23.4953782, rate = 0.46302763)
    #break 3
    hosp5porcentGamma[549:730]<- rgamma(n=182, shape=22.3206092, rate = 0.43987624)
    #break 4
    hosp5porcentGamma[731:914]<- rgamma(n=183, shape=21.2045788, rate = 0.41788243)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/gamma/5porCentoNewData/dataHospital",paste("hospitalBreaks5PorcentGamma", file_list, ".csv"))
  }  
  write.csv2(hosp5porcentGamma,  file = mypath)
  file_list<-file_list+1;
}

#-10%
hosp10porcentGamma<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hosp10porcentGamma){
    #original estimation
    hosp10porcentGamma[1:183]<-rgamma(n=183, shape=26.03366, rate = 0.51305)
    #break 1
    hosp10porcentGamma[184:365]<-rgamma(n=182, shape=23.430294, rate = 0.461745)
    #break 2
    hosp10porcentGamma[366:548]<-rgamma(n=183, shape=21.0872646, rate = 0.4155705)
    #break 3
    hosp10porcentGamma[549:730]<- rgamma(n=182, shape=18.9785381, rate = 0.37401345)
    #break 4
    hosp10porcentGamma[731:914]<- rgamma(n=183, shape=17.0806843, rate = 0.33661211)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/gamma/10porCentoNewData/dataHospital",paste("hospitalBreaks10PorcentGamma", file_list, ".csv"))
  }  
  write.csv2(hosp10porcentGamma,  file = mypath)
  file_list<-file_list+1;
}

#-25%
hosp25porcentGamma<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hosp25porcentGamma){
    #original estimation
    hosp25porcentGamma[1:183]<-rgamma(n=183, shape=26.03366, rate = 0.51305)
    #break 1
    hosp25porcentGamma[184:365]<-rgamma(n=182, shape=19.525245, rate = 0.3847875)
    #break 2
    hosp25porcentGamma[366:548]<-rgamma(n=183, shape=14.6439338, rate = 0.28859063)
    #break 3
    hosp25porcentGamma[549:730]<- rgamma(n=182, shape=10.9829503, rate = 0.21644297)
    #break 4
    hosp25porcentGamma[731:914]<- rgamma(n=183, shape=8.23721273, rate = 0.16233223)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/gamma/25porCentoNewData/dataHospital",paste("hospitalBreaks25PorcentGamma", file_list, ".csv"))
  }  
  write.csv2(hosp25porcentGamma,  file = mypath)
  file_list<-file_list+1;
}

#-50%
hosp50porcentGamma<-(nrow=1:914)
file_list <- list.files(pattern="*.csv") 
file_list<-1
while (file_list<101){
  for(i in hosp50porcentGamma){
    #original estimation
    hosp50porcentGamma[1:183]<-rgamma(n=183, shape=26.03366, rate = 0.51305)
    #break 1
    hosp50porcentGamma[184:365]<-rgamma(n=182, shape=13.01683, rate = 0.256525)
    #break 2
    hosp50porcentGamma[366:548]<-rgamma(n=183, shape=6.508415, rate = 0.1282625)
    #break 3
    hosp50porcentGamma[549:730]<- rgamma(n=182, shape=3.2542075, rate = 0.06413125)
    #break 4
    hosp50porcentGamma[731:914]<- rgamma(n=183, shape=1.62710375, rate = 0.03206563)
    
    mypath <- file.path("/Users/martasantos/Desktop/NewData/gamma/50porCentoNewData/dataHospital",paste("hospitalBreaks50PorcentGamma", file_list, ".csv"))
  }  
  write.csv2(hosp50porcentGamma,  file = mypath)
  file_list<-file_list+1;
}
