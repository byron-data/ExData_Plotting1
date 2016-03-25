# Download the data
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
destfile="household_power_consumption.zip")
			  
# Unpack the zip file
unzip(zipfile="household_power_consumption.zip")

library(sqldf)

# Read all household power consumption data
hpc <- read.csv.sql("household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE, sep=";")

###
# Graph 3.
###

png('plot3.png', width=480, height=480)
plot(datetime, hpc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(datetime, hpc$Sub_metering_1)
lines(datetime, hpc$Sub_metering_2, col="red")
lines(datetime, hpc$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=colnames(hpc)[7:9], lty=c(1,1,1), lwd=c(1,1,1))
#dev.copy(png, file = "plot3.png")
dev.off()
