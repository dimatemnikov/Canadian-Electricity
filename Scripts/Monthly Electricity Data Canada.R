#This script cleans up the data from StatCan.

#import data downloaded from StatCan.
raw_monthly_elec_data <- read.csv("raw data/Canadian monthly electric power generation, receipts, deliveries, availability.csv")

#inspect data structure
str(raw_monthly_elec_data)

#vectors and coordinates are provided, which we do not need. Let's remove them.
all_elec_sub <- subset(raw_monthly_elec_data, select = c(Ref_Date,GEO,COMPONENTS,Value))
#str(all_elec_sub)
#fix(all_elec_sub)
write.csv(all_elec_sub,file='Canada and Provinces Electricity Generation, Receipts, Deliveries, Availability.csv')

#the data is for every province and territory as well as for Canada as a whole.
#Let's break down the data for every province and Canada as a whole.
Canada_elec_sub <- subset(all_elec_sub, GEO == 'Canada')
write.csv(Canada_elec_sub,file='Canada Electricity Generation, Receipts, Deliveries, Availability.csv')

ON_elec_sub <- subset(all_elec_sub, GEO == 'Ontario')
write.csv(ON_elec_sub,file='Ontario Electricity Generation, Receipts, Deliveries, Availability.csv')


