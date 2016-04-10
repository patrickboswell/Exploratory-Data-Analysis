##Read Electric power consumption data and subset for data collected from 1/2/2007 to 2/2/2007
epc <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec = ".")
epc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

##Merge Date and Time into Datetime and preserve Date class
epc$Datetime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Producing Histogram plot of Global Active Power
png(filename = "plot2.png", width = 480, height = 480) ##Initiate png plotting Device
with(epc, plot(Datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()