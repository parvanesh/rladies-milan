w <- read.csv('Wholesale customers data.csv')
w$Channel <- factor(w$Channel)
w$Region <- factor(w$Region)
str(w)

hist(w$Milk, breaks = 30)
hist(w$Frozen, breaks = 30)
hist(w$Grocery, breaks = 30)

attach(w)


center <- function(data){
  hist(data, breaks = 30, main = NULL)
  abline(v = median(data), col='red')
  abline(v = mean(data), col='blue')
  abline(v = mode(data), col='green')
  print(sprintf('Mean: %g',mean(data)))
  print(sprintf('Median: %g',median(data)))
  print(sprintf('Mode: %g',mode(data)))
  
}
center(Fresh)


