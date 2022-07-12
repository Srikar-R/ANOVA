#Introduction: 

#ANOVA is a statistical test used to determine whether or not there is a significant
#difference between the means of treatments.The analysis of variance is the systematic algebraic procedure of decomposing (i.e.
#partitioning) overall variation.If we find there is significant difference, we conduct a post-hoc test to check where the difference occurs.
#post hoc analysis consists of statistical analyses that were specified after the data were seen.

#Randomized Complete Block Design (RCBD) is the most common design of experiments in many disciplines, including agriculture, engineering, medical, etc. In addition to the
#experimental error reducing ability, the design widens the generalization of the study findings.
#The repeated application of the treatments under investigation is known as replication.If the treatment is applied only once we have no means of
#knowing about the variations in the results of a treatments. Only when we repeat the application of the treatment several times,
#we can estimate the experimental error.

#Objective:

##Data Description:
#The data set contains information on 20 people who undertook one of four diets (referred to as diet A, B,C and D). 
#The aim of the study was to see which diet was best for losing weight. The variable 'Method' describes the various dieting methods
#and WeightL shows how much weight the participants had lost in pounds. Replications shows the repeated application of the methods.

#Data Summary:

library(readxl)
data<- read_excel("C:/Users/Srikar/Desktop/SS/R/Sem 5/Design of Exp/Practical 6/dataset.xlsx")
head(data,6)

summary(data)

#We observe that the range of values are from 17kgs to 95kgs which are the minimum and maximum values.

dim(data)

#There are 20 observations with 3 variables : Method, replications and weight 
names(data)

#Hypothesis Statement:

#Null Hypothesis (H 0 ): There is no significant difference in the different die methods (i.e. ?? F = ?? M = ?? B )

#Alternative Hypothesis (H 1 ): At least two diet methods have significant difference.(i.e. ??i ?? ??j)

#We keep the significance level as 5% or 0.05

#Procedure

#1)Plotting boxplot
A.box=boxplot(data$WeightL~ data$Method, xlab = "Diet Type",ylab = "Weight loss", col = c("red", "light blue", "light green"),
        main="Types of weightloss methods and the weight lost")

Table.A <- A.box$stats
colnames(Table.A)<-A.box$names
rownames(Table.A)<-c('min','lower quartile','median','upper quartile','max')
Table.A

#The above boxplot represents the above table.The minimum weight lost using any of the methods was found in mehtod C.There is only one outlier in 
#found in method C.The maximum weight loss was found in Method B.The median weight loss was highest in method B.

#2) Constructing the anova model

model=aov(data$WeightL~data$Method+data$Replications, data = data)
summary(model)

#We observe that the weight loss methods and the replications are not significant as their p-value is more than 0.05. Hence we 
#reject the null hypothesis.There is no significant difference in the different weight loss methods.


#Conclusion:

#All the weight loss methods lead to same amount of weight loss.

