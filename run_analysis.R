## This script takes a dataset from UCI Machine Learning Depository 
## Human Activity Recognition Using Smartphones Data Set
## Reference: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
## Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a 
## Multiclass Hardware-Friendly Support Vector Machine. International Workshop 
## of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Uses base R package plus dplyr package

## Note downloaded directory "UCI HAR Dataset" must be in your working directory

## Read tables of labels for activities and features

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
feature_labels <- read.table("UCI HAR Dataset/features.txt")

## convert feature labels into readable labels with "chr" structure

features <- feature_labels[,2]
feature_descriptions <- make.names(features, unique = TRUE)

## Give activity_labels data frame column names

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

## Merge activity id with descriptive activity name
activity_labeled <- merge(full_table, activity_labels, by.x = "Activity_id", by.y = "Activity_id")

## Extracts subjects, activity, and all features that are feature mean and 
## feature standard deviation of raw measurements
table_mean_std <- select(activity_labeled, Subject_id, Activity, contains(".mean."), contains(".std."))

## Rename feature meand and std with descriptive names and resorder so that
## feature mean and feature standard deviation are in adjacent columns
table_mean_std_described <- select(table_mean_std, Subject = Subject_id, Activity = Activity, 
                                 TimeBodyAccelX.mean = tBodyAcc.mean...X, TimeBodyAccelX.stdev = tBodyAcc.std...X,
                                 TimeBodyAccelY.mean = tBodyAcc.mean...Y, TimeBodyAccelY.stdev = tBodyAcc.std...Y,
                                 TimeBodyAccelZ.mean = tBodyAcc.mean...Z, TimeBodyAccelZ.stdev = tBodyAcc.std...Z,
                                 TimeGravityAccelX.mean = tGravityAcc.mean...X, TimeGravityAccelX.stdev = tGravityAcc.std...X,
                                 TimeGravityAccelY.mean = tGravityAcc.mean...Y, TimeGravityAccelY.stdev = tGravityAcc.std...Y,
                                 TimeGravityAccelZ.mean = tGravityAcc.mean...Z, TimeGravityAccelZ.stdev = tGravityAcc.std...Z,
                                 TimeBodyAccelJerkX.mean = tBodyAccJerk.mean...X, TimeBodyAccelJerkX.stdev = tBodyAccJerk.std...X,
                                 TimeBodyAccelJerkY.mean = tBodyAccJerk.mean...Y, TimeBodyAccelJerkY.stdev = tBodyAccJerk.std...Y,
                                 TimeBodyAccelJerkZ.mean = tBodyAccJerk.mean...Z, TimeBodyAccelJerkZ.stdev = tBodyAccJerk.std...Z,
                                 TimeBodyGyroX.mean = tBodyGyro.mean...X, TimeBodyGyroX.stdev = tBodyGyro.std...X,
                                 TimeBodyGyroY.mean = tBodyGyro.mean...Y, TimeBodyGyroY.stdev = tBodyGyro.std...Y,
                                 TimeBodyGyroZ.mean = tBodyGyro.mean...Z, TimeBodyGyroZ.stdev = tBodyGyro.std...Z,
                                 TimeBodyGyroJerkX.mean = tBodyGyroJerk.mean...X, TimeBodyGyroJerkX.stdev = tBodyGyroJerk.std...X,
                                 TimeBodyGyroJerkY.mean = tBodyGyroJerk.mean...Y, TimeBodyGyroJerkY.stdev = tBodyGyroJerk.std...Y,
                                 TimeBodyGyroJerkZ.mean = tBodyGyroJerk.mean...Z, TimeBodyGyroJerkZ.stdev = tBodyGyroJerk.std...Z,
                                 TimeBodyAccelMagnitude.mean = tBodyAccMag.mean.., TimeBodyAccelMagnitude.stdev = tBodyAccMag.std..,
                                 TimeGravityAccelMagnitude.mean = tGravityAccMag.mean.., TimeGravityAccelMagnitude.stdev = tGravityAccMag.std..,
                                 TimeBodyAccelJerkMagnitude.mean = tBodyAccJerkMag.mean.., TimeBodyAccelJerkMagnitude.stdev = tBodyAccJerkMag.std..,
                                 TimeBodyGyroMagnitude.mean = tBodyGyroMag.mean.., TimeBodyGyroMagnitude.stdev = tBodyGyroMag.std..,
                                 TimeBodyGyroJerkMagnitude.mean = tBodyGyroJerkMag.mean.., TimeBodyGyroJerkMagnitude.stdev = tBodyGyroJerkMag.std..,
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

## group table by subject and activity so that each subject has 6 rows, each
## with one movement activity, and the 66 feature variables
grouped_table <- group_by(table_mean_std_described, Subject, Activity)

## Calculate average for each feature variable for each subject and activity combination
tidy_data <- summarise_each(grouped_table, c("mean"))

## View final tidy table
View(tidy_data)


