#WIN BY EFFORTS

bankloan <- read.csv("C:/Users/Ujwal/Desktop/day 12 neural network/bankloan.csv")

install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)
library(caTools)
library(psych)
library(dplyr)

str(bankloan)

split <- sample.split(bankloan$default, SplitRatio = 0.8)
table(split)
split
train <- subset(bankloan, split == T)
test <- subset(bankloan, split == F)

m.rpart <- rpart(default ~ . , train)
pred <- predict(m , test, type = "vector")

m.rpart
pred

rpart.plot(m.rpart, digits =2, fallen.leaves = T, type = 3)
p.part <- predict(m.rpart, test)

p.part
summary(p.part)

cor(p.part , test$default)

install.packages("RWeka")
library(RWeka)
m.m5p <- M5P(default ~ . , train) 
m.m5p
p.m5p <- predict(prune_tr , test)
summary(m.m5p)
summary(p.m5p)

cor(p.m5p , test$default)
(p.m5p , test$default)


sqrt(sum((test$default - p.m5p)^2)/140)
#RMSE 0.38




library(tree)
model_tr <- tree(default ~ . , train)
plot(model_tr)
text(model_tr)

pred_tr <- predict(model_tr, test, type = "vector")
summary(pred_tr)

table(pred_tr , test$default)


