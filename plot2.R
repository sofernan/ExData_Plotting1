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
plot(subset.power_data$newdate,subset.power_data$Global_active_power,type="n",
     xlab="",ylab="Global Active Power (kilowatts)")
lines(subset.power_data$newdate,subset.power_data$Global_active_power)
dev.copy(png, file = "plot2.png")
dev.off() 
