collist1=list("","","","","","","","","")
collist=list("","",0,0,0,0,0,0,0)
cname<-scan("household_power_consumption.txt",what=collist1,nlines=1,sep=";")
a<- scan("household_power_consumption.txt",what=collist,sep=";",skip=1,na.string= "?")
## Read the colnames and data seperately

data0<-data.frame(a)  
## Change form of data from "list" to "dataframe"
colnames(data0)<-cname
data<-data0[which(data0$Date=="1/2/2007"|data0$Date=="2/2/2007"),1:9]
## Select the records on 1/2/2007 and 2/2/2007
data$DayTime<- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
## Add one col "DayTime" show the real time 

## Plot4
Sys.setlocale(locale = "C")
par(mfrow = c(2, 2))
##subplot1
with(data,plot(DayTime,Global_active_power,type="l",xlab=NA,ylab="Global Active Power"))
##subplot2
with(data,plot(DayTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))
##subplot3
with(data,plot(DayTime,Sub_metering_1,type="l",ylab="Energy sub metering"))
with(data,lines(DayTime,Sub_metering_2,type="l",col="red"))
with(data,lines(DayTime,Sub_metering_3,type="l",col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n",col = c("black","red","blue"),lty = c(1, 1, 1))
##subplot4
with(data,plot(DayTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

# save pic
dev.copy(png, file = "plot4.png",width = 480, height = 480, units = "px")
dev.off()
