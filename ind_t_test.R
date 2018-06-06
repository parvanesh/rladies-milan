# Data source http://www.sthda.com

# Suppose we collected data for women and men weights
women_weight <- c(38.9, 61.2, 73.3, 21.8, 63.4, 64.6, 48.4, 48.8, 48.5,82)
men_weight <- c(67.8, 60, 63.4, 76, 89.4, 73.3, 67.3, 61.3, 62.4,53) 

# let's look at the data we have
hist(women_weight, main = 'Women weights')
mean(women_weight)
hist(men_weight, main = 'Men weights')
mean(men_weight)

# Can we just say that they are different and that's it?! Well...No! 
t.test(women_weight, men_weight)
