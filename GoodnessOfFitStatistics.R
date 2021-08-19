
dadosHotelDiarios <- read.csv("hotelDados.csv", header=T, sep=";",skip = 0)
View(dadosHotelDiarios)

inds <- seq(as.Date("2018-12-01"), as.Date("2019-11-30"), by = "day")

dadosHotelDiarios <- cbind(inds,dadosHotelDiarios)

head(dadosHotelDiarios)
myts2 <- ts(dadosHotelDiarios$Consumo,     
            start = c(2019, as.numeric(format(inds[1], "%j"))),
            frequency = 7)
plot(myts2)

dadosConsumo<-dadosHotelDiarios$Consumo
?plotdist
plotdist(dadosConsumo, "norm", para=list(mean=mean(dadosConsumo), sd=sd(dadosConsumo)), demp = TRUE)
?descdist
descdist(dadosConsumo, boot = 365)
?fitdist
fw <- fitdist(dadosConsumo, "weibull")
summary(fw)
?rmse
#    estimate Std. Error
#shape   2.2959   0.090165
#scale  33.6650   0.814163
#Loglikelihood:  -1448.2   AIC:  2900.3   BIC:  2908.1 
#Correlation matrix:
#  shape   scale
#shape 1.00000 0.32568
#scale 0.32568 1.00000
?plot
plot(fw)
fdn <- fitdist(dadosConsumo, "norm")
summary(fdn)
plot(fdn)
shapiro.test(dadosConsumo)

#p-value = 8.427e-10 <0.05  Como o valor de prova é inferior a 5%, rejeita-se a hipótese nula, ou seja, 
#que os dados seguem uma distribuição normal
#H0:A variável segue uma distribuição normal
#vs
#H1:A variável não segue uma distribuição normal

fitg <- fitdist(dadosConsumo, "gamma")
summary(fitg)
#      estimate Std. Error
#shape  4.66258    0.33436
#rate   0.15677    0.01187
#Loglikelihood:  -1439.8   AIC:  2883.6   BIC:  2891.4 
#Correlation matrix:
#  shape    rate
#shape 1.00000 0.94707
#rate  0.94707 1.00000
plot(fitg)

fitln <- fitdist(dadosConsumo, "lnorm")
summary(fitln)
#Fitting of the distribution ' lnorm ' by maximum likelihood 
#Parameters : 
#  estimate Std. Error
#meanlog  3.28154   0.025473
#sdlog    0.48532   0.018012
#Loglikelihood:  -1443.8   AIC:  2891.7   BIC:  2899.5 
#Correlation matrix:
#  meanlog sdlog
#meanlog       1     0
#sdlog         0     1
plot(fitln)

ft_llogis <- fitdist(dadosConsumo,"llogis")
summary(ft_llogis)
hoslem_gof(ft_llogis)
#     estimate Std. Error
#shape   3.5626    0.15502
#scale  27.2463    0.70394
#Loglikelihood:  -1450.3   AIC:  2904.6   BIC:  2912.4 
#Correlation matrix:
#  shape   scale
#shape 1.00000 0.05135
#scale 0.05135 1.00000
plot(ft_llogis)

plot.legend <- c("Weibull", "Log-Normal", "Gamma","Log-logistic", "Normal")
#par(mfrow = c(2, 2))
denscomp(list(fw, fitln,fitg,ft_llogis, fdn ), legendtext = plot.legend) 
qqcomp(list(fw, fitln,fitg, ft_llogis, fdn), legendtext = plot.legend) 
cdfcomp(list(fw, fitln,fitg,ft_llogis,fdn), legendtext = plot.legend)
ppcomp(list(fw, fitln,fitg,ft_llogis,fdn), legendtext = plot.legend)

gofstat(list(fw, fitg, fitln,ft_llogis))
#Goodness-of-fit statistics
#                               1-mle-weibull 2-mle-gamma 3-mle-lnorm 4-mle-logis
#Kolmogorov-Smirnov statistic      0.056589    0.056699     0.07493    0.066447
#Cramer-von Mises statistic        0.211396    0.209777     0.51572    0.187311
#Anderson-Darling statistic        1.734629    1.357436     2.79092    2.424982

#Goodness-of-fit criteria
#1-mle-weibull 2-mle-gamma 3-mle-lnorm 4-mle-logis
#Akaike's Information Criterion        2900.3      2883.6      2891.7      2932.8
#Bayesian Information Criterion        2908.1      2891.4      2899.5      2940.5


#SO UTILIZANDO A TENDENCIA AGORA
#Decompose
x <- decompose(myts2, type = "additive", filter = NULL)
plot(x)

y <- decompose(myts2, type = "multiplicative", filter = NULL)
plot(y)

trend<-(y$trend)
trend = trend[!is.na(trend)]

plotdist(trend, histo = TRUE, demp = TRUE)

descdist(trend, boot = 100)
fw <- fitdist(trend, "weibull")
summary(fw)
#estimate Std. Error
#shape   3.0024    0.12183
#scale  33.6211    0.62725
#Loglikelihood:  -1349.8   AIC:  2703.7   BIC:  2711.4 
#Correlation matrix:
#       shape   scale
#shape 1.00000 0.32711
#scale 0.32711 1.00000
plot(fw)

