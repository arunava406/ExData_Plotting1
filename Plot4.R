dev.cur()
getwd()
data_full <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(data1$Global_active_power~ data1$Datetime, type = "l",ylab = "Global Access Power", xlab = "")

plot(data1$Voltage ~ data1$Datetime, type = "l",ylab = "voltage", xlab = "datetime")

plot(data1$Sub_metering_1 ~ data1$Datetime, type="l",ylab="Energy sub metering", xlab="")
lines(data1$Sub_metering_2 ~ data1$Datetime, col = "red")
lines(data1$Sub_metering_3 ~ data1$Datetime, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data1$Global_reactive_power ~ data1$Datetime, type = "l",ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
