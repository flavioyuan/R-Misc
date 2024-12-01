if(!require(ggplot2)) {install.packages("ggplot2")}
if(!require(ggpubr)){install.packages("ggpubr")}
if(!require(Hmisc)){install.packages("Hmisc")}
if(!require(corrplot)){install.packages("corrplot")}
if(!require(PerformanceAnalytics)){install.packages("PerformanceAnalytics")}
if(!require(tidyverse)) {install.packages("tidyverse")}

npontos = 100

set.seed(123)
x <- seq(npontos)
y <- 5*x + rnorm(npontos, mean=10, sd=5)

plot(x,y)
abline(a=0, b=5)

cor.test(y,x)

data <- data.frame(x, y)

model <- lm(y~x, data=data)
summary(model)

plot(data$x, data$y, main="Linear Regression with Gaussian noise", xlab="x", 
     ylab="y", pch=10)
abline(model, col="red")