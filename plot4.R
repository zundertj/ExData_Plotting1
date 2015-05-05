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
png("plot4.png")

par(mfrow = c(2,2))

# frame 1 (top left)
with(data, plot(DateTime, Global_active_power,
     main="", 
     xlab="",
     ylab="Global Active Power",
     type="l"))

# frame 2 (top right)
with(data, plot(DateTime, Voltage,
                main="", 
                xlab="datetime",
                ylab="Voltage",
                type="l"))

# frame 3 (bottom left)
with(data, plot(DateTime, Sub_metering_1,
                main="", 
                xlab="",
                ylab="Energy sub metering",
                type="n"))
with(data, lines(DateTime, Sub_metering_1, col = "black"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# frame 4 (bottom right)
with(data, plot(DateTime, Global_reactive_power,
                main="", 
                xlab="datetime",
                type="l"))
dev.off()