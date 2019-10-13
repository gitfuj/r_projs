#WIN BY EFFORTS

bankloan <- read.csv("C:/Users/Ujwal/Desktop/day 12 neural network/bankloan.csv")

install.packages("pROC")
library(pROC)

str(bankloan)

library(caTools)
set.seed(12)

#split dataset for training and validation
split <- sample.split(bankloan, SplitRatio = 0.7)
train <- subset(bankloan, split == T)
validation <- subset(bankloan, split == F)

dim(train)
dim(validation)

#from validation dataset we will create valid_data and valid_test
split2 <- sample.split(validation, SplitRatio = 0.5)
valid_data <- subset(validation, split == T)
test_data <- subset(validation, split == F)

dim(valid_data)
dim(test_data)

#LOGISTIC REGRESSION MODEL

model <- glm(default ~ age + income + creddebt + othdebt, train , family = binomial)
model
summary(model)

library(ROCR)
pred_training <- predict(model , train , type = "response")
table(train$default, pred_training >= 0.5)

pred_test <- predict(model , test_data  , type = "response")
table(test_data$default, pred_test >= 0.5)

x <- as.data.frame()
pred <- prediction(pred_training, train$default)
ROCRperf <- performance(pred, "tpr", "fpr")

par(mfrow = c(1,1))

install.packages("plotrix")
library(plotrix)
plot(ROCRperf , colorize = T, 
     print.cutoofs.at = seq(0,1, by = 0.1))
draw.circle(x=0, y=1, radius = 0.42)


detach(package:neuralnet)

#AREA UNDER CURVE
install.packages("verification")
library(verification)
auc(train$default, pred_training)
#area under curve is 0.772

library(neuralnet)
creditnet <- neuralnet(default ~ age+ income+ creddebt + othdebt , train , hidden = 1,
                       lifesign = "minimal", linear.output = F, threshold = 0.1)
plot(creditnet)
creditnet
test_data
temp_test <- subset(test_data,
                    select = c("age", "income", "creddebt","othdebt"))

creditnet.result <- compute(creditnet, temp_test)
results <- data.frame(actual = test_data$default,
                      prediction =creditnet.result$net.result )

results[100:115, ]
results$prediction <- round(results$prediction)
table(results$actual, results$prediction)

head(results$prediction,3)
pred_nn <- prediction(results$prediction, test_data$default)

rocpref <- performance(pred_nn, "tpr", "fpr")
plot(rocpref, colorize = T, 
     print.cutoofs.at = seq(0,1,by = 0.1))
auc(pred_nn)
