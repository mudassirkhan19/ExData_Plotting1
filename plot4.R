library(data.table)
library(lubridate)
#Read dataset using data.table fread function and subset required dates
#For any confusion regarding data tables refer to this
#https://s3.amazonaws.com/assets.datacamp.com/img/blog/data+table+cheat+sheet.pdf

power <- fread("household_power_consumption.txt",na.strings = "?")
sub <- power[Date%in% c("1/2/2007","2/2/2007")]

#create a new datatime variable combining both date  & time using lubridate dmy_hms()
sub[, timestamp:=dmy_hms(paste(sub$Date, sub$Time))]

#Set parameters
par(mfcol = c(2,2), mar = c(4,4,1,1))

#plot 1
plot(sub$timestamp, sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#plot 2
plot(sub$timestamp, sub$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l")

lines(sub$timestamp, sub$Sub_metering_2, col = "red")

lines(sub$timestamp, sub$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.8, bty = "n", col = c("black","red","blue"), lwd = 1, lty = 1)

#plot 3
plot(sub$timestamp, sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot 4
plot(sub$timestamp, sub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Save to PNG
dev.copy(png,"plot4.png")
dev.off()