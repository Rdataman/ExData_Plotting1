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

## Plot2
Sys.setlocale(locale = "C")
with(data,plot(DayTime,Global_active_power,type="l",xlab=NA,ylab="Global Active Power (kilowatts)"))
# save pic
dev.copy(png, file = "plot2.png",width = 480, height = 480, units = "px")
dev.off()
