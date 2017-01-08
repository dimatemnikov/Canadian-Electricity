#import data
CAN_elec_gen <- read.csv("Canadian Electricity Generation Monthly.csv",header=TRUE)

#create table with generation data in TWh.
gen <- CAN_elec_gen$Value/1000000

#Convert the Ref Dates into year & month format.
dates <- as.yearmon(CAN_elec_gen$Ref_Date, "%Y/%m")
CAN_elec_gen$Ref_Date <- dates

#summarize monthly generation data.
summary(gen)

#Create a histogram of total generation
h <- hist(gen,
          breaks = 10,
          col="grey",
          border = 0,
          main = "Histogram of Monthly Electricity Generation for Canada over 8 years (96 months)",
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

#plot generation through time.
mode(dates)
dates <- as.Date(dates)
ggplot(CAN_elec_gen, aes(dates,gen)) + geom_line() + geom_point() +
  theme_bw() + theme_light() +
  xlab("") + ylab("Electricity generation in TWh") + 
  ggtitle("Monthly Electricity Generation in Canada 2008-2015") +
  scale_x_date(date_minor_breaks = "1 year", date_labels = "%b %Y") 
  #ylim(0,70) + yaxs




#create time series that matches the imported data.
#dates <- as.yearmon(2008 + seq(0, 12*7+11)/12)


