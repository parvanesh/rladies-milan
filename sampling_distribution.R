library(dplyr)

# loading the imdb database
movies = read.csv('movie_rating.csv')

# slicing the total db for animation
animation <- filter(movies, movies$genres %in% c('Animation'))

# defining sample size and number of repeatations
sample_size <- 2000
rep_num <- 5000

# creating an empth vector
sample_means <- rep(NA, rep_num)

# a loop for taking a sample and saving its mean
for (i in 1:rep_num) {
    my_sample <- sample(animation$averageRating, sample_size)
    sample_means[i] <- mean(my_sample)
}

# visualizing
hist(sample_means, main = 'Sampling Distribution')
abline(v = mean(animation$averageRating) , col = 'red')

