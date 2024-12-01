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
cat("root mean square error: ", sqrt(mean((final_data$error)**2)) )
