#### Getting and Cleaning Data Course Project
library(dplyr)

#### download and uzip 
fileName <- "UCIdata.zip"
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI HAR Dataset"

#### DL Check
if(!file.exists(fileName)){
      download.file(url,fileName, mode = "wb") 
}

#### Uzip check
if(!file.exists(dir)){
      unzip("UCIdata.zip", files = NULL, exdir=".")
}

#### Reading Data
# Subject files
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
### Fearures files
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
### Activity files
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# Excercice 1
#### merge training set and the test set to create one data set.
# dataSet <- rbind(X_train,X_test)
dataSet <- cbind(rbind(subject_train,subject_test),rbind(y_train,y_test),rbind(X_train,X_test))

# Excercice 2
#### Extracts only the measurements on the mean and standard deviation for each measurement. 
# Use vector of mean and std, use the vector to subset.
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]
feature_id <- grep(("mean\\(\\)|std\\(\\)"), features)
MeanStd <- dataSet[, c(1, 2, feature_id+2)]
colnames(MeanStd) <- c("Subject", "Activity", features[feature_id])


# Excercice 3
#### Uses descriptive activity names to name the activities in the data set
# group the activity column of dataSet, re-name lable of levels with activity_levels, and apply it to dataSet.
Act_names <- read.table("UCI HAR Dataset/activity_labels.txt")

for (i in 1:6){
      MeanStd$Activity[MeanStd$Activity == i] <- as.character(Act_names[i,2])
}

# Excercice 4
#### Appropriately labels the data set with descriptive activity names.
# Create vector of "Clean" feature names by getting rid of "()" apply to the dataSet to rename labels.
# CleanFeatureNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
# names(dataSet) <- CleanFeatureNames[MeanStd]
names(MeanStd) <- gsub("\\()", "", names(MeanStd))
names(MeanStd) <- gsub("^t", "time_", names(MeanStd))
names(MeanStd) <- gsub("^f", "freq_", names(MeanStd))
names(MeanStd) <- gsub("BodyBody", "Body", names(MeanStd))

# Excercice 5
# From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.
Tidy_finalSet <- MeanStd %>% group_by(Subject, Activity) %>% summarise_all(.funs = c(mean="mean"))
write.table(Tidy_finalSet, "tidy_data.txt", row.names = FALSE)
