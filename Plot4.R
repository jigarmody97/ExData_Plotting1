Plot4 <- function(){
  ## reading data line, edit the path to the data file
  data <- read.table("~/R/Practice/household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";")
  ## naming the columns
  names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  ## creating a new date/time variable combining the date and time
  datetime <- strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  ## adding new variable to the data set
  data <- cbind(datetime, data)
  ## opening a png file
  png(filename = "Plot4.png", width = 480, height = 480)
  ## setting space for adding 4 plots
  par(mfrow = c(2,2))
  ## plotting first plot
  plot(data$datetime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l")
  ## plotting second plot
  plot(data$datetime, data$Voltage, xlab = "Datetime", ylab = "Voltage", type = "l")
  ## plotting third plot
  plot(data$datetime, data$Sub_metering_1, ylab = "Energy sub metering", type = "l", col = "black")
  lines(data$datetime, data$Sub_metering_2, col = "red")
  lines(data$datetime, data$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)
  ## plotting fourth plot
  plot(data$datetime, data$Global_reactive_power, xlab = "Datetime", ylab = "Global_reactive_power", type ="l")
  dev.off()
}
