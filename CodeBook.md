#CodeBook  - Getting and Cleaning Data - Course Project
By David Montandon, October 2015 (non english native, sorry for english mistakes in text)

##Data Source
The data comes from an experiment of 30 people performing six activites with their Samsung Galaxy S II.

##Data Processing
This script will create a new file called tinydata.txt that will contains data merge and rearanged from differents files.
Read  [README](https://github.com/DavidMontandon/getdata033/blob/master/readme.md) file for more informations.

Script resume : Open different data sources, merge, filter and sort them and then calculate mean and standard deviation for each varaibles. 
The script produce a tiny datatable on local disk.

##Data in tinydata.txt
89 variables
180 lines
separator : " " (space)

##Load data from tinydata.txt
     dt <- read.csv("./getdata-033/tidydata.txt", sep = " ") 

##Variables
**All variables are numeric except Subject, Activity and ActivityKey** 

Subject : integer
Values : 1 to 30

Activity : Factor 
Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS

ActivityKey : integer
Values : 1 to 6

* Subject
* Activity
* ActivityKey
* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdX
* tBodyAccStdY
* tBodyAccStdZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdX
* tGravityAccStdY
* tGravityAccStdZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdX
* tBodyAccJerkStdY
* tBodyAccJerkStdZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyAccMagMean
* tBodyAccMagStd
* tGravityAccMagMean
* tGravityAccMagStd
* tBodyAccJerkMagMean
* tBodyAccJerkMagStd
* tBodyGyroMagMean
* tBodyGyroMagStd
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStd
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdX
* fBodyAccStdY
* fBodyAccStdZ
* fBodyAccMeanFreqX
* fBodyAccMeanFreqY
* fBodyAccMeanFreqZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyAccJerkMeanFreqX
* fBodyAccJerkMeanFreqY
* fBodyAccJerkMeanFreqZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyGyroMeanFreqX
* fBodyGyroMeanFreqY
* fBodyGyroMeanFreqZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyAccMagMeanFreq
* fBodyAccJerkMagMean
* fBodyAccJerkMagStd
* fBodyAccJerkMagMeanFreq
* fBodyGyroMagMean
* fBodyGyroMagStd
* fBodyGyroMagMeanFreq
* fBodyGyroJerkMagMean
* fBodyGyroJerkMagStd
* fBodyGyroJerkMagMeanFreq
* angletBodyAccMeangravity
* angletBodyAccJerkMeangravityMean
* angletBodyGyroMeangravityMean
* angletBodyGyroJerkMeangravityMean
* angleXgravityMean.angleYgravityMean
* angleZgravityMean

Document edited on https://stackedit.io/editor