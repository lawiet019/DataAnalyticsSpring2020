setwd("/Users/koko/documents/data_analytics/code/DataAnalyticsSpring2020/lab0203")
#Figure out how to include multiple independent variables 
multivariates <- read.csv("multivariate.csv")
attach(multivariates)

HP<- Homeowners/Population
PD<-Population/area
#lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis of covariance
mm<-lm(Immigrant~Income+Population+HP+PD)
plot(Immigrant~Income+Population+HP+PD)
cm
View(multivariates)


# to use %>% ,need to install package and load library


library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%



# examples on pipe operator
df_mtcars<-mtcars
head(df_mtcars)
# nesting
filter(df_mtcars,mpg>20)
help(sample_n)
sample_n(filter(df_mtcars,mpg>20),10)
arrange(sample_n(filter(df_mtcars,mpg>20),10),desc(mpg))

