setwd("D:/Python & R Practice/exdata_data_household_power_consumption")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                 nrows=2075259, quote='\"')
fData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(fData$Date, fData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
SubMetering1 <- as.numeric(fData$Sub_metering_1)
SubMetering2 <- as.numeric(fData$Sub_metering_2)
SubMetering3 <- as.numeric(fData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime,SubMetering1, type="l", xlab="", ylab="Energy sub metering", col = "black")
lines(datetime,SubMetering2, col="red")
lines(datetime,SubMetering3, col="blue ")
legend(x="topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.off()
