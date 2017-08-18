# UCIHARDatasetCleaning
Peer-graded Assignment: Getting and Cleaning Data Course Project

## Overview
This repo contains files created for the final Getting and Cleaning Data Course Project.
This script performs manipulation of the data from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## File list:

### Readme.md
    This file. It presents overview of the repo files.

### run_analysis.r
    Script to perform fetching the data and creating a tidy data set
    from raw data stored in zip-file specified in the Overview.
    
    The script checks if data folder (zipped or unzipped) is already present in the R working directory.
    If there is neither folder nor zip-file containing desired data it downloads the file und extracts it.
    
    When the data are available in the working directory the script proceeds with combing the data 
    into tidy dataset by:
    1. Importing training and test datasets (UCI HAR Dataset/test/y_test.txt, UCI HAR Dataset/train/y_train.txt)
    2. Naming the columns with the names imported from UCI HAR Dataset/features.txt
    3. Matching individual rows with the information on the activity and subject performimg it
       while the measurements was taken.
    4. Renaming the columns to provide more descriptive information on the measurements
       according to the procedure described in the CodeBook.md
    5. Exporting the tidy dataset to the current working directory
            
### CodeBook.md
    The codebook describing resulting tidy set variables with references to the original data description.
