rawFileName<-'~/coursera/ExploratoryDataAnalysis/household_power_consumption.txt'
colTypes=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") ## Define types of the fields
data<-read.table(rawFileName, stringsAsFactors=F, sep=";", header=T, na.strings="?", colClasses=colTypes) 
data<-subset(data, Date %in% c("1/2/2007", "2/2/2007")) 
pdate<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S") ## merge date and time into single POSIX field
data<-cbind(data, pdate)
png(filename = "~/git-repo/ExData_Plotting1/plot1.png")
with(data, hist(Global_active_power, xlab="Global Active Power (kilowatts)", col='red', main="Global Active Power"))
dev.off()