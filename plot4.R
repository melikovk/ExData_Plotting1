rawFileName<-'~/coursera/ExploratoryDataAnalysis/household_power_consumption.txt'
colTypes=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") ## Define types of the fields
data<-read.table(rawFileName, stringsAsFactors=F, sep=";", header=T, na.strings="?", colClasses=colTypes) 
data<-subset(data, Date %in% c("1/2/2007", "2/2/2007")) 
datetime<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S") ## merge date and time into single POSIX field
data<-cbind(data, datetime)
png(filename = "~/git-repo/ExData_Plotting1/plot4.png")
par(mfrow=c(2,2))
with(data, plot(Global_active_power~datetime, ylab="Global Active Power", xlab="", type='l'))
with(data, plot(Voltage~datetime, ylab="Voltage", xlab="datetime", type='l'))
with(data, plot(Sub_metering_1~datetime, ylab="Energy sub metering", xlab="", type='l'))
with(data, lines(Sub_metering_2~datetime, col="red"))
with(data, lines(Sub_metering_3~datetime, col="blue"))
legend("topright", lwd=1, col=c('black', 'red', 'blue'), bty='n', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
with(data, plot(Global_reactive_power~datetime, type='l'))
dev.off()