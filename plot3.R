# Plot3.R
# -----------------------------


## Readind data
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses=c(Date="character", Time="character"))
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

x <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

loc <- Sys.getlocale("LC_TIME")

## Plot 3
Sys.setlocale("LC_TIME", "English")
plot(x$Time, x$Sub_metering_1, type = "l", lwd = 1, col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(x$Time, x$Sub_metering_2, col = "red")
lines(x$Time, x$Sub_metering_3, col = "blue")

Sys.setlocale("LC_TIME", loc)

# Save to file
dev.copy(png, "plot3.png")
dev.off()

