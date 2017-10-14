# tidydata assignment

## Intro
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description of the script

The R script called run_analysis.R loads the raw data from the working directory and creates a tidy dataset.
The script uses the data.tabla package to manipulate the data.

The script merges the training and the test sets to create one data set.
For each subject it shows the activity name, the set (training or test) and the recorded measurements.
The tidy data only includes the mean and the standard deviation for each measurement. The measurements are:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The names of the measurements are also cleaned up.

## Second data set

Finally, the script creates an independent tidy data set with the average of each variable for each activity and each subject.
This data set is saved as a txt file in the working directory.




