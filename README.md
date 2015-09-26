## **Course project for Coursera "Getting and Cleaning Data"**  

### These repo contains scripts that take .txt files from Human Activity Recognition Using Smartphones Data Set stored in the UCI Machine Learning Repository and creates a tidy data set for understanding the movement dynamics of 30 subjects performing 6 movement activities.  

[link] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  

**Reference** Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  

### **Description of scripts**  

The Course_project.R scripts presumes that the directory “UCI HAR Dataset” is in the R working directory. It uses the base and dplyr R packages.  

1. Read tables of labels for activities and features
	+ Convert feature labels into readable labels with "chr" structure
	+ Give activity_labels data frame column names
2. Read tables containing test subject ids, test activity ids, and test values of 561 features into R
3. Read tables containing train subject ids, train activity ids, and train values of 561 features into R
4. Combine test subject id, test activity and test feature values into a table
	+ Add column labels
5. Combine train subject id, train activity and train feature values into a table
	+ Add column labels
6. Create table that contains both the test and train subjects with activities and feature values
7. Merge activity id with descriptive activity name
8. Extracts subjects, activity, and all features that are feature mean and feature standard deviation of raw measurements
9. Rename feature meand and std with descriptive names and resorder so that feature mean and feature standard deviation are in adjacent columns
10. group table by subject and activity so that each subject has 6 rows, each with one movement activity, and the 66 feature variables
11. Calculate average for each feature variable for each subject and activity combination
12. View final tidy table  

Each of 30 subjects have performed 6 activities for which the means of mean movement features and standard deviation of movement features have been calculated.  

Each line of the final output is one observation defined as a subject/activity pair and 66 feature variable averages.  

Column 1 (Subject) and 2 (Activity) have the variables that define the observations. Columns 3 through 68 each have the mean of a single feature variable.

