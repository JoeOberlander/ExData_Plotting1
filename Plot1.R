## Create the histogram in Plot 1
hist(consumdata$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save file and close device
#dev.copy(png,"plot1.png", width=480, height=480)
#dev.off()