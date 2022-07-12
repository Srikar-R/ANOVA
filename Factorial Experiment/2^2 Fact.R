#Introduction: 

#ANOVA is a statistical test used to determine whether or not there is a significant
#difference between the means of treatments.The analysis of variance is the systematic algebraic procedure of decomposing (i.e.
#partitioning) overall variation.If we find there is significant difference, we conduct a post-hoc test to check where the difference occurs.
#post hoc analysis consists of statistical analyses that were specified after the data were seen.

#Factorial Experiment- Factorial experiments involve simultaneously more than one factor and each factor is at two or more
#levels. Several factors affect simultaneously the characteristic under study in factorial experiments and
#the experimenter is interested in the main effects and the interaction effects among different factors. 

#Aim: To find out wheether there is significant difference in the 2 factors

#Data Description

library(readxl)

data <- read_excel("C:/Users/Srikar/Desktop/SS/R/Sem 5/Design of Exp/Practical 11/dataset.xlsx")

head(data)

#The following dataset contains two factors Phosphate and super sulphate. Phosphate contains two levels P0 and P1 and similarly Super su;phate 
#consists of S0 and S1. There are totally 16 observations.

#Hypothesis Statement

#Factor 1:

#H0: There is no significant effect of Factor 1 on crop yield.
#H1: There is a significant effect of Factor 1 on crop yield.

#Factor 2:

#H0: There is no significant effect of Factor 2 on crop yield.
#H1: There is a significant effect of Factor 2 on crop yield.

#Interaction:
 
#H0: There is no significant effect of interaction of Factor 1 and Factor 2 on crop yield.
#H1: There is a significant effect of interaction of Factor 1 and Factor 2 on crop yield.

#Procedure:

#1) Constructing the ANOVA model:

model=aov(data$Yeild~data$Fact1+data$Fact2+data$Fact1*data$Fact2,data=data)
summary(model)

#We reject the null hypothesis  for() Fact 1 since the p-value is above 0.05 (significance level).This means that there is no siginificatn effect on the yeild of crop.
#Similarly there is no effect by the interaction of the two factors but we find that there is a significant difference on the effect of Fact 2 

