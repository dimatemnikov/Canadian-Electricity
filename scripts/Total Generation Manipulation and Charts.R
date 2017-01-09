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
gen_hist <- hist(gen,
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
gen_plot <- ggplot(CAN_elec_gen, aes(dates,gen)) + geom_line() + geom_point() +
  theme_bw() + theme_light() +
  xlab("") + ylab("Electricity generation in TWh") + 
  ggtitle("Monthly Electricity Generation in Canada 2008-2015") +
  scale_x_date(date_minor_breaks = "1 year", date_labels = "%b %Y") 
  #ylim(0,70) + yaxs


#Let's tabulate the monthly data by looping though the Dates and checking the month.
jan_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "January"])
feb_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "February"])
mar_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "March"])
apr_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "April"])
may_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "May"])
jun_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "June"])
jul_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "July"])
aug_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "August"])
sep_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "September"])
oct_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "October"])
nov_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "November"])
dec_gen_mean <- mean(CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "December"])

months <- c("January","February","March","April","May","June","July","August","September","October","November","December")
monthly_averages <- c(jan_gen_mean,feb_gen_mean,mar_gen_mean,apr_gen_mean,may_gen_mean,jun_gen_mean,jul_gen_mean,aug_gen_mean,sep_gen_mean,oct_gen_mean,nov_gen_mean,dec_gen_mean)
monthly_table <- data.frame("Month"=months,"Average Generation"=monthly_averages)
monthly_table

barplot(monthly_table$Average.Generation)

jan_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "January"]
feb_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "February"]
mar_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "March"]
apr_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "April"]
may_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "May"]
jun_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "June"]
jul_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "July"]
aug_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "August"]
sep_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "September"]
oct_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "October"]
nov_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "November"]
dec_gen_all <- CAN_elec_gen$Value[months(CAN_elec_gen$Ref_Date) == "December"]

# boxplot(jan_gen_all,
#         horizontal = TRUE,
#         xlab = "January electricity generation in TWh",
#         main = "Boxplot of Electricity Generation in Canada for month of January")

