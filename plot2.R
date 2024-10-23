

library(dplyr)

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

data <- data %>%
  filter(DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))

plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt = "n")

axis(1, at = seq(from = as.POSIXct("2007-02-01"), to = as.POSIXct("2007-02-02"), by = "1 day"),
     labels = format(seq(from = as.POSIXct("2007-02-01"), to = as.POSIXct("2007-02-02"), by = "1 day"), "%A"))

dev.copy(png,"plot2.png")
dev.off()


