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

hist(household$Global_active_power, col = "red", 
     xlab = "Global active power (kilowatts)", main = "Global active power")
dev.copy(png,'plot1.png')
dev.off()
