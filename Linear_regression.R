miles <- c(9300 ,10565,15000,15000,17764,57000,65940,73676,77006,93739,146088,153260)
price <- c(7100,15500,4400,4400,5900,4600, 8800, 2000, 2750,2550,960,1025)
car <- 1:12
data <- cbind(miles, price,car)

data <- data.frame(data)
x <- data$miles
y <- data$price
plot(x,y)
abline(lm(y~x),col = 'red')
yhat <- predict(lm(y~x))
segments(x,y,x,yhat)
e <- y-yhat

#coefficiencts
lm(y~x)$coefficients

SSE <- sum(e**2)
SSTo <- sum((y-mean(y))**2)
SSR <- SSTo - SSE
rsq <- SSR/SSTo 


summary(lm(y~x))$r.squared
