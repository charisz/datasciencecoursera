#!/usr/bin/Rscript
# kristof.jakab@gmail.com

# Data science # 4: Exploratory Data Analysis # project 1
# plot2

#----------------------------------------
# load
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
data[data=="?"] <- NA

#----------------------------------------
# to plot
gap <- as.numeric(data$Global_active_power)
ylab <- "Global Active Power (kilowatts)"

n <- length(gap)
ats <- c(0,n/2+1,n)
labels <- c("Thu","Fri","Sat") # format(as.Date("2007-02-01"), "%a")

#----------------------------------------
# plot
png(filename="plot2.png")
plot(gap,type="l",
     ylab=ylab,
     xlab="",xaxt="n")
axis(1,at=ats,labels=labels)
dev.off()