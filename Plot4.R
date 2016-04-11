#Read in the data
library(ggplot2)
setwd("~/Explore")
NEI <- readRDS("~/Explore/summarySCC_PM25.rds")
SCC <- readRDS("~/Explore/Source_Classification_Code.rds")

#Select data from Coal Combustion-related sources
SCC_coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),] 
NEI_SCC_coal <- merge(x=NEI, y=SCC_coal, by='SCC') 

#Get the Total Country-wide Emissions by Year and Assign Column names
NEI_SCC_coal <- aggregate(NEI_SCC_coal$Emissions,list(NEI_SCC_coal$year),FUN=sum)
colnames(NEI_SCC_coal) <- c("Year","Tot_Emissions")

qplot(Year,Tot_Emissions,data=NEI_SCC_coal, geom = c("point", "line"),
      ylab="Total PM2.5 Emissions (tons)",
      main = "Coal Combustion sources PM2.5 Emissions from 1999-2008")

dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off()
