#import data.
GEN_TABLE <- read.csv("Monthly Generation Table.csv", header=TRUE)

#install.packages("Hmisc")
library(Hmisc)

#converting the Month column values from numeric to yearmon.
mode(GEN_TABLE$Month)
library(zoo)
months <- as.yearmon(GEN_TABLE$Month,format="%Y/%m")

#summary in TWh
summary(as.numeric(GEN_TABLE$Canada)/1000000)

boxplot(GEN_TABLE$Canada/1000000,
        horizontal = TRUE,
        xlab = "Monthly electricity generation in TWh",
        main = "Boxplot of Monthly Electricity Generation in Canada")

hist(as.numeric(GEN_TABLE$Canada/1000000),
     col="grey",
     border = 0,
     main = "Histogram of Monthly Electricity Generation for Canada over 8 years (96 months)",
     xlab = "Generation in TWh",
     ylab = "Frequency",
     freq = FALSE)
rug(GEN_TABLE$Canada/1000000)

#Adding a normal distribution curve.
# curve(dnorm(x,mean=mean(GEN_TABLE$Canada/1000000),sd=sd(GEN_TABLE$Canada/1000000)),
#       col="red",
#       lwd=2,
#       add=TRUE)


plot(months,GEN_TABLE$Canada/1000000, type="l", xlab = "Date", bty="n",xaxt="n",
   ylab="Monthly Electricity Generation in TWh",
   main = "Monthly Electricity Generation \n in Canada 2008 to 2015")
  axis(side=1,at=seq(2008,2016,1), srt=45)
 minor.tick(nx=4)

 
 plot(months,GEN_TABLE$Canada/1000000, type="l", xlab = "Date", bty="n",xaxt="n",xlim=c(2010,2012),
      ylab="Monthly Electricity Generation in TWh",
      main = "Monthly Electricity Generation \n in Canada 2008 to 2015")
 axis(side=1,at=seq(2010,2012,1), srt=45)
 minor.tick(nx=6)
  
