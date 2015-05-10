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

# Plot 2
png("plot2.png", width=480, height=480)
plot(data$Datetime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()