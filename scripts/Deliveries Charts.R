
#import data for deliveries
CAN_elec_del <- read.csv("Canadian Electricity Deliveries Monthly.csv",header=TRUE)

#create table with deliveries data in TWh.
deliveries <- CAN_elec_del$Value/1000000

#Convert the Ref Dates into year & month format.
dates <- as.yearmon(CAN_elec_del$Ref_Date, "%Y/%m")
CAN_elec_del$Ref_Date <- dates

#summarize monthly deliveries data.
summary(deliveries)

#Create a histogram of total deliveries
del_hist <- hist(deliveries,
                 breaks = 10,
                 col="grey",
                 border = 0,
                 main = "Histogram of Monthly Electricity Deliveries for Canada over 8 years (96 months)",
                 xlab = "Electricity Deliveries in TWh",
                 ylab = "Frequency",
                 freq = FALSE)

#Adding the individual data.
rug(deliveries)

#Adding a normal distribution curve.
curve(dnorm(x,mean=mean(deliveries),sd=sd(deliveries)),
      col="red",
      lwd=2,
      add=TRUE)

#Boxplot of data
boxplot(deliveries,
        horizontal = TRUE,
        xlab = "Monthly electricity deliveries in TWh",
        main = "Boxplot of Monthly Electricity Deliveries in Canada")

#plot receipts through time.
mode(dates)
dates <- as.Date(dates)

del_plot <- ggplot(CAN_elec_del, aes(dates,deliveries)) + geom_line() + geom_point() +
  theme_bw() + theme_light() +
  xlab("") + ylab("Electricity deliveries in TWh") + 
  ggtitle("Monthly Electricity Deliveries in Canada 2008-2015") +
  scale_x_date(date_minor_breaks = "1 year", date_labels = "%b %Y") 
#ylim(0,70) + yaxs
