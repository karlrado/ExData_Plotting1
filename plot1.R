plot1 <- function() {
    
    ## Data File:
    ## - Download from:
    ## https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip
    ## - Unzip the zip file.
    ## - Make sure the file is in the same folder as this script.
    ## 
    datafile <- "household_power_consumption.txt"
    
    ## Read the entire file and keep only the dates we want.
    ##
    data <- read.csv(datafile,
                     sep = ";", 
                     stringsAsFactors = FALSE,
                     na.strings = "?")
    data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
    
    ## Create the plot.
    ##
    png("plot1.png")
    hist(data$Global_active_power,
         col = "red",
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power")
    dev <- dev.off()
}
