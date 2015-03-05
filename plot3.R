plot3 <- function() {
    
    ## Data File:
    ## - Download from 
    ## https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip
    ## - Unzip the zip file
    ## - Make sure the file is in the same folder as this script
    ## 
    datafile <- "household_power_consumption.txt"
    
    ## On the first run, save a local subset file so that it can be loaded more
    ## quickly on subsequent runs. The idea came from the course discussion
    ## forum.
    ## 
    subsetfile <- "household_power_consumption_subset.Rd"
    if (!file.exists(subsetfile)) {
    	## Read the entire file, keep only the dates we want, and save the data to a file.
    	##
    	data <- read.csv(datafile,
    					 sep = ";", 
    					 stringsAsFactors = FALSE,
    					 na.strings = "?")
    	data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
    	save(data, file = subsetfile)
    } else {
    	## Load the saved file (much faster).
    	##
    	load(subsetfile)
    }
    
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
