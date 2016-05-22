## Reads Household Data Text File and Generates Required Plot.  Saves the plot to png file

plot1 <- function() {
  hhdata <- readhouse()
  
  png("plot1.png", width=480, height=480)
  hist(hhdata$Global_active_power, breaks=15, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}

## reads data file and returns a data frame of just two days 1/2/2007 and 2/2/2007
readhouse <- function() {
  d <- read.delim("~/coursera/dataexplore/household_power_consumption.txt", header=TRUE, sep=";"
    , colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric"
    , "numeric", "numeric"), na.strings="?")
  
  twodays <- subset(d, (Date == "1/2/2007" | Date == "2/2/2007"))
  twodays
  
}
