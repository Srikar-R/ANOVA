#Introduction: 

#ANOVA is a statistical test used to determine whether or not there is a significant
#difference between the means of treatments.The analysis of variance is the systematic algebraic procedure of decomposing (i.e.
#partitioning) overall variation.If we find there is significant difference, we conduct a post-hoc test to check where the difference occurs.
#post hoc analysis consists of statistical analyses that were specified after the data were seen.

#Factorial Experiment- Factorial experiments involve simultaneously more than one factor and each factor is at two or more
#levels. Several factors affect simultaneously the characteristic under study in factorial experiments and
#the experimenter is interested in the main effects and the interaction effects among different factors. 

#Aim: To find out wheether there is significant difference in the 3 factors

#Data Description:

#The datset contains the information about the different types of ingridients used to bake a cake. The three ingridient are flour,shorterning and 
#eggs. Each factor contains two levels. Every level is denoted by 0 and 1 i.e. F1 is one level and the other is F0.This goes for every factor
#There are totaly 9 observations that were recorded. The repsonse varible is mean tasting which is rated from 0 to 7 where 0 is the wrost 
#possible test and 7 is the best taste.

#Data Source:https://www.itl.nist.gov/div898/software/dataplot/data/BOXCAKE2.DAT

library(readxl)

data <- read_excel("C:/Users/Srikar/Desktop/SS/R/Sem 5/Design of Exp/Practical 12/dataset.xlsx")

head(data)

#Hypothesis Statement

#Factor 1:

#H0: There is no significant effect of Flour on the cake
#H1: There is a significant effect of Flour on the cake

#Factor 2:

#H0: There is no significant effect of shortening on the cake
#H1: There is a significant effect of shortening on the cake

#Factor 3:

#H0: There is no significant effect of egg on the cake
#H1: There is a significant effect of egg on the cake

#Interaction:

#H0: There is no significant effect of interaction of flour,eggs and shortening on the cake
#H1: There is a significant effect of interaction of flour,eggs and shortening on the cake

#Procedure:

#1) Constructing the ANOVA model:

model=aov(data$MeanTaste~data$FLOUR+data$SHORT+data$EGGS+data$SHORT*data$FLOUR++data$EGGS*data$FLOUR+data$EGGS*data$SHORT+data$EGGS*data$SHORT+data$FLOUR,data=data)
summary(model)

#We observve that the interactio between flour and short is significant on the cake rating as its p-value is below 0.05.Flour and and short are 
#not significant