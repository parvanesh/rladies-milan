mypar(1,1)

#Variance 
k <- rnorm(100)
plot(k,rep(0,100))
abline(v = mean(k), col = 'red')
var(k)



#Covariance
x <- runif(100, 0, 100)
y <- 5*x + rnorm(100, 0, 30)

plot(x,y)
abline(lm(y~x),col = 'red')
segments(x, y, x, predict(lm(y~x)))

cov(x,y)


#Correlation
cor.test(x,y, method = 'pearson')

library(rafalib)
mypar(3,1)

norm_1 = rnorm(50,0,1)
plot(norm_1,rep(0,50), xlim = range(-10,10), main = 'sd = 1')
abline(v=mean(norm_1),col = 'red')

norm_2 = rnorm(50,0,2)
plot(norm_2,rep(0,50), xlim = range(-10,10), main = 'sd = 2')
abline(v=mean(norm_2),col = 'red')

norm_3 = rnorm(50,0,3)
plot(norm_3,rep(0,50), xlim = range(-10,10), main = 'sd = 3')
abline(v=mean(norm_3),col = 'red')


