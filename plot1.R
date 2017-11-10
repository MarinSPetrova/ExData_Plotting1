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
png("plot1.png",width=480, height=480)
hist(mydata$Global_active_power, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
#dev.copy(png, file = "plot1.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off()
