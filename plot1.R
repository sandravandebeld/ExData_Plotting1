#read data (is allready subsetted because of lack of space on vritual machine)
library(readr)
df <- read_delim("household_power_consumption_2007_02-01_untill_2007_02_02.txt", 
                                                                       ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                                                    Global_active_power = col_number(), 
                                                                                                                    Global_intensity = col_number(), 
                                                                                                                    Global_reactive_power = col_number(), 
                                                                                                                    Sub_metering_1 = col_number(), Sub_metering_2 = col_number(), 
                                                                                                                    Sub_metering_3 = col_number(), Time = col_time(format = "%H:%M:%S"), 
                                                                                                                    Voltage = col_number()), trim_ws = TRUE)
str(df)

#create plot 1
hist(df$Global_active_power, xlab = "Global active power (kilowatt)", col = "red", main = "Global active power")
#copy plot to png file
dev.copy(png, "plot1.png")
dev.off()