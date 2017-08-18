

### Run_analysis
### This script performs manipulation of the data from: 
### https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



# cleaning the workspace at start

rm(list=ls())
sourcefile      <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"



# downloading and unzipping if necessary

if( !file.exists("UCI HAR Dataset") )
        {
                if( !file.exists(basename(sourcefile)) ) download.file(sourcefile, basename(sourcefile) )
                if(  file.exists(basename(sourcefile)) ) unzip(basename(sourcefile) )
                }



# fetching test and train data combining them together

data             <- rbind( 
                           read.table("UCI HAR Dataset/test/X_test.txt"  ),
                           read.table("UCI HAR Dataset/train/X_train.txt")
                           )



# getting names of the features

colnames(data)   <- unlist(read.table("UCI HAR Dataset/features.txt", sep = " ", colClasses = c("NULL", "character")))



# extracting the measurements on the mean and standard deviation based on above info

data         <- subset( data, select=(grepl( "mean()|std()", colnames(data))))



# Add descriptive activity names to the data set
                              
labels           <- rbind( 
                        read.table("UCI HAR Dataset/test/y_test.txt"  , as.is = TRUE),
                        read.table("UCI HAR Dataset/train/y_train.txt", as.is = TRUE)
                        )

act.dict                <- read.table("UCI HAR Dataset/activity_labels.txt", as.is=TRUE)
row.names(act.dict)     <- act.dict[, 1]
act.dict                <- act.dict[,-1]

subjects           <- rbind( 
                        read.table("UCI HAR Dataset/test/subject_test.txt"  , as.is = TRUE, col.names = "Subject"),
                        read.table("UCI HAR Dataset/train/subject_train.txt", as.is = TRUE, col.names = "Subject")
                        )



# using rownames functionality instead of dplyr::left_join() to match activity labels with activity id
# and adding id for tested subjects

data             <- cbind(data, Activity = act.dict[unlist(labels)], Subject = subjects)



# Renaming the columns to provide descriptive information on the measurements
# Addind "Time" instead of "t" and "Freq" instead of "f"
# Removing non-letter characters

names(data)     <- gsub("^t", "Time", names(data))
names(data)     <- gsub("^f", "Freq", names(data))
names(data)     <- gsub("\\(\\)", "", names(data))
names(data)     <- gsub("mean", "Mean", names(data))
names(data)     <- gsub("std", "Std", names(data))
names(data)     <- gsub("\\-", "", names(data))
names(data)


# Creating a tidy dataset according as Activity-Subject-wise means of all of the selected features. 
library(dplyr)

data.tidy        <- data %>% group_by( Activity, Subject) %>% summarise_all(mean)

write.table(data.tidy, file = "UCI_HAR_Tidy_Dataset.txt", row.names = FALSE)

### EOF

