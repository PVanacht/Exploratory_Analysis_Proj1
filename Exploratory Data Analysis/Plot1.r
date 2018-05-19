
rm(list=ls())
library(dplyr)

## Grab the Data
setwd("C:/Users/domin/Desktop/CourseraProjects/Exploratory Data Analysis")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";")

## Change Data Types
data$Date <- as.Date(data$Date, "%d/%m/%Y")
power <- data %>% filter(Date >= "2007-02-01" & Date <="2007-02-02")
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))

## Puts Plot into different file
png("plot1.png", width = 480, height = 480)

## Creates Active Power Histogram
hist(power$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "Red")

dev.off()
