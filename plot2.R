rawFileName<-'~/coursera/ExploratoryDataAnalysis/household_power_consumption.txt'
colTypes=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.table(rawFileName, stringsAsFactors=F, sep=";", header=T, na.strings="?", colClasses=colTypes) ## read file
data<-subset(data, Date %in% c("1/2/2007", "2/2/2007")) ## select relevant dates
pdate<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data<-cbind(data, pdate)
setwd("~/git-repo/ExData_Plotting1")
png(filename = "plot2.png")
with(data, plot(Global_active_power~pdate, ylab="Global Active Power (kilowatts)", xlab="", type='l'))
dev.off()