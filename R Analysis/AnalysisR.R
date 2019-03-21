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

library(psych)

library(ggplot2) #Graphics
library(dplyr)

#View Data frame
data

#Check the structure
str(data)

#Delete non-prime participants
newdata <- data[-c(26, 48, 40, 95, 174, 187, 189, 212, 28, 35, 46, 50, 54, 55, 56, 58, 66, 71, 73, 78, 85, 92, 96, 99, 117, 121, 124, 134, 136, 137, 139, 140, 147, 150, 155, 159, 163, 172, 177, 178, 202, 207, 215, 228, 229, 249, 264, 280, 283, 295, 300, 308, 310, 335, 336, 343, 344, 345, 350, 358), ]

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

#Interaction Plot from data - There is no interaction
ggline(newdata, x = "primecondfactor", y = "agree", color = "argumentfactor",
       add = c("mean_se", "dotplot"),
       palette = c("#00AFBB", "#E7B800"))

# 2x2 ANOVA
#Results1 - labels 2x2 ANOVA without interactive effects
results1 <- aov(agree ~ primecondfactor + argumentfactor, data = newdata)
summary(results1)

#2x2 ANOVA with interactive effects
#Results2 shows the interactive effects between the factors
results2 <- aov(agree ~ primecondfactor * argumentfactor, data = newdata)
results2 <- aov(agree ~ primecondfactor + argumentfactor + primecondfactor:argumentfactor, data = newdata)
summary(results2)
library(lsr)
etaSquared(results2)

#Results 2 without factor - These are the same results
results2t <- aov(agree ~ primecond * argument, data = newdata)
results2t <- aov(agree ~ primecond + argument + primecond:argument, data = newdata)
summary(results2t)

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

#Comupte Cell means
groups <- group_by(newdata, primecondfactor, argumentfactor)
plot.data <- summarise(groups,
                       mean = mean(agree, na.rm=TRUE),
                       sd = sd(agree, na.rm=TRUE),
                       n = n(),
                       se=sd/sqrt(n),
                       ci = qt(0.975,df=n-1)*se)

plot.data 

#Make bar graph
ggplot(plot.data, aes(x=primecondfactor, y=mean, fill = argumentfactor )) +
  geom_bar(stat="identity", position=position_dodge()) +
  geom_errorbar(aes(ymin=mean-ci, ymax=mean+ci), width=.2, position=position_dodge(.9)) +
  ggtitle("Agreement by Prime Condition and Argument") +
  xlab("Prime Condition") +
  ylab("Level of Agreement") + theme_bw()+
  theme(text = element_text(size = 18, colour="black"),
        axis.title = element_text(size = 20, colour="black"),
        title = element_text(size = 24, colour="black"),
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_manual("Argument", values = c("Liberal" = "blue", "Conservative" = "red"))


#################################################
#Compute Summary Statistics
#The grup_by function allows for grouping of statistics by their factor ategories, or other groupsings as designated before the summarise command.
require("dplyr")

#Cell statistics for the grouping of prime condition and argument
group_by(newdata, argumentfactor, primecondfactor) %>%
  summarise(
    count = n(),
    mean = mean(agree, na.rm = TRUE),
    sd = sd(agree, na.rm = TRUE)
  )
#Alternatively, we can group means this way
#"rep" represents the n for the cell.
model.tables(results2, type="means", se = TRUE)

####################################
#Analysis of Poltential Biases

#Political party affiliation
describe(newdata$partyid)
table(newdata$partyid)
group_by(newdata, argumentfactor, primecondfactor, partyid) %>%
  summarise(
    count = n(),
    mean = mean(agree, na.rm = TRUE),
    sd = sd(agree, na.rm = TRUE)
  )
table(newdata$argumentfactor, newdata$partyid, newdata$primecondfactor)


# Religiosity in group - via question "I consider myself a religious person"
describe(newdata$religious)
table(newdata$religious)
group_by(newdata, argumentfactor, primecondfactor, religious) %>%
  summarise(
    count = n(),
    mean = mean(agree, na.rm = TRUE),
    sd = sd(agree, na.rm = TRUE)
  )
table(newdata$argumentfactor, newdata$religious, newdata$primecondfactor)

#Look at other demographic variables

#Age
table(newdata$age)
hist(newdata$age)
#Cumulative frequency of age
agegroup = newdata$age 
breaks = seq(19, 68, by=1) 
age.cut = cut(agegroup, breaks, right=FALSE) 
age.freq = table(age.cut)
age.cumfreq = cumsum(age.freq)
cbind(age.cumfreq)

#Gender
table(newdata$gender)
