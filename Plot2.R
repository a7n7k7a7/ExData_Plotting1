# Read dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# change format of Date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Pick rows
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Add variable representing date and time
data <- transform(data, date_time = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# Create plot and save it in Plot2.png file
png(file = "Plot2.png")
plot(x = data$date_time, y = as.numeric(as.character(data$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()