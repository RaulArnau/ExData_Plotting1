# Plot1.R
# -----------------------------

## Readind data
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses=c(Date="character", Time="character"))
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

x <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]


## Plot 1
hist(x$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red", main = "Global Active Power")


# Save to file
dev.copy(png, "plot1.png")
dev.off()

