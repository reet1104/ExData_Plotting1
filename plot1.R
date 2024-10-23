memory_required <- 2075259 * 9 * 8 / (1024^2)  # in MB
print(memory_required)

data <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

subset_data$DateTime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power",yaxt = "n")

dev.copy(png,"plot1")
dev.off()