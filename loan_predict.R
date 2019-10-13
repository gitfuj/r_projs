#WIN BY EFFORTS

bankloan <- read.csv("C:/Users/Ujwal/Desktop/day 12 neural network/bankloan.csv")

dim(bankloan)
str(bankloan)
library(neuralnet)
loan_train <- bankloan[1:600, ]
loan_test <- bankloan[601:700, ]

linear <- lm(creddebt ~ . -creddebt, loan_train)
summary(linear)

pred_reg <- predict(linear, loan_test)
pred_reg

plot(loan_test$creddebt, pred_reg, lwd = 1,
     col = c("red"),
     main = "Linear Regression : Predicted vs Actual")

#NEURAL NETWORK
loan <- neuralnet(creddebt ~ . -creddebt,loan_train
                  , hidden = 1,
                  lifesign = "minimal")

loan#synaptic weights
summary(loan)
plot(loan)

prediction <- compute(loan, loan_test[ ,c(1:6,8:9)])
loan_test$predicted <- prediction$net.result
loan_test$diff <- (loan_test$predicted - loan_test$creddebt) ^ 2
rmse <- sqrt(sum(loan_test$diff)/NROW(loan_test))
print(rmse)

plot(loan_test$predicted~loan_test$creddebt, 
     col= "blue", lwd = 1, 
     main = "NN : Predicted vs Actual")

par(mfrow = c(1,2))
