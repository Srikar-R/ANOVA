#Objective: 

#1) To check the significance of the factor,"method"  on the dataset 'Diet'

#Important Terminologies:

#1)One-Way analysis- one-way analysis of variance is a technique that 
#can be used to compare whether two samples means are significantly different or not.

#2)Post-Hoc test- ANOVA results do not identify which particular differences between pairs of means are significant. Use post hoc tests 
#to explore differences between multiple group means while controlling the experiment-wise error rate.

#Data Description:
#The data set contains information on 76 people who undertook one of three diets (referred to as diet A, B,C and D). 
#The aim of the study was to see which diet was best for losing weight. The variable 'Method' describes the various dieting methods
#and WeightL shows how much weight the participants had lost in pounds


library(readxl)
data <- read_excel("C:/Users/Srikar/Desktop/Study stuff/R/Sem 5/Design of Exp/Practical 2/dataset.xlsx")

head(data)



#Hypothesis Testing


#Null Hypothesis (H 0 ): There is no significant difference in the different diets (i.e. ?? F = ?? M = ?? B )

#Alternative Hypothesis (H 1 ): At least two diets have significant difference.(i.e. ??i ?? ??j)


#Procedure

#1)Plotting boxplot


boxplot(data$WeightL~ data$Method, xlab = "Diet Type", 
        ylab = "Weight loss", col = c("red", "light blue", "light green"))


#2)Computation of Test Statistic and ANOVA table:

model = aov(data$WeightL ~ data$Method)
summary(model)


#3)Pairwise Comparison of Means:


library(multcompView)

exp_tukey = TukeyHSD(model <- aov(data$WeightL ~ data$Method, data = data) )
extract_p(exp_tukey)


#Analysis

#1) The Pr(>F) value obtained for the data is 0.153. The alpha-value is equal to 0.05. As the Pr(>F) value is greater than the alpha-value, we may accept the null hypothesis (H0) and reject 
#the alternative hypothesis (H1). Thus, we can say that the mean weight of the different diets are same

#2) All of them are not significant as we observe the values of the pariwise comparison test as well

#Conclusion:

#There is no significance between the different diets followed and all have yeilded the same amount of weight loss

