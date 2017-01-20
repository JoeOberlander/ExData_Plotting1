## Create Plot 2
plot(consumdata$Global_active_power~consumdata$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save file and close device
#dev.copy(png,"plot2.png", width=480, height=480)
#dev.off()
