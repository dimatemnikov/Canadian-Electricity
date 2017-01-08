#import data for receipts
CAN_elec_rec <- read.csv("Canadian Electricity Receipts Monthly.csv",header=TRUE)

#create table with receipts data in TWh.
receipts <- CAN_elec_rec$Value/1000000

#Convert the Ref Dates into year & month format.
dates <- as.yearmon(CAN_elec_rec$Ref_Date, "%Y/%m")
CAN_elec_rec$Ref_Date <- dates

#summarize monthly receipts data.
summary(receipts)

#Create a histogram of total receipts
rec_hist <- hist(receipts,
          breaks = 10,
          col="grey",
          border = 0,
          main = "Histogram of Monthly Electricity Receipts for Canada over 8 years (96 months)",
          xlab = "Electricity Receipts in TWh",
          ylab = "Frequency",
          freq = FALSE)

#Adding the individual data.
rug(receipts)

#Adding a normal distribution curve.
curve(dnorm(x,mean=mean(receipts),sd=sd(receipts)),
      col="red",
      lwd=2,
      add=TRUE)

#Boxplot of data
boxplot(receipts,
        horizontal = TRUE,
        xlab = "Monthly electricity receipts in TWh",
        main = "Boxplot of Monthly Electricity Receipts in Canada")

#plot receipts through time.
dates <- as.Date(dates)

rec_plot <- ggplot(CAN_elec_rec, aes(dates,receipts)) + geom_line() + geom_point() +
  theme_bw() + theme_light() +
  xlab("") + ylab("Electricity receipts in TWh") + 
  ggtitle("Monthly Electricity Receipts in Canada 2008-2015") +
  scale_x_date(date_minor_breaks = "1 year", date_labels = "%b %Y") 
#ylim(0,70) + yaxs






