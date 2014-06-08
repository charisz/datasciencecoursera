#!/usr/bin/Rscript
# kristof.jakab@gmail.com

# Data science # 4: Exploratory Data Analysis # project 1
# plot2

#----------------------------------------
# load
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
data[data=="?"] <- NA
n <- nrow(data)

#----------------------------------------
# to plot

#¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
# plot1
gap <- as.numeric(data$Global_active_power)
ylab1 <- "Global Active Power (kilowatts)"

#¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
# plot2
sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)
ylab2 <- "Energy sub metering"

# x axis
ats <- c(0,n/2+1,n)
labels <- c("Thu","Fri","Sat")
# legend
legends <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

#¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
# plot3
vol <- as.numeric(data$Voltage)
xlab <- "datetime"
ylab3 <- "Voltage"

#¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
# plot4
grp <- as.numeric(data$Global_reactive_power)
ylab4 <- "Global_reactive_power"

#----------------------------------------
# plot
png(filename="plot4.png")
par(mfcol=c(2,2))

#¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
# plot1
plot(gap,type="l",
     ylab=ylab1,
     xlab="",xaxt="n")
axis(1,at=ats,labels=labels)

#¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
# plot2
plot(sm1,col="black",type="l",
     ylab=ylab2,
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
legend(x=n+n/25,y=40+40/25,xjust=1,yjust=1,legend=legends,
       lty=1,col=c("black","red","blue"),
       bty="n")

#¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
# plot3
plot(vol,type="l",
     ylab=ylab3,
     xlab="",xaxt="n")
axis(1,at=ats,labels=labels)

#¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
# plot4
plot(grp,type="l",
     yaxp=c(0.0,0.5,5),
     ylab=ylab4,
     xlab="",xaxt="n")
axis(1,at=ats,labels=labels)
dev.off()