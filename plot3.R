# load data and change date time types
df<- read.table("household_power_consumption.txt", 
                sep = ";", 
                skip = 66637, 
                nrows=2880, 
                col.names = read.csv2("household_power_consumption.txt", 
                                      header = FALSE, nrows = 1))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time<-as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

# plot 3
with(df,
     plot(Time, 
          Sub_metering_1,
          col = "black",
          type = "l",
          ylab = "Engrgy sub metering",
          xlab = ""
     )
)
with(df,
     lines(Time,
           Sub_metering_2,
           col = "red",
     )
)
with(df,
     lines(Time,
           Sub_metering_3,
           col = "blue",
     )
)
legend("topright", 
       lty = "solid",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.5)
dev.copy(png, file = "plot3.png")
dev.off()