
plot2 <- function() {
    #  data file downloaded and unzipped into local data directory
    epc <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")

    # select out target date ragne
    plot_data <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007",]

    # select out Global_active_power and Date+Time dimensions
    y <- plot_data[,c("Global_active_power")]
    x <- plot_data[,c("Date", "Time")]

    # convert factor data to plot friendly data
    kilowatt_vals <- as.numeric(levels(y)[y])

    # Date+Time dimension conversion
    date_time <- paste(x$Date, x$Time)
    time_vals <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")

    # margins and setup plot frame
    par(mfrow=c(1,1), mar=c(4, 5, 3, 2))
    plot(time_vals, kilowatt_vals, ylab="Global Active Power (kilowatts)", 
         xlab="", type="n")

    # plot data
    lines(time_vals, kilowatt_vals)

    # copy to plot2.png
    dev.copy(png, file = "plot2.png")
    dev.off()
}

