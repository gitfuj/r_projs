

#PCA on our familiar data set
bodyfat <- read.csv("C:/Users/Ujwal/Desktop/bodyfat-reduced.csv")

model = lm(BodyFat~., data = bodyfat)
summary(model)
#removing the response variable 
bodyfatX = bodyfat[,-1]

# Perform Principal Component Analysis
bodyfatX.pca <- prcomp(bodyfatX, center = TRUE, scale = TRUE) 

plot(bodyfatX.pca, type="l")  #scree plot
summary(bodyfatX.pca)  #gives the data from the scree plot

# Here is the rotation matrix:
print(bodyfatX.pca$rotation)

#checking the correlation between the variable after principal component analysis
cor(bodyfatX.pca$x)

#correlation between previous and the new principal components
cor(cbind(bodyfat[,-1],data.frame(bodyfatX.pca$x)))


#new dataset with bodyfat and the principal components in the rest of the columns
bodyfat.pca = cbind(bodyfat[,1],data.frame(bodyfatX.pca$x))
colnames(bodyfat.pca)[1] <- "BodyFat"


#the correlation of bodyfat to each principal component
cor(bodyfat.pca)[,1]

# regration model
bodyfat.pcr1 <- lm(BodyFat ~., data = bodyfat.pca)
summary(bodyfat.pcr1)


betas1 = bodyfatX.pca$rotation %*% bodyfat.pcr1$coefficients[-1]
betas1

# deleting non-significant components
bodyfat.pcr2 <- lm(BodyFat ~ PC1+PC2+PC4+PC5, data = bodyfat.pca)
summary(bodyfat.pcr2)

# Compare the two models
anova(bodyfat.pcr1,bodyfat.pcr2)

# Find the best subset model
library(leaps)
leaps<-regsubsets(BodyFat~., data=bodyfat.pca, method = "exhaustive")
library(car)
subsets(leaps, statistic="bic", ylim=c(-305,-280))

# How can we get the model coefficients in terms of our original variables?

fullmodelcoef = bodyfat.pcr1$coefficients[-1]
fullmodelcoef["PC3"] = 0
fullmodelcoef["PC6"] = 0
betas2 = bodyfatX.pca$rotation %*% fullmodelcoef
betas2


# Alternately, we can use pcr in the pls package
# install.packages("pls")
library(pls)

pcr_model <- pcr(BodyFat~., data = bodyfat, scale = TRUE)
validationplot(pcr_model)
validationplot(pcr_model, val.type = "R2")
predplot(pcr_model)
coefplot(pcr_model)


# compare the results of the two different approaches for PCR:

# % variance explained

summary(pcr_model)
summary(bodyfatX.pca)

# The model coefficients for the original variables
pcr_model$coefficients
betas1  # we calculated these above

# This is the rotation matrix (also called laodings)
pcr_model$loadings
bodyfatX.pca$rotation

# use this to get the "scores", i.e., the rotated design matrix
pcr_model$scores
bodyfatX.pca$x

# coefficients of the model using the Principal Components
pcr_model$Yloadings
bodyfat.pcr1$coefficients