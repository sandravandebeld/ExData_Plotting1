#read data (is allready subsetted because of lack of space on vritual machine)
df <- read.table("household_power_consumption_2007_02-01_untill_2007_02_02.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")

#combine the date and time variable into 1 variable
df$Date <- as.Date(df$Date, "%d/%m/%y")
str(df)
df$DateTime <- paste(df$Date, df$Time)
strptime(df$DateTime, "%Y-%m-%d %H:%M:%S")
str(df)
df$DateTime <- as.POSIXlt(df$DateTime)
class(df$DateTime)

#create plot 2
plot(df$DateTime, df$Global_active_power, type = "l", ylab = "Global active power (kilowatt)", xlab = " ")
dev.copy(png, "plot2.png")
dev.off()

