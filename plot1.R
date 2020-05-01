# Reading data
tab<- read.table("Data.txt",header = T,sep = ";",stringsAsFactors = F)
#changing date format
tab<- mutate(tab,Date=as.Date(Date,"%d/%m/%Y"))

# Selecting dates
data<- tab[tab$Date>="2007-02-01"&tab$Date<="2007-02-02",]
# merging date and time
x<- mutate(data,Date=as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S"))
#Plotting graph
hist(as.numeric(data$Global_active_power),col="Red",xlab = "Global Active Power(Kilowatts)",main = "Global Active Power")

dev.copy(png,file="Plot1.png",width=480,height=480)
dev.off()