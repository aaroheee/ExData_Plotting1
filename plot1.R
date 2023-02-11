setwd("D:/Python & R Practice/exdata_data_household_power_consumption")
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                 nrows=2075259, quote='\"')
data_filtered <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

png("plot1.png", width = 480, height = 480)
hist(data_filtered$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency", col='red')
dev.off()
