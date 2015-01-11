## Set working Directory
setwd("P:/My Documents/Coursera/ExploratoryDataAnalysis")

## Read Data
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                    stringsAsFactors = FALSE,na.strings = "?",comment.char="")
## Date
power$Date <- as.Date(power$Date,format = "%d/%m/%Y")

## Subset the data
power07 <- subset(power, subset= (Date >= "2007-02-01" & Date <= "2007-02-02"))

## remove Original dataset
rm(power)

## Date Comversions
x <- paste(as.Date(power07$Date), power07$Time)
power07$Date_Time <- as.POSIXct(x)

## Plot 2
### Construct the plot 
plot(power07$Global_active_power~power07$Date_Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")
### and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()