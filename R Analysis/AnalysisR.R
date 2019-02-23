#Religion and Public Opinion
#Author: Jennifer Lin


#Read in Data
data <- read.csv("/Users/JenniferLin/Desktop/Working/ReligiousPrimes/JLin_Analysis.csv", header=TRUE)
#Set Working Directory

setwd("~/Desktop/Working/ReligiousPrimes/R Analysis")

#Load packags for analysis
library(car)

library("ggpubr")

#View Data frame
data

#Check the structure
str(data)

#Delete non-prime participants
newdata <- data[-c(26, 40, 95, 174, 187, 189, 212, 28, 35, 46, 50, 54, 55, 56, 58, 66, 71, 73, 78, 85, 92, 96, 99, 117, 121, 124, 134, 136, 137, 139, 140, 147, 150, 155, 159, 163, 172, 177, 178, 202, 207, 215, 228, 229, 249, 264, 280, 283, 295, 300, 308, 310, 335, 336, 343, 344, 345, 350, 358), ]

#generate prime condition variable
newdata$neutral <- car::recode(newdata$neutprime, "NA = '0'")
newdata$religion <- car::recode(newdata$religprime, "NA = '0'")
which( colnames(newdata)=="neutral" )
newdata$primecond <- newdata[,25] + newdata[,26]
newdata$primecond

#Generate factors
newdata$primecondfactor <- factor(newdata$primecond, levels = c(0, 1), labels = c("D0", "D1"))
newdata$primecondfactor

#generate Table
table(newdata$argument, newdata$primecond)

#Box Plot with Multiple Groups
ggboxplot(newdata, x = "argument", y = "agree", color = "primecondfactor", palette = c("#00AFBB", "#E7B800"), na.rm=TRUE)

# 2x2 ANOVA
results1 <- aov(agree ~ argument + primecondfactor, data = newdata)
summary(results1)

#2x2 ANOVA with interactive effects
results2 <- aov(agree ~ argument * primecondfactor, data = newdata)
results2 <- aov(agree ~ argument + primecondfactor + argument:primecondfactor, data = newdata)
summary(results2)
