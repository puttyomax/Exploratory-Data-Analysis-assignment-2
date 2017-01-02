if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
mary<-sum(subset(NEI,year==1999 & fips=="24510")$Emissions)
for(i in c(2002,2005,2008)){
        mary<-append(mary,sum(subset(NEI,year==i & fips=="24510")$Emissions))
}
names(mary)<-c(1999,2002,2005,2008)
barplot(mary,xlab="Year",ylab="PM2.5 Emission",main="PM2.5 Emission in the Baltimore City, Maryland")
