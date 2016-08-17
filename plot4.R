#setwd("My Music/Coursera/Course 4 - Exploratory data analysis/Week1/Quiz")

# Load data
library(sqldf)
data <- read.csv.sql(
    file = "household_power_consumption.txt", 
    sep = ";",
    "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

# convert "?" to NA
data[data == "?"] = NA

# add new column date+time
data$DateTime <- strptime(
    paste(data$Date, data$Time, sep = " "), 
    format = "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# 1st plot
plot(
    x = data$DateTime,
    y = data$Global_active_power, 
    xlab = "", 
    ylab = "Global Active Power", 
    type = "l",
    ylim = c(0, 8))

# 2nd plot
plot(
    x = data$DateTime,
    y = data$Voltage, 
    xlab = "datetime", 
    ylab = "Voltage", 
    type = "l",
    ylim = c(234, 246))

# 3rd plot
plot(
    x = data$DateTime,
    y = data$Sub_metering_1, 
    xlab = "", 
    ylab = "Energy sub metering", 
    type = "l",
    ylim = c(0, 40))
lines(
    x = data$DateTime, 
    y = data$Sub_metering_2, 
    type = "l", 
    col = "red")
lines(
    x = data$DateTime, 
    y = data$Sub_metering_3, 
    type = "l", 
    col = "blue")
legend(
    "topright", 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    col = c("black", "red", "blue"),
    lwd = 1,
    seg.len = 1,
    bty = "n")

# 4th plot
plot(
    x = data$DateTime,
    y = data$Global_reactive_power, 
    xlab = "datetime", 
    ylab = "Global_reactive_power", 
    type = "l",
    ylim = c(0.0, 0.5))

dev.off()