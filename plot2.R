###############################################################################
# Plot #2
# Coursera - Exploratory Data Analysis - Course Project #1
# Marc-Michel Isabelle
# 2014-07-12
# Data source : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
###############################################################################

# Set working directory
setwd("N:/Data Science/04 EDA/cp1")

# Change local regional setting
Sys.setlocale("LC_TIME", "English")

# Import the fle
filename = "household_power_consumption.txt"
data <- read.csv(filename, 
                 sep = ";", 
                 header = TRUE, 
                 skip = 0, 
                 na.strings = "?",
                 dec = ".")

# Subset the required date
power.cons <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Format to DateTime
power.cons$test <- paste(power.cons$Date, power.cons$Time, sep=" ")
power.cons$DateTime <- strptime(power.cons$test, format="%d/%m/%Y %H:%M:%S")
power.cons <- power.cons[-10]

# Construct the plot and save it to a PNG file
png(filename="plot2.png", width=480, height=480)
plot(power.cons$DateTime, 
     power.cons$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = "") 
dev.off()
