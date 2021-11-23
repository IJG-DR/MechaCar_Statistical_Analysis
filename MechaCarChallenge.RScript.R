############################################################
### MODULE 15 Challenge
############################################################


############################################################
### DELIVERABLE 1
############################################################

# Load dplyr library
library(dplyr)

# Import and read the csv data file
mpgData <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

# Visually inspect the data 
head(mpgData)

# Perform multiple linear regression
lm(mpg ~  + vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpgData)

# Obtain summary statistics for the linear regression
summary(lm(mpg ~  + vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpgData))



############################################################
### DELIVERABLE 2
############################################################

# Import and read the csv data file
coilData <- read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

# Visually inspect the data 
head(coilData)

# Create dataframe summary table with mean, median, variance and std. dev. of PSI
total_summary <- coilData %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

# Create a dataframe summary table by lot
lot_summary <- coilData %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

# Complement analysis with a box-plot graph
plt <- ggplot(coilData,aes(x=Manufacturing_Lot,y=PSI)) #import dataset into ggplot2
plt + geom_boxplot(fill = "plum", colour="black",outlier.color="darkmagenta") #add boxplot and aesthetics



############################################################
### DELIVERABLE 3
############################################################














