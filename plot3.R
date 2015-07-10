
plot3 <- function() {
    #  data file downloaded and unzipped into local data directory
    epc <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")

    # select out target date ragne, sub metering data and Date+Time
    plot_data <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007",]
    y1 <- plot_data[,c("Sub_metering_1")]
    y2 <- plot_data[,c("Sub_metering_2")]
    y3 <- plot_data[,c("Sub_metering_3")]
    x  <- plot_data[,c("Date", "Time")]

    # convert factor data to plot friendly data
    esm1 <- as.numeric(levels(y1)[y1])
    esm2 <- as.numeric(levels(y2)[y2])
    esm3 <- y3

    # Date+Time dimension conversion
    date_time <- paste(x$Date, x$Time)
    time_vals <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")

    # margins and setup plot frame
    par(mfrow=c(1,1), mar=c(4, 5, 3, 2))
    plot(time_vals, esm1, ylab="Global Active Power (kilowatts)", 
         xlab="", type="n")

    legend("topright", lty=c(1,1), col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    # plot data
    lines(time_vals, esm1, col="black")
    lines(time_vals, esm2, col="red")
    lines(time_vals, esm3, col="blue")

    # copy to plot3.png
    dev.copy(png, file = "plot3.png")
    dev.off()
}

