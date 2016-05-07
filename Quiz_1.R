MyData <- read.csv("hw1_data.csv")
names(MyData)
MyData[1:2,]
MyData[152:153,]
Ozone <- MyData(,1)
Ozone[47]
Bad <- is.na(Ozone)
BadOzone <- Ozone[Bad]
length(BadOzone)
GoodOzone <- Ozone[!Bad]
mean(GoodOzone)
OzoneFilter <- subset(MyData, Ozone > 31)
FullFilter <- subset(OzoneFilter, Temp > 90)
SolarR <- FullFilter[,2]
mean(SolarR)

Mon <- subset(MyData, Month == 6)
Tem <- Mon[,4]
mean(Tem)

Mon <- subset(MyData, Month == 5)
oz <- Mon[,1]
##remove bad values



