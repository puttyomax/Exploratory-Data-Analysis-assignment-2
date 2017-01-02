if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
#downloading data
library(ggplot2)
motbal<-subset(NEI,fips=="24510"&type=="ON-ROAD")
dmbal<-aggregate(Emissions ~ year, motbal, sum)
g<-ggplot(dmbal,aes(x=year,y=Emissions))
g+geom_point()+geom_line(color="blue")+ggtitle("Emissions from Motor Vehicle Sources from 1999–2008 in Baltimore City")
