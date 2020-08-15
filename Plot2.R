Plot2 <- function(){
  data <- read.table("~/R/Practice/household_power_consumption.txt", skip = 66637,nrows = 2880, sep = ";")
  names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  datetime <- strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  data <- cbind(datetime, data)
  png(filename = "Plot2.png", width = 480, height = 480)
  plot(data$datetime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l")
  dev.off()
}
