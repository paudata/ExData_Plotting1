###
# Loading data
setwd('coursera')
powerdata<-read.csv("household_power_consumption.txt", sep=";", na.strings="?")


### subsetting
powerdata2 <- subset(powerdata, powerdata$Date %in% c("1/2/2007", "2/2/2007"))


####
# Plot 1
#####
powerdata2$Global_active_power<-as.numeric(powerdata2$Global_active_power)

png("plot1.png",width=480, height=480, bg = "transparent")
hist(powerdata2$Global_active_power, col=2, 
     main = paste("Global Active Power"),xlab="Global Active Power (kilowatts)")
dev.off()
