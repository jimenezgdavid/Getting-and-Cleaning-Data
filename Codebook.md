## **Course project for Coursera "Getting and Cleaning Data"**  

#### This repo contains scripts that take .txt files from Human Activity Recognition Using Smartphones Data Set stored in the UCI Machine Learning Repository and creates a tidy data set for understanding the movement dynamics of 30 subjects performing 6 movement activities.  

[Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  

[Original data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

**Reference** Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  


### Variable descriptions  

**Subject** = Individual subjects 1 to 30 by identification number  

**Activity** = 1 of 6 activities

	* LAYING
	* SITTING
	* STANDING
	* WALKING
	* WALKING_DOWNSTAIRS
	* WALKING_UPSTAIRS

**Columns 3 through 68**

Features were derived from:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration measured in standard gravity units “g”
Triaxial Angular velocity from the gyroscope measured in units radians/second 

All features are normalized and bounded within [-1,1].

Each feature name has several components:

* Time = raw time domain signal *or* Transformed = Fast Fourier Transformed signal
* Body = Body movement measured *or* Gravity = Gravity movement measured
* Accel = Acceleration measured *or* Gyro = Angular velocity measured
* X, Y or Z = axis *or* Magnitude = total magnitude of movement
* Jerk = body linear acceleration and angular velocity derived in time
* mean = average of signals over instances for each subject and activity *or* stdev = standard deviation of signals over instances for each subject and activity

