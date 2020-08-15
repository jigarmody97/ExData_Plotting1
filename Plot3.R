Plot3 <- function(){
  ## reading the data, edit the path to the data file
  data <- read.table("~/R/Practice/household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";")
  ## naming the columns
  names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  ## addinga date/time variable combining the date and the time
  datetime <- strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  ## adding the new variable to the data set
  data <- cbind(datetime, data)
  ## opening a png file
  png(filename = "Plot3.png", width = 480, height = 480)
  ## plotting the data and adding sub metering 2 and 3 data with lines function
  plot(data$datetime, data$Sub_metering_1, ylab = "Energy sub metering", type = "l", col = "black")
  lines(data$datetime, data$Sub_metering_2, col = "red")
  lines(data$datetime, data$Sub_metering_3, col = "blue")
  dev.off()
}
