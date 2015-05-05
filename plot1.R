# Data Science 4 - Course Project 1

# set input file: assume it is in the working directory
input_file <- file.path(getwd(), "household_power_consumption.txt")

# load data
data <- read.csv(input_file, sep=";", na.strings="?")

# select data for 1st and 2nd of February, 2007
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# convert date and time for future processing       
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


# plot
png("plot1.png")

hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.off()