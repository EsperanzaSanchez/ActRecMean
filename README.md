==================================================================
#Human Activity Recognition Mean
by: Esperanza Sanchez
Course Project
Getting and Cleaning Data
Johns Hopkins. BSofH - Coursera
January - 2015


Human Activity Recognition Mean  results of transform raw data (Smartphones Dataset Version 1.0).

The process prepared a R version 3.1.2 (2014-10-31) dataframe with the average on the mean and standard deviation for each measurement measurabled for each physical activity and each subject or volunteer in the  “Human Activity Recognition Using Smartphones” experiment and exports it to a flat file.

Also reports a CodeBook with the Data Dictionary and Study Design.

  
For each record it is provided:
======================================

- Activity name of activities performed in the experiment ((WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- An identifier of the subject who carried out the experiment.
- 79 Subset of variables  with the average on the mean and standard deviation for each initial measurement (time and frequency domain variables obtained of sensor signals (accelerometer and gyroscope)) 

The dataset includes the following files:
=========================================

- 'README.md':  Describes this project in more detail and  add some documentation such as how the scripts work.

- 'ActivityRecognitionMean.txt': Flat file, shows the average of each variable for each activity and each subject on  the mean and standard deviation for each initial measurement. 

- CodBook.md : Describes the results in terms of data variables: Data Dictionary  and shows the sources of raw data.

-  run_analysis.R:  File with the code  of the R function that  prepares a R version 3.1.2 (2014-10-31) dataframe with the average of each variable measurabled for each physical activity and each subject or volunteer in the 
  “Human Activity Recognition Using Smartphones” experiment ( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and exports it to a flat file.


- CodeBook.R: File with the code of the R function that  writes a CodeBook.md file for the  Activity Recognition Mean.

Description of the scripts:
=========================================

- run_analysis.R: Works in this order:

1. Reads relevant raw  data sets:

'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
'X_train.txt': Training set.
'y_train.txt': Training labels.
'X_test.txt': Test set.
'y_test.txt': Test labels.

In the cases of test and train data, reads the files with feature´s list as appropriate variable names.

2. Merges the training and the test sets to create one data frame.

3. Uses the descriptive activity names given in 'activity_labels.txt' to name the activities.

4. Extracts the measurements on the mean and standard deviation for each measurement.

5. labels columns with descriptive variable names leaving  the feature´s names as
measurement descriptive variables names.

6.  Creates a data frame with the average of each variable for each activity and each subject or volunteer:

changes the form of data frame for multi calculus facility  and averages all variables and puts them  into columns using reshape2 package functionality
   
7. Exports the average data frame to a flat file: 'ActivityRecognitionMean.txt'

- CodeBook.R
: Order

1. Reads 'ActivityRecognitionMean.txt' into a R data frame.

2. Writes titles 

3. Writes Activity_Name and Subject_Id features

4. Writes Mean Variables features Min an Max

5. Writes Study Design references



=========================================

For additional information about the experiment visit: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).