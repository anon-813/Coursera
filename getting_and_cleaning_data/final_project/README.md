# Coursera

This repository is for the Coursera 'Getting and Cleaning Data' course, week 4 final project.

The repository contains:
  1.  "run_analysis.R".   This script
      a. downloads and unzips the data files needed
      b. Merges the training and the test sets to create one data set.
      c. Extracts only the measurements on the mean and standard deviation for each measurement.
      d.  Uses descriptive activity names to name the activities in the data set
      e.  Appropriately labels the data set with descriptive variable names.
      f.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  2. The final output data, "tidy_data.txt"
  3. CodeBook.md which describes the data and explains how the data was cleaned up
  
  The dplyr package is used in the last step of run_analysis.R.   The script will install the package if it is not already installed.
