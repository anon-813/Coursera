cat("\014") 
rm(list = ls())

# Set working directory 
setwd("C:/Users/20287/Documents/DFS/XXR/Coursera/getting_and_cleaning_data/final_project")
getwd()

# download file and unzip
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists('./getdata_projectfiles_UCI HAR Dataset.zip')){
  download.file(fileURL,'./getdata_projectfiles_UCI HAR Dataset.zip', mode = 'wb')
  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}

# read in features and clean up names.  features will be used as column names in other data frames
features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])
features <- gsub('-mean', 'Mean', features)
features <- gsub('-std', 'Std', features)
features <- gsub('[-()]', '', features)
features <- gsub(',', '_', features)
features <- gsub("BodyBody", "Body", features) # I think 'BodyBody' is a duplication error and should just say 'Boby'
features <- tolower(features)  #make all lower case 

# read in train files and combine into df_train.  
x_train <- read.table('./UCI HAR Dataset/train/X_train.txt', col.names = features)
y_train <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ', col.names="code")
s_train <- read.csv('./UCI HAR Dataset/train/subject_train.txt', header = FALSE, sep = ' ', col.names="subject")
df_train <-  cbind(s_train, y_train, x_train)
rm(s_train, y_train, x_train) # files no longer needed

# read in test files and combine into df_test.  
x_test <- read.table('./UCI HAR Dataset/test/X_test.txt', col.names = features)
y_test <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ', col.names="code")
s_test <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ', col.names="subject")
df_test <-  cbind(s_test, y_test, x_test)
rm(s_test, y_test, x_test) # files no longer needed

# TASK 1: Merges the training and the test sets to create one data set.
df <- rbind(df_train, df_test)

# TASK 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# make vector (wantedMeasures) of Mean and Std columns and use that to subset the df
wantedMeasures <- grep("mean|std", colnames(df)) 
df <- df[, c(1:2, wantedMeasures)]  #keep 1:2 for next step

# TASK 3:  Uses descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"), stringsAsFactors = FALSE)
df <- merge(df, activities, by="code", all.x=TRUE)

# TASK 4:  Appropriately labels the data set with descriptive variable names.
# Was done above 

# TASK 5:  creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# use dplyr package to group data by activity and subject and then get the average of each variable
if (!"dplyr" %in% installed.packages()) {
  install.packages("dplyr")
}
library(dplyr)
df_g <- df %>% group_by(activity, subject)
tidydf <- summarise_all(df_g, mean)
# write out the dataframe to a text file
write.table(tidydf, "tidy_data.txt", row.names = FALSE)

