#decision tree

travel <- read.csv("C:/Users/Ujwal/Desktop/New folder/train_and_test2.csv")
View(travel)
names(travel)
travel <- travel[-c(6:12 , 14:21, 23:24 , 26:27)]

str(travel)
unique(travel$X2urvived)
unique(travel$Sex)

travel$X2urvived <- factor(travel$X2urvived)
travel$Sex <- factor(travel$Sex)

library(ISLR)
library(tree)
tree_travel <- tree(X2urvived ~ . , travel)
summary(tree_travel)

plot(tree_travel)
text(tree_travel, preety = 0)
tree_travel

NROW(travel)

set.seed(3)
train_travel <- sample(1 : NROW(travel) , 1100) 
test_travel <- travel[-train_travel, ]

NROW(train_travel)

traveltree_train <- tree(X2urvived ~ ., travel, subset = train_travel)
tree_pred <- predict(traveltree_train , test_travel , type = "class" )
summary(traveltree_train)

table(tree_pred , travel$X2urvived)
(907+291)/11 #79.38

#pruning of tree for better result
# cv = cross validation
set.seed(3)
cv.travel <- cv.tree(traveltree_train , FUN = prune.misclass)
cv.travel
names(cv.travel)
par(mfrow = c(1,2))
plot(cv.travel$size , cv.travel$dev ,
     col = "blue",
     type = 'b', lwd = 2)
plot(cv.travel$k , cv.travel$dev ,
     type = 'b', lwd = 2,
     col = "red")


#pruning of tree 

prune_travel <- prune.misclass(traveltree_train , best = 6)
plot(prune_travel)
text(prune_travel , preety = 0)

#prediction of tree
tree_pred1 <- predict(prune_travel, test_travel, type = "class")
table(tree_pred1 , travel$X2urvived)
(907+231)/11 #1.0
# after pruning the effeciency of data depreciated

