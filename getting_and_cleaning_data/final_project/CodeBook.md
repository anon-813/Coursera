# Code Book

This describes the variables, the data, and any work performed to clean up the data.

# Data Description

Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Data Source

The data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.   

# Data Structure

The zip file contains
1.   'README.txt'  This file provides information on the data in the zip files.
2.   'features_info.txt': Shows information about the variables used on the feature vector.
3.   'features.txt': List of all features. 
4.   'activity_labels.txt': Links the class labels with their activity name.
5.   'train/X_train.txt': Training set.
6.   'train/y_train.txt': Training labels.
7.   'test/X_test.txt': Test set.
8.   'test/y_test.txt': Test labels.
9.   'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
10.  'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. 
Additional files in the zip file are explained in the README.txt file but are not used in this project.

The structure of the test and training datasets (5 and 7 above) are the same.  
The test and training labels files (6 and 8) provide the codes for each record in 5 & 7 respectively.
The activities_labels file (4) provides a description for each of the codes.  For example, code 1 = Walking, code 2 = Walking Upstairs, etc.
The features file (3) provides the column labels for the test and training datasets, 5 & 7.

In run_analysis.R, we will
  1.  column bind training files 5, 6, and 9.  
  2.  column bind test files 7, 8, and 10.
  3.  row bind the results of step 1 and 2.
This will provide full dataset to perform the analysis required.



