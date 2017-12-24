library(data.table)


# Downloads data files from sourcefileUrl writes files to destfile
downloaddata <- function(sourcefileUrl,destfile) {
    print("Downloading Raw Data...")
    ## Get data to analyze
    download.file(sourcefileUrl,destfile=destfile)
    
    ## Unzip DataSet to /data directory
    unzip(zipfile=destfile,exdir="./data")
  
}

# Read data household_power_consumption.txt and extract 2/1/2007 and 2/2/2007 data
# Add datetime field of type POSIXct by combining Date and Time field values
# Convert all string observation values to numeric fields
readdata <- function() {

    print("Importing and Cleansing Raw Data...")
  
    powercon <- fread("./data/household_power_consumption.txt", na.strings="?")
    
    # filter out data to plot by date string
    powercon <- powercon[powercon$Date == "1/2/2007" | powercon$Date == "2/2/2007",]
    
    # Add combined datetime field
    powercon <-transform(powercon, datetime = as.POSIXct(strptime(paste(Date,Time), format="%d/%m/%Y%H:%M:%S")))
    
    # Put the DateTime column on the first postion 
    powercon$Date <- NULL 
    powercon$Time <- NULL 
    setcolorder(powercon, c("datetime","Global_active_power", "Global_reactive_power", 
                            "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
    
    # Convert char fields to numeric data
    powercon <- data.frame(powercon)
    indx <- sapply(powercon, is.factor)
    powercon[indx] <- lapply(powercon[indx], function(x) as.numeric(as.character(x)))
    powercon
}

# Save plot as a png file
saveplotpng <- function (filename, width = 480, height = 480) {
    print(paste("Saving plot to  ", getwd(), "/", filename, ".png", sep=""))
    dev.copy(png, paste(filename, ".png", sep=""), width = width, height = height)
    dev.off()
}  


