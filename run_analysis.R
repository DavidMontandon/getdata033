# ***************************************************************************
# Getting and Cleaning Data Course Project
# getdata-033
#
# 21 October 2015
# by David MONTANDON
#
# This script will produce tidy data set by merging "train" and "test" file of Samsung data and returning only the
# measurements of the mean and the standard deviation. 
#
# Output : file "./getdata-033/tidydata.txt"
#
# Please read README file and CodeBook file in the repo for more informations
## ***************************************************************************



#GET THE DATA FROM THE PEER ASSESSMENTS GETDATA-033 
if (!file.exists("./getdata-033")) {
  dir.create("./getdata-033")
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  tmp <- tempfile()
  download.file(URL, tmp, method = "curl")
  unzip(tmp, exdir = "./getdata-033")
} else {
  print("Data already on disk")    
} 

#REQUIREMENTS
if("plyr" %in% rownames(installed.packages()) == FALSE) {install.packages("plyr")}
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}
if("reshape2" %in% rownames(installed.packages()) == FALSE) {install.packages("reshape2")}
packages <- c("plyr", "dplyr","reshape2") #used package
sapply(packages, require, character.only=TRUE, quietly=TRUE)
setInternet2(TRUE) #Fixing security problem for downloading

###
# PREPARE ACTIVITY DATA
###


#Y_TRAIN - LOAD TRAINING ACTIVITY FILE AND SET COLUMN LABEL
train_activities <- read.table("./getdata-033/UCI HAR Dataset/train/y_train.txt", sep="")
names(train_activities) <- "ActivityKey"

#X_TRAIN - LOAD TRAINING DATA 
train_data <- read.table("./getdata-033/UCI HAR Dataset/train/X_train.txt", sep = "",  stringsAsFactors = FALSE)

#SUBJECT_TRAIN - LOAD TRAINING SUBJECT AND SET COLUMN 
subject_train <- read.table("./getdata-033/UCI HAR Dataset/train/subject_train.txt", sep = "",  stringsAsFactors = FALSE)
names(subject_train) <- "Subject"

#MERGE DATA SUBJECT ACTIVITY AND DATA INTO TRAIN
train <- cbind(subject_train, train_activities, train_data)

rm(subject_train) #No longer used, free memory usage
rm(train_activities) #No longer used, free memory usage
rm(train_data) #No longer used, free memory usage


###
# PREPARE TEST DATA
###

#Y_TEST - LOAD TEST ACTIVITY AND SET COLUMN 
test_activities <- read.table("./getdata-033/UCI HAR Dataset/test/y_test.txt", sep="",  stringsAsFactors = FALSE)
names(test_activities) <- "ActivityKey"

#X_TEXT - LOAD TEST DATA
test_data <- read.table("./getdata-033/UCI HAR Dataset/test/X_test.txt", sep = "",  stringsAsFactors = FALSE)

#X_TEXT - LOAD TEST SUBJECT AND SET COLUMN
subject_test <- read.table("./getdata-033/UCI HAR Dataset/test/subject_test.txt", sep = "",  stringsAsFactors = FALSE)
names(subject_test) <- "Subject"   

#MERGE TEST DATA INTO TEST
test <- cbind(subject_test, test_activities, test_data)

rm(subject_test) #No longer used, free memory usage
rm(test_activities) #No longer used, free memory usage
rm(test_data) #No longer used, free memory usage

#MERGE TEST DATA AND TRAIN DATA INTO MERGED
merged_data <- rbind(train, test)

rm(test) #No longer used, free memory usage
rm(train) #No longer used, free memory usage

#ACTIVITY_LABELS - LOAD ACTIVITY FILE AND SET COLUMN LABEL
activity_labels <- read.table("./getdata-033/UCI HAR Dataset/activity_labels.txt",  stringsAsFactors = FALSE)
names(activity_labels) <- c("ActivityKey", "Activity")

#ADD ACTIVITY LABEL
merged_data <- left_join(activity_labels, merged_data, by = "ActivityKey")

#FEATURES - LOAD FEATURES FILE AND SET COLUMN LABEL
features <- read.table("./getdata-033/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
names(features) <- c("FeatureKey", "Feature")

#RENAME COLUMN NAMES
names(merged_data) <- c(names(activity_labels), "Subject", features$Feature)

#MERGE COLUMNS ACTIVITY SUBJECT MEAN AND STD
merged_data <- merged_data[,grepl("Activity|Subject|[Mm]ean|[Ss]td",names(merged_data))]

#REMOVE UNWANTED CHARACTER FROM COLUMN LABEL
names(merged_data) <- gsub("\\(|\\)|-|,", "", names(merged_data))

#REPLACE COLUMN NAMES TO MATCH WHAT EVER CASE
names(merged_data) <- gsub("mean", "Mean", names(merged_data))
names(merged_data) <- gsub("std", "Std", names(merged_data))

#RENAME BODYBODY INTO BODY
names(merged_data) <- gsub("BodyBody", "Body", names(merged_data))

#SORT DATA BY SUBJECT AND THEN ACTIVITY
merged_data <- arrange(merged_data, Subject, Activity)

#MELT DATA
merged_data_melt <- melt(merged_data, id.vars=c("Subject","Activity"), variable.name = "Measurement", value.name = "Value")

rm(merged_data) #No longer used, free memory usage

#CALCULATE MEAN
merged_data_summary <- dcast(merged_data_melt, Subject + Activity~Measurement, mean, value.var = "Value")

rm(merged_data_melt) #No longer used, free memory usage

#WRITE TIDYDATA
write.table(merged_data_summary, "./getdata-033/tidydata.txt", row.names = FALSE)
print("File ./getdata-033/tidydata.txt created !")
