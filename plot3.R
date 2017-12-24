source("getconsumptiondata.R")

makeplot3 <- function() {
    print("Making Plot 3...")
    par(mfrow=c(1,1))
    
    plot(powercon$datetime, powercon$Sub_metering_1, xlab="", 
         ylab="Energy sub metering", type="n") 
    
    lines(powercon$datetime, powercon$Sub_metering_1, col="black") 
    lines(powercon$datetime, powercon$Sub_metering_2, col="red") 
    lines(powercon$datetime, powercon$Sub_metering_3, col="blue") 
    
    legend("topright", col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty=c(1,1)) 
    
}

sourcefileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "exdata_data_household_power_consumption.zip"
setwd("C:/R/Github/ExData_Plotting1/")

#Downloading Household Power Consumption Data
downloaddata(sourcefileurl,destfile)
#Cleansing Household Power Consumption Data
powercon <- readdata()
makeplot3()
saveplotpng("plot3")




