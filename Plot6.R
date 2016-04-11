#Read in the data
library(ggplot2)
setwd("~/Explore")
NEI <- readRDS("~/Explore/summarySCC_PM25.rds")
SCC <- readRDS("~/Explore/Source_Classification_Code.rds")

SCC_Veh <- SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE),]
NEI_MD <- subset(NEI, fips=="24510")
NEI_MD$city <- "Baltimore"
NEI_CA <- subset(NEI, fips == "06037")
NEI_CA$city <- "Los Angeles"
NEI_CA_MD <- rbind(NEI_CA,NEI_MD)
NEI_CA_MD_Veh <- merge(x=NEI_CA_MD, y=SCC_Veh, by='SCC') 

g <- ggplot(data=NEI_CA_MD_Veh, aes(factor(year), Emissions,fill=year))
g + facet_grid(. ~ city)+geom_bar(stat="identity") + 
    labs(x="Year", y=" Total PM2.5 Emissions (Tons)",
       title=" Vehicle sources PM2.5 Emissions in 
       Baltimore City and Los Angeles City from 1999-2008")

dev.copy(png, file="plot6.png", height=480, width=480) 
dev.off()
