# data frame 
days <- c('Mon','Tue','Mon','Thur','Fri','Sat','Sun')
temp <- c(28,30.5,32,31.2,29.3,27.9,26.4)
snowed <- c('T','T','F','F','T','T','F')
help("data.frame")
RPI_Weather_Week <- data.frame(days,temp,snowed)
RPI_Weather_Week

head(RPI_Weather_Week)
str(RPI_Weather_Week)
summary(RPI_Weather_Week)

RPI_Weather_Week[1,]# show the 1st row 
RPI_Weather_Week[,1]#show the 1st column

RPI_Weather_Week[,'snowed']
RPI_Weather_Week[,'days']
RPI_Weather_Week[,'temp']
RPI_Weather_Week[1:5,c("days","temp")]
RPI_Weather_Week$temp

##Select data that meets certain conditions or related columns from a data frame
subset(RPI_Weather_Week,subset = snowed== 'T')

sorted.snowed <- order(RPI_Weather_Week['snowed'])
sorted.snowed
RPI_Weather_Week[sorted.snowed,]

dec.snow <- order(-RPI_Weather_Week$temp)# descending order based on attributes
dec.snow 

# create dataframes
empty.DataFrame <- data.frame()
v1 <- 1:10
v1
letters # give 'a' to 'z'
v2 <- letters[1:10]
newdf <- data.frame(col.name.1 = v1,col.name.2 = v2)
newdf



# set the work directory
setwd("/Users/koko/documents/data_analytics/code/DataAnalyticsSpring2020/lab0123")
#read in csv file
GPW <- read.csv("GPW3_GRUMP_SummaryInformation_2010.csv")
View(GPW)

#read the excel 
# read directly
install.packages(readxl)
library(readxl)
EPIdataxls <- read_excel("2010EPI_data.xls",sheet = "EPI2010_onlyEPIcountries") 
View(EPIdataxls)
# remove the firts line of csv, the first line is note. And then add header = TRUE
EPI_data <- read.csv("2010EPI_data.csv",header = TRUE)


View(EPI_data)
attach(EPI_data) 	
# before fix install XQuartz on mac
fix(EPI_data) 	# launches a simple data editor
EPI <- EPI_data$EPI 			# prints out values EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
tf
E <- EPI[!tf] # filters out NA values, new array

# exercise1
summary(EPI)
fivenum(EPI)#Returns Tukey's five number summary (minimum, lower-hinge, median, upper-hinge, maximum) for the input data.
stem(EPI)# leaf stem image
hist(EPI)# histgrom
hist(EPI, seq(30., 95., 1.0), prob=TRUE) # the parameters of seq is that (start,end,step)
# draw lines based on the hist,usage line(x, y, iter = 1)
# density,the first element is data source, and na.rm is (logical; if TRUE, missing values are removed from x. If FALSE any missing values cause an error.)
#t bw he smoothing bandwidth to be used
lines(density(EPI,na.rm=TRUE,bw=1.)) 
rug(EPI) 
#A rug plot is a plot of data for a single quantitative variable, displayed as marks along an axis. It is used to visualise the distribution of the data. As such it is analogous to a histogram with zero-width bins, or a one-dimensional scatter plot.




