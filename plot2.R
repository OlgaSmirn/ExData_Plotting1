## read data
df <- read.table("household_power_consumption.txt",header=TRUE,na.strings = "?",sep = ";",dec= ".",stringsAsFactors = FALSE)

df1<- subset(df,Date == "1/2/2007")
df2<-subset(df,Date =="2/2/2007")
mydata <- bind_rows(df1,df2)
mydata <- mutate(mydata, DateTime =  paste(mydata$Date,mydata$Time))
mydata$DateTime <- strptime( mydata$DateTime ,"%d/%m/%Y %H:%M:%S")


## Plot2

par(mfrow =c(1,1))
png("plot2.png")
plot(mydata$DateTime,mydata$Global_active_power, type= "l",xlab="",ylab= "Global Active Power (killovatts)")
dev.off()