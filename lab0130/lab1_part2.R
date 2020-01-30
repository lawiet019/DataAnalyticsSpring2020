setwd("/Users/koko/documents/data_analytics/code/DataAnalyticsSpring2020/lab0130")
#exercise 1
#ecdf Compute an empirical cumulative distribution function
# read EPI 
EPI_data <- read.csv("2010EPI_data.csv",header = TRUE)
EPI <- EPI_data$EPI
#db.points: logical; if TRUE, also draw points at the (xlim restricted) knot locations. Default is true, for sample size < 1000
plot(ecdf(EPI),do.points= FALSE,verticals = TRUE)
help(qqnorm)
# The quantile-quantile (q-q) plot is a graphical technique for determining if two data sets come from populations with a common distribution. A q-q plot is a plot of the quantiles of the first data set against the quantiles of the second data set.
#The principle is that if the data is normal, then its assumed normal quantile will be basically consistent with the actual data.Calculate the data quantiles at the time of assumed normal; and use the actual data as the X axis and the data quantiles at the time of assumed normal as the Y axis to make a scatter plot.
par(pty="s")#A character specifying the type of plot region to be used; "s" generates a square plotting region and "m" generates the maximal plotting region.
qqnorm(EPI)
qqline(EPI)

help(qqplot)
#qqplot produces a QQ plot of two datasets.
#The first sample for qqplot.
#xlab -plot labels. The xlab and ylab refer to the y and x axes respectively if datax = TRUE.
x<-seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="qq plot-fdsn")
qqline(x)
plot(ecdf(EPI_data$EPI),do.points=FALSE,verticals =TRUE)
plot(ecdf(EPI_data$EPI),do.points = TRUE,verticals = TRUE)

#explore other variables
DALY = EPI_data$DALY
WATER_H = EPI_data$WATER_H
View(WATER_H)
View(DALY)
hist(DALY)
plot(ecdf(DALY),do.points= FALSE,verticals = TRUE)
plot(ecdf(WATER_H),do.points= FALSE,verticals = TRUE)
qqplot(DALY,WATER_H)
qqline(WATER_H)
boxplot(DALY,WATER_H)

#Linear basis and least-squares constraints
multivariates <- read.csv("multivariate.csv")
attach(mutlivariates)

Homeowners <- multivariates$Homeowners
Immgrant <- multivariates$Immigrant

help(lm)
#lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis 
