#win by efforts

data('USArrests')
View(USArrests)

str(USArrests)

df <- USArrests

dim(df)
sum(is.na(df))

df <- na.omit(df)
df <- scale(df)
str(df)

View(df)
head(df,2)

install.packages(c('cluster', 'factoextra'))
library(cluster)
library(factoextra)

#sample of 15 rows
set.seed(2)
ss <- sample(1:50 , 15)
df1 <- USArrests[ss, ]
df1_scaled <- scale(df1)
head(df1_scaled)
head(df1,2)

eucledian_distance_ss <- dist(df1_scaled , method = "euclidean")
head(eucledian_distance_ss , 2)

round(as.matrix(eucledian_distance_ss)[1:3,1:3], 1)
library(ggplot2)
dev.off()
fviz_dist(eucledian_distance_ss)

fviz_nbclust(df , kmeans , method = "wss")+
geom_vline(xintercept = 4, linetype = 5, col = "red")

set.seed(33)
km.res <- kmeans(df , 4, nstart = 25)
km.res

km.res$totss
km.res

km.res$betweenss
139.5968/196

aggregate(USArrests, by = list(cluster = km.res$cluster), mean)
df_m <- cbind(USArrests, cluster = km.res$cluster)
head(df_m)
View(df_m)
write.csv(df_m, 'C:/Users/Ujwal/Desktop/USArrests_m.csv')

fviz_cluster(km.res, data = df,
             palette = c("#2E9FDF",'#00AFBB','#E7B800','#FC4E07'),
             ellipse.type = 'euclid',
             start.plot = T,
             repel = T,
             ggtheme = theme())


res.dist <- dist(df, method = "euclidean")
dd  <- hclust(d = res.dist,  method = "ward.D2")
fviz_dend(dd, k= 4, cex= 0.5,
          k_colors = c("lightblue", "lightgreen", "red", "purple"),
          color_labels_by_k = T,
          rect = T)

grp <- cutree(res.hc, k = 4)

fviz_cluster(list(data = df, cluster = grp), data = df,
             palette = c("#2E9FDF",'#00AFBB','#E7B800','#FC4E07'),
             ellipse = T,
             ellipse.type = 'convex',
             start.plot = T,
             show.clust.cent = F,
             repel = f,
             ggtheme = theme_classic())

