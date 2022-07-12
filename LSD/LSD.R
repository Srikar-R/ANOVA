#Introduction: 

#ANOVA is a statistical test used to determine whether or not there is a significant
#difference between the means of treatments.The analysis of variance is the systematic algebraic procedure of decomposing (i.e.
#partitioning) overall variation.If we find there is significant difference, we conduct a post-hoc test to check where the difference occurs.
#post hoc analysis consists of statistical analyses that were specified after the data were seen.

#When the experimental material is divided into rows and columns and the treatments are llocated such that each treatment occurs only once in a row and once in a column, the design
#is known as Latin Square Design (LSD).Latin square designs allow for two blocking factors. In other words, these designs are used to simultaneously control (or eliminate) two sources of nuisance variability.


#Objective:

#i) To check whether the different fertilizers yeild the same amount of crops
#ii) To ckech whether the different tillage methods yeild the same amount of crops
#iii) To check whether the different kind of seeds yeild the same amount ofcrops

#Data Description 

#The dataset contains the productivity of 5 seeds grown using the different types of Fertilizers used (Fertilizer 1,2,3,4 and 5)
#and the the different types of tilliage methods which is the treatment on the seed. The different types of tilliage methods are 
#(A,B,C,D and E).Here tilliage method is the treatment used on the seeds.The different types of seeds that are sowed are Seed (A,B,C,D and E).The frequency shows the number of crops that
#are grown using the combinations of different types of seeds, fertilizers and tilliage methods.The frequency is measured in cwt/year.
#(1 CWT{hundredweight} = 100pounds ). The data totally contains 25 observations.

#Data Summary

library(readxl)
data<- read_excel("C:/Users/Srikar/Desktop/SS/R/Sem 5/Design of Exp/Practical 8/dataset.xlsx")
head(data,6)

summary(data)

#The 4 variables are treatment, fertilizer,seed and frequency.#We observe that the range of production is from 41 to 57 cwt/year.
#All variables are character types except frequency which is of integer type. 

#Hypothesis Statement:

#1)Statement with respect to fertilizer

#Null Hypothesis (H 0 ): There is no significant difference in the growth by different fertilizers (i.e. ?? F = ?? M = ?? B )

#Alternative Hypothesis (H 1 ): At least two fertlizers have significant difference.(i.e. ??i ?? ??j)


#2)Statement with respect to tillage

#Null Hypothesis (H 0 ): There is no significant difference in the growth by different tilliage methods (i.e. ?? F = ?? M = ?? B )

#Alternative Hypothesis (H 1 ): At least two tilliage methods  have significant difference.(i.e. ??i ?? ??j)

#Keeping the significance level as 5% or 0.05

#Procedure:

#1)Constructing the ANOVA model

mod=lm(data$freq~data$fertilizer+data$treatment+data$seed)
aov=anova(mod)
aov

#We observe that there is a significant difference between the different types of treatment which is the tilliage method
#as the p-value is below 0.05 significance level. This means that different tilliage methods yeild to differnt amounts of 
#crops grown


#Similarly we find that the seeds sown are also significantly different.The different seeds sown yeild to different amount of crops grown.
#Thus we reject the null-hypothesis for treatment and seed. There is no difference in the fertilizers used as the p-value shows
#no significance as its above 0.05. The different fertilizers have the same effect on the number of crops grown.

#2) Performing our post-hoc test

#We perform post=hoc test as we find there is a significant difference in treamtmen (tilliage methods) and seeds sown

library(lsmeans)

x=lsmeans(mod,"treatment")
pairs(x)

#We observe that there is a difference between treatment A and treatment C.We can say that on an average, C yeilds more than A.
#There is also a difference between treatment C and treatment E.We can say that on an average C yeilds more crps than E

y=lsmeans(mod,"seed")
pairs(y)

#We observe that Seed A and seed B differ amongst each other.Seed A and Seed D are significantly different. Seed B and 
#seed C are significantly different from each other.Seed B and Seed C are significantly different from each other and lastly
#Seed B and Seed E are significantly different from each other as their p-values are below 0.05. 


#Conclusion:

#1) All fertilizers have the same effect on crops
#2) Tillage method A and C differ where C is better than A on an average. Tillaige method C is better than method E. Hence,
#There is a significant difference between the methods

#3)The different types of seeds yeild different amount of crops. We find that on an average A yeilds the least and Seed B and 
#D yeild the most.