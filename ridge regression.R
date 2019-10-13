#ridge regression

x1 <- rnorm(20)
x2 <- rnorm(20, mean=x1, sd=0.01)
cor(x1,x2)
y <- rnorm(20, mean=3+x1+x2, sd = 0.2)

# Try OLS
lm(y~x1+x2)$coef

#Now try Ridge Regression
library(MASS)
lm_seq = seq(0,1,.001)
fit = lm.ridge(y~x1+x2,lambda=lm_seq)
select(fit)

lm.ridge(y~x1+x2,lambda=0.1)
