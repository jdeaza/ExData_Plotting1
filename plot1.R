#########Course project 1 Exploratory Data Analysis

#####Get a directory
if(!file.exists("./exploratory")) {dir.create("./exploratory")}

######Read data

data_power <- read.table("./exploratory/household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, na.string = "?")

#####Subsetting data

dataf <- subset(data_power, Date == "1/2/2007" | Date == "2/2/2007")

#######Create and paste a new variable for Date an Time variables

dataf$datetime <- strptime(paste(dataf$Date, dataf$Time), , format = "%d/ %m/ %Y %H: %M: %S")

########Graph 1 (histogram)

with(dataf, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

########Saving plott in PNG file

dev.copy(png,file = "plot1.png", width = 480, height = 480)
dev.off()


