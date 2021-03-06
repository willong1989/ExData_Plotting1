##EDA W1 Project

##plot2 get the data

##Load the data and unzip the files
##setwd("~/Development/Data Science Course/4_EDA")
path=getwd()
url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- "data.zip"
if (!file.exits(path)) {dir.create(path)}
download.file(url, file.path(path,f))

unzip(zipfile="data.zip")

##read the txt file 
data <- read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?")
str(data)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Subset the data
data1 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##get the plot
data1$datetime <- as.POSIXct(strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S"))

png("plot3.png", width=480, height=480)

with(data1, {
  plot(Sub_metering_1 ~ datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2 ~ datetime,col='Red')
  lines(Sub_metering_3 ~ datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
