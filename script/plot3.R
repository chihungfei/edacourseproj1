myData <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

#Filtering dataset

myData <- myData[which(myData$Date == "1/2/2007" | myData$Date == "2/2/2007"), ]

#Altering formats of date and time
DT <- strptime(paste(myData$Date, myData$Time), format = "%d/%m/%Y %H:%M:%S")

#Extracting Global Active Power
GAP <- myData$Global_active_power

#Plotting
png("plot3.png")
plot(DT, myData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(DT, myData$Sub_metering_2, type = "l", col = "red")
lines(DT, myData$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()