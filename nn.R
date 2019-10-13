#win by efforts

wbcd <- read.csv("C:/Users/Ujwal/Desktop/day 11/wbcd.csv")
dim(wbcd)
str(wbcd)

wbcd <- wbcd[-1]
dim(wbcd)
str(wbcd)

table(wbcd$diagnosis)
barplot(table(wbcd$diagnosis),
        col = c("lightblue", "lightgreen"),
        main = "Barplot of diagnosis")

text(barplot(table(wbcd$diagnosis),
             col = c("lightblue", "lightgreen"),
             main = "Barplot of diagnosis"), 0,
              table(wbcd$diagnosis), cex = 2, pos = 3)

wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c('B','M'),
                       labels = c('Benign','Malignant'))
table(wbcd$diagnosis)

text(barplot(table(wbcd$diagnosis), col = c("lightblue", "green"),
     main = "barplot of Diagnosis"), 0 ,
     table(wbcd$diagnosis), cex = 2, pos = 3)

round(prop.table(table(wbcd$diagnosis))*100, digits = 2)

normalize <- function(x){
  return((x-min(x))/(max(x)-min(x)))
  }
normalize(c(1,2,3,4,5))
normalize(c(10,20,30,40,50))

wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))
str(wbcd_l)
str(wbcd)
wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]

wbcd_train_lables <- wbcd[1:469, 1]
wbcd_test_lables <- wbcd[470:569, 1]


str(wbcd_train)
str(wbcd_train_lables)

#install.packages("class")
library(class)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_lables, k = 21)

summary(wbcd_test_pred)

#install.packages("gmodels")
library(gmodels)

CrossTable(x =wbcd_test_lables, y = wbcd_test_pred,
            prop.chisq = T)


install.packages("sjPlot")
library(sjPlot)
sjc.elbow(wbcd[-1])
str(wbcd)

aa <- sjc.cluster(wbcd,groupcount = 2, method = c("hclust", "kmeans"))

barplot(table(aa))
