# one-way ANOVA is used to analyze variation between means of different samples
# its difference with independent t-test is that unlike t-test it can be used to
# analyze more than two sample groups

# for a step-by-step calculations take a look at p.122 of book
# "statistics in plain english"

library(sjstats) # for etha squred
library(Rcmdr) # for Levene's test

# we want to find out if there is a difference between hours of sleep of
# 5,8 and 10 years old kids
age <-  c(5,5,5,5,5,8,8,8,8,8,12,12,12,12,12)
sleep <- c(12,11,11,10,9,12,10,10,9,9,10,9,8,8,7)

# It's necessary to convert the independent variable
# to factor otherwise the model doesn't work
age <- as.factor(age)
data <- data.frame(age,sleep)

# creating the ANOVA model
model <- aov(data$sleep ~ data$age)

# Levene's test is used to test for the Homogenity of the variance of the samples
# H1 here is that samples have a different variance
leveneTest(data$sleep , data$age)

# summary shows if there is at least one sample that its mean significantly
# differs from others
summary(model)

# Etha squred is the effect size test for ANOVA and shows the percentage of variance 
# of dependent variable which is explanable with dependent variable
eta_sq(model)


# To find out which group(s) is different from the rest we should perform a
# post-hoc test. TukeyHSD is a simpel and widly test . other tests are:
# Tukey-Kramer --> accepts different sample size for samples
# Dunnett's test AND Games-Howell test --> accept samples with difefrent variances
TukeyHSD(model)
