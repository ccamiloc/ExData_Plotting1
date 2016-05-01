##
## Author: Cassio Camilo
## Date: 2016-05-01
##
## This R script is used to Course Project 1 Assignment of the Exploratory Data Analysis course at Coursera.
##
## This one generate a plot grafic - Plot 2
##
library(dplyr)

## First we have to load the data set file and generate a subset data containing 
## only the observations to days 01 and 02 from February 2007.
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Set the driver grafic PNG as default output
png("plot4.png", width = 480, height = 480, units = "px")

#Generate the grafic
x <- dados$Sub_metering_1
y <- dados$Sub_metering_2
z <- dados$Sub_metering_3
xaxis <- strptime(paste(dados$Date,dados$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))
plot(strptime(paste(dados$Date,dados$Time), format = "%d/%m/%Y %H:%M:%S"), dados$Global_active_power, type="l", xlab = "", ylab= "Global Active Power")
plot(strptime(paste(dados$Date,dados$Time), format = "%d/%m/%Y %H:%M:%S"), dados$Voltage, type="l", xlab = "datetime", ylab= "Voltage")
plot(xaxis,x, type="l", ylab = "Energy sub metering", xlab = "")
lines(xaxis, y, type= "l", col= "red")
lines(xaxis, z, type= "l", col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1), box.lwd = 0)
plot(strptime(paste(dados$Date,dados$Time), format = "%d/%m/%Y %H:%M:%S"), dados$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")

#Close the grafic driver
dev.off()