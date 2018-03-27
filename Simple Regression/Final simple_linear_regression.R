# Simple Linear Regression

# Importing the dataset
set
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
#library(caTools)
#set.seed(123)
#split = sample.split(dataset$Salary, SplitRatio = 2/3)
#training_set = subset(dataset, split == TRUE)
#test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


#Scatterplot
plot(Salary ~ YearsExperience, data=dataset)

#Correlation test
cor.test(dataset$Salary, dataset$YearsExperience)

# Fitting Simple Linear Regression to the model
regressor = lm(formula = Salary ~ YearsExperience,
               data = dataset)

#Values and coefficients
summary(regressor)

library(stargazer)
stargazer(regressor,type="text")


# Predicting the y values, y values =25,792.200 + 9,449.962(YearsExperience)
y_pred = predict(regressor, data = dataset)
y_pred

# Visualising results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$YearsExperience, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$YearsExperience, y = y_pred),
            colour = 'blue') +
  ggtitle('Salary vs Experience') +
  xlab('Years of experience') +
  ylab('Salary')

