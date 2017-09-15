# Use ggplot2

library(ggplot2)

# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get total emissions

subdata <- subset(NEI, fips == "24510")
data <- aggregate(Emissions ~ year + type, subdata, sum)

# Create plot

png("plot3.png", height = 480, width = 480)

# Plot the data

g <- ggplot(data, aes(year, Emissions, col = type))
g <- g + geom_line() + 
        geom_point() + 
        ggtitle("Emissions from PM2.5 in Baltimore City") +
        xlab("Year") +
        ylab("PM2.5 Emissions")

# Print the plot

print (g)

# Shut down the current device

dev.off()

