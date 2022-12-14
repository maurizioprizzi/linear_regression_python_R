# This file was created in RStudio
# import the data
dataset = read.csv("Salary_Data.csv")

# we need to install the caTools at this point
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

y_pred = predict(regressor, newdata = test_set)

# install.packages("ggplot2")
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), colour = "red") +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = "blue") + 
  ggtitle("Salary vs Experience (Training Set)") + 
  xlab("Years of Experience") + 
  ylab("Salary")

