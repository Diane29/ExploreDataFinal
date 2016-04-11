#Read in the data
setwd("~/Explore")
NEI <- readRDS("~/Explore/summarySCC_PM25.rds")
SCC <- readRDS("~/Explore/Source_Classification_Code.rds")

#Get the Total Country-wide Emissions by Year and Assign Column names
NEI_Tot <- aggregate(NEI$Emissions,list(NEI$year),FUN=sum)
colnames(NEI_Tot) <- c("Year","Tot_Emissions")

#Plot graph of Total Emissions from all sources by Year
barplot(NEI_Tot$Tot_Emissions,names.arg= NEI_Tot$Year, xlab="Year", 
        ylab="Total PM2.5 Emissions (tons)",
        main="All Sources PM2.5 Emissions from 1999 - 2008")

dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off()
