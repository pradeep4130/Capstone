
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



