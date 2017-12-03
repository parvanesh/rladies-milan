#Our simple example
x <-sample(10:30, 10, replace = T)
x <- append(x,63)
dev.off()
boxplot(x,horizontal = T, range = 1.5, outline = T)
median(x)
mean(x)




#Loading Some real data
day <- read.csv('day.csv')

dev.off()
str(day)

boxplot(day$casual, horizontal = T, range = 0)
boxplot(day$casual, horizontal = T, range = 1.5)



#Plotting boxplot of all variales
dev.off()
library(reshape2)
long <- melt(w)
plot(value ~ variable, data=long, notch = T)



#Combining Boxplot and Scatter Plot
#code: https://www.statmethods.net
dev.off()
par(fig=c(0,0.8,0,0.8), new=TRUE)
plot(Fresh, Milk, xlab="Fresh",
     ylab="Milk")
par(fig=c(0,0.8,0.55,1), new=TRUE)
boxplot(Fresh, horizontal=TRUE, axes=FALSE)
par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(Milk, axes=FALSE)







