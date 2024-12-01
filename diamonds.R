# Prices of over 50,000 round cut diamonds
# data: R diamonds
require(dplyr)
require(ggplot2)
require(caTools)

# - Exploratory
dim(diamonds)
head(diamonds)
str(diamonds)

diamonds %>% filter(cut=="Premium" & price>5000) -> premium_price
diamonds %>% filter(x > 4) -> diamonds_length

ggplot(data = diamonds, aes(x=price)) + 
  geom_histogram()
  
# linear regression
sample.split(diamonds$price, SplitRatio = 0.75) -> split_tag
subset(diamonds, split_tag==TRUE) -> train
subset(diamonds, split_tag==FALSE) -> test

lm(price~carat, data = train) -> linear_model1
summary(linear_model1)

predict(linear_model1, newdata = test) -> my_result
cbind(Actual=test$price, Predicted=my_result) -> final_data

as.data.frame(final_data) -> final_data
error <- final_data$Actual - final_data$Predicted 
final_data <- cbind(final_data, error)

# large error ~1220
rmse1 <- sqrt(mean((final_data$error)**2))
cat("root mean square error: ", rmse1)

# linear regression - multiple variables

linear_model2 <- lm(price ~ x+y+z, data = train)
summary(linear_model2)
my_result2 <- predict(linear_model2, newdata = test)
cbind(Actual=test$price, Predicted=my_result2) -> final_data2

as.data.frame(final_data2) -> final_data2
error2 <- final_data2$Actual - final_data2$Predicted 
final_data2 <- cbind(final_data2, error2)

# large error 1560
rmse2 <- sqrt(mean((final_data2$error2)**2))
cat("root mean square error: ", rmse2)
