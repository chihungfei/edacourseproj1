myData <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

#Filtering dataset

myData <- myData[which(myData$Date == "1/2/2007" | myData$Date == "2/2/2007"), ]

#Altering formats of date and time
DT <- strptime(paste(myData$Date, myData$Time), format = "%d/%m/%Y %H:%M:%S")

#Extracting Global Active Power
GAP <- myData$Global_active_power

#Plotting
png("plot2.png")
plot(DT, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()