library(data.table)
library(lubridate)
#Read dataset using data.table fread function and subset required dates
#For any confusion regarding data tables refer to this
#https://s3.amazonaws.com/assets.datacamp.com/img/blog/data+table+cheat+sheet.pdf

power <- fread("household_power_consumption.txt",na.strings = "?")
sub <- power[Date%in% c("1/2/2007","2/2/2007")]

#create a new datatime variable combining both date  & time using lubridate dmy_hms()
sub[, timestamp:=dmy_hms(paste(sub$Date, sub$Time))]

#Create plot
hist(sub$Global_active_power, col = "red",main="Global Active Power", xlab = "Global Active Power (kilowatts)")

#Save to PNG
dev.copy(png,"plot1.png")
dev.off()