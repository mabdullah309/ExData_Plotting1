# Reading data
tab<- read.table("Data.txt",header = T,sep = ";",stringsAsFactors = F)
#changing date format
tab<- mutate(tab,Date=as.Date(Date,"%d/%m/%Y"))

# Selecting dates
data<- tab[tab$Date>="2007-02-01"&tab$Date<="2007-02-02",]
# merging date and time
x<- mutate(data,Date=as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S"))
#Plotting graph
plot(x$Date,x$Sub_metering_1,xlab="",ylab = "Energy sub metering",type="n")
points(x$Date,x$Sub_metering_1,col="Black",type = "l")
points(x$Date,x$Sub_metering_2,col="Red",type="l")
points(x$Date,x$Sub_metering_3,col="Blue",type="l")
legend("topright",legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),
       col=c("Black","Red","Blue"),lty = 1,cex = 0.6,text.font = 4)

dev.copy(png,file="Plot3.png")
dev.off()
