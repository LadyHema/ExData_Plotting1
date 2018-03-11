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
       col = c("black", "red", "blue"), lwd = 1)
dev.copy(png,'plot3.png')
dev.off()


