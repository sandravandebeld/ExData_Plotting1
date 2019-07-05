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

#create plot4
par(mfrow = c(2, 2))
with(df, {
    plot(DateTime, Global_active_power, type = "l", ylab = "Global active power (kilowatt)", xlab = " ")
    plot(DateTime, Voltage, type = "l")
    plot(DateTime, Sub_metering_1, type="l", col="black", pch="o", lty=1, ylab="Energy sub metering", xlab = " ")
    points(DateTime, Sub_metering_2, col="red", type= "l", pch="o", lty=1 )
    points(DateTime, Sub_metering_3, col="blue", type= "l", pch="o", lty=1 )
    plot(DateTime, Global_reactive_power, type = "l")
 })
dev.copy(png, "plot4.png")
dev.off()