fitg <- fitdist(trend, "gamma")
summary(fitg)
#    estimate Std. Error
#shape  7.63285   0.559180
#rate   0.25486   0.019298
#Loglikelihood:  -1341.3   AIC:  2686.6   BIC:  2694.4 
#Correlation matrix:
#       shape    rate
#shape 1.00000 0.96747
#rate  0.96747 1.00000
plot(fitg)

fitln <- fitdist(trend, "lnorm")
summary(fitln)
#estimate Std. Error
#meanlog  3.33262   0.019573
#sdlog    0.36983   0.013840
#Loglikelihood:  -1341.2   AIC:  2686.4   BIC:  2694.1 
#Correlation matrix:
#         meanlog sdlog
#meanlog       1     0
#sdlog         0     1
plot(fitln)

ft_llogis <- fitdist(trend,"logis")
summary(ft_llogis)
#        estimate Std. Error
#location  29.4590    0.59989
#scale      6.3947    0.27560
#Loglikelihood:  -1366.9   AIC:  2737.8   BIC:  2745.6 
#Correlation matrix:
#        location    scale
#location 1.000000 0.023111
#scale    0.023111 1.000000
plot(fitln)

plot.legend <- c("Weibull", "lognormal", "gamma","log-logistico")
par(mfrow = c(2, 2))
denscomp(list(fw, fitln,fitg,ft_llogis ), legendtext = plot.legend) 
qqcomp(list(fw, fitln,fitg, ft_llogis), legendtext = plot.legend) 
cdfcomp(list(fw, fitln,fitg,ft_llogis), legendtext = plot.legend)
ppcomp(list(fw, fitln,fitg,ft_llogis), legendtext = plot.legend)

gofstat(list(fw, fitg, fitln,ft_llogis))
#Goodness-of-fit statistics
#1-mle-weibull 2-mle-gamma 3-mle-lnorm 4-mle-logis
#Kolmogorov-Smirnov statistic       0.10928     0.11493      0.1145     0.11554
#Cramer-von Mises statistic         0.76720     1.05657      1.2942     0.91368
#Anderson-Darling statistic         5.46148     6.37443      7.3178     6.42681

#Goodness-of-fit criteria
#1-mle-weibull 2-mle-gamma 3-mle-lnorm 4-mle-logis
#Akaike's Information Criterion        2703.7      2686.6      2686.4      2737.8
#Bayesian Information Criterion        2711.4      2694.4      2694.1      2745.6

a<-ts(rweibull(n=100, shape=1, scale = 7.34))
autoplot(a)

w<-ts(rgamma(n=100, shape=1, rate = 7.341))
autoplot(w)

#------------------------------------------------------------------------#
dadosHospital <- read.csv("hospitalData.csv", header=T, sep=";",skip = 0)
View(dadosHospital)

inds <- seq(as.Date("2018-12-01"), as.Date("2019-11-30"), by = "day")

dadosHospitalDiarios <- cbind(inds,dadosHospital)

head(dadosHospitalDiarios)
myts2 <- ts(dadosHospitalDiarios$Consumo,     
            start = c(2019, as.numeric(format(inds[1], "%j"))),
            frequency = 7)
plot(myts2)

dadosConsumo<-dadosHospitalDiarios$Consumo

plotdist(dadosConsumo, histo = TRUE, demp = TRUE)

fdn <- fitdist(dadosConsumo, "norm")
summary(fdn)
plot(fdn)
shapiro.test(dadosConsumo)
plotdist(dadosConsumo, "norm", para=list(mean=mean(dadosConsumo), sd=sd(dadosConsumo)), demp = TRUE)

descdist(dadosConsumo, boot = 365)
fw <- fitdist(dadosConsumo, "weibull")
summary(fw)
#estimate Std. Error
#shape   3.5481   0.099664
#scale  54.9234   0.858046
#Loglikelihood:  -1456.7   AIC:  2917.3   BIC:  2925.1 
#Correlation matrix:
#  shape   scale
#shape 1.00000 0.32977
#scale 0.32977 1.00000
plot(fw)

fitg <- fitdist(dadosConsumo, "gamma")
summary(fitg)
# estimate Std. Error
#shape 26.03366   1.914632
#rate   0.51305   0.038097
#Loglikelihood:  -1351.6   AIC:  2707.2   BIC:  2715 
#Correlation matrix:
#  shape    rate
#shape 1.00000 0.99041
#rate  0.99041 1.00000
plot(fitg)
?rnorm
fitln <- fitdist(dadosConsumo, "lnorm")
summary(fitln)
#     estimate Std. Error
#meanlog  3.90747  0.0100848
#sdlog    0.19267  0.0071302
#Loglikelihood:  -1343.1   AIC:  2690.1   BIC:  2697.9 
#Correlation matrix:
#  meanlog      sdlog
#meanlog 1.0000e+00 4.0874e-12
#sdlog   4.0874e-12 1.0000e+00
plot(fitln)

