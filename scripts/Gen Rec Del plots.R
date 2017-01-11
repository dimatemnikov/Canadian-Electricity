#import data
CAN_elec_gen <- read.csv("Canadian Electricity Generation Monthly.csv",header=TRUE)
CAN_elec_del <- read.csv("Canadian Electricity Deliveries Monthly.csv",header=TRUE)
CAN_elec_rec <- read.csv("Canadian Electricity Receipts Monthly.csv",header=TRUE)

temp <- merge(CAN_elec_gen,CAN_elec_del,by="Ref_Date")
merge(temp,CAN_elec_rec,by="Ref_Date")

#Check if all imported data have same dates.
if (identical(CAN_elec_del$Ref_Date,CAN_elec_gen$Ref_Date,CAN_elec_rec$Ref_Date)){
  print("Dates match up")
  dates <- as.yearmon(CAN_elec_gen$Ref_Date, "%Y/%m")
  } else 
    print("Dates do not match up")
  
#create tables with generation, deliveries, receipts, dates data in TWh.
gen <- CAN_elec_gen$Value/1000000
rec <- CAN_elec_rec$Value/1000000
del <- CAN_elec_del$Value/1000000


CAN_gen_rec_del <- c(dates,gen,rec,del)
CAN_gen_rec_del


#Convert the Ref Dates into year & month format.
dates <- as.yearmon(CAN_elec_gen$Ref_Date, "%Y/%m")
dates <- c("Date",as.Date(dates)
dates
CAN_elec_gen$Ref_Date <- dates



