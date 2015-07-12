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

## to concat the dates and times together
date_with_time <- paste(as.Date(df1$Date), df1$Time)
df1$Dateupdated <- as.POSIXct(date_with_time)

## open graphics device png
png(filename = "plot2.png"
    ,width = 480
    ,height = 480
    ,units = "px"
    ,bg = "white"
)

## plot the second graph to the open graphics device
plot(df1$Dateupdated
     ,df1$Global_active_power
     ,type = "l"
     ,ylab="Global Active Power (kilowatts)"
     ,xlab=""
     )

## close current graphics device
dev.off()