?fitdist
ft_llogis <- fitdist(dadosConsumo,"llogis")
summary(ft_llogis)
#      estimate Std. Error
#shape   9.1075    0.38550
#scale  49.8137    0.50831
#Loglikelihood:  -1340.6   AIC:  2685.1   BIC:  2692.9 
#Correlation matrix:
#  shape     scale
#shape 1.0000000 0.0081942
#scale 0.0081942 1.0000000
plot(fitln)

plot.legend <- c("Weibull", "Log-Normal", "Gamma","Log-logistic", "Normal")
par(mfrow = c(2, 2))
denscomp(list(fw, fitln,fitg,ft_llogis,fdn ), legendtext = plot.legend) 
qqcomp(list(fw, fitln,fitg, ft_llogis,fdn), legendtext = plot.legend) 
cdfcomp(list(fw, fitln,fitg,ft_llogis), legendtext = plot.legend)
ppcomp(list(fw, fitln,fitg,ft_llogis,fdn), legendtext = plot.legend)

gofstat(list(fw, fitg, fitln,ft_llogis))
#Goodness-of-fit statistics
#1-mle-weibull 2-mle-gamma 3-mle-lnorm 4-mle-logis
#Kolmogorov-Smirnov statistic       0.20385    0.060991    0.072754    0.078646
#Cramer-von Mises statistic         3.08741    0.419164    0.460287    0.691384
#Anderson-Darling statistic             Inf    3.349062    3.374419    4.716009

#Goodness-of-fit criteria
#1-mle-weibull 2-mle-gamma 3-mle-lnorm 4-mle-logis
#Akaike's Information Criterion        2917.3      2707.2      2690.1      2704.9
#Bayesian Information Criterion        2925.1      2715.0      2697.9      2712.7


#SO UTILIZANDO A TENDENCIA AGORA
#Decompose
x <- decompose(myts2, type = "additive", filter = NULL)
plot(x)

y <- decompose(myts2, type = "multiplicative", filter = NULL)
plot(y)

trend<-(y$trend)
trend = trend[!is.na(trend)]

plotdist(trend, histo = TRUE, demp = TRUE)

descdist(trend, boot = 100)
fw <- fitdist(trend, "weibull")
summary(fw)
#    estimate Std. Error
#shape   8.5788    0.34498
#scale  53.4415    0.34864
#Loglikelihood:  -1185.9   AIC:  2375.8   BIC:  2383.5 
#Correlation matrix:
#  shape   scale
#shape 1.00000 0.33284
#scale 0.33284 1.00000
plot(fw)

fitg <- fitdist(trend, "gamma")
summary(fitg)
#estimate Std. Error
#shape  65.1004   4.846407
#rate    1.2868   0.096167
#Loglikelihood:  -1166.6   AIC:  2337.3   BIC:  2345 
#Correlation matrix:
#  shape    rate
#shape 1.00000 0.99616
#rate  0.99616 1.00000

plot(fitg)

fitln <- fitdist(trend, "lnorm")
summary(fitln)
#        estimate Std. Error
#meanlog  3.91605  0.0065357
#sdlog    0.12383  0.0046200
#Loglikelihood:  -1165.4   AIC:  2334.7   BIC:  2342.5 
#Correlation matrix:
#  meanlog sdlog
#meanlog       1     0
#sdlog         0     1
plot(fitln)

ft_llogis <- fitdist(trend,"logis")
summary(ft_llogis)
#      estimate Std. Error
#location   50.254    0.35713
#scale       3.794    0.16265
#Loglikelihood:  -1185   AIC:  2374   BIC:  2381.8 
#Correlation matrix:
#  location    scale
#location 1.000000 0.061396
#scale    0.061396 1.000000
plot(fitln)

plot.legend <- c("Weibull", "lognormal", "gamma","log-logistico")
par(mfrow = c(2, 2))
denscomp(list(fw, fitln,fitg,ft_llogis ), legendtext = plot.legend) 
qqcomp(list(fw, fitln,fitg, ft_llogis), legendtext = plot.legend) 
cdfcomp(list(fw, fitln,fitg,ft_llogis), legendtext = plot.legend)
ppcomp(list(fw, fitln,fitg,ft_llogis), legendtext = plot.legend)

gofstat(list(fw, fitg, fitln,ft_llogis))
#Goodness-of-fit statistics
#1-mle-weibull 2-mle-gamma 3-mle-lnorm 4-mle-logis
#Kolmogorov-Smirnov statistic       0.14292     0.10164    0.093913    0.098267
#Cramer-von Mises statistic         1.42764     0.88183    0.798756    0.955641
#Anderson-Darling statistic         8.00897     5.05662    4.654396    6.243392

#Goodness-of-fit criteria
#1-mle-weibull 2-mle-gamma 3-mle-lnorm 4-mle-logis
#Akaike's Information Criterion        2375.8      2337.3      2334.7      2374.0
#Bayesian Information Criterion        2383.5      2345.0      2342.5      2381.8


