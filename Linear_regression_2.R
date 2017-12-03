#Dataset is from Superdatascience.com
getwd()
setwd('/Users/Navid/Documents/R_files/ML_course/Simple_Linear_Regression/')
data <- read.csv('Salary_Data.csv')

#Splitting the data into test and training sets
library(caTools)

split <- sample.split(data$Salary, SplitRatio =  3/4)

training_set <- subset(data, split == T)
test_set <- subset(data, split == F)

#Creattig a linear regressor
regressor <- lm(formula = Salary~YearsExperience,
                data = training_set)

#Using regressor to predict testset Salary
y_pred <- predict(regressor,newdata = test_set)


#Visualizing the predictions

library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = 'black') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)),
            color = 'blue') +
  ggtitle('Experinece Vs. Salary (Training Set)')+
  xlab('Years of Experience')+
  ylab('Salary')

#plotting the abline, note that we don't need to predict the points again using testset,
#our regressor is based on training set, we just use test set to see the error
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = 'black') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)),
            color = 'blue') +
  ggtitle('Experinece Vs. Salary (Test Set)')+
  xlab('Years of Experience')+
  ylab('Salary')

#R squared
summary(regressor)$r.squared
#R squared = correlation**2
cor(training_set$Salary,training_set$YearsExperience)**2
