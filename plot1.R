rawFileName<-'~/coursera/ExploratoryDataAnalysis/household_power_consumption.txt'
colTypes=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.table(rawFileName, stringsAsFactors=F, sep=";", header=T, na.strings="?", colClasses=colTypes) ## read file
data<-subset(data, Date %in% c("1/2/2007", "2/2/2007")) ## select relevant dates
pdate<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data<-cbind(data, pdate)
setwd("~/git-repo/ExData_Plotting1")
png(filename = "plot1.png")
with(data, hist(Global_active_power, xlab="Global Active Power (kilowatts)", col='red', main="Global Active Power"))
dev.off()