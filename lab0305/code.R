setwd("/Users/koko/documents/data_analytics/code/DataAnalyticsSpring2020/lab0305")
# creating a matrix data with random numbers
# and plotting the matrix using the image() function
# you will see there, it does not have a real pattern in the plot.
set.seed(12345)
#par can be used to set or query graphical parameters.
#Parameters can be set by specifying them as arguments to par in tag = value form, 
#or by passing them as a list of tagged values.
# mar – A numeric vector of length 4, which sets the margin sizes in the following
# order: bottom, left, top, and right. The default is c(5.1, 4.1, 4.1, 2.1).
# rep(0.2,4) is repeat 0.2 four times
par(mar = rep(0.2,4))
#matrix creates a matrix from the given set of values.
# rnorm give normal distribution data
data_Matrix <-matrix(rnorm(400), nrow = 40)
# Creates a grid of colored or gray-scale rectangles with colors corresponding to
# the values in z. This can be used to display three-dimensional or spatial data
# heaka images. This is a generic function.
# t just give the transpose
image(1:10, 1:40, t(data_Matrix)[,nrow(data_Matrix):1])
# now we can run a hierarchical cluster analysis on the dataset
# we will use the heatmap() function that is available in R
# A heat map is a false color image (basically image(t(x))) with
# a dendrogram added to the left side and to the top.
heatmap(data_Matrix)
#A binomial distribution can be thought of as simply the probability 
# of a SUCCESS or FAILURE outcome in an experiment or survey that is repeated
# multiple times. The binomial is a type of distribution that has two possible
# outcomes (the prefix “bi” means two, or twice). For example, a coin toss has 
# only two possible outcomes: heads or tails and taking a test could have two 
# possible outcomes: pass or fail.

set.seed(678910)
for(i in 1:40){
  # flipping a coin and getting the data
  coin_Flip <- rbinom(1, size = 1, prob = 0.5)
  # if the coin is "Heads", add a common pattern to that row,
  if(coin_Flip){
    data_Matrix[i, ] <- data_Matrix[i, ] + rep(c(0,3), each =5)
  }
}
heatmap(data_Matrix)

library(gdata) 
#faster xls reader but requires perl!
bronx1<-read.xls(file.choose(),pattern="BOROUGH",stringsAsFactors=FALSE,sheet=1,perl="/usr/bin/perl") 
#Give the TRUE indices of a logical object, allowing for array indices.
bronx1<-bronx1[which(bronx1$GROSS.SQUARE.FEET!="0" & bronx1$LAND.SQUARE.FEET!="0" & bronx1$SALE.PRICE!="$0"),]
#alternate
#library("xlsx", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
#bronx1<-read.xlsx("<SOMEWHERE>/rollingsales_bronx.xls",pattern="BOROUGH",stringsAsFactors=FALSE,sheetIndex=1,startRow=5,header=TRUE)
View(bronx1)

attach(bronx1) # If you choose to attach, leave out the "data=." in lm regression
SALE.PRICE<-sub("\\$","",SALE.PRICE) 
SALE.PRICE<-as.numeric(gsub(",","", SALE.PRICE)) 
GROSS.SQUARE.FEET<-as.numeric(gsub(",","", GROSS.SQUARE.FEET)) 
LAND.SQUARE.FEET<-as.numeric(gsub(",","", LAND.SQUARE.FEET)) 
plot(log(GROSS.SQUARE.FEET), log(SALE.PRICE)) 
m1<-lm(log(SALE.PRICE)~log(GROSS.SQUARE.FEET))
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))
# sub() function replaces the first match of a string, if the parameter is a string vector, replaces the first match of all elements.
# Model 2

m2<-lm(log(bronx1$SALE.PRICE)~log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD))
summary(m2)
plot(resid(m2))
# Suppress intercept - using "0+ ..."
m2a<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD))
summary(m2a)
plot(resid(m2a))

# Model 3
m3<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD)+factor(bronx1$BUILDING.CLASS.CATEGORY))
summary(m3)
plot(resid(m3))

# Model 4
m4<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD)*factor(bronx1$BUILDING.CLASS.CATEGORY))
summary(m4)
plot(resid(m4))


#  go through the titantic data
data(Titanic)
dim(Titanic)
View(Titanic)
str(Titanic)

library(party)
help(ctree)
library(rpart)
library(rpart.plot)

#rpart
#s_titanic <- sample(32,20) 
#titanic_train <- Titanic[s_titanic,]
#titanic_test <- Titanic[-s_titanic,]
dectionTreeModel <- rpart(Species~., iris_train,
                          method = "class")


