#Read in the data
setwd("~/Explore")
NEI <- readRDS("~/Explore/summarySCC_PM25.rds")
SCC <- readRDS("~/Explore/Source_Classification_Code.rds")

#Select data of Vehicle sources 
SCC_Veh <- SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE),]

#Pull the data for Baltimore, Maryland then merge with Vehicle sources
NEI_MD <- subset(NEI,fips == "24510")
NEI_MD_Veh <- merge(x=NEI_MD, y=SCC_Veh, by='SCC') 

#Get the Total Country-wide Emissions by Year and Assign Column names
NEI_MD_Veh_Tot<- aggregate(NEI_MD_Veh$Emissions,list(NEI_MD_Veh$year),FUN=sum)
colnames(NEI_MD_Veh_Tot) <- c("Year","Tot_Emissions")

qplot(Year,Tot_Emissions,data=NEI_MD_Veh_Tot,geom = c("point", "line"),
      ylab="Total PM2.5 Emissions (tons)",
      main = "Vehicle sources PM2.5 Emissions in Baltimore City from 1999-2008")

dev.copy(png, file="plot5.png", height=480, width=480) 
dev.off()
