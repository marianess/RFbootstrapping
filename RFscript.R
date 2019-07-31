# Using bootstrap to find the accuracy
a=c()
i=5
for (i in 3:15) {
    
    train <- sample(nrow(RFdata), 0.3*nrow(RFdata), replace = FALSE)
    TrainSet <- RFdata[train,]
    ValidSet <- RFdata[-train,]
    
    model3 <- randomForest(TrainSet$cluster ~ ., data = TrainSet[,1:31], ntree = 500, mtry = 13, importance = TRUE)
    predValid <- predict(model3, ValidSet, type = "class")
    a[i-2] = mean(predValid == ValidSet$cluster)
}

# Using For loop to identify the right mtry for model
a=c()
i=5
for (i in 3:15) {
    model3 <- randomForest(TrainSet$cluster ~ ., data = TrainSet[,1:31], ntree = 500, mtry = i, importance = TRUE)
    predValid <- predict(model3, ValidSet, type = "class")
    a[i-2] = mean(predValid == ValidSet$cluster)
}


plot(3:15,a)