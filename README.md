# CleaningDataProject
Project files for the Coursers "Cleaning Data" online course. 

## Project Description and Given Criteria

Project description below copied from the "Getting and Cleaning Data" Coursera course (Feb/Mar 2016). Minor edits made in formatting and structure. 

### Review criteria

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

### Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1. a tidy data set as described below, 
2. a link to a Github repository with your script for performing the analysis, and 
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
(extra) You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
 
# Analysis Method

#### Call relevant needed libraries

Before the main sections of the R script was run, the libraries reguired for the functions were called. 
- library(dplyr)  for gathering of data functions
- library(tidyr)  for tidying of data functions

#### Overview:
- The  raw data is read in from various .txt type files and created as data frames in the R format.   
- Directory set for computer and file location 
- Read.table was used to read in the different files.
- Data that contained numbers was given a ‘colClasses = “numeric”’ type for ease in later manipulation as they would then be given a numerica class and could be used in numeric calculations. 
- The two sets of data, the ‘test’ and ‘train’ were collected together without (in this data analysis) indicating which data was from which.  Note that as each was labelled with a participant ‘subject’ number, later subseting could be referenced without adding additional information.  
- The type of activity was matched for each data row in terms of its written value (e.g. WALKING) instead of its numeric equivalent (e.g. 1). 
- the grep() function and regular expressions were used to identify the columns from the original data sets that contained information about mean calculated values and standard deviations.  
- the select function was used to create a subset with the mean and std columns and then it was column binded to the activity and subject columns. 
- Some of the column names were changed to be more desriptive. Most are already descriptive.  The ‘t’ was changed to ‘time”, ‘f’ changed to ‘fft’, and the vector and scalar information at the end of the column name was updated. 
- The column names in the data frame was updated to the renamed values using ‘setNames’ function. 
- The final data fram was grouped by the activity and subject (in that order) columns.  They were then arranged in ascending order, then the funs() and summarize_each() functions were used to find summary mean information for each grouped subtype. 

