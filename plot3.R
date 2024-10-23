
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subset_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

subset_data$DateTime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

plot(subset_data$DateTime, subset_data$Sub_metering_1, ylab = "Energy Sub Metering", type = "l", xlab = "", xaxt = "n")

lines(subset_data$DateTime, subset_data$Sub_metering_2, type = "l", col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, type = "l", col = "blue")

axis.POSIXct(1, at = seq(min(subset_data$DateTime), max(subset_data$DateTime), by = "day"), 
             format = "%A")

legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png,"plot3.png")
dev.off()