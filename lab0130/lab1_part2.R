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
Immigrant <- multivariates$Immigrant
#lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis 
mm<-lm(Homeowners ~ Immigrant)
mm
summary(mm)
summary(mm)$coef
#lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis 
#This function adds one or more straight lines through the current plot.
#Tilde (~): used to connect the response variable (to the left of the tilde) and the independent variable (to the right of the tilde) in the formula
#That is, the function f (Homeowners) = Immgrant
plot(Homeowners~Immgrant)

#This function adds one or more straight lines through the current plot.
abline(mm)
abline(mm,col=2,lwd=3)

#These functions access an object's attributes. The first form below returns the object's attribute list. The replacement forms uses the list on the right-hand side of the assignment as the object's attributes (if appropriate).
attributes(mm)
#c Combine Values into a Vector or List
newImmigrantdata <- data.frame(Immigrant = c(0, 20))
#%>%It is to send the value of the left part to  the right part, and as the first parameter of  the right part, it is the pipeline function.
mm %>% predict(newImmigrantdata)
