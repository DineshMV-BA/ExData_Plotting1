install.packages("data.table")
library(data.table)
datefilter <- 'findstr /b /c:"1/2/2007" /c:"2/2/2007" /c:"Date;" household_power_consumption.txt'
filtdata <- paste0(system(datefilter, intern = T), collapse = "\n")
epcdata <- fread(filtdata, sep = ";", header = T, na.strings = '?')
png(file="plot1.png")
with(epcdata,
     hist(Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
     )
dev.off()