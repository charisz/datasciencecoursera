#!/usr/bin/Rscript
# kristof.jakab@gmail.com

# Data science # 4: Exploratory Data Analysis # project 1
# plot1

#----------------------------------------
# load
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
data[data=="?"] <- NA

#----------------------------------------
# to plot
gap <- as.numeric(data$Global_active_power)

#----------------------------------------
# plot
png(filename="plot1.png")
hist(gap,col="red",     
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()