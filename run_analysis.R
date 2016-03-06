# "Getting and Cleaning Data" Coursera Course Final Project 

# Initial description and goal taken and copied from course: 

# The purpose of this project is to demonstrate your ability to collect, 
# work with, and clean a data set. The goal is to prepare tidy data that can be
# used for later analysis. You will be graded by your peers on a series of 
# yes/no questions related to the project. You will be required to submit: 
# 1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis,
# and 3) a code book that describes the variables, the data, and any 
# transformations or work that you performed to clean up the data called 
# CodeBook.md. You should also include a README.md in the repo with your 
# scripts. This repo explains how all of the scripts work and how they are 
# connected.
# 
# One of the most exciting areas in all of data science right now is wearable 
# computing - see for example this article . Companies like Fitbit, Nike, and 
# Jawbone Up are racing to develop the most advanced algorithms to attract new 
# users. The data linked to from the course website represent data collected 
# from the accelerometers from the Samsung Galaxy S smartphone. A full 
# description is available at the site where the data was obtained:
#         
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# 
# Here are the data for the project:
#         
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# You should create one R script called run_analysis.R that does the following.
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
# measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

# Call relevant needed libraries
library(dplyr) # Add dplyr for gathering of data
library(tidyr)  # add tidyr package for tidying of data 

# -----------------  SECTION STEP 1 ----------------------------

# STEP 1: Merges the training and the test sets to create one data set.

# Setwd() for my computer:
setwd("C:/Users/LDS/Documents/rprograms/CleaningData/CourseProject/DataSets")

# Reading in the original column names for the raw data sets and sets the two 
        # new column names 
features <- read.table("features.txt", header = FALSE, 
                       col.names=c("rawNameNumber", "rawVariableName"))


# Reading in raw data from the original data files, setting column names as 
        # given in the "rawVariableName" above
X_test <- read.table("./test/X_test.txt", 
                     colClasses = "numeric", 
                     col.names=features$rawVariableName)
X_train <- read.table("./train/X_train.txt", 
                      colClasses = "numeric", 
                      col.names=features$rawVariableName)

# Reading in raw data from the original subject data files
X_test_subject <- read.table("./test/subject_test.txt", 
                             colClasses = "numeric", 
                             col.names="subject")
X_train_subject <- read.table("./train/subject_train.txt", 
                              colClasses = "numeric",
                              col.names="subject")

# Reading in raw data from the original activity label data files
y_test <- read.table("./test/y_test.txt", 
                     colClasses = "numeric",
                     col.names="activitynum")
y_train <- read.table("./train/y_train.txt", 
                      colClasses = "numeric",
                      col.names="activitynum")

# Reading in activity labels, then deleting column with redundant numbers
activities <- read.table("./activity_labels.txt",
                         colClasses = c("numeric", "character"),
                         col.names=c("activitynum","activity"))
y_test <- merge(y_test,activities) # merging sets with activity labels
y_train <- merge(y_train,activities) #...
y_test <- select(y_test, activity)
y_train <- select(y_train, activity)

# Column bind the information together
X_test_all <-cbind(X_test, X_test_subject, y_test)
X_train_all <-cbind(X_train, X_train_subject, y_train)

# merging the two data frames using the dplyr library functions and rbind 
X_total <- rbind(X_test_all, X_train_all) # row binding for one large (combined) data set
X_total <- tbl_df(X_total) # converting data frames for screen visual outputs


# -----------------  SECTION STEP 2 ----------------------------

# 2. Extracts only the measurements on the mean and standard deviation for each 
# measurement.

# Do a general search on columns that contain mean and std. Regular expression 
   # starts and ends with "." to search for columns like ".mean" and eliminate 
   # columns with meanFreq.  Escape \\ variable used so "." searched as character
meanCols <- X_total[,grepl("\\.[Mm]ean\\.", colnames(X_total))] # columns containing mean
stdCols <- X_total[,grepl("[Ss]td", colnames(X_total))] # columns containting std
subject <- X_total$subject
activity <- X_total$activity

# get subset of columns using select for mean and std columns and 
   # include extra last 3 columns for later tidying
X_selected <- cbind(meanCols,stdCols,subject,activity)
X_selected<-tbl_df(X_selected) # cleaned up for screen printing formatting

# -----------------  SECTION STEP 3 ----------------------------

# Changes selected column names to be more descriptive. Most are already 
    # descriptive so only changing some. 

# Gets updated list of column names
X_selected_cols <- colnames(X_selected)

# Column names that start with t are for the variables from time domain signals
    # and start with f are for the fast fourier transformed (FFT) data.  
    # Change column names to better signify this.
X_selected_cols <- gsub("^t","time_", X_selected_cols) # change time columns from t... to time_...
X_selected_cols <- gsub("^f","fft_", X_selected_cols) # change fourier columns from f... to fft_...

# Column names endings are based on dimension, update so consistent with _ separator
     # NOTE: in original column names . is a character, while in gsub regular
     # expression, we adjust for it's use by searching for the character, \\.
     # as otherwise it means "any character". 
     # ...X is for in the x direction vector (based on accelerometer set axes)
     # ...Y is for the y direction vector
     # ...Z is for the z direction vector
     # .. is for a scalar magnitude quantity (sqrt(x^2+y^2+z^2))
X_selected_cols <- gsub("\\.\\.\\.X$","_xvector", X_selected_cols)  # update dimension label
X_selected_cols <- gsub("\\.\\.\\.Y$","_yvector", X_selected_cols)  # update dimension label
X_selected_cols <- gsub("\\.\\.\\.Z$","_zvector", X_selected_cols)  # update dimension label
X_selected_cols <- gsub("\\.\\.$","_scalar", X_selected_cols)  # update dimension label

# Structure
# Top level:    Body, Gravity  (Gravity only subsets to Acc)
# Second level: Acc, Gyro, Body 
# Third level:  Jerk, Mag, Gyro
# Fourth level: Mag

# Column names that contain:
     # "Body" within are values applied to the person's body and 
     # "Gravity" are values extracted for system gravitational acceleration. 
     # "Acc" = acceleration
     # "Gyro" = gyroscope value
     # "Jerk" = value for sudden change in acceleration value
     # "Mag" = magnitude (size only, no direction)
     # "mean" = value shown is the mean value of the given type
     # "std" = value shown is the standard deviation of the given type

# -----------------  SECTION STEP 4 ----------------------------

# 4. Appropriately labels the data set with descriptive variable names.

# (Step 4): Replace the new set of column names to X_selected df
X_selected<-setNames(X_selected, X_selected_cols) 

# -----------------  SECTION STEP 5 ----------------------------

# 5. From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

funs(mean, "mean", mean(., na.rm = TRUE))

 X_selected <- group_by(X_selected, activity, subject)
 
 X_selected <- arrange(X_selected, activity, subject)
 
 meanData <- summarize_each(X_selected, funs(mean))

 print(meanData) 
















