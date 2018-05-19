rm(list=ls())
library(dplyr)

## Grab the Data
setwd("C:/Users/domin/Desktop/CourseraProjects/Exploratory Data Analysis")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";")

## Change Data Types
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
str(data)
power <- data %>% filter(DateTime >= "2007-02-01" & DateTime <"2007-02-03")
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))

## Puts Plot into different file
png("plot2.png", width = 480, height = 480)

## Creates Active Power Line Graph
plot(power$DateTime, power$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (Kilowatts)")

dev.off()
