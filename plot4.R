source("getconsumptiondata.R")

makeplot4 <- function() {
    par(mfrow = c(2, 2), bg="white", cex=.8, cex.axis = .8) 

    # Top left plot same as plot2
    plot(powercon$datetime, powercon$Global_active_power, xlab="",
        ylab="Global Active Power", pch='.')
    lines(powercon$datetime, powercon$Global_active_power)

    # Top right plot Voltage over observation time
    plot(powercon$datetime, powercon$Voltage, xlab="datetime", 
         ylab="Voltage", pch='.') 
    lines(powercon$datetime, powercon$Voltage) 
    
    # Bottom left plot same as plot3
    plot(powercon$datetime, powercon$Sub_metering_1, xlab="",
         ylab="Energy sub metering", type="n")

    lines(powercon$datetime, powercon$Sub_metering_1, col="black")
    lines(powercon$datetime, powercon$Sub_metering_2, col="red")
    lines(powercon$datetime, powercon$Sub_metering_3, col="blue")

    legend("topright", col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=c(1,1), bty="n", cex=.8, inset=.1)
    
    # Bottom right plot Globel Reactive power by observation time
    plot(powercon$datetime, powercon$Global_reactive_power, 
         xlab="datetime", ylab="Global_Reactive_Power", pch='.') 

    lines(powercon$datetime, powercon$Global_reactive_power) 
    
}

sourcefileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "exdata_data_household_power_consumption.zip"
setwd("C:/R/Github/ExData_Plotting1/")

#Downloading Household Power Consumption Data
downloaddata(sourcefileurl,destfile)
#Cleansing Household Power Consumption Data
powercon <- readdata()
makeplot4()
saveplotpng("plot4")

