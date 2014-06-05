# Plot4.R
# -----------------------------


## Readind data
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses=c(Date="character", Time="character"))
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

x <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

loc <- Sys.getlocale("LC_TIME")

## Plot 4
Sys.setlocale("LC_TIME", "English")
mfrow = par("mfrow")
par(mfrow = c(2,2))
# 1, 1
plot(x$Time, x$Global_active_power, type = "l", lwd = 1, 
     xlab = "", ylab = "Global Active Power (kilowatts)")
# 1, 2
plot(x$Time, x$Voltage, type = "l", lwd = 1, 
     xlab = "datetime", ylab = "Voltage")
# 2, 1
plot(x$Time, x$Sub_metering_1, type = "l", lwd = 1, col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(x$Time, x$Sub_metering_2, col = "red")
lines(x$Time, x$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
# 2, 2
plot(x$Time, x$Global_reactive_power, type = "l", lwd = 1, col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")


Sys.setlocale("LC_TIME", loc)

# Save to file
dev.copy(png, "plot4.png")
dev.off()
