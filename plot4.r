setwd("~/RStudio/ExData_Plotting1")

library(lubridate)

power_cons <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?',colClasses=c(rep('character',2), rep('numeric',7)))

power_cons$Date <- dmy(power_cons$Date)
power_cons$Time <- hms(power_cons$Time)

power_cons <- subset(power_cons, year(Date)==2007 & month(Date)==2 & (day(Date)==1 | day(Date)==2))

datetime <- power_cons$Date + power_cons$Time

power_cons$date.time <- datetime

power_cons <- read.csv('power_cons.csv')

png(filename='plot4.png', width=480, height=480, units='px')

par(mfrow=c(2,2))

#Q1
plot(power_cons$date.time, power_cons$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Q2
plot(power_cons$date.time, power_cons$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Q3
plot(power_cons$date.time, power_cons$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(power_cons$date.time, power_cons$Sub_metering_2, type = "l", col = "red")
lines(power_cons$date.time, power_cons$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.0)

#Q4
plot(power_cons$date.time, power_cons$Global_reactive_power, ylim = c(0.0, 0.5),  type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off() 



