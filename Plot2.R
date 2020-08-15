Plot2 <- function(){
  ## data reading line, edit the path to the data file
  data <- read.table("~/R/Practice/household_power_consumption.txt", skip = 66637,nrows = 2880, sep = ";")
  ## naming the columns
  names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  ## creating a date/time variable combining the data and time
  datetime <- strptime(paste(data$Date, data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  ## adding the new variable to the data frame
  data <- cbind(datetime, data)
  ## opening a png file
  png(filename = "Plot2.png", width = 480, height = 480)
  ## plotting the data
  plot(data$datetime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l")
  dev.off()
}
