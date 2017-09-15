# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get total emissions

subdata <- subset(NEI, fips == "24510")
data <- aggregate(Emissions ~ year, subdata, sum)

# Create plot

png("plot2.png", height = 480, width = 480)

# Plot the data

plot(data, main = "Total emissions from PM2.5 in Baltimore City", 
     xlab = "Year",
     ylab = "PM2.5 Emissions",
     type = 'l')

# Shut down the current device

dev.off()
