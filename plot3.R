if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
#downloadin data
library(ggplot2)
#importing ggplot2
bal<-subset(NEI,fips=="24510")
dbal<-aggregate(Emissions ~ year + type, bal, sum)
#extracting and tidying data
g<-ggplot(dbal,aes(x=year,y=Emissions))
g+geom_point()+facet_grid(.~type)+geom_line(color="blue")
#plotting
