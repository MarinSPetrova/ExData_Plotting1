# data
library(readr)
allData <- read_delim("~/coursera/R/Exploratory Data Analysis/Course Project1/household_power_consumption.txt", 
                      ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                   Global_active_power = col_number(), 
                                                                   Global_intensity = col_number(), 
                                                                   Global_reactive_power = col_number(), 
                                                                   Time = col_character(), Voltage = col_number()), 
                      trim_ws = TRUE)

mydata<-subset(allData,Date == "2007-02-01" | Date == "2007-02-02") 
mydata$DateTime <- paste(mydata$Date, mydata$Time)
mydata$DateTime<-strptime(mydata$DateTime, "%Y-%m-%d %H:%M:%S")

#plot
png("plot4.png",width=480, height=480)

par(mfcol=c(2,2))

# Plot 1,1
plot(mydata$DateTime,mydata$Global_active_power, xlab = "",ylab = "Global Active Power", type = "l")

# Plot 2,1
plot(mydata$DateTime,mydata$Sub_metering_1, xlab = "",ylab = "Energy sub metering", type = "n")
points(mydata$DateTime,mydata$Sub_metering_1, col="black", type = "l")
points(mydata$DateTime,mydata$Sub_metering_2, col="red", type = "l")
points(mydata$DateTime,mydata$Sub_metering_3, col="blue", type = "l")
legend("topright", lty = c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

# Plot 1,2
plot(mydata$DateTime,mydata$Voltage, xlab = "datetime",ylab = "Voltage", type = "l")

# Plot 2,2
plot(mydata$DateTime,mydata$Global_reactive_power, xlab = "datetime",ylab = "Global reactive power", type = "l")

dev.off()