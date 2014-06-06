setwd('/home/lobo/mooc/ceda/a1/ExData_Plotting1')

df <- read.csv('household_power_consumption.txt', na.strings = "?", sep = ";")

df$Date <- as.Date(df$Date, "%d/%m/%Y")
dfGraph <- subset(df, df$Date == as.Date('2007-02-01') | df$Date == as.Date('2007-02-02'))

dev = png("plot1.png")
hist(dfGraph$Global_active_power, main = "Global Active Power", col = "Red", xlab="Global Active Power (kilowatts)")
dev.off()

