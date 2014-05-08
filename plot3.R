###
# Loading data
setwd('coursera')
powerdata<-read.csv("household_power_consumption.txt", sep=";", na.strings="?")



powerdata2 <- subset(powerdata, powerdata$Date %in% c("1/2/2007", "2/2/2007"))
datetime<-paste(powerdata2$Date,powerdata2$Time)
datetime2<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480,height=480, bg = "transparent")
plot(datetime2, powerdata2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime2, powerdata2$Sub_metering_2, col="red")
lines(datetime2,powerdata2$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()
