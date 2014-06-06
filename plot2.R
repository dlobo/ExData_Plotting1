setwd('/home/lobo/mooc/ceda/a1/ExData_Plotting1')

df <- read.csv('household_power_consumption.txt', na.strings = "?", sep = ";")

df$DateTime <- strptime(paste(df$Date, df$Time, sep=' '), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
dfGraph <- subset(df, df$Date == as.Date('2007-02-01') | df$Date == as.Date('2007-02-02'))

dev = png("plot2.png")
plot(dfGraph$DateTime, dfGraph$Global_active_power, type = 'l', xlab = '', ylab = "Global Active Power (kilowatts)")
dev.off()

