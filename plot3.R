rm(list=ls())
setwd("/Users/sophiafernando/Documents/CourseraDataScience/ExploratoryDataAnalysis/Data")
library(R.devices)

power_data <- NULL
power_data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings="?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates rather than reading in the 
# entire dataset and subsetting to those dates.
# Our overall goal here is simply to examine how household energy usage varies over a 2-day 
# period in February, 2007.
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

D1 <- as.Date("2007-02-01","%Y-%m-%d")
D2 <- as.Date("2007-02-02","%Y-%m-%d")

subset.power_data <- subset(power_data, as.Date(Date,"%d/%m/%Y") %in% c(D1, D2))  
subset.power_data$newdate <- as.POSIXct(paste(subset.power_data$Date, subset.power_data$Time), format="%d/%m/%Y %H:%M:%S")

## Plot 3
par(mfrow=c(1,1))
plot(subset.power_data$newdate,subset.power_data$Sub_metering_1,type="n",
     xlab="",ylab="Energy sub metering")
lines(subset.power_data$newdate,subset.power_data$Sub_metering_1)
lines(subset.power_data$newdate,subset.power_data$Sub_metering_2,col="red")
lines(subset.power_data$newdate,subset.power_data$Sub_metering_3,col="blue")

# lty=c(1,2)
legend( x="topright", 
        legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
        col=c("black","red","blue"), lwd=1, cex=0.7 , bty="n", inset = .05)

dev.copy(png, file = "plot3.png")
dev.off() 

