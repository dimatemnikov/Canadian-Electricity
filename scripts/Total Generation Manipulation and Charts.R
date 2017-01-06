#import data
CAN_elec_gen <- read.csv("Canadian Electricity Generation Monthly.csv",header=TRUE)

#create table with generation data in TWh.
gen <- CAN_elec_gen$Value/1000000

#summarize monthly generation data.
summary(gen)

#Create a histogram of total generation
h <- hist(gen,
          breaks = 10,
          col="grey",
          border = 0,
          main = "Histogram of Monthly Electricity Generation for Canada",
          xlab = "Generation in TWh",
          ylab = "Frequency",
          freq = FALSE)
#Adding the individual data.
rug(gen)

#Adding a normal distribution curve.
curve(dnorm(x,mean=mean(gen),sd=sd(gen)),
      col="red",
      lwd=2,
      add=TRUE)

#Boxplot of data
boxplot(gen,
        horizontal = TRUE,
        xlab = "Monthly electricity generation in TWh",
        main = "Boxplot of Monthly Electricity Generation in Canada")
