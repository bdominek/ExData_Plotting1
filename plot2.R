source("getconsumptiondata.R")

makeplot2 <- function() {
    print("Making Plot 2...")
    par(mfrow=c(1,1))
    
    plot(powercon$datetime, powercon$Global_active_power, xlab="", 
         ylab="Global Active Power (Kilowatts)", type="n") 
    lines(powercon$datetime, powercon$Global_active_power) 
}

sourcefileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "exdata_data_household_power_consumption.zip"
setwd("C:/R/Github/ExData_Plotting1/")

#Downloading Household Power Consumption Data
downloaddata(sourcefileurl,destfile)
#Cleansing Household Power Consumption Data
powercon <- readdata()
makeplot2()
saveplotpng("plot2")



