# Random Forest Regression

# Setting working directory
setwd("/Users/Sonya/Downloads/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 9 - Random Forest Regression")

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[,2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(0)
# split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting the Random Forest Regression to the dataset
# install.packages('randomForest')
library(randomForest)
set.seed(5678)
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary,
                         ntree = 10)

# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualising the Random Forest Regression results
# install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            color = 'blue') + 
  ggtitle('Truth or Bluff (Random Forest Regression)') + 
  xlab('Level') + 
  ylab('Salary')

# Visualising the Random Forest Regression results (for higher resolution and smoother curve)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') + 
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue') + 
  ggtitle('Truth or Bluff (Random Forest Regression)') + 
  xlab('Level') + 
  ylab('Salary')
