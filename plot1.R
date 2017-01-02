if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}
#downloading data

x<-sum(subset(NEI,year==1999)$Emissions)
for(i in c(2002,2005,2008)){
        x<-append(x,sum(subset(NEI,year==i)$Emissions))
}
names(x)<-c(1999,2002,2005,2008)
barplot(x,main="PM 2.5 Emission",xlab="Year",ylab="PM 2.5 Emission")

