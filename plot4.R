## Read the data from the text file
data <- read.table("household_power_consumption.txt",
                   sep=";",
                   header=TRUE, 
                   na.strings="?",
                   stringsAsFactors=FALSE)

## Display the first few rows of the data to
## verify it has been read correctly
head(data)
str(data) ## Showing a summary of the dataframe

## Converting Date and Time columns to Date/Time classes (POSIXct type)
## and adding it to a separate column 'DateTime'
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time),
                                     format="%d/%m/%Y %H:%M:%S"))

# Filtering the data for the specified date range
data <- subset(data, as.Date(data$Date, 
                             format="%d/%m/%Y") >= as.Date("2007-02-01") &
                 as.Date(data$Date, 
                         format="%d/%m/%Y") <= as.Date("2007-02-02"))

head(data)
str(data)

## Creating and saving the plot4 to a PNG file with specified dimensions
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))  ## Resetting the layout for saving
plot(data$DateTime, data$Global_active_power, ## 1st plot
     type = "l", 
     col = "black", 
     xlab = "DateTime", 
     ylab = "Global Active Power", 
     main = NULL)
plot(data$DateTime, data$Voltage, ## 2nd plot
     type = "l", 
     col = "black", 
     xlab = "DateTime", 
     ylab = "Voltage", 
     main = NULL)
plot(data$DateTime, data$Sub_metering_1, ## 3rd plot
     type = "l", 
     col = "black", 
     xlab = "DateTime", 
     ylab = "Sub-metering", 
     main = NULL)
lines(data$DateTime, data$Sub_metering_2,
      type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3,
      type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", 
                              "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
plot(data$DateTime, data$Global_reactive_power, ## 4th plot
     type = "l", 
     col = "black", 
     xlab = "DateTime", 
     ylab = "Global Reactive Power", 
     main = NULL)
dev.off()