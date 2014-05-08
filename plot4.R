###
# Loading data
setwd('coursera')
powerdata<-read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#subsetting
powerdata2 <- subset(powerdata, powerdata$Date %in% c("1/2/2007", "2/2/2007"))

powerdata2$Date<-as.character(as.Date(powerdata2$Date, format="%d/%m/%Y"))
datetime<-paste(powerdata2$Date,powerdata2$Time)
datetime2<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480,height=480, bg = "transparent")
par(mfcol=c(2,2))
plot(datetime2, as.numeric(powerdata2$Global_active_power), type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
plot(datetime2, powerdata2$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(datetime2, powerdata2$Sub_metering_2, col="red")
lines(datetime2,powerdata2$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,col=c("black","red","blue"))


plot(datetime2, as.numeric(powerdata2$Voltage), type="l", xlab="datetime",
     ylab="Voltage")
plot(datetime2, as.numeric(powerdata2$Global_reactive_power), type="l", xlab="datetime",
     ylab="Global_reactive_power")
dev.off()
