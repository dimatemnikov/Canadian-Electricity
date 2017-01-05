#This script cleans up the data from StatCan.

#import data downloaded from StatCan.
raw_monthly_elec_data <- read.csv("raw data/Canadian monthly electric power generation, receipts, deliveries, availability.csv")
raw_monthly_elec_data <- unlist(raw_monthly_elec_data)
mode(raw_monthly_elec_data)

#vectors and coordinates are provided, which we do not need. Let's remove them.
all_elec_sub <- subset(raw_monthly_elec_data, select = c(Ref_Date,GEO,COMPONENTS,Value))
#str(all_elec_sub)
#fix(all_elec_sub)
write.csv(all_elec_sub,file='Canada and Provinces Electricity Generation, Receipts, Deliveries, Availability.csv',row.names = FALSE)

#the data is for every province and territory as well as for Canada as a whole.

#Let's create a new subset for Canada as a whole.
Canada_elec_sub <- subset(all_elec_sub, GEO == 'Canada')
#We no longer need the GEO tag as we are exclusively dealing with Canada.
Canada_elec_sub <- subset(Canada_elec_sub, select = c(Ref_Date, COMPONENTS, Value))
#Creating a new CSV for Canada electricity data.
write.csv(Canada_elec_sub,file='Canada Electricity Generation, Receipts, Deliveries, Availability.csv',row.names = FALSE)

#Further segmenting the data for Generation only.
Canada_elec_gen <- subset(Canada_elec_sub, COMPONENTS == 'Total generation')
#We no longer need the COMPONENT column either.
Canada_elec_gen <- subset(Canada_elec_gen, select = c(Ref_Date, Value))
#Renaming the Values column to Total Generation.
names(Canada_elec_gen)[names(Canada_elec_gen) == 'Value'] <- 'Total Generation (MWh)'
names(Canada_elec_gen)[names(Canada_elec_gen) == 'Ref_Date'] <- 'Date'
mode(Canada_elec_gen)
#Saving the data to CSV.
write.csv(Canada_elec_gen,file='Canada Electricity Generation.csv',row.names = FALSE)

#Doing the same for Receipts, Deliveries, and availability.
Canada_elec_rec <- subset(Canada_elec_sub, COMPONENTS == 'Total receipts')
Canada_elec_rec <- subset(Canada_elec_rec, select = c(Ref_Date, Value))
names(Canada_elec_rec)[names(Canada_elec_rec) == 'Value'] <- 'Total Receipts (MWh)'
names(Canada_elec_rec)[names(Canada_elec_rec) == 'Ref_Date'] <- 'Date'
write.csv(Canada_elec_rec,file='Canada Electricity Receipts.csv',row.names = FALSE)

Canada_elec_del <- subset(Canada_elec_sub, COMPONENTS == 'Total deliveries')
Canada_elec_del <- subset(Canada_elec_del, select = c(Ref_Date, Value))
names(Canada_elec_del)[names(Canada_elec_del) == 'Value'] <- 'Total Deliveries (MWh)'
names(Canada_elec_del)[names(Canada_elec_del) == 'Ref_Date'] <- 'Date'
write.csv(Canada_elec_del,file='Canada Electricity Deliveries.csv',row.names = FALSE)

Canada_elec_avail <- subset(Canada_elec_sub, COMPONENTS == 'Total electricity available for use within specific geographic border')
Canada_elec_avail <- subset(Canada_elec_avail, select = c(Ref_Date, Value))
names(Canada_elec_avail)[names(Canada_elec_avail) == 'Value'] <- 'Total Availability (MWh)'
names(Canada_elec_avail)[names(Canada_elec_avail) == 'Ref_Date'] <- 'Date'
write.csv(Canada_elec_avail,file='Canada Electricity Availability.csv',row.names = FALSE)


