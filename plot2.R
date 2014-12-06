# Code for Exploratory Data Analysis Proj. 1 
# First read the data and preprocessing the data

setwd("C:/Users/jsylas/Desktop/R/Exploratory Data Analysis")
data <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"),header=T,stringsAsFactors=F, sep=";")
data$DateTime <- paste(data$Date,data$Time)
data$DateTime1 <- as.POSIXct(strptime(data[,10],format="%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data[,1],format="%d/%m/%Y")
data1<- subset(data, Date >="2007-02-01" & Date <= "2007-02-02")
data1$day <- as.factor(weekdays(data1$Date))


# Plot the graph
png(file="plot2.png")
with(data1,plot(DateTime1,Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab=""))
dev.off()
