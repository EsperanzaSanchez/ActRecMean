run_analysis <- function() {
  
  ## This process prepares a R version 3.1.2 (2014-10-31) dataframe with the
  ## average of each variable measurabled for each physical activity
  ## and each subject or volunteer in the 
  ## “Human Activity Recognition Using Smartphones” experiment
  ##( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
  ## and exports it to a flat file.

library(reshape2)

## 1. Reads relevant data sets:
##  'features.txt': List of all features.
##  'activity_labels.txt': Links the class labels with their activity name.
##  'X_train.txt': Training set.
##  'y_train.txt': Training labels.
##  'X_test.txt': Test set.
##  'y_test.txt': Test labels.
##  In the cases of test and train data, reads the files with feature´s list as 
##  appropriate variable names.

features<- read.table("features.txt")
test <- read.table("X_test.txt",col.names=features$V2)
train <- read.table("X_train.txt",col.name=features$V2)
tlab <- read.table("y_test.txt")   
trlab <- read.table("y_train.txt")
act <- read.table("activity_labels.txt")
tsub <- read.table("subject_test.txt")
trsub <- read.table("subject_train.txt")

## 2. Merges the training and the test sets to create one data frame.
mat1 <- cbind(tlab,tsub, test)
mat2 <- cbind(trlab,trsub, train)
unique <- rbind(mat1,mat2)

## 3. Uses the descriptive activity names given in 'activity_labels.txt´ 
## to name the activities
tlab <- as.character(apply(tlab,1,function(x){return(act$V2[act$V1 == x])}))
trlab <- as.character(apply(trlab,1,function(x){return(act$V2[act$V1 == x])}))
unique[1:2947,1] <- tlab
unique[2948:10299,1] <- trlab

## 4. Extracts the measurements on the mean and standard deviation for each measurement.

cols1<- grep("mean",colnames(unique))
cols2<- grep("std",colnames(unique))
unique <- cbind(unique[1:2], unique[cols1],unique[cols2])

## 5. labels columns with descriptive variable names leaving  the feature´s names as
## measurement descriptive variables names.

colnames(unique)[1] <- "Activity_Name" 
colnames(unique)[2] <- "Subject_ID"

## 6.  Creates a data frame with the average of each variable for 
## each activity and each subject or volunteer.

  ## changes the form of data frame for multi calculus facility
   temp <- melt(unique,id=c("Activity_Name","Subject_ID")) 
  ## averages all variables and puts them  into columns 
   mean_table<- dcast(temp,Activity_Name+Subject_ID ~ variable, mean) 

## 7. Exports the average data frame to a flat file.
write.table(mean_table,file="ActivityRecognitionMean.txt",row.names = F,col.names=T)
}