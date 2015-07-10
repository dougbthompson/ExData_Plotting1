
plot1 <- function() {
    # data file downloaded and unzipped into local data directory
    epc <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")

    # select out target date ragne and then just Global_active_power data
    plot_data <- epc[epc$Date == "1/2/2007" | epc$Date == "2/2/2007",]
    plot1_gap <- plot_data[,c("Global_active_power")]

    # convert factor data to plot friendly data
    plot1_gap_num <- as.numeric(levels(plot1_gap)[plot1_gap])

    # margins and plot data
    par(mfrow=c(1,1), mar=c(4, 5, 3, 2))
    hist(plot1_gap_num, ylab = "Frequency", xlab = "Global Active Power (kilowatts)", 
         main = "Global Active Power", col="red")

    # copy to plot1.png
    dev.copy(png, file = "plot1.png")
    dev.off()
}

