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

# Visually inspect the data for normality using a distribution plot
plt <- ggplot(coilData,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# Visually inspect distribution of Lot 1
psiLot1 <- coilData[coilData$Manufacturing_Lot == 'Lot1',]
head(psiLot1)
plt <- ggplot(psiLot1,aes(x=PSI))
plt + geom_density()

# Visually inspect distribution of Lot 2
psiLot2 <- coilData[coilData$Manufacturing_Lot == 'Lot2',]
head(psiLot2)
plt <- ggplot(psiLot2,aes(x=PSI))
plt + geom_density()

# Visually inspect distribution of Lot 3
psiLot3 <- coilData[coilData$Manufacturing_Lot == 'Lot3',]
head(psiLot3)
plt <- ggplot(psiLot3,aes(x=PSI))
plt + geom_density()

# Apply the shapiro test to the population and to each lot
shapiro.test(coilData$PSI)
shapiro.test(psiLot1$PSI)
shapiro.test(psiLot2$PSI)
shapiro.test(psiLot3$PSI)

# Apply a one sample t-test to determine if the PSI across 
# all manufacturing lots is statistically different from 
# the population mean of 1,500 pounds per square inch.
psiSample <- coilData %>% sample_n(15) # select a random sample
t.test(psiSample$PSI,mu=mean(coilData$PSI))

# Apply the t-test using subset function to test for Lot1
t.test( sample_n(coilData,15)$PSI, mu=mean(coilData$PSI), subset=subset(coilData, Manufacturing_Lot == 'Lot1'))

# Apply the t-test using subset function to test for Lot2
t.test( sample_n(coilData,15)$PSI, mu=mean(coilData$PSI), subset=subset(coilData, Manufacturing_Lot == 'Lot2'))

# Apply the t-test using subset function to test for Lot3
t.test( sample_n(coilData,15)$PSI, mu=mean(coilData$PSI), subset=subset(coilData, Manufacturing_Lot == 'Lot3'))
