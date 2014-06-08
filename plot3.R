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
ylab <- "Energy sub metering"
sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)

#----------------------------------------
# plot
png(filename="plot3.png")
plot(sm1,col="black",type="l",
     ylab="Energy sub metering",
     xlab="",xaxt="n",
     ylim=c(0,40))
par(new=T)
plot(sm2,col="red",type="l",bty="n",
     xlab="",xaxt="n",yaxt="n",ylab="",main="",
     ylim=c(0,40))
par(new=T)
plot(sm3,col="blue",type="l",bty="n",
     xlab="",xaxt="n",yaxt="n",ylab="",main="",
     ylim=c(0,40))
axis(1,at=ats,labels=labels)
legend(x=n+n/25,y=40+40/25,xjust=1,yjust=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()