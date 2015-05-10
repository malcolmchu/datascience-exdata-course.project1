## @author  Malcolm Chu
## @course  Data Science by John Hopkins University
## @class   Exploratory Data Analysis
## @task    Course Project 1
## @description Examine how household energy usage varies over a 2-day period in February 2007
## @url     https://class.coursera.org/exdata-014/human_grading/view/courses/973508/assessments/3/submissions

# Read the dataset
data <- read.table("household_power_consumption.txt", header=T, sep=';',
                   na.strings="?", as.is=T)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 3
png("plot3.png", width=480, height=480)
with(data, {
    plot(Datetime, Sub_metering_1, type="l",
         xlab="", ylab="Energy sub metering")
    lines(Datetime, Sub_metering_2, col="Red")
    lines(Datetime, Sub_metering_3, col="Blue")
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("Black", "Red", "Blue"), lty=1, lwd=2)
dev.off()