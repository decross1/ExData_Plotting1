## JHU Data Science: Exploratory Data Analysis - Course Project 1

## load libraries that might be useful for the project
library(ggplot2)
library(dplyr)
library(lubridate)
library(tidyr)

## Set proper working directory, for the JHU folders and verify the dataset is stored in folder
setwd("//prod-am.ameritrade.com/userhome/cro202/My Documents/JHU Data Science Spec/Exploratory Data Analysis/Course Project 1")
getwd()
list.files()

## read in the data and store it in variable df(dataframe)
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE,  na.strings = "?", stringsAsFactors = FALSE, comment.char = "", quote = '\"')

## to store a copy of the original df, for testing purposes
df1 <- df

## to preview the df, and verify everything was read in properly
head(df1)
View(df1)

## convert the dates to a class easier to handle in R
df1$Date <- as.Date(df1$Date, format="%d/%m/%Y")

## to subset to the dates we are concerned with 
df1 <- subset(df1, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

## open graphics device png
png(filename = "plot1.png"
    ,width = 480
    ,height = 480
    ,units = "px"
    ,bg = "white"
    )

## plot the histogram to the open graphics device (png)
hist(df1$Global_active_power
     ,main = "Global Active Power"
     ,xlab = "Global Active Power (Kilowatts)"
     ,ylab = "Frequency"
     ,col = "orangered"
     ,ylim = c(0, 1200)
     )

## close current graphics device
dev.off()

    

