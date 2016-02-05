require('dplyr')
require('magrittr')
setwd("~/GitHub/ExData_Plotting1")

poweruse <- 
  read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") %>%
  subset(Date == '1/2/2007' | Date == '2/2/2007') %>%
  mutate(Date_time = paste(as.Date(Date, format = "%d/%m/%Y"), Time))

png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(strptime(poweruse$Date_time, "%Y-%m-%d %H:%M:%S"), 
     poweruse$Global_active_power, 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     type="l")

plot(strptime(poweruse$Date_time, "%Y-%m-%d %H:%M:%S"), 
     poweruse$Voltage,
     xlab="datetime",
     ylab="Voltage",
     type="l")

plot(strptime(poweruse$Date_time, "%Y-%m-%d %H:%M:%S"), 
     poweruse$Sub_metering_1, 
     type="l", 
     col=1,
     xlab="",
     ylab="Energy sub metering")
lines(strptime(poweruse$Date_time, "%Y-%m-%d %H:%M:%S"), poweruse$Sub_metering_2, type="l", col=2)
lines(strptime(poweruse$Date_time, "%Y-%m-%d %H:%M:%S"), poweruse$Sub_metering_3, type="l", col=4)
legend("topright", legend = colnames(poweruse[7:9]), col=c(1,2,4), pch="_", bty="n")

plot(strptime(poweruse$Date_time, "%Y-%m-%d %H:%M:%S"), 
     poweruse$Global_reactive_power, 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     type="l")

dev.off()

