##EDA Week1 Final Project


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

##Get the plot
png("plot1.png", width=480, height=480)

hist(data1$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

dev.off()

