if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
#downloading data
library(ggplot2)
neiscc<-merge(NEI,SCC,by="SCC")
#takes some time
coal<-subset(neiscc,grepl("Coal",EI.Sector))
dcoal<-aggregate(Emissions ~ year, coal, sum)
g<-ggplot(dcoal,aes(x=year,y=Emissions))
g+geom_point()+geom_line(color="blue")+ggtitle("US/ Coal Combustion-Related Emissions")
#plotting
