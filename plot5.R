# Use ggplot2

library(ggplot2)

# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get total emissions

subdata <- subset(NEI, fips == "24510" & type == 'ON-ROAD')
data <- aggregate(Emissions ~ year, subdata, sum)

# Create plot

png("plot5.png", height = 480, width = 480)

# Plot the data

g <- ggplot(data, aes(year, Emissions))
g <- g + geom_line() + 
        geom_point() + 
        ggtitle("Emissions from motor vehicle sources in Baltimore Cityin Baltimore City") +
        xlab("Year") +
        ylab("PM2.5 Emissions")

# Print the plot

print (g)

# Shut down the current device

dev.off()

