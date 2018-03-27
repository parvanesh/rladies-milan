##############################
########Cross-Sectional ######
#########  Analysis  #########
##############################


rm(list=ls())


##############################
####### First Question #######
##############################

#reading data set 18

MyDataSet = read.csv('Dataset_WorkersSurvey.csv')
MyDataSet

#remove the column X

MyDataSet$X<-NULL
head(MyDataSet)
str(MyDataSet)

#all variable names

colnames(MyDataSet)

#correlation between variables
#correlartion coefficient has to be between -1 and 1.

(mcor <- cor(MyDataSet))
write.csv(mcor,"q1.csv")
install.packages("corrplot")
library(corrplot)
corrplot(mcor, type="upper", order="hclust", tl.col="black", tl.srt=45)


##############################
####### Second Question #######
##############################

############# creating regression ################# 
myolsMyData1 <- lm(wage_h ~ school, data=MyDataSet)
myolsMyData1
summary(myolsMyData1)
library(stargazer)
stargazer(myolsMyData1,type="text")
############# correlation between schooling and wage #################

cor.test(MyDataSet$wage_h, MyDataSet$school)

#p-value is < 2.2e-16 
#P-value is lower than 0.05. For this reason, it is statistically significant.

#plot(MyDataSet$school, MyDataSet$wage_h) the model

plot(MyDataSet$school,MyDataSet$wage_h, ylab='hourly wage', xlab='Schooling')
abline(myolsMyData2, col="red")
##############################
####### Third Question #######
##############################

myolsMyData1 <- lm(wage_h ~ school, data=MyDataSet)
myolsMyData1

betaHat <- myolsMyData1$coefficients

#y_pred = 4.074 + 0.617*school

y_pred = predict(myolsMyData1, data = MyDataSet)

y_pred <- betaHat["(Intercept)"]+ betaHat["school"]*8
y_pred
y_pred <- betaHat["(Intercept)"]+ betaHat["school"]*18
y_pred

##############################
####### Fourth Question #######
##############################

newols <- lm (logwage_h ~ male + married + school + school_father + school_mother + experience + d_north + d_centre + d_partime + d_agri + d_indu + d_pa, data=MyDataSet )
summary(newols)
library(stargazer)
stargazer(newols, type="text")

#Eliminating some variables 
newols2 <- lm (logwage_h ~ male + school + married + experience + d_north + d_agri + d_pa, data=MyDataSet )
summary(newols2)
library(stargazer)
stargazer(newols2, type="text")



##############################
####### Fifth Question #######
##############################

wage0<-(MyDataSet$logwage_h)
school<-(MyDataSet$school)
d_north<-(MyDataSet$d_north)
d_south<-(MyDataSet$d_south)
school_d_north<-(school*d_north)
school_d_south<-(school*d_south)

anovam <- lm(wage0 ~ school_d_north+school_d_south-1)
summary(anovam)
stargazer(anovam,type="text",title="Anova Model", out="anovacim")

library(car)
fiti <- linearHypothesis(anovam, "school_d_north=school_d_south")
linearHypothesis(anovam, "school_d_north-school_d_south=0")

stargazer(fiti,type="text",title="RLS", out="anovacim")

#With the R matrix of restrictions
R <- matrix(c(1,-1), nrow=1, ncol=2)
r <- 0
betah <- matrix(coef(anovam), nrow=2, ncol=1)
X <- cbind(school_d_south, school_d_north)

F_test1 <- t(R%*%betah-r)%*%solve(R%*%solve(crossprod(X))%*%t(R))%*%(R%*%betah-r)
F_test2 <- crossprod(anovam$residuals)
F_test <- (F_test1/1)/(F_test2/anovam$df.residual)
print(F_test)

#By hand with RSS
restr <- school_d_north+school_d_south
restrictedModel <- lm(wage0 ~ restr-1)
RSS_R <- crossprod(restrictedModel$residuals)
RSS_U <- crossprod(anovam$residuals)
F_test <- ((RSS_R - RSS_U)/1)/(RSS_U/anovam$df.residual)
print(F_test)

##############################
####### Sixth Question #######
##############################




##Analyze the completemodel of point. 4 test for the endogeneity of schooling using school father
##and school mother as instruments via CF (control function) approach.
##the first-stage regression and on the validity and weakness of the instruments. 
##estimate the model with IV or TSLS. 



##complete model
ols3<-lm(logwage_h~ male +married+school+experience+d_north+d_south+d_partime+d_agri+d_indu+d_pa , data=MyDataSet)
summary(ols3)
residual<-resid(ols3)
residual

#first stage
fstage <-lm (school~male +married+school+school_mother+school_father+experience+d_north+d_south+d_partime+d_agri+d_indu+d_pa , data=MyDataSet)
summary(fstage)
residualfirsts<-resid(fstage)
residualfirsts
#second stage

sstage <-lm(logwage_h~male +married+school+experience+d_north+d_south+d_partime+d_agri+d_indu+d_pa +residualfirsts , data=MyDataSet)
summary(sstage)
stargazer(sstage, type = "text")
#for instrument to be valid instrument must to be exogeneous so cov between in insturments and residual = 0

validity_checking<-cov(MyDataSet$school_mother,residual)
validity_checking

validity_checking2<-cov(MyDataSet$school_father,residual)
validity_checking2
##the instrument is not valid 




summary(fstage)
#f statistic equal to 244 so its bigger than 10 it means the insturment is not weak 


### estimation for IV ###


#use school_father  instrument and find coefficient(betahat IV)

coefiv <- with(MyDataSet, cov(logwage_h,school_father)/cov(school,school_father))

coefiv

coefiv <- with(MyDataSet, cov(logwage_h,school_mother)/cov(school,school_mother))
coefiv

library(AER)

reg.iv <- ivreg(logwage_h ~ school+experience| school_father+school_mother, data=MyDataSet)
reg.iv



# using IV regression in the case with endageneous case. 
# OLS is not consistent.

noteOLS<-lm(logwage_h~ school + experience,data=MyDataSet)
summary(noteOLS)

library(stargazer)
stargazer(reg.iv, noteOLS, type="text")
#comparision of result thru stargazer 

### estimation for 2SLS ###

#stage1

fstage2sls <- lm(school ~ experience+school_father+school_mother, data=MyDataSet)
fstage2sls

reg.2SLS <- lm(logwage_h ~ fitted(fstage2sls)+experience, data=MyDataSet)
summary(reg.2SLS) 


stargazer(noteOLS, reg.iv ,reg.2SLS, type="text")

#find cov between isntruments and school and our result must be different from  0

rele_checking1<-cov(MyDataSet$school_mother,MyDataSet$school)
rele_checking1  # cov=5.965442

rele_checking2<-cov(MyDataSet$school_father,MyDataSet$school)
rele_checking2 # cov=7.354234



