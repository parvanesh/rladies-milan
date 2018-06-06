library(dplyr)
library(lsr) # cohen's d
movies = read.csv('movie_rating.csv')

# all genres: 'Documentary','Short','Animation','Comedy','Romance', 'Sport','News',
# 'Drama','Fantasy','Horror','Biography','Music','War','Crime','Western','Family',
# 'Adventure','History','Sci-Fi','Action','Mystery','Thriller','Musical','Film-Noir',
# 'Game-Show','Reality-TV','Talk-Show','Adult'

# slicing the total db for each target genres
animation <- filter(movies, movies$genres %in% c('Animation'))
drama <- filter(movies, movies$genres %in% c('Drama'))
documentary <- filter(movies, movies$genres %in% c('Documentary'))

# taking a random sample
sample_number <- 20
s_animation <- animation[sample(nrow(animation), sample_number), ]
s_drama <- drama[sample(nrow(drama), sample_number), ]
s_documentary <- documentary[sample(nrow(documentary), sample_number), ]

# Calculating the t-statistics/z-score

# Let's see if our sample represents animation movies or not
anim <- s_animation$averageRating

diff <-  mean(anim) - mean(animation$averageRating,na.rm= TRUE)
std.error <- (sd(anim)/(length(anim))**0.5)
t.value <- diff/std.error
p.value <- (1- pt(t.value,df=19)) *2
p.value



# One-sample t-test
t.test(anim, mu = mean(animation$averageRating,na.rm= TRUE), alternative = "two.sided")


# t-test
t.test(s_drama$averageRating,s_animation$averageRating)
t.test(s_documentary$averageRating,s_animation$averageRating, var.equal = FALSE)

# effect size
cohensD(s_documentary$averageRating,s_animation$averageRating)
