#win by efforts

path <- "C:/Users/manish/Desktop/SMOTE"
setwd(path)  #for using the path directory

install.packages("ROSE")
library(ROSE)

data(hacide)
str(hacide.train)

table(hacide.train$cls)

#check class distribution
prop.table(table(hacide.train$cls))
#this shows that the dataset is very imbalance showing 0.2 positive and .98 negetive

library(rpart)
tree_imb <- rpart(cls ~ . , data = hacide.train)
pred_tree_imb <- predict(tree_imb, newdata = hacide.test)

#checking the accuracy of the model
accuracy.meas(hacide.test$cls , pred_tree_imb[ ,2])

#checking the final accuracy before building the model
roc.curve(hacide.test$cls , pred_tree_imb[ ,2] , plotit = F)

#sampling the data for improving the prediction accuracy by using over and undersampling
data_balance_over <- ovun.sample(cls ~ . , data = hacide.train , method = "over", N = 1960)$data
table(data_balance_over$cls)

data_balance_under <- ovun.sample(cls ~ . , data = hacide.train , method = "under", N = 40, seed = 1)$data
table(data_balance_under$cls)

data_balanced_both <- ovun.sample(cls ~ ., data = hacide.train, method = "both", p=0.5, N=1000, seed = 1)$data
table(data_balanced_both$cls)


data.rose <- ROSE(cls ~ ., data = hacide.train, seed = 1)$data
table(data.rose$cls)


#build decision tree models
tree.rose <- rpart(cls ~ ., data = data.rose)
tree.over <- rpart(cls ~ ., data = data_balance_over)
tree.under <- rpart(cls ~ ., data = data_balance_under)
tree.both <- rpart(cls ~ ., data = data_balanced_both)

#make predictions on unseen data
pred.tree.rose <- predict(tree.rose, newdata = hacide.test)
pred.tree.over <- predict(tree.over, newdata = hacide.test)
pred.tree.under <- predict(tree.under, newdata = hacide.test)
pred.tree.both <- predict(tree.both, newdata = hacide.test)


#ROSE
roc.curve(hacide.test$cls, pred.tree.rose[,2])

#oversampling
roc.curve(hacide.test$cls, pred.tree.over[,2])

#Undersampling
roc.curve(hacide.test$cls, pred.tree.under[,2])

#Both
roc.curve(hacide.test$cls, pred.tree.both[,2])
