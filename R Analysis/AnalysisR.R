#Religion and Public Opinion
#Author: Jennifer Lin
#Use the CSV cleaned under the "UnstringData.do" file from Stata under the "Analysis DO Files/" folder in the git repository.
#Git repository for project: https://github.com/lin-jennifer/ReligiousPrimes.git
#Analyzed using RStudio on Mac OSX 10.14.3

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
newdata$primecond <- newdata[,23] + newdata[,24]
newdata$primecond

#Generate factors
# 0 = Neutral condtion, 1 = religious condition
newdata$primecondfactor <- factor(newdata$primecond, levels = c(0, 1), labels = c("Neutral", "Religious"))
newdata$primecondfactor
# 0 = Liberal stance, 1 = Conservative stance
newdata$argumentfactor <- factor(newdata$argument, levels = c(0, 1), labels = c("Liberal", "Conservative"))
newdata$argumentfactor

#Check types of data for each variable - either string, integer, numeric, factor etc.
str(newdata)

#generate Table
table(newdata$argument, newdata$primecond)
table(newdata$argumentfactor, newdata$primecondfactor)
table(newdata$argumentfactor, newdata$agree, newdata$primecondfactor)

##Summarize data
tapply(newdata$agree, newdata$primecondfactor, mean, na.rm = TRUE)
tapply(newdata$agree, newdata$argumentfactor, mean, na.rm = TRUE)

#Box Plot with Multiple Groups
ggboxplot(newdata, x = "primecondfactor", y = "agree", color = "argumentfactor", palette = c("#00AFBB", "#E7B800"), na.rm=TRUE)

# 2x2 ANOVA
#Results1 - labels 2x2 ANOVA without interactive effects
results1 <- aov(agree ~ primecondfactor + argumentfactor, data = newdata)
summary(results1)

#2x2 ANOVA with interactive effects
#Results2 shows the interactive effects between the factors
results2 <- aov(agree ~ primecondfactor * argumentfactor, data = newdata)
results2 <- aov(agree ~ primecondfactor + argumentfactor + primecondfactor:argumentfactor, data = newdata)
summary(results2)

#Interaction Plots
interaction.plot(x.factor     = newdata$primecondfactor,
                 trace.factor = newdata$argumentfactor, 
                 response     = newdata$agree, 
                 trace.label = deparse(substitute(Argument)),
                 mean.rm.na <- function(x) mean(x,na.rm=T),
                 type="b",
                 col=c("black","red"),  ### Colors for levels of trace var.
                 pch=c(19, 17),             ### Symbols for levels of trace var.
                 fixed=TRUE,                    ### Order by factor order in data
                 xpd = NULL, leg.bg = par("bg"),leg.bty = "o",ylim = range(1:7),
                 xlab="Prime Condition",ylab="Level of Agreement", main="Interaction Plot",
                 xtick = FALSE, xaxt = par("xaxt"), axes = TRUE)