# load data and change date time types
df<- read.table("household_power_consumption.txt", 
                sep = ";", 
                skip = 66637, 
                nrows=2880, 
                col.names = read.csv2("household_power_consumption.txt", 
                                      header = FALSE, nrows = 1))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time<-as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

# plot 1
hist(df$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frenquency",
     col = "red")
# create png file
dev.copy(png, file = "plot1.png")
dev.off()
