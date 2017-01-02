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
motlos<-subset(NEI,fips=="06037"&type=="ON-ROAD")
dmlos<-aggregate(Emissions ~ year, motlos, sum)
dm<-rbind(dmlos,dmbal)
place<-c(rep("Los Angeles",4),rep("Baltimore",4))
dm<-cbind(dm,place)
p<-ggplot(dm,aes(year,Emissions))+geom_point(aes(color=place),size=4)+ggtitle("Emissions from Motor Vehicle Sources in Baltimore City and Los Angeles")
p
