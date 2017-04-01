## read data
df <- read.table("household_power_consumption.txt",header=TRUE,na.strings = "?",sep = ";",dec= ".",stringsAsFactors = FALSE)

df1<- subset(df,Date == "1/2/2007")
df2<-subset(df,Date =="2/2/2007")
mydata <- bind_rows(df1,df2)
mydata <- mutate(mydata, DateTime =  paste(mydata$Date,mydata$Time))
mydata$DateTime <- strptime( mydata$DateTime ,"%d/%m/%Y %H:%M:%S")


## Plot3

par(mfrow =c(1,1))
# open png file
png("plot3.png")

#create chart
par(mfrow =c(1,1))
plot(mydata$DateTime,mydata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(mydata$DateTime,mydata$Sub_metering_2,type="l",col="red")
lines(mydata$DateTime,mydata$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#close png file
dev.off()