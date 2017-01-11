#import raw data
elec_raw <- read.csv("raw data/Canadian monthly electric power generation, receipts, deliveries, availability.csv", header=TRUE)

#keep only columns Ref_Date, COMPONENT, Value.
elec_raw_ON <- elec_raw[elec_raw$GEO == "Ontario",]
ON_elec_gen <- elec_raw_ON[elec_raw_ON$COMPONENTS == "Total generation",]
