setwd("~/RStudio/ExData_Plotting1")

library(lubridate)

power_cons <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?',colClasses=c(rep('character',2), rep('numeric',7)))

power_cons$Date <- dmy(power_cons$Date)
power_cons$Time <- hms(power_cons$Time)

power_cons <- subset(power_cons, year(Date)==2007 & month(Date)==2 & (day(Date)==1 | day(Date)==2))

datetime <- power_cons$Date + power_cons$Time

power_cons$date.time <- datetime

power_cons <- read.csv('power_cons.csv')

png(filename='plot1.png', width=480, height=480, units='px')

hist(power_cons$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts', col='red')

dev.off()