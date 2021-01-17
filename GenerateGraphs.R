# load required packages
if(!require(changepoint)) install.packages("changepoin", repos = "http://cran.us.r-project.org")
if(!require(bfast)) install.packages("bfast", repos = "http://cran.us.r-project.org")
if(!require(breakpoint)) install.packages("breakpoint", repos = "http://cran.us.r-project.org")
if(!require(cpm)) install.packages("cpm", repos = "http://cran.us.r-project.org")
if(!require(dplyr)) install.packages("dplyr", repos = "http://cran.us.r-project.org")
if(!require(segmented)) install.packages("segmented", repos = "http://cran.us.r-project.org")
if(!require(stats)) install.packages("stats", repos = "http://cran.us.r-project.org")
if(!require(strucchange)) install.packages("strucchange", repos = "http://cran.us.r-project.org")
if(!require(tseries)) install.packages("tseries", repos = "http://cran.us.r-project.org")
if(!require(ggplot2)) install.packages("ggplot2", repos = "http://cran.us.r-project.org")
if(!require(plotly)) install.packages("plotly", repos = "http://cran.us.r-project.org")
if(!require(bfast)) install.packages("bfast", repos = "http://cran.us.r-project.org")
if(!require(bcp)) install.packages("bcp", repos = "http://cran.us.r-project.org")
if(!require(DBEST)) install.packages("DBEST", repos = "http://cran.us.r-project.org")
if(!require(zoo)) install.packages("zoo", repos = "http://cran.us.r-project.org")
if(!require(stringr)) install.packages("stringr", repos = "http://cran.us.r-project.org")
if(!require(scales)) install.packages("scales", repos = "http://cran.us.r-project.org")
if(!require(ffstream)) install.packages("ffstream", repos = "http://cran.us.r-project.org")
if(!require(Rcpp)) install.packages("Rcpp", repos = "http://cran.us.r-project.org")
#setwd("/Users/martasantos/Desktop/NewData/logLogistic/50porCentoNewData/dataHotel")
setwd("/Users/martasantos/Desktop/NewData/logLogistic/50porCentoNewData/dataHouse")
#getwd()
#somePDFPath = "/Users/martasantos/Desktop/NewData/logLogistic/50porCentoNewData/graphsHotel/logLogisticBreaks50porcentGraphsSegmentacaoBinariaVariance.pdf"
somePDFPath = "/Users/martasantos/Desktop/NewData/logLogistic/50porCentoNewData/graphsHouse/logLogisticHouseBreaks50porcentGraphsDBEST.pdf"
pdf(file=somePDFPath) 

for (i in list.files(pattern="*.csv")){
  dat <- read.csv(i, header=T, sep=";",skip = 0)
  myts2<-ts(dat$x, frequency=7)
  #plot(myts2, main=i)
  stl.Set<-stl(myts2,s.window = "peri",robust=TRUE) ## o adequado pois os dados tem outliers
  #plot(stl.Set, main=i)
  
  #STRUCCHANGE METHOD
  detecao<-breakpoints(stl.Set$time.series[,"trend"]~1)
  
  #plot(stl.Set$time.series[,"trend"],xlab="",col=4,ylab="Consumption (m3)",main=i,lwd=3)
  #abline(v=breakdates(detecao),col=5,pch="p",lwd=4,lty=2)
  #m.binsegHotel <- cpt.mean(stl.Set$time.series[,"trend"],method="BinSeg")
  #plot(m.binsegHotel, type="l", main=i)
  #binseghotel.var<- cpt.var(stl.Set$time.series[,"trend"],method="BinSeg")
  #plot(binseghotel.var, type="l", main=i)
  #PELT.var <- cpt.var(stl.Set$time.series[,"trend"],method="PELT")
  #plot(PELT.var, type="l", main=i)
  #abline(v=breakdates(detecao),col=5,pch="p",lwd=4,lty=2)
  dbestMethod<-DBEST(stl.Set$time.series[,"trend"] , "cyclical", seasonality = 30, algorithm = "change detection", 
                     breakpoints.no = 500, first.level.shift=0.01, 
                     second.level.shift=0.2, duration=365, 
                     distance.threshold="default", alpha=0.1, plot ="on")
  plot(dbestMethod, figure=1)
  plot(dbestMethod, figure =2)
  
}

dev.off()

