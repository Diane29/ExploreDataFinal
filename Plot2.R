#Read in the data
setwd("~/Explore")
NEI <- readRDS("~/Explore/summarySCC_PM25.rds")
SCC <- readRDS("~/Explore/Source_Classification_Code.rds")

#Pull the data for Baltimore, Maryland 
NEI_MD <- subset(NEI,fips == "24510")
NEI_MD_Tot <- aggregate(NEI_MD$Emissions,list(NEI_MD$year),FUN=sum)
colnames(NEI_MD_Tot) <- c("Year","Tot_Emissions")

#Plot data of Total Emissions from Baltimore, Maryland sources by Year
barplot(NEI_MD_Tot$Tot_Emissions,names.arg= NEI_MD_Tot$Year, xlab="Year", 
        ylab="Total PM2.5 Emissions (Tons)",
      main="Baltimore City sources PM2.5 Emissions from 1999 - 2008")

dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off()
