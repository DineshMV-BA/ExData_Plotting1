install.packages("data.table")
library(data.table)
datefilter <- 'findstr /b /c:"1/2/2007" /c:"2/2/2007" /c:"Date;" household_power_consumption.txt'
filtdata <- paste0(system(datefilter, intern = T), collapse = "\n")
epcdata <- fread(filtdata, sep = ";", header = T, na.strings = '?')
datentime <- strptime(paste(epcdata$Date,epcdata$Time),format='%d/%m/%Y %H:%M:%S')
png(file="plot2.png")
with(epcdata,
     plot(datentime,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type='l')
)
dev.off()