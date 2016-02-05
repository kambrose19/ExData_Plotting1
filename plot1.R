require('dplyr')
require('magrittr')
setwd("~/GitHub/ExData_Plotting1")

poweruse <- 
  read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") %>%
  subset(Date == '1/2/2007' | Date == '2/2/2007') %>%
  mutate(Date_time = paste(as.Date(Date, format = "%d/%m/%Y"), Time))

png("plot1.png", width=480, height=480, units="px")

hist(poweruse$Global_active_power,
     col="red",
     xlab="Global active power (kilowatts)", 
     main="Global Active Power")

dev.off()
