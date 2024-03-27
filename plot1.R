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

## Creating and saving the plot1 to a PNG file with specified dimensions
## This plot is a histogram of Global Active Power
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     col = "blue",  ## Color of the bars - I preferred blue :)
     main = "Global Active Power",  ## Title
     xlab = "Global Active Power (Kilowatts)",  ## X-axis label
     ylab = "Frequency")  ## Y-axis label
dev.off()
