#This is a comment, what you write here it is not going to print
#for funning any line, press ctrl+enter
getwd() # get current directory
setwd("any directory you like") # set a new working directory
dir() #getting contents in current directory
1

1+2 #1-2,1*2
3^3

#operations
sum(1,2,4,6,89)
min(1,6,9)
max(1,6,9)
sqrt(16)


# define variables 
x = 4
y = 5
x <- 3# = & <- are same , you can use both of them for assigning the variables

y <- 12
z <- x+y
z

print("Hello!")
txt <- "wow"
print(txt) # it is same as next command
txt #it is same as previous command 
?print # get help documentation for print function

y = 10 #R is case sensitive, so y & Y are different variables
Y # you will get error here
y

1:30 #create values from 1 to 30
rep(2,100) #repeat values
########################################################
#creating a single dimension vector
vec1 <- c(1:5,10, 20,30) #numeric vector
vec2 <- c(1,5,10,c(2,6,8))
length(vec2) #get length of vector
class(vec1) #get type of vector

#create foor loop
for (i in 1:5)
{
  print(i)
}

#condition
if(y>10)
{
  x=6
}


str1<-c("this","is","a","great","day") #character vector
class(str1)
length(str1)

log1 <- c(TRUE, FALSE, TRUE) # create logical vector
log1

#create named vectors
c(vegies="tomato","celery",fruits="apple","kiwi") 
ex1 <- c("tomato","celery","apple","kiwi")
names(ex1) <- c("vegies","","fruits","")
ex1[1:4] # get values of vector from first till forth index
ex1[1] #get first element from vector
ex1[c(1,4)] #get first & fourth element from vector
#create a variable from 100 to 200 
#and select the first 10
ex1 = c(1,2)
ex1[1:10] # for not avaiable indexes the value will be null

########################################################
#two dimensional arrays or matrices
mat = matrix(1:20, nrow = 5, ncol = 4)
mat
mat = matrix(1:20, nrow = 5, ncol = 4, byrow = TRUE)
mat
mat[1,] #get first row values
mat[,1] # get first column values
mat[1:2,]# get first & second row values
mat[,3:1] # get 3,2 and 1 column value

#a) create matrix with values as 1 to 100,10*10, by row & column, b) select the second column
x1 = matrix(1:100,10,10, byrow = TRUE)
x1[,2]

#data frames, which you can integrate variosu type of variables together
a<-c(1:4)
b<-rep(c(TRUE,FALSE),2)
c<-c("hello","to","the","Rladies")
myData <- data.frame(a,b,c)
dim(myData) # get dimention of data frame

rownames(myData) # get row's name
colnames(myData) # get column's name

colnames(myData)<- c("num","log","msg") # assign column's name
rownames(myData)<- c("a","b","c","d") # assign row's name
rownames(myData)
colnames(myData)
myData
dim(myData)
summary(myData)
cbind(myData,c(100,3333,222,777)) # bind other data with your data frame

#applying condition and data sub selection
myData[myData$num==4,] # get values from data fram that in the num column there is only value 4
myData[myData$log==TRUE,] # get values from data fram that in the log column there is TRUE value  

duplicated(c(c(1:5),5,6,7)) # find dulicated values in data frame
#########################################################
library(utils) #install.packages("utils")
# get data from imdb dataset, which includes around 5000 data from films in the imdb site
dataImdb = read.csv("imdb.csv", sep = ";", stringsAsFactors = TRUE) # read csv file from same directory as your code is located 
dim(dataImdb)
head(dataImdb) # get the first few rows from data frame
tail(dataImdb) # get the last rows from DF
dataImdb[1:10,] 
colnames(dataImdb)
summary(dataImdb) # some summary of data frame
str(dataImdb) # get summary of value types from data frame

dataImdb$duration[is.na(dataImdb$duration)] <- 0 # assign 0 to null values in duration column
dataImdb$budget[is.na(dataImdb$budget)] <- 0  # assign 0 to null values in budget column
dataImdb$title_year[is.na(dataImdb$title_year)] <- 0  # assign 0 to null values in year column
dataImdb <- dataImdb[!duplicated(dataImdb$movie_title),] # remove duplicated values in the data frame
dim(dataImdb) # how many values are removed from data frame

summary(dataImdb) # now take in to consideration Null values (NA) from other columns too
goodMovies = dataImdb[dataImdb$imdb_score>8,] #how many good movies are present in data frame?  (assupmtion: good movies above score 8)
dim(goodMovies)
badMovies = dataImdb[dataImdb$imdb_score<6,]#how many bad movies are present in data frame?  (assupmtion: bad movies below score 6)
dim(badMovies)

min(unique(goodMovies$title_year)) # when is the earliest year for good moviess
max(unique(goodMovies$title_year)) # when is the latest year for good moviess

goodMovies = dataImdb[dataImdb$imdb_score>8 & dataImdb$title_year>=2000,] # how many recent good movies r present in data 
dim(goodMovies)
goodMovies[1:10,]
goodMovies[order(goodMovies$imdb_score, decreasing = TRUE),][1:5,] # order the good movies and get the top recent ones 
goodMovies[order(goodMovies$imdb_score, decreasing = TRUE),][1:5,"movie_title"] # which movie are they?
dataImdb[order(dataImdb$budget, decreasing = TRUE),c("budget","movie_title","num_critic_for_reviews")][1:10,]# find the top film with highest budget
###################################################


plot(dataImdb$duration) #how duration of movie is distributed?
plot(dataImdb$title_year) # how about year?
hist(dataImdb$imdb_score) # see distribution of imdb score
mean(dataImdb$imdb_score) # get average of imdb score

