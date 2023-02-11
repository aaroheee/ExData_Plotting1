setwd("D:/Python & R Practice/exdata_data_household_power_consumption")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                 nrows=2075259, quote='\"')
fData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(fData$Date, fData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(fData$Global_active_power)

Voltage <- as.numeric(fData$Voltage)

SubMetering1 <- as.numeric(fData$Sub_metering_1)
SubMetering2 <- as.numeric(fData$Sub_metering_2)
SubMetering3 <- as.numeric(fData$Sub_metering_3)

globalReactivePower <- as.numeric(fData$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime,SubMetering1, type="l", xlab="", ylab="Energy sub metering", col = "black")
lines(datetime,SubMetering2, col="red")
lines(datetime,SubMetering3, col="blue ")
legend(x="topright",lty=1,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

plot(datetime,globalReactivePower, type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
