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



plot(household$Time, household$Global_active_power, type = "l",
     xlab = "", ylab = "Global active power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()

