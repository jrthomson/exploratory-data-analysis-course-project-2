# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get total emissions

data <- aggregate(Emissions ~ year, NEI, sum)

# Create plot

png("plot1.png", height = 480, width = 480)

# Plot the data

plot(data, main = "Total PM2.5 Emissions", 
        xlab = "Year",
        ylab = "PM2.5 Emissions",
        type = 'l')

# Shut down the current device

dev.off()
