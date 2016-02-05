require('dplyr')
require('magrittr')
setwd("~/GitHub/ExData_Plotting1")

poweruse <- 
  read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") %>%
  subset(Date == '1/2/2007' | Date == '2/2/2007') %>%
  mutate(Date_time = paste(as.Date(Date, format = "%d/%m/%Y"), Time))

png("plot2.png", width=480, height=480, units="px")

plot(strptime(poweruse$Date_time, "%Y-%m-%d %H:%M:%S"), 
     poweruse$Global_active_power, 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     type="l")

dev.off()
