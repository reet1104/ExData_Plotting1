

data <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subset_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

subset_data$DateTime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

# Setting up a 2x2 plotting area
par(mfrow = c(2, 2))

#plot1
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt = "n")
axis.POSIXct(1, at = seq(min(subset_data$DateTime), max(subset_data$DateTime), by = "day"), 
             format = "%A")

#plot2
plot(subset_data$DateTime, subset_data$Voltage, type = "l", ylab = "Voltage", xlab = "Datetime", xaxt = "n")
axis.POSIXct(1, at = seq(min(subset_data$DateTime), max(subset_data$DateTime), by = "day"), 
             format = "%A")

#plot3
plot(subset_data$DateTime, subset_data$Sub_metering_1, ylab = "Energy Sub Metering", type = "l", xlab = "", xaxt = "n")

#plot4
lines(subset_data$DateTime, subset_data$Sub_metering_2, type = "l", col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, type = "l", col = "blue")
axis.POSIXct(1, at = seq(min(subset_data$DateTime), max(subset_data$DateTime), by = "day"), 
             format = "%A")

plot(subset_data$DateTime, subset_data$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "Datetime", xaxt = "n")
axis.POSIXct(1, at = seq(min(subset_data$DateTime), max(subset_data$DateTime), by = "day"), 
             format = "%A")

dev.copy(png,"plot4.png")
dev.off()