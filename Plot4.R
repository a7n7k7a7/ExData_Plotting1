# Read dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# change format of Date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Pick rows
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Add variable representing date and time
data <- transform(data, date_time = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# Create plot and save it in Plot4.png file
png(file = "Plot4.png")

par(mfrow = c(2, 2))

# Plot 1
plot(x = data$date_time, y = as.numeric(as.character(data$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2
plot(x = data$date_time, y = data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(x = data$date_time, y = data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(x = data$date_time, y = data$Sub_metering_2, type = "l", col = "red")
lines(x = data$date_time, y = data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty = "n")

# Plot 4
plot(x = data$date_time, y = as.numeric(as.character(data$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()