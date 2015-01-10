plot3 <- function() {
    
    ## Data File:
    ## - Download from 
    ## https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip
    ## - Unzip the zip file
    ## - Make sure the file is in the same folder as this script
    ## 
    datafile <- "household_power_consumption.txt"
    
    ## Read the entire file and keep only the dates we want.
    ##
    data <- read.csv(datafile,
                     sep = ";", 
                     stringsAsFactors = FALSE,
                     na.strings = "?")
    data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
    
    ## Create a Date/Time object column out of the text Date and Time columns.
    ##
    data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
    
    ## Create the plot.
    ##
    png("plot3.png")
    plot(data$DateTime, data$Sub_metering_1,
         type = "l",
         xlab = "",
         ylab = "Energy sub metering")
    lines(data$DateTime, data$Sub_metering_2, col = "red")
    lines(data$DateTime, data$Sub_metering_3, col = "blue")
    legend("topright",
           lwd = 1,
           col = c("black", "red", "blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev <- dev.off()
}
