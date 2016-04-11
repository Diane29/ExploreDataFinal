#Read in the data
library(ggplot2)
setwd("~/Explore")
NEI <- readRDS("~/Explore/summarySCC_PM25.rds")
SCC <- readRDS("~/Explore/Source_Classification_Code.rds")

#Pull the data for Baltimore, Maryland 
NEI_MD <- subset(NEI,fips == "24510")

#Plot data of Emissions and compare by Type from 1999-2008  
g <- ggplot(data=NEI_MD, aes(factor(year), Emissions,fill=year))
g + facet_grid(. ~ type)+geom_bar(stat="identity") +
  labs(x="Year", y=" Total PM2.5 Emissions (tons)",
  title=" Baltimore City PM2.5 Emissions by source Type from 1999-2008")

dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off()
