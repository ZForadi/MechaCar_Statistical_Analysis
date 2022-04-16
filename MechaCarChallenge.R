# Linear Regression to Predict MPG
library(dbplyr)
mc_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mc_df) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mc_df)) #generate summary statistics

# Summary Statistics on Suspension Coils
sc_df <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
library(tidyverse)
total_summary <- sc_df %>% summarize (Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),
                                                SD=sd(PSI))

lot_summary <- sc_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),
                                                                   SD=sd(PSI), .groups = 'keep') #create summary table
# T-Tests on Suspension Coils
t.test(sc_df$PSI, mu=1500)

Lot1 <- subset(sc_df, Manufacturing_Lot=="Lot1")
t.test(Lot1$PSI, mu=1500)

Lot2 <- subset(sc_df, Manufacturing_Lot=="Lot2")
t.test(Lot2$PSI, mu=1500)

Lot3 <- subset(sc_df, Manufacturing_Lot=="Lot3")
t.test(Lot3$PSI, mu=1500)