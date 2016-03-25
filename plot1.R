# Download the data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
destfile="household_power_consumption.zip")
			  
# Unpack the zip file
unzip(zipfile="household_power_consumption.zip")

library(sqldf)

# Read all household power consumption data
hpc <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE, sep=";")

###
# Graph 1.
###

png('plot1.png', width=480, height=480)
hist(hpc$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
#dev.copy(png, file = "plot1.png")
dev.off()
