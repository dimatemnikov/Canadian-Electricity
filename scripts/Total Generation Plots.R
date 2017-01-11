#import data.
GEN_TABLE <- read.csv("Monthly Generation Table.csv", header=TRUE)

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

#plot receipts through time.
ggplot(GEN_TABLE, aes(x=GEN_TABLE$Month,y=GEN_TABLE$Canada/1000000),group=1) +
  geom_line() + geom_point() +
  theme_bw() + theme_light() +
  xlab("") + ylab("Electricity generation in TWh") +
  ggtitle("Monthly Electricity Generation in Canada 2008-2015") 
  #scale_x_date(date_minor_breaks = "1 month", date_labels = "%b %Y")

#ggplot(aes(x = GEN_TABLE$Month, y = GEN_TABLE$Canada), data = GEN_TABLE) + geom_line()

