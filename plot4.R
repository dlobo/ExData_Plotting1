setwd('/home/lobo/mooc/ceda/a1/ExData_Plotting1')

df <- read.csv('household_power_consumption.txt', na.strings = "?", sep = ";")

df$DateTime <- strptime(paste(df$Date, df$Time, sep=' '), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
dfGraph <- subset(df, df$Date == as.Date('2007-02-01') | df$Date == as.Date('2007-02-02'))

dev = png("plot4.png")

par(mfrow = c(2,2))

plot(dfGraph$DateTime, dfGraph$Global_active_power, type = 'l', xlab = '', ylab="Global Active Power (kilowatts)")

plot(dfGraph$DateTime, dfGraph$Voltage, type = 'l', xlab = 'datetime', ylab = "Voltage")

plot(dfGraph$DateTime, dfGraph$Sub_metering_1, type = 'l', xlab = '', ylab = "Energy sub metering", col = 'black')
lines(dfGraph$DateTime, dfGraph$Sub_metering_2, type = 'l', col = 'red')
lines(dfGraph$DateTime, dfGraph$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", c( 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'),  pt.cex=1, cex=1, lty = c(1, 1, 1))
       
plot(dfGraph$DateTime, dfGraph$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = "Global_reactive_power")

dev.off()

