## Reads Household Data Text File and Generates Required Plot.  Saves the plot to png file

plot2 <- function() {
  hhdata <- readhouse()
  hhdata$dt <- strptime(paste(hhdata$Date, hhdata$Time), "%d/%m/%Y %H:%M:%S")
  
  png("plot2.png", width=480, height=480)
  plot(hhdata$dt, hhdata$Global_active_power, type="l", xlab="", main="",  ylab="Global Active Power (kilowatts)")
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
