# CodeBook

## Data

The included run_analysis.R script uses the Human Activity Recognition Using Smartphones Dataset Version 1.0 to generate a new dataset consisting of the average of all mean and standard deviation measurements for each subject and activity. The Human Activity Recognition Using Smartphones Dataset Version 1.0 is available here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables

The Subject variable specifies the subject numbered 1 to 30.

The Activity variable specifies the activity, one of "Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", or "Laying".

The other features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables included for these signals are:

* mean(): Mean value
* std(): Standard deviation

The names of these variables have been modified from the original dataset to make them more readable.

## Transformations

1. Combine rows of subject data from the train and test datasets
2. Combine rows of activity data from the train and test datasets
3. Changed activity data to be displayed with the descriptive names corresponding to the numbers in the original
4. Combine rows of measurement data from the train and test datasets
5. Combine columns from subject, activity, and measurement data and use features data for column names
6. Filter to retain only the subject and activity data and data corresponding to the mean and standard deviation for measurements
7. Search and replace strings in column names to make them more readable and clear
8. Aggregate the dataset by subject and activity and calculate the mean for each measurement column in the aggregate dataset
