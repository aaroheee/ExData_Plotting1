setwd("D:/Python & R Practice/exdata_data_household_power_consumption")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                 nrows=2075259, quote='\"')


fData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
datetime <- strptime(paste(fData$Date, fData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(fData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
