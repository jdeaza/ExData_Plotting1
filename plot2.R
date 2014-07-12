#########Course project 1 Exploratory Data Analysis

######Read data

data_power <- read.table("./exploratory/household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, na.string = "?")

#####Subsetting data

dataf <- subset(data_power, Date == "1/2/2007" | Date == "2/2/2007")

#######Create a new variable pasting Date and Time variables

dataf$datetime <- strptime(paste(dataf$Date, dataf$Time), format = "%d/ %m/ %Y %H: %M: %S")

########Graph 2 ########

with(dataf, plot(datetime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)"))

########Saving plott in PNG file

dev.copy(png,file = "plot2.png", width = 480, height = 480)
dev.off()