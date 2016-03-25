# Download the data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
destfile="household_power_consumption.zip")
			  
# Unpack the zip file
unzip(zipfile="household_power_consumption.zip")

library(sqldf)

# Read all household power consumption data
hpc <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE, sep=";")

###
# Graph 2.
###

datetime <- paste(hpc$Date, hpc$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

png('plot2.png', width=480, height=480)
plot(datetime, hpc$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(datetime, hpc$Global_active_power)
#dev.copy(png, file = "plot2.png")
dev.off()
