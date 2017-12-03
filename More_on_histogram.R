#Database : Wholesale customers Data Set
#Source : https://archive.ics.uci.edu/ml/datasets/Wholesale+customers
#The data set is originated from a larger database referred on: 
#Abreu, N. (2011). Analise do perfil do cliente Recheio e desenvolvimento de um sistema promocional.
#Mestrado em Marketing, ISCTE-IUL, Lisbon 


#Loading data
w <- read.csv('Wholesale customers data.csv')

#Data Summary
str(w)

#Changing datatypes of Region and Channel
w$Channel <- factor(w$Channel)
w$Region <- factor(w$Region)

#Data Summary
str(w)

#Creating a sample of data
w_sample <- w[sample(nrow(w),50),]

#We use this library for Mode
#install.packages('DescTools')
library(DescTools)


#Creating Histogram + Mean, Median,Mode
center <- function(data){
  hist(data, breaks = 30, main = NULL)
  abline(v = median(data), col='red')
  abline(v = mean(data), col='blue')
  abline(v = mode(data), col='green')
  print(sprintf('Mean: %g',mean(data)))
  print(sprintf('Median: %g',median(data)))
  print(sprintf('Mode: %g',mode(data)))
  
}
#Skewd Distribution
center(w$Fresh)
#Normal Distribution
center(rnorm(1000))

#plotting four histograms together
attach(w)
par(mfrow = c(2,2))
center(Fresh)
center(Milk)
center(Grocery)
center(Frozen)


#What if looking just at central tendency is not enough ?
par(mfrow = c(1,1))
hist(rnorm(1000,0,1), breaks = 20,xlim = c(-7,7),ylim =c(0,300))
hist(rnorm(1000,0,1.3), breaks = 20,add = T)
hist(rnorm(1000,0,1.5), breaks = 20, add = T)

#
#
#
#
#VARIABILITY
#
#
#



#Plotting boxplot of all variales
library(reshape2)
long <- melt(w)
plot(value ~ variable, data=long)

#Combining Boxplot and Scatter Plot
#code: https://www.statmethods.net
par(fig=c(0,0.8,0,0.8), new=TRUE)
plot(Fresh, Milk, xlab="Fresh",
     ylab="Milk")
par(fig=c(0,0.8,0.55,1), new=TRUE)
boxplot(Fresh, horizontal=TRUE, axes=FALSE)
par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(Milk, axes=FALSE)
summary(w)


#Describing the dataframe
#install.packages("psych")
library(psych)
describe(w)


#Plotting a histogram + Normal Distribution
#install.packages('rcompanion')
library(rcompanion)
plotNormalHistogram(Milk)

