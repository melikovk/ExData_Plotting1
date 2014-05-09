rawFileName<-'~/coursera/ExploratoryDataAnalysis/household_power_consumption.txt'
colTypes=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") ## Define types of the fields
data<-read.table(rawFileName, stringsAsFactors=F, sep=";", header=T, na.strings="?", colClasses=colTypes)
data<-subset(data, Date %in% c("1/2/2007", "2/2/2007"))
pdate<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S") ## merge date and time into single POSIX field
data<-cbind(data, pdate)
png(filename = "~/git-repo/ExData_Plotting1/plot2.png")
with(data, plot(Global_active_power~pdate, ylab="Global Active Power (kilowatts)", xlab="", type='l'))
dev.off()