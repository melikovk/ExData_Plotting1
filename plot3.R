rawFileName<-'~/coursera/ExploratoryDataAnalysis/household_power_consumption.txt'
colTypes=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") ## Define types of the fields
data<-read.table(rawFileName, stringsAsFactors=F, sep=";", header=T, na.strings="?", colClasses=colTypes) 
data<-subset(data, Date %in% c("1/2/2007", "2/2/2007")) 
pdate<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S") ## merge date and time into single POSIX field
data<-cbind(data, pdate)
png(filename = "~/git-repo/ExData_Plotting1/plot3.png")
with(data, plot(Sub_metering_1~pdate, ylab="Energy sub metering", xlab="", type='l'))
with(data, lines(Sub_metering_2~pdate, col="red"))
with(data, lines(Sub_metering_3~pdate, col="blue"))
legend("topright", lwd=1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()