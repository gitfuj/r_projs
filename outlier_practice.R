#win by efforts

#creating random samples

a <- c(sample(60:100,20), 12,23,134,120)
a

str(a)


boxplot(a,
        col = "lightgreen")
par(mfrow= c(1,1))

l <- quantile(a,0.25)
l
lb <- quantile(a,0.25) - 1.5 * IQR(a)
lb

u <- quantile(a,0.75)
u
ub <- quantile(a,0.75) + 1.5 * IQR(a)
ub

p <- a[a > lb & a < ub]
p

str(p)
boxplot(p,
        col = "lightblue")

q <- c(sample(60:100,20), 12,15,145,154)
q

lb1 <- quantile(q,0.25) - 1.5 * IQR(q)
lb1
ub1 <- quantile(q,0.75) + 1.5 * IQR(q)
ub1
rm_lu <- q[q > lb1 & q < ub1]
rm_lu

boxplot(p,rm_lu)
str(q)







