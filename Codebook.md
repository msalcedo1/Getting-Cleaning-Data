# Code Book

Overview
30 volunteers performed 6 different activities while wearing a smartphone. The smartphone captured various data about their movements.

Explanation of each file
- features.txt: Names of the 561 features.
- activity_labels.txt: Names and IDs for each of the 6 activities.
- X_train.txt: 7352 observations of the 561 features.
- subject_train.txt: A vector of 7352 integers, with the ID of the subject related to each of the observations in X_train.txt.
- y_train.txt: A vector of 7352 integers, with the ID of the activity related to each of the observations in X_train.txt.
- X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.
- subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
- y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt

## Processing steps
Script was created to be executed without having to change wprkind directory. It first handles the zip file, that is going to be downloaded into your wd.

Then, the useful data from every txt file is stored into a variable:

### Subject files
- subject_test
- subject_train
### Fearures files
- X_test
- X_train
### Activity files
- y_test
- y_train

## Excercice 2
First creates a vector of only mean and std labels, then use the vector to subset dataSet.
* dataSet : dataSet will only contain mean and std variables

## Excercice 3
Create a vector of "clean" feature names by getting rid of "()" at the end. Then, will apply that to the dataSet to rename column labels.
* CleanFeatureNames : a vector of "clean" feature names 

## Excercice 4
Combine test data and train data of subject and activity, then give descriptive lables. Finally, bind with dataSet. At the end of this step, dataSet has 2 additonal columns 'subject' and 'activity' in the left side.
* subject : bind of subject_train and subject_test
* activity : bind of y_train and y_test

## Excercice 5
Group the activity column of dataSet as "act_group", then rename each levels with 2nd column of activity_levels. Finally apply the renamed "act_group" to dataSet's activity column.
* act_group : factored activity column of dataSet 

## Excercice 6
In this part, dataSet is melted to create tidy data. It will also add [mean of] to each column labels for better description. Finally output the data as "tidy_data.txt" stored on your wd.
* baseData : melted tall and skinny dataSet
* secondDataSet : casete baseData which has means of each variables