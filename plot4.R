#########Course project 1 Exploratory Data Analysis

######Read data

data_power <- read.table("./exploratory/household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, na.string = "?")

#####Subsetting data

dataf <- subset(data_power, Date == "1/2/2007" | Date == "2/2/2007")

#######Create a new variable pasting Date ann Time variables

dataf$datetime <- strptime(paste(dataf$Date, dataf$Time), format = "%d/ %m/ %Y %H: %M: %S")

########Graph 4 ########

par(mfrow = c(2, 2))
with(dataf, {
	plot(datetime, Global_active_power, type= "l", xlab = " ", ylab = "Global Active Power ")
	plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
	plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
	lines(datetime, Sub_metering_2, type = "l", col = "red")
	lines(datetime, Sub_metering_3, type = "l", col = "blue")
	legend("topright", lty = 1, col = c("black", "red", "blue"), legend = 	c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(datetime, Global_reactive_power, type = "l", xlab = "datetime",col = "black")
}) 

############Savig plott in PNG

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()