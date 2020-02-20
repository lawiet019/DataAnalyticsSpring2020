# install the library
# load the library 
library(rpart)
library(rpart.plot)
library(ggplot2)
data("msleep")
str(msleep)
## creating a new data frame with the 3 = vore
#,6=sleep_total, 10=brainwt, 11=bodywt
mSleepDF1<- msleep[,c(3,6,10,11)]
View(mSleepDF1)
# to predict sleep_total base on the all the attributes
#anova -Analysis of variance (ANOVA) is a collection of
#statistical models and their associated estimation procedures 
#(such as the "variation" among and between groups) used to analyze the differences among group means in a sample
sleepModel_1 <- rpart(sleep_total ~ ., data=mSleepDF1, method = "anova")
sleepModel_1
## type = 3, Draw separate split labels for the left and right directions.See the documentation
#fallen.leaves = TRUE, Default TRUE to position the leaf nodes at the bottom of the graph.
#It can be helpful to use FALSE if the graph is too crowded and the text size is too small.
rpart.plot(sleepModel_1,type=3,fallen.leaves = TRUE)
# for digit, it will see Keep a few decimal places
rpart.plot(sleepModel_1, type = 3,digits = 3, fallen.leaves = TRUE) 
rpart.plot(sleepModel_1, type = 3,digits = 4, fallen.leaves = TRUE) 

# what is the differece betwwen ctree nad rpart
#https://stats.stackexchange.com/questions/12140/conditional-inference-trees-vs-traditional-decision-trees
require(C50)
data("iris")
str("iris")
# table uses the cross-classifying factors to build a contingency table of the counts at each combination of factor levels.
table(iris$Species)
set.seed(9850)
# runif -These functions provide information about the uniform distribution on the interval from min to max.
# runif generates random deviates.
#nrow and ncol return the number of rows or columns present in x. NCOL and NROW 
grn <-runif(nrow(iris))
# random choose some lines from iris
irisrand <-iris[order(grn),]
irisrand <-iris[order(grn),]

