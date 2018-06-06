# Store the data in the variable t_data
t_data <- ToothGrowth

# cheking out our data
head(t_data)
str(t_data)

# we should convert "dose" to factor
t_data$dose <- factor(t_data$dose, 
                       levels = c(0.5, 1, 2),
                       labels = c("D0.5", "D1", "D2"))
# lets check it again
str(t_data)


# create an addtitive two-way model
res.aov2 <- aov(len ~ supp + dose, data = t_data)

# let's take a look at our results
summary(res.aov2)
