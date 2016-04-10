##Read Electric power consumption data and subset for data collected from 1/2/2007 to 2/2/2007
epc <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec = ".")
epc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

##Merge Date and Time into Datetime and preserve Date class
epc$Datetime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)

##Producing Histogram plot of Global Active Power
png(filename = "plot3.png", width = 480, height = 480) ##Initiate png plotting Device
with(epc, {
  plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Datetime, Sub_metering_2, type = "l", col = "red")
  lines(Datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
  })
dev.off()