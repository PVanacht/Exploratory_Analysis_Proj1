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
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))


## Puts Plot into different file
png("plot3.png", width = 480, height = 480)

## Creates Sub Metering Line Graph
plot(power$DateTime, power$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy Sub Metering")
lines(power$DateTime, power$Sub_metering_2, col = "Red")
lines(power$DateTime, power$Sub_metering_3, col = "Blue")
legend("topright", col = c("black", "red", "blue"), 
       c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = c(1,1))

?legend

dev.off()
