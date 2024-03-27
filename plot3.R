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


## Creating and saving the plot3 to a PNG file with specified dimensions
## This plot shows Sub-metering vs DateTime.
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, 
     type = "l", 
     col = "black", 
     xlab = "DateTime", 
     ylab = "Energy sub-metering", 
     main = "Sub-meterings vs. DateTime")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()