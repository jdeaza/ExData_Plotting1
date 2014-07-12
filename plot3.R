#########Course project 1 Exploratory Data Analysis

######Read data

data_power <- read.table("./exploratory/household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, na.string = "?")

#####Subsetting data

dataf <- subset(data_power, Date == "1/2/2007" | Date == "2/2/2007")

#######Create and paste a new variable for Date an Time variables

dataf$datetime <- strptime(paste(dataf$Date, dataf$Time), , format = "%d/ %m/ %Y %H: %M: %S")

########Graph 3 ##########

with(dataf, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black"))
with(dataf, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(dataf, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

########Saving plott in PNG file

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()