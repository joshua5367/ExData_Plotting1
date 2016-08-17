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

png(filename="plot2.png", width = 480, height = 480)

plot(
    x = data$DateTime,
    y = data$Global_active_power, 
    xlab = "", 
    ylab = "Global Active Power (kilowatts)", 
    type = "l")

dev.off()