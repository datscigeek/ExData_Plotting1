setwd("~/RStudio/ExData_Plotting1")

library(lubridate)

power_cons <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?',colClasses=c(rep('character',2), rep('numeric',7)))

power_cons$Date <- dmy(power_cons$Date)
power_cons$Time <- hms(power_cons$Time)

power_cons <- subset(power_cons, year(Date)==2007 & month(Date)==2 & (day(Date)==1 | day(Date)==2))

datetime <- power_cons$Date + power_cons$Time

power_cons$date.time <- datetime

power_cons <- read.csv('power_cons.csv')

png(filename='plot3.png', width=480, height=480, units='px')

plot(power_cons$date.time, power_cons$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(power_cons$date.time, power_cons$Sub_metering_2, col='red')
lines(power_cons$date.time, power_cons$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty='solid')

dev.off()
