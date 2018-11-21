
# Install packages needed for reading csv files
#install.packages("gdata")
#install.packages("xlsx")
#install.packages("tidyr")
#install.packages("dplyr")
#install.package("caret")
#install.package("psych")


# Load the packages
#library(gdata)
#library(xlsx)
library(tidyr)
library(dplyr)
library(psych)
library(caret)
library(VIM)


# Set the working directory
getwd()
setwd("D:/R/capstone")
cat("-----------------------------------------------------------------/n")

# 1. Read the Customer churn csv file
rawData=read.csv("D:/R/capstone/capstone/Customer_Churn.csv", header=TRUE)

# 1.1 Check if all was read fine
dim(rawData)
colnames(rawData)
head(rawData)
tail(rawData)
lapply(rawData,mean)

# 2. Pre-processing

# 2.1figure out which cols are numerical

numeIdx = which(unlist(lapply(rawData,is.numeric)))
numeIdx = data.frame(numeIdx)

head(numeIdx)

# Total missing values
length(which(is.na(rawData)))

# Which columns have missing values
summary(rawData)

# Check for missing values and decide what you want to do about them.
missingIdx <- which(is.na(rawData[,20]))

# kNN imputation

rawData <- kNN(rawData, variable = "TotalCharges", k=6)
summary(rawData)

for(i in missingIdx){
print(rawData[i,20])
}

rawData <- subset(rawData, select = customerID:Churn)
summary(rawData)



# If replacing missing values with mean value

# mean(rawData[,20],is.na=TRUE)
# for (i in missingIdx) {
#    rawData$TotalCharges[i] <- 2283.3
# }

#For input numerical columns, apply centering, scaling, remove columns 
#with zero variance or near-zero variance.


for (i in numeIdx){
preProcValues <- preProcess(rawData[,i],method = c("center","scale", "zv","nzv"))
PredValues <- predict(preProcValues, rawData)
}

head(PredValues)
View(PredValues)


# 2.2 For input categorical columns-apply ‘dummy coding/one-hot encoding’ 
# using dummy.code function from psych library

#figure out which cols are categorical

categldx <- which(unlist(lapply(rawData,class) == "factor"))
categldx <- data.frame(categldx)

class(categldx)

# Remove customerID column from categldx

idx = which(colnames(rawData)=="customerID")
categldx = categldx[-idx,]


#Write for loop from 1 to all numbers in categIdx 
#and in for loop apply dummy.code. Collect the result and 
#append it to end of rawData using cbind(rawData,result)

#y <- categldx[2]
#y
#rawData[y]

for (i in categldx){ 
  result = dummy.code(rawData[,i])
  colnames(result) = paste(colnames(rawData[i]),unique(rawData[,i]), sep = "_")
  rawData = cbind(rawData,result)
}


View(rawData)
summary(rawData)


