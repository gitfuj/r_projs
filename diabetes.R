#win by efforts

diabetes <- read.csv("C:/Users/Ujwal/Desktop/datasets/diabetes2.csv")

sum(is.na(diabetes))

str(diabetes)

par(mfrow = c(1,2))
hist(diabetes$Pregnancies , col= heat.colors(10))
boxplot(diabetes$Pregnancies, col = "red")

hist(diabetes$Glucose , col= heat.colors(10))
boxplot(diabetes$Glucose, col = "red")

hist(diabetes$BloodPressure , col= heat.colors(10))
boxplot(diabetes$BloodPressure, col = "red")

hist(diabetes$SkinThickness , col= heat.colors(10))
boxplot(diabetes$SkinThickness, col = "red")

hist(diabetes$Insulin , col= heat.colors(10))
boxplot(diabetes$Insulin, col = "red")

hist(diabetes$BMI , col= heat.colors(10))
boxplot(diabetes$BMI, col = "red")

hist(diabetes$DiabetesPedigreeFunction , col= heat.colors(10))
boxplot(diabetes$DiabetesPedigreeFunction, col = "red")

hist(diabetes$Age , col= heat.colors(10))
boxplot(diabetes$Age, col = "red")

unique(diabetes$Outcome)
par(mfrow = c(1,1))

barplot(table(diabetes$Outcome), col = c("lightblue", "lightyellow"))

library(psych)
library(corrplot)
library(dplyr)        

pairs.panels(diabetes)
ma <- as.matrix(diabetes)
heatmap(ma)

#model
normalize <- function(x){
              return((x-min(x))/(max(x)- min(x)))
}
diabetes_norm <- as.data.frame(lapply(diabetes, normalize))
str(diabetes_norm)

NROW(diabetes_norm)
diabetes_train <- diabetes_norm[1:650, ]
diabetes_test <- diabetes_norm[651:768, ]

library(neuralnet)
set.seed(123)
diabetes_model <- neuralnet(Outcome ~ . -Outcome, data= diabetes_train, hidden = 1)
plot(diabetes_model)

model_result <- compute(diabetes_model, diabetes_test[1:8])
str(model_result)
predict_Outcome <- model_result$net.result
NROW(predict_Outcome)
round(cor(predict_Outcome, diabetes_test$Outcome),2)


