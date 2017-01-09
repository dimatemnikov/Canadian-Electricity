#import raw data
elec_raw <- read.csv("raw data/Canadian monthly electric power generation, receipts, deliveries, availability.csv", header=TRUE)

#keep only columns Ref_Date, COMPONENT, Value.
elec_raw2 <- subset(elec_raw, select = c("Ref_Date","GEO","COMPONENTS","Value"))
elec_raw_CAN <- elec_raw2[elec_raw2$GEO == "Canada",]

#remove GEO column from this data.
CAN_elec <- subset(elec_raw_CAN, select = c("Ref_Date","COMPONENTS","Value"))

#segmenting into just generation and removing redundant COMPONENT column.
CAN_elec_gen <- CAN_elec[CAN_elec$COMPONENTS == "Total generation",]
CAN_elec_gen <- subset(CAN_elec_gen, select = c("Ref_Date","Value"))

#export this generation data to csv.
write.csv(CAN_elec_gen,file = "Canadian Electricity Generation Monthly.csv",row.names = FALSE)

#segmenting into just receipts and removing redundant COMPONENT column.
CAN_elec_rec <- CAN_elec[CAN_elec$COMPONENTS == "Total receipts",]
CAN_elec_rec <- subset(CAN_elec_rec, select = c("Ref_Date","Value"))

#export this generation data to csv.
write.csv(CAN_elec_rec,file = "Canadian Electricity Receipts Monthly.csv",row.names = FALSE)

#segmenting into just receipts and removing redundant COMPONENT column.
CAN_elec_del <- CAN_elec[CAN_elec$COMPONENTS == "Total deliveries",]
CAN_elec_del <- subset(CAN_elec_del, select = c("Ref_Date","Value"))

#export this generation data to csv.
write.csv(CAN_elec_del,file = "Canadian Electricity Deliveries Monthly.csv",row.names = FALSE)

