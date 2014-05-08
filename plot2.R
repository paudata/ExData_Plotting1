###
# Loading data
setwd('coursera')
powerdata<-read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#subsetting
powerdata2 <- subset(powerdata, powerdata$Date %in% c("1/2/2007", "2/2/2007"))

# manipulating date and time
powerdata2$Date<-as.character(as.Date(powerdata2$Date, format="%d/%m/%Y"))
datetime<-paste(powerdata2$Date,powerdata2$Time)
datetime2<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

png("plot2.png",width=480, height=480, bg = "transparent")  
plot(datetime2, as.numeric(powerdata2$Global_active_power), type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
