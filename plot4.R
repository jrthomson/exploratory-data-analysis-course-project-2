# Use ggplot2

library(ggplot2)

# Read data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge the data

mergedata <- merge(NEI, SCC, by = "SCC")

# Get 'coal' data

coal <- grepl("coal", mergedata$Short.Name, ignore.case = TRUE)
subcoal <- mergedata[coal, ]

# Get total emissions

data <- aggregate(Emissions ~ year, subcoal, sum)

# Create plot

png("plot4.png", height = 480, width = 720)

# Plot the data

g <- ggplot(data, aes(factor(year), Emissions, group = 1))
theme_update(plot.title = element_text(hjust = 0.5))
g <- g + geom_line() + 
        geom_point() + 
        ggtitle("Emissions from Coal in US") +
        xlab("Year") +
        ylab("PM2.5 Emissions")

# Print the plot

print (g)

# Shut down the current device

dev.off()

