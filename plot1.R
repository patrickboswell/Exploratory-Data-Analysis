##Read Electric power consumption data and subset for data collected from 1/2/2007 to 2/2/2007
epc <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec = ".")
epc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
epc$Global_active_power <- as.numeric(epc$Global_active_power) ##Convert to numeric to be usable hist()

##Producing Histogram plot of Global Active Power
png(filename = "plot1.png", width = 480, height = 480) ##Initiate png plotting Device
hist(epc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()