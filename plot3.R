# Download the data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
destfile="household_power_consumption.zip")
			  
# Unpack the zip file
unzip(zipfile="household_power_consumption.zip")

library(sqldf)

# Read all household power consumption data only for 1/2/2007 and 2/2/2007
hpc <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE, sep=";")

###
# Graph 3.
###

# Combine date and time into a single value
datetime <- paste(hpc$Date, hpc$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Open PNG graphics device with width 480 and height 480
png('plot3.png', width=480, height=480)

# Set up a line plot of datetime and Sub_metering_1 with no x label and a y label
plot(datetime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
# Add the lines for datetime and Sub_metering_2
lines(datetime, hpc$Sub_metering_2, col="red")
# Add the lines for datetime and Sub_metering_3
lines(datetime, hpc$Sub_metering_3, col="blue")
# Add a legend with no border
legend("topright", col=c("black", "red", "blue"), legend=colnames(hpc)[7:9], lty=c(1,1,1), lwd=c(1,1,1))

#dev.copy(png, file = "plot3.png") # alternative (not used)

# Turn off graphics device
dev.off()
