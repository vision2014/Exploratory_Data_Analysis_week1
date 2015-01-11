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

## Plot 4
### Construct the plot 
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(power07, {
  plot(Global_active_power~Date_Time,type="l",ylab="Global Active Power",xlab="")
  plot(Voltage~Date_Time, type = "l", ylab="Voltage",xlab="datetime")
  plot(Sub_metering_1~Date_Time, type = "l", ylab="Energy sub metering",xlab="")
  lines(Sub_metering_2~Date_Time, col = "Red")
  lines(Sub_metering_3~Date_Time, col = "Blue")
  legend("topright",col = c("black","red","blue"),lty=1, lwd=2, legend=c(
    "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~Date_Time,type="l",ylab="Global_reactive_power",xlab="datetime")
})

### and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()