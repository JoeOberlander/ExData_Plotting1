#This script will load data from the UC Irvine Machine Learning Repository, with the data 
#formatted as follows:

#the .txt file has 9 variables, each in a different column
#1. Date: Date in format dd/mm/yyyy
#2. Time: time in format hh:mm:ss
#3. Global_active_power: household global minute-averaged active power (in kilowatt)
#4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#5. Voltage: minute-averaged voltage (in volt)
#6. Global_intensity: household global minute-averaged current intensity (in ampere)
#7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds 
#   to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not 
#   electric but gas powered).
#8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds
#   to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a 
#   light.
#9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds 
#   to an electric water-heater and an air-conditioner.

# data from the period the dates 2007-02-01 and 2007-02-02 are used
# missing values are coded as ?.

consumdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
consumdata$Date <- as.Date(consumdata$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
consumdata <- subset(consumdata,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
consumdata <- consumdata[complete.cases(consumdata),]

## Combine Date and Time column
dateTime <- paste(consumdata$Date, consumdata$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
consumdata <- consumdata[ ,!(names(consumdata) %in% c("Date","Time"))]

## Add DateTime column
consumdata <- cbind(dateTime, consumdata)

## Format dateTime Column
consumdata$dateTime <- as.POSIXct(dateTime)