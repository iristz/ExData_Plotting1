data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings=c("?"))
subSetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png",width=480,height=480)
plot(datetime, subSetData$Sub_metering_1,type="l",col="black",xlab="",ylab="Engergy sub metering", main="")
lines(datetime,subSetData$Sub_metering_2, col="red")
lines(datetime,subSetData$Sub_metering_3, col="blue")
legend("topright", lwd=1, lty=1, col=c("black","red","blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()