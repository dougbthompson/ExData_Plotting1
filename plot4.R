
plot4 <- function() {
    #  data file downloaded and unzipped into local data directory
    epc <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")

    # select out target date ragne
    plot_data <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007",]

    # Date+Time dimension conversion
    x <- plot_data[,c("Date", "Time")]
    date_time <- paste(x$Date, x$Time)
    time_vals <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")

    # image layout and margins
    par(mfrow=c(2,2), mar=c(4, 4, 2, 2), oma=c(1, 1, 1, 1))

    # plot(1,1)
    y <- plot_data[,c("Global_active_power")]
    kilowatt_vals <- as.numeric(levels(y)[y])
    plot(time_vals, kilowatt_vals, ylab="Global Active Power", 
         xlab="", type="n")

    lines(time_vals, kilowatt_vals)

    # plot(1,2)
    y <- plot_data[,c("Voltage")]
    voltage_vals <- as.numeric(levels(y)[y])
    plot(time_vals, voltage_vals, ylab="Voltage", xlab="datetime", type="n")

    lines(time_vals, voltage_vals)

    # plot(2,1)
    y1 <- plot_data[,c("Sub_metering_1")]
    y2 <- plot_data[,c("Sub_metering_2")]
    y3 <- plot_data[,c("Sub_metering_3")]

    esm1 <- as.numeric(levels(y1)[y1])
    esm2 <- as.numeric(levels(y2)[y2])
    esm3 <- y3

    plot(time_vals, esm1, ylab="Energy sub metering", xlab="", type="n")
    legend("topright", lty=c(1,1), bty="n", cex=0.5, col=c("black", "red", "blue"),
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    lines(time_vals, esm1, col="black")
    lines(time_vals, esm2, col="red")
    lines(time_vals, esm3, col="blue")

    # plot(2,2)
    y <- plot_data[,c("Global_reactive_power")]
    grp_vals <- as.numeric(levels(y)[y])
    plot(time_vals, grp_vals, ylab="Global_reactive_power", xlab="datetime", type="n")

    lines(time_vals, grp_vals)

    # copy to plot4.png
    dev.copy(png, file = "plot4.png")
    dev.off()
}

