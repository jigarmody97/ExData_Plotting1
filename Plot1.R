Plot1 <- function(){
  ## data reading line, enter the path to the file
  data <- read.table("~/R/Practice/household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";")
  ## adding names to the columns
  names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  ## open a png file according to the requirements
  png(filename = "Plot1.png", width = 480, height = 480)
  ## plotting the data
  hist(data$Global_active_power, col = "red", main = "Global Active Power")
  dev.off()
}
