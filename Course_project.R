## This script takes a dataset from UCI etc ...

## Uses base R package plus dplyr package

## Note "UCI HAR Dataset" must be in your working directory
## Read tables of lables for activities and features

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
feature_labels <- read.table("UCI HAR Dataset/features.txt")

## convert feature labels into readable labels with "chr" structure

features <- feature_labels[,2]
feature_descriptions <- make.names(features, unique = TRUE)

names(activity_labels) = c("Activity_id", "Activity")

## Read tables containing test subject ids, test activity ids, and test values of 561 features into R

test_values <- read.table("UCI HAR Dataset/test/X_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt")

## Read tables containing train subject ids, train activity ids, and train values of 561 features into R

train_activities <- read.table("UCI HAR Dataset/train/y_train.txt")
train_values <- read.table("UCI HAR Dataset/train/X_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Combine test subject id, test activity and test feature values into a table
test_table <- cbind(test_subjects, test_activities, test_values)

## Add column labels
colnames(test_table) <- c("Subject_id", "Activity_id", feature_descriptions)

## Combine train subject id, train activity and train feature values into a table
train_table <- cbind(train_subjects, train_activities, train_values)

## Add column labels
colnames(train_table) <- c("Subject_id", "Activity_id", feature_descriptions)

## create table that contains both the test and train subjects with activities and feature values
full_table <- rbind(test_table, train_table)

## Convert activity id to descriptive activity name
activity_labeled <- merge(full_table, activity_labels, by.x = "Activity_id", by.y = "Activity_id")

## extracts subjects, activity, feature mean and feature standard deviation
table_mean_std <- select(activity_labeled, Subject_id, Activity, contains(".mean."), contains(".std."))

## Need to rename feature meand and std to be descriptive name
table_mean_std_described <- select(table_mean_std, Subject = Subject_id, Activity = Activity, 
                                 TotalBodyAccelX.mean = tBodyAcc.mean...X, TotalBodyAccelX.stdev = tBodyAcc.std...X,
                                 TotalBodyAccelY.mean = tBodyAcc.mean...Y, TotalBodyAccelY.stdev = tBodyAcc.std...Y,
                                 TotalBodyAccelZ.mean = tBodyAcc.mean...Z, TotalBodyAccelZ.stdev = tBodyAcc.std...Z,
                                 TotalGravityAccelX.mean = tGravityAcc.mean...X, TotalGravityAccelX.stdev = tGravityAcc.std...X,
                                 TotalGravityAccelY.mean = tGravityAcc.mean...Y, TotalGravityAccelY.stdev = tGravityAcc.std...Y,
                                 TotalGravityAccelZ.mean = tGravityAcc.mean...Z, TotalGravityAccelZ.stdev = tGravityAcc.std...Z,
                                 TotalBodyAccelJerkX.mean = tBodyAccJerk.mean...X, TotalBodyAccelJerkX.stdev = tBodyAccJerk.std...X,
                                 TotalBodyAccelJerkY.mean = tBodyAccJerk.mean...Y, TotalBodyAccelJerkY.stdev = tBodyAccJerk.std...Y,
                                 TotalBodyAccelJerkZ.mean = tBodyAccJerk.mean...Z, TotalBodyAccelJerkZ.stdev = tBodyAccJerk.std...Z,
                                 TotalBodyGyroX.mean = tBodyGyro.mean...X, TotalBodyGyroX.stdev = tBodyGyro.std...X,
                                 TotalBodyGyroY.mean = tBodyGyro.mean...Y, TotalBodyGyroY.stdev = tBodyGyro.std...Y,
                                 TotalBodyGyroZ.mean = tBodyGyro.mean...Z, TotalBodyGyroZ.stdev = tBodyGyro.std...Z,
                                 TotalBodyGyroJerkX.mean = tBodyGyroJerk.mean...X, TotalBodyGyroJerkX.stdev = tBodyGyroJerk.std...X,
                                 TotalBodyGyroJerkY.mean = tBodyGyroJerk.mean...Y, TotalBodyGyroJerkY.stdev = tBodyGyroJerk.std...Y,
                                 TotalBodyGyroJerkZ.mean = tBodyGyroJerk.mean...Z, TotalBodyGyroJerkZ.stdev = tBodyGyroJerk.std...Z,
                                 TotalBodyAccelMagnitude.mean = tBodyAccMag.mean.., TotalBodyAccelMagnitude.stdev = tBodyAccMag.std..,
                                 TotalGravityAccelMagnitude.mean = tGravityAccMag.mean.., TotalGravityAccelMagnitude.stdev = tGravityAccMag.std..,
                                 TotalBodyAccelJerkMagnitude.mean = tBodyAccJerkMag.mean.., TotalBodyAccelJerkMagnitude.stdev = tBodyAccJerkMag.std..,
                                 TotalBodyGyroMagnitude.mean = tBodyGyroMag.mean.., TotalBodyGyroMagnitude.stdev = tBodyGyroMag.std..,
                                 TotalBodyGyroJerkMagnitude.mean = tBodyGyroJerkMag.mean.., TotalBodyGyroJerkMagnitude.stdev = tBodyGyroJerkMag.std..,
                                 TransformedBodyAccelX.mean = fBodyAcc.mean...X, TransformedBodyAccelX.stdev = fBodyAcc.std...X,
                                 TransformedBodyAccelY.mean = fBodyAcc.mean...Y, TransformedBodyAccelY.stdev = fBodyAcc.std...Y,
                                 TransformedBodyAccelZ.mean = fBodyAcc.mean...Z, TransformedBodyAccelZ.stdev = fBodyAcc.std...Z,
                                 TransformedBodyAccelJerkX.mean = fBodyAccJerk.mean...X, TransformedBodyAccelJerkX.stdev = fBodyAccJerk.std...X,
                                 TransformedBodyAccelJerkY.mean = fBodyAccJerk.mean...Y, TransformedBodyAccelJerkY.stdev = fBodyAccJerk.std...Y,
                                 TransformedBodyAccelJerkZ.mean = fBodyAccJerk.mean...Z, TransformedBodyAccelJerkZ.stdev = fBodyAccJerk.std...Z,
                                 TransformedBodyGyroX.mean = fBodyGyro.mean...X, TransformedBodyGyroX.stdev = fBodyGyro.std...X,
                                 TransformedBodyGyroY.mean = fBodyGyro.mean...Y, TransformedBodyGyroY.stdev = fBodyGyro.std...Y,
                                 TransformedBodyGyroZ.mean = fBodyGyro.mean...Z, TransformedBodyGyroZ.stdev = fBodyGyro.std...Z,
                                 TransformedBodyAccelMagnitude.mean = fBodyAccMag.mean.., TransformedBodyAccelMagnitude.stdev = fBodyAccMag.std..,
                                 TransformedBodyBodyAccelJerkMagnitude.mean = fBodyBodyAccJerkMag.mean.., TransformedBodyBodyAccelJerkMagnitude.stdev = fBodyBodyAccJerkMag.std..,
                                 TransformedBodyBodyGyroMagnitude.mean = fBodyBodyGyroMag.mean.., TransformedBodyBodyGyroMagnitude.stdev = fBodyBodyGyroMag.std..,
                                 TransformedBodyBodyGyroJerkMagnitude.mean = fBodyBodyGyroJerkMag.mean.., TransformedBodyBodyGyroJerkMagnitude.stdev = fBodyBodyGyroJerkMag.std..)

## group by subject and activity
grouped_table <- group_by(table_mean_std_described, Subject, Activity)

## average of each variable for subject and activity
tidy_data <- summarise_each(grouped_table, c("mean"))
## write table using using row.name=FALSE 

