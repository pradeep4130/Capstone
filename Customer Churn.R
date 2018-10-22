
# Install packages needed for reading csv files
#install.packages("gdata")
#install.packages("xlsx")
#install.packages("tidyr")
#install.packages("dplyr")
#install.package("caret")
#install.package("psych")


# Load the packages
library(gdata)
library(xlsx)
library(tidyr)
library(dplyr)
library(psych)
library(caret)


# Set the working directory
getwd()
setwd("D:/R/capstone")
cat("-----------------------------------------------------------------/n")

# Read the Customer churn csv file
rawData=read.csv("D:/R/capstone/Customer_Churn.csv", header=TRUE)

#Check if all was read fine
dim(rawData)
colnames(rawData)
head(rawData)
tail(rawData)
lapply(rawData,mean)

# 2. Pre-processing
# For input categorical columns-apply ‘dummy coding/one-hot encoding’ 
# using dummy.code function from psych library

#figure out which cols are categorical

categldx <- which(lapply(rawData,class) == "factor")
categldx

#Write for loop from 1 to all numbers in categIdx 
#and in for loop apply dummy.code. Collect the result and 
#append it to end of rawData using cbind(rawData,result)

result <- for(x in 2:length(categldx)){

 dummy.code(rawData %>% categldx[x])

}
View(result)


#figure out which cols are numerical

numeldx = unlist(lapply(rawData,is.numeric))
numeldx










