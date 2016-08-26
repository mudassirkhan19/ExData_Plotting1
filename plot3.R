
#Create plot
plot(sub$timestamp, sub$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l")

lines(sub$timestamp, sub$Sub_metering_2, col = "red")

lines(sub$timestamp, sub$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1, lty = 1, cex = 0.75)

#Save to PNG
dev.copy(png,"plot3.png")
dev.off()