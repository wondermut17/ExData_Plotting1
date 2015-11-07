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
      
        ## Plotting the 2nd graph
        plot(data$Global_active_power~data$Datetime, type="line",
                   ylab="Global Active Power (kilowatts)", xlab="")
        
      ## Saving the graph to the folder
      dev.copy(png, file="plot2.png", height=480, width=480)
      dev.off()