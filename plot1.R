plot1 <- function() {
    
    ## Data Filename This file was downloaded, unzipped, and placed in the same
    ## folder as this script.
    ## 
    datafile <- "household_power_consumption.txt"
    
    ## Read the entire file and select only the dates we want.
    ##
    data <- read.csv(datafile,
                     sep=";", 
                     stringsAsFactors=FALSE,
                     na.strings="?")
    data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
    
    ## Create a Date/Time object column out of the text Date and Time columns.
    ##
    data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
    
    png("plot1.png")
    hist(data$Global_active_power,
         col="red",
         xlab="Global Active Power (kilowatts)",
         main="Global Active Power")
    dev <- dev.off()
}
