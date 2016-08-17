#setwd("My Music/Coursera/Course 4 - Exploratory data analysis/Week1/Quiz")

# Load data
library(sqldf)
data <- read.csv.sql(
    file = "household_power_consumption.txt", 
    sep = ";",
    "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

# convert "?" to NA
data[data == "?"] = NA

png(filename="plot1.png", width = 480, height = 480)

hist(
    x = data$Global_active_power, 
    col = "red", 
    xlab = "Global Active Power (kilowatts)", 
    main = "Global Active Power")

dev.off()