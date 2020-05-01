# Reading data
tab<- read.table("Data.txt",header = T,sep = ";",stringsAsFactors = F)
#changing date format
tab<- mutate(tab,Date=as.Date(Date,"%d/%m/%Y"))

# Selecting dates
data<- tab[tab$Date>="2007-02-01"&tab$Date<="2007-02-02",]
# merging date and time
x<- mutate(data,Date=as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S"))
#Plotting graph

plot(x$Global_active_power~x$Date,type="l",xlab="",ylab="Global Active Power(Kilowatts")

dev.copy(png,file="Plot2.png")
dev.off()
