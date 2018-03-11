#read data
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              method = "curl", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
household <- read.table("household_power_consumption.txt",
              sep = ";", dec = ".", na.strings = "?", skip = 66637, nrows = 2880)
names(household) <- names(read.table("household_power_consumption.txt", header = TRUE,
                        sep = ";", dec = ".", na.strings = "?", nrows = 1))
household$Date <- as.Date(strptime(household$Date, "%d/%m/%Y"))
household$Time <- strptime(paste(household$Date, household$Time), "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2), mar= c(4,4,4,4))
#plot 1
plot(household$Time, household$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

#plot 2
plot(household$Time, household$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage" )


#plot 3
plot(household$Time, household$Sub_metering_1, type = "l", xlab = "", ylab = "", 
     col = "black", ylim = c(0,38))
par(new = T)
plot(household$Time, household$Sub_metering_2, type = "l", xlab = "", ylab = "", 
     col = "red", ylim = c(0, 38))
par(new = T)
plot(household$Time, household$Sub_metering_3, type = "l", xlab = "", 
     ylab = "Energy sub metering", 
     col = "blue", ylim = c(0, 38))

legend(legend = list("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), "topright",
       col = c("black", "red", "blue"), lwd = 1, cex = 0.7, bty = "n")

#plot4
plot(household$Time, household$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power" )


dev.copy(png,'plot4.png')
dev.off()


