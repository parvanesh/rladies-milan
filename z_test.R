#install.packages('BSDA')
library(BSDA)


x <- c(7.8, 6.6, 6.5, 7.4, 7.3, 7., 6.4, 7.1, 6.7, 7.6, 6.8)
y <- c(4.5, 5.4, 6.1, 6.1, 5.4, 5., 4.1, 5.5)
z.test(x, sigma.x=0.9, y, sigma.y=0.5)

a <- c(65, 78, 88, 55, 48, 95, 66, 57, 79, 81)
mean(a)

z.test(x=a, sigma.x = sqrt(18),mu=75)


(mean(a) - 75)/sqrt(1.8)
