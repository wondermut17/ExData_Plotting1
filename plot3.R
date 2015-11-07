{
  directory <- ("~/Desktop/Data_Exploration_Class")
}



  ## Loading the data into data_total dataframe
    data_total <- read.csv(file="household_power_consumption.txt"
                       , header=T, sep=';', na.strings="?", nrows=2075259, 
                       check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
    data_total$Date <- as.Date(data_total$Date, format="%d/%m/%Y")

  ## Subsetting the data
  data <- subset(data_total, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

    rm(data_total)

  ## Converting the datetime data into date and time
    datetime <- paste(as.Date(data$Date), data$Time)
    data$datetime <- as.POSIXct(datetime)

  ## Plotting the 3rd Graph
  with(data, {
    plot(Sub_metering_1~Datetime, type="line",
        ylab="Global Active Power (kilowatts)", xlab="")
   lines(Sub_metering_2~Datetime,col='red')
    lines(Sub_metering_3~Datetime,col='blue')
  })
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Saving to the graph to the folder
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()