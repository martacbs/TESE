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
setwd("/Users/martasantos/Desktop/NewData/weibull/50porCentoNewData/dataHouse")
getwd()
#somePDFPath = "/Users/martasantos/Desktop/NewData/weibull/5porCentoNewData/graphsHouse/weibullHouseBreaks5porcentGraphsStl.pdf"
#pdf(file=somePDFPath) 

numberBreakpointsStrucchange<-c()
breakpointDetectionsStrucchange<-c()
numberbrakspintsPELTMean<- c()
numberBreakpointsSegBinMean<-c()
breakpointDetectionsSegBinMean<-c()
numberBreakpointsSegBinVariance<-c()
breakpointDetectionsSegBinVariance<-c()
numberbrakspintsPELTVariance<-c()
breakpointDetectionsPELTVariance<-c()
numberBreakpointsTStudent<-c()
numberBreakpointsBartlett<-c()
numberBreakpointsGLR<-c()
numberBreakpointsLepage<-c()
numberBreakpointsKolmogorov<-c()
numberBreakpointsCrammer<-c()
numberBreakpointsMann<-c()
numberBreakpointsMood<-c()
numberbrakspintsFfstreamAF<-c()
breakpointDetectionsFfstreamAF<-c()
i<-list.files()
for (i in list.files(pattern="*.csv")){
  dat <- read.csv(i, header=T, sep=";",skip = 0)
  myts2<-ts(dat$x, frequency=7)
  #plot(myts2, main=i)
  stl.Set<-stl(myts2,s.window = "peri",robust=TRUE) ## o adequado pois os dados tem outliers
  #plot(stl.Set, main=i)
  
  #STRUCCHANGE METHOD
  detecao<-breakpoints(stl.Set$time.series[,"trend"]~1)
  #nameDataset[i]<-print(i)
  numberBreakpointsStrucchange[i]<-print(length(detecao$breakpoints))
  breakpointDetectionsStrucchange[i]<-print(str_c(detecao$breakpoints, collapse = ","))   
  
  #PELT MEDIA
  m.pelt1 <- cpt.mean(stl.Set$time.series[,"trend"],method="PELT")
  numberbrakspintsPELTMean[i]<-print(length(cpts(m.pelt1)))
  
  #SEGMENTACAO BINARIA MEDIA
  m.binsegMean <- cpt.mean(stl.Set$time.series[,"trend"],method="BinSeg")
  numberBreakpointsSegBinMean[i]<-print(length(cpts(m.binsegMean)))
  segBinMean<-cpts(m.binsegMean)
  breakpointDetectionsSegBinMean[i]<-print(str_c(segBinMean, collapse=","))
  
  #SEGMENTACAO BINARIA VARIANCIA
  binsegVarl.var<- cpt.var(stl.Set$time.series[,"trend"],method="BinSeg")
  numberBreakpointsSegBinVariance[i]<-print(length(cpts(binsegVarl.var)))
  segBinVar<-cpts(binsegVarl.var)
  breakpointDetectionsSegBinVariance[i]<-print(str_c(segBinVar, collapse=","))
  
  #PELT VARIANCIA
  PELT.var <- cpt.var(stl.Set$time.series[,"trend"],method="PELT")
  numberbrakspintsPELTVariance[i]<-print(length(cpts(PELT.var)))
  peltVar<-cpts(PELT.var)
  breakpointDetectionsPELTVariance[i]<-print(str_c(peltVar, collapse=","))
  
  #TStudent
  variable <- stl.Set$time.series[,"trend"]
  resultTStudent <- processStream(variable, "Student", ARL0=500, startup=20)
  numberBreakpointsTStudent[i]<-print(length(resultTStudent$changePoints))
  
  #with Bartlett
  resultBartlett <- processStream(variable, "Bartlett", ARL0=500, startup=20)
  numberBreakpointsBartlett[i]<-print(length(resultBartlett$changePoints))
  
  #With GLR
  resultGLR <- processStream(variable, "GLR", ARL0=500, startup=20)
  numberBreakpointsGLR[i]<-print(length(resultGLR$changePoints))
  
  # with lepage 
  resultLepage<- processStream(variable, "Lepage", ARL0=500, startup=20)
  numberBreakpointsLepage[i]<-print(length(resultLepage$changePoints))
  
  # with Kolmogorov-Smirnov
  resultKolmogorov<- processStream(variable, "Kolmogorov-Smirnov", ARL0=500, startup=20)
  numberBreakpointsKolmogorov[i]<-print(length(resultKolmogorov$changePoints))
  
  #with Cramer-von-Mises
  resultCramer <- processStream(variable, "Cramer-von-Mises", ARL0=500, startup=20)
  numberBreakpointsCrammer[i]<-print(length(resultCramer$changePoints))
  
  #with Mann-Whitney
  resultMann <- processStream(variable, "Mann-Whitney", ARL0=500, startup=20)
  numberBreakpointsMann[i]<-print(length(resultMann$changePoints))
  
  # with Mood
  resultMood <- processStream(variable, "Mood", ARL0=500, startup=20)
  numberBreakpointsMood[i]<-print(length(resultMood$changePoints))
  
  #print(dat$x[detecao$breakpoints])
  #plot(stl.Set$time.series[,"trend"],xlab="",col=4,ylab="Consumption (m3)",main=i,lwd=3)
  #abline(v=breakdates(detecao),col=5,pch="p",lwd=4,lty=2)
  #m.binsegHotel <- cpt.mean(stl.Set$time.series[,"trend"],method="BinSeg")
  #plot(m.binsegHotel, type="l", main=i)
  #binseghotel.var<- cpt.var(stl.Set$time.series[,"trend"],method="BinSeg")
  #plot(binseghotel.var, type="l", main=i)
  #PELT.var <- cpt.var(stl.Set$time.series[,"trend"],method="PELT")
  #plot(PELT.var, type="l", main=i)
  #abline(v=breakdates(detecao),col=5,pch="p",lwd=4,lty=2)
  #dbestMethod<-DBEST(stl.Set$time.series[,"trend"] , "cyclical", seasonality = 30, algorithm = "change detection", 
  #                  breakpoints.no = 500, first.level.shift=0.01, 
  #                 second.level.shift=0.2, duration=365, 
  #                distance.threshold="default", alpha=0.1, plot ="on")
  #plot(dbestMethod, figure=1)
  #plot(dbestMethod, figure =2)
  
}
#dev.off()
test<-cbind(numberBreakpointsStrucchange,breakpointDetectionsStrucchange,numberbrakspintsPELTMean, numberBreakpointsSegBinMean,
            breakpointDetectionsSegBinMean,numberBreakpointsSegBinVariance,breakpointDetectionsSegBinVariance,
            numberbrakspintsPELTVariance,breakpointDetectionsPELTVariance, numberBreakpointsTStudent, numberBreakpointsBartlett,
            numberBreakpointsGLR,numberBreakpointsLepage,numberBreakpointsKolmogorov, numberBreakpointsCrammer,
            numberBreakpointsMann,numberBreakpointsMood)
View(test)
write.csv2(test,"weibull50porCentoDataHouse.csv")
