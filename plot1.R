source("getconsumptiondata.R")

makeplot1 <- function() {
    print("Making Plot 1...")
    par(mfrow=c(1,1))
    
    hist(powercon$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
}

sourcefileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "exdata_data_household_power_consumption.zip"
setwd("C:/R/Github/ExData_Plotting1/")

#Downloading Household Power Consumption Data
downloaddata(sourcefileurl,destfile)
#Cleansing Household Power Consumption Data
powercon <- readdata()
makeplot1()
saveplotpng("plot1")