library(ggplot2) # for visualization we use ggplot library, install the package by : install.packages("ggplot2")
qplot(data=dataImdb,title_year,color) # visualization within 2 variables
qplot(data=dataImdb,title_year,imdb_score, color = country) # visulization within 3 variables , can u find ur country? :)

ggplot(data=dataImdb, aes(x=title_year,y = imdb_score))+geom_point() #ggplot is giving u better visualization functionalities
qplot(dataImdb$title_year)
newData <- dataImdb[dataImdb$title_year >0,] # get just data that year is present for them
dim(newData) # dimention of data
# more neat & organized plot
ggplot(data=newData, aes(x=title_year,y = imdb_score))+geom_point()+ xlab("Year") + ylab("IMDB score") + ggtitle("Year vs score")

ggplot(data=newData, aes(x=newData$duration))+ geom_histogram() # plot distribution of movies' duration
ggplot(data=newData, aes(x=newData$duration))+ geom_histogram( binwidth = 2)

ggplot(data=newData, aes(x=newData$duration, fill = newData$color ))+ 
  geom_histogram()  + xlab("") +ggtitle("") # you can compare the color and duration of movies

ggplot(data=newData, aes(x=newData$imdb_score ))+ geom_histogram( ) # how about imdb score
ggplot(data=newData, aes(x=newData$imdb_score ))+ geom_histogram( fill = "red") # make ur plots colorful
#####################################################################
newData$scoreCat <- 0 # crate new column in ur data
plot(newData$scoreCat)
length(which(newData$imdb_score>7)) # how many high score movies do we have? assupmtion: high score movies are the one with rank higher than 7
newData[which(newData$imdb_score>=7),"scoreCat"] <- "HighRank" # label them as high rank
newData[which(newData$imdb_score<7 & newData$imdb_score>= 5 ),"scoreCat"] <- "MidRank" # label movies as medium rank which have score within 7 & 5
newData[which(newData$imdb_score<5 ),"scoreCat"] <- "LowRank" #label the rest as low ranks
table(newData$scoreCat)# how many low, medium and high rank movies do we have?
ggplot(data=newData, aes(x=newData$imdb_score ,fill = newData$scoreCat))+ geom_bar()
ggplot(data=newData, aes(x=newData$scoreCat ,fill = newData$scoreCat))+ geom_bar()


ggplot(data = newData,aes(x = newData$color)) + geom_bar() # barplots

ggplot(data = newData,aes(x = newData$language)) + geom_bar() # barplot
subData <- newData[newData$language!="English",] # movies which are not english
ggplot(data = subData,aes(x = subData$language)) + geom_bar() + 
  theme(axis.text.x = element_text(angle = 90))

ggplot(data = subData,aes(x = subData$language)) + geom_bar() +  coord_flip() # flip the plot , so u dont need any more to rotate x-axis texts
# find average number of movies for each language
ggplot(data = subData,aes(x = subData$language, fill =subData$language )) + 
  geom_bar(stat="count",aes(y  = ..count../sum(..count..))) + coord_flip()


table(dataImdb$director_name)
ggplot(dataImdb,aes(x= director_name))+geom_bar() #not so beautiful, is it?

# lets get better insight for directors
library(plyr)
dt2 = plyr::count(dataImdb, c('director_name')) #count number of movies for each director
dt2 <- as.data.frame(dt2) 
subData = dt2[order(dt2$freq, decreasing =  TRUE),][1:10,] #just give me the first 10 directors with highest number of movies
ggplot(subData, aes(x = director_name,y=freq )) + geom_bar(stat="identity") # who are they?
ggplot(subData, aes(x = reorder(director_name,-freq),y=freq )) + geom_bar(stat="identity") # ok, lets order them

dt2 <- dt2[dt2$director_name!="",] #filter empty record 
ggplot(subData, aes(x = reorder(director_name,-freq),y=freq )) + geom_bar(stat="identity") #it is better now, no?

dt2 = plyr::count(dataImdb, c('title_year','country')) # how is the proportion of movies country and year of production?
dt2 <- as.data.frame(dt2)

ggplot(dt2, aes(x =title_year,y = freq , color = country )) + geom_point()+ geom_line() # we have some movies that dont have year of production

dt2 = dt2[dt2$freq>5 & dt2$title_year>0,] # let's filter them
ggplot(dt2, aes(x =title_year,y = freq , color = country )) + geom_point()+ geom_line() # which country has more movie production, respect to other countries?

dt2 = dataImdb[order(dataImdb$num_critic_for_reviews,decreasing = TRUE),][1:5,] # which movie is having more critic reviews?how many?
ggplot(dt2,aes(x = movie_title,y = imdb_score, fill = as.factor(title_year) ))+ geom_bar(stat = "identity") + 
  geom_text(aes(label =num_critic_for_reviews )) + coord_flip()+labs(fill="Year") # labs(fill="Year"): this is going to rename the legend's title


dt2 = aggregate(dataImdb$imdb_score, list(dataImdb$director_name), mean) # so what is the average imdb score for each director?
dt2 = dt2[order(dt2$x, decreasing = TRUE),]
sub2 = dt2[1:30, ]
sub2
library(formattable)
formattable(sub2, list(x = color_bar("orange")), align = 'l') # who is having ghr highest imdb score?

dt2 <- dataImdb[dataImdb$title_year>2000,]
ggplot(dt2,aes(x= as.factor(title_year),y=imdb_score))+geom_boxplot(outlier.color = "red") #see what is the median imdb score in each year
