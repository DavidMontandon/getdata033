#README - Getting and Cleaning Data - Course Project
By David Montandon, October 2015 (non english native, sorry for english mistakes in text)

##Assignment instruction
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

##Files
*README.md* : this current file
*[CodeBook.md](https://github.com/DavidMontandon/getdata033/blob/master/CodeBook.md)* : description of the variables and transformations process
*[run_analysis.R](https://github.com/DavidMontandon/getdata033/blob/master/run_analysis.R)* : source code of the assignment)
*[tinydata.txt](https://github.com/DavidMontandon/getdata033/blob/master/tinydata.txt)* : sample of data (date 25.10.2015)

##Process of run_analysis.R
Here is the details of each step performed in the run_analysis.R file.
**Downloading orignal data file from Internet**
	In case data are not on the disk, the script will download the zip from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and copy it in your download folder. Files inside the zip will be extracted inside a folder called "getdata-033". 
**Loading packages**
It will requires "plyr", "dplyr" and "reshape2" package in other to run
**1. Merges the training and the test sets to create one data set.**
 - Load training activity data from file "y_train.txt" and change column title to "ActivityKey"
 - Load training data from file "X_train.txt"  
 - Load training subject data from file "subject_train.txt"  and change column title to "Subject"
 - Merge  training subject, training activities and training data
 - Load tests activity data from file "y_test.txt" and change column title to "ActivityKey"
 - Load tests data from file "X_test.txt"  
 - Load tests subject data from file "subject_test.txt"  and change column title to "Subject"
 - Merge  tests subject, test activities and tests data 
 -  Merge test data and training data
 - Read features data
 - Load features data from file "features.txt" and change column title to "FeatureKey" and "Feature"
 - Add activites labels **3. Uses descriptive activity names to name the activities in the data set**
 - Name columns bases on "Features" **4. Appropriately labels the data set with descriptive variable names.** 
**2. Extracts only the measurements on the mean and standard deviation for each measurement.** 
- Subset the merged data to column represented by "mean" and "std"
- Search for each variable name by ignoring it's formatting case (Mean=mean) for both "mean" and "std"
**5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**
- Remove unwanted characters from columns names
- Standardize Mean and Std columns names
- Rename "Bodybody" into "Body"
- Sort data by "Subject" and "Activity"
- Calculate mean of each numerical column
- Write data frame into a file text called tidydata.txt in the folder "getdata-033"

Document edited on https://stackedit.io/editor