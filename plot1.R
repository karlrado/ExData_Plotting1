plot1 <- function() {
    
    ## Data File:
    ## - Download from:
    ## https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip
    ## - Unzip the zip file.
    ## - Make sure the file is in the same folder as this script.
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
    
    ## Create the plot.
    ##
    png("plot1.png")
    hist(data$Global_active_power,
         col = "red",
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power")
    dev <- dev.off()
}
