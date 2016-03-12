#Code Book for run_analysis
*Code developed by:* **Obadowski**

This file presents all the information about the output datasets.
The data used in this job was available in this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The complete description of all data is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This job was get only the columns with the mean and standard deviations for each measurement. After that, it was necessary to produce a tidy dataset with the mean for each subject and each Activity. The description about the codes are available in the [ReadMe.md](https://github.com/Obadowski/GetCleanProject/blob/master/README.md) file.

In order to ease the job of, the variables with names starting by "t" are related to measurements done in time domain, and the variables starting by "f" are related to measurements done in frequency domain. The data was acquire at constant rate of 50 Hz.

Both datasets, *tidy_table* and *Averages*, present all the columns listed below:
Subject

Activity 

tBodyAcc-mean()-X

tBodyAcc-mean()-Y 

tBodyAcc-mean()-Z

tBodyAcc-std()-X

tBodyAcc-std()-Y

tBodyAcc-std()-Z

tGravityAcc-mean()-X

tGravityAcc-mean()-Y

tGravityAcc-mean()-Z

tGravityAcc-std()-X

tGravityAcc-std()-Y

tGravityAcc-std()-Z

tBodyAccJerk-mean()-X

tBodyAccJerk-mean()-Y

tBodyAccJerk-mean()-Z

tBodyAccJerk-std()-X

tBodyAccJerk-std()-Y

tBodyAccJerk-std()-Z

tBodyGyro-mean()-X

tBodyGyro-mean()-Y

tBodyGyro-mean()-Z

tBodyGyro-std()-X

tBodyGyro-std()-Y

tBodyGyro-std()-Z

tBodyGyroJerk-mean()-X

tBodyGyroJerk-mean()-Y

tBodyGyroJerk-mean()-Z

tBodyGyroJerk-std()-X

tBodyGyroJerk-std()-Y

tBodyGyroJerk-std()-Z

tBodyAccMag-mean()

tBodyAccMag-std()

tGravityAccMag-mean()

tGravityAccMag-std()

tBodyAccJerkMag-mean()

tBodyAccJerkMag-std()

tBodyGyroMag-mean()

tBodyGyroMag-std()

tBodyGyroJerkMag-mean()

tBodyGyroJerkMag-std()

fBodyAcc-mean()-X

fBodyAcc-mean()-Y

fBodyAcc-mean()-Z

fBodyAcc-std()-X

fBodyAcc-std()-Y

fBodyAcc-std()-Z

fBodyAcc-meanFreq()-X

fBodyAcc-meanFreq()-Y

fBodyAcc-meanFreq()-Z

fBodyAccJerk-mean()-X

fBodyAccJerk-mean()-Y

fBodyAccJerk-mean()-Z

fBodyAccJerk-std()-X

fBodyAccJerk-std()-Y

fBodyAccJerk-std()-Z

fBodyAccJerk-meanFreq()-X

fBodyAccJerk-meanFreq()-Y

fBodyAccJerk-meanFreq()-Z

fBodyGyro-mean()-X

fBodyGyro-mean()-Y

fBodyGyro-mean()-Z

fBodyGyro-std()-X

fBodyGyro-std()-Y

fBodyGyro-std()-Z

fBodyGyro-meanFreq()-X

fBodyGyro-meanFreq()-Y

fBodyGyro-meanFreq()-Z

fBodyAccMag-mean()

fBodyAccMag-std()

fBodyAccMag-meanFreq()

fBodyBodyAccJerkMag-mean()

fBodyBodyAccJerkMag-std()

fBodyBodyAccJerkMag-meanFreq()

fBodyBodyGyroMag-mean()

fBodyBodyGyroMag-std()

fBodyBodyGyroMag-meanFreq()

fBodyBodyGyroJerkMag-mean()

fBodyBodyGyroJerkMag-std()

fBodyBodyGyroJerkMag-meanFreq()

angle(tBodyAccMean,gravity)

angle(tBodyAccJerkMean),gravityMean)

angle(tBodyGyroMean,gravityMean)

angle(tBodyGyroJerkMean,gravityMean)

angle(X,gravityMean)

angle(Y,gravityMean)

angle(Z,gravityMean)


The only difference between two files is, as explained above, is:
the first one present the original measurement and the second one is the mean for each Subject and each Activity. That way it is possible to group by the variables and perform more accurate analysis.



