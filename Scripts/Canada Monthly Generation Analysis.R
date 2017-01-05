#Import Canada Generation Data.
Canada_elec_gen <- read.csv("Canada Electricity Generation.csv")

#Summarize the generation data.
summary(Canada_elec_gen$Total.Generation..MWh.)

#MWh are very large numbers for our analysis. Let's convert to TWh by dividing by 1,000,000.
Canada_elec_gen$Total.Generation..MWh.=Canada_elec_gen$Total.Generation..MWh./1000000

#We need to rename the header.
names(Canada_elec_gen)[2] <- "Total Generation (TWh)"
write.csv(Canada_elec_gen,file='Canada Electricity Generation in TWh.csv',row.names = FALSE)


#Creating a histogram of generation data.
hist(Canada_elec_gen$`Total Generation (TWh)`,breaks=20,
     main="Distribution of Electricity Generation per Month in Canada \n Jan 2008 to Dec 2015 \n StatsCan Data",
     ylab="Frequency of Generation Amount",
     xlab="Electricity Generation \n (in TWh)",
     col="grey")

#We want to create a plot over time.
#We must first convert the Date column numeric values into date values.
mode(Canada_elec_gen$Date)
z <- Canada_elec_gen[1,1] 
z <- as.Date(Canada_elec_gen[1,1],"%Y/%m")
z

#plotting
plot.ts(Canada_elec_gen$`Total Generation (TWh)`, 
        main="Electricity Generation in Canada (TWh)",
        ylab="Electricity Generated (TWh)",
        xlab= NULL)

