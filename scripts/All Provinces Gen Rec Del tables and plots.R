#import raw data for all Canada and all provinces 
elec_raw_all <- read.csv("raw data/Canadian monthly electric power generation, receipts, deliveries, availability.csv", header=TRUE)

#remove vector and coordinate columns
elec_raw_all <- subset(elec_raw_all, select = c("Ref_Date","GEO","COMPONENTS","Value"))

#create data tables for every province, territory, and Canada for all electricity data.
CAN_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Canada",], select = c("Ref_Date","COMPONENTS","Value"))
AB_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Alberta",], select = c("Ref_Date","COMPONENTS","Value"))
BC_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "British Columbia",], select = c("Ref_Date","COMPONENTS","Value"))
ON_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Ontario",], select = c("Ref_Date","COMPONENTS","Value"))
MB_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Manitoba",], select = c("Ref_Date","COMPONENTS","Value"))
NWT_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Northwest Territories",], select = c("Ref_Date","COMPONENTS","Value"))
NS_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Nova Scotia",], select = c("Ref_Date","COMPONENTS","Value"))
NB_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "New Brunswick",], select = c("Ref_Date","COMPONENTS","Value"))
PEI_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Prince Edward Island",], select = c("Ref_Date","COMPONENTS","Value"))
QC_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Quebec",], select = c("Ref_Date","COMPONENTS","Value"))
SK_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Saskatchewan",], select = c("Ref_Date","COMPONENTS","Value"))
NUN_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Nunavut",], select = c("Ref_Date","COMPONENTS","Value"))
NFL_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Newfoundland and Labrador",], select = c("Ref_Date","COMPONENTS","Value"))
YUK_elec_all <- subset(elec_raw_all[elec_raw_all$GEO == "Yukon",], select = c("Ref_Date","COMPONENTS","Value"))

#creating a reference list of the provinces and territories.
provinces <- c("Alberta","British Columbia","Ontario","Manitoba","Northwest Territories","Nova Scotia","New Brunswick","Prince Edward Island", "Quebec","Saskatchewan","Nunavut","Newfoundland and Labrador","Yukon")

#GENERATION
g1 <-CAN_elec_gen <- subset(CAN_elec_all[CAN_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g2 <- AB_elec_gen <- subset(AB_elec_all[AB_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g3 <- BC_elec_gen <- subset(BC_elec_all[BC_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g4 <- ON_elec_gen <- subset(ON_elec_all[ON_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g5 <- MB_elec_gen <- subset(MB_elec_all[MB_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g6 <- NWT_elec_gen <- subset(NWT_elec_all[NWT_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g7 <- NS_elec_gen <- subset(NS_elec_all[NS_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g8 <- NB_elec_gen <- subset(NB_elec_all[NB_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g9 <- PEI_elec_gen <- subset(PEI_elec_all[PEI_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g10 <- QC_elec_gen <- subset(QC_elec_all[QC_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g11 <- SK_elec_gen <- subset(SK_elec_all[SK_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g12 <- NUN_elec_gen <- subset(NUN_elec_all[NUN_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g13 <- NFL_elec_gen <- subset(NFL_elec_all[NFL_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))
g14 <- YUK_elec_gen <- subset(YUK_elec_all[YUK_elec_all$COMPONENTS == "Total generation",], select = c("Ref_Date","Value"))

#Create table with all generation data.
library(plyr)
GEN_TABLE <- join_all(list(g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14), by='Ref_Date', type='left')

#Rename headers.
colnames(GEN_TABLE) <- c("Month","Canada",provinces)

#export table as csv.
write.csv(GEN_TABLE,file = "Monthly Generation Table.csv",row.names = FALSE)

summary(as.numeric(GEN_TABLE$Canada))

hist(as.numeric(GEN_TABLE$`British Columbia`),
     breaks = 10,
     col="grey",
     border = 0,
     main = "Histogram of Monthly Electricity Generation for Canada over 8 years (96 months)",
     xlab = "Generation in TWh",
     ylab = "Frequency",
     freq = TRUE)

CAN_elec_gen$Value
#Tables 



