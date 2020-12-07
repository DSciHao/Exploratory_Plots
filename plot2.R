# load data and change date time types
df<- read.table("household_power_consumption.txt", 
                sep = ";", 
                skip = 66637, 
                nrows=2880, 
                col.names = read.csv2("household_power_consumption.txt", 
                                      header = FALSE, nrows = 1))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time<-as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

# plot 2
with(df, 
     plot(Time, 
          Global_active_power, 
          type = "l", 
          ylab = "Global Active Power (kilowatts)",
          xlab = "")
)                  
dev.copy(png, file = "plot2.png")
dev.off()