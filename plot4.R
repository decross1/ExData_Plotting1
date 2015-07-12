## JHU Data Science: Exploratory Data Analysis - Course Project 1

## load libraries that might be useful for the project
library(ggplot2)
library(dplyr)
library(lubridate)
library(tidyr)

## Set proper working directory, for the JHU folders and verify the dataset is stored in folder
setwd("C:/Users/Maegz/Documents/Exploratory Data Analysis")
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
png(filename = "plot4.png"
    ,width = 480
    ,height = 480
    ,units = "px"
    ,bg = "white"
)

## to set up the facets
par(mfrow=c(2,2))

with(df1, {
  plot(Global_active_power ~ Dateupdated
       ,type = "l"
       ,ylab = "Global Active Power (kilowatts)"
       ,xlab="")
  plot(Voltage ~ Dateupdated
       ,type = "l"
       ,ylab = "Voltage (volt)"
       ,xlab = "")
  plot(Sub_metering_1 ~ Dateupdated
       ,type = "l"
       ,ylab = "Global Active Power (kilowatts)"
       ,xlab = "")
  lines(Sub_metering_2 ~ Dateupdated, col = "red")
  lines(Sub_metering_3 ~ Dateupdated, col = "Blue")
  
  legend("topright"
         ,col = c("black", "red", "blue")
         ,lty = 1
         ,lwd = 2
         ,bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Dateupdated
       ,type = "l"
       ,ylab = "Global Reactive Power (kilowatts)"
       ,xlab = ""
       )
})

## close current graphics device
dev.off()
