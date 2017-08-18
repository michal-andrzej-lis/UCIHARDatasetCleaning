
## UCI_HAR_Tidy_Dataset - CodeBook

Each row of the tidy dataset contains mean value for the given Activity name and subject that was performing this activity taken from the combined original training and test sets.
No other preprocessing was done from raw measurements.
Original features are described within the Readme.txt and features_info.txt files provided along with data.
IMPORTANT NOTE: Raw data comes are normalized and bounded within [-1,1]. (no unitis are relevant for these measurements)

In orther to calculate the avarage, grouping information was added as separate columns 
1. Activity
    - Desctiption: Name of the activity performed during the experiment
    - Values: 
      - WALKING, 
      - WALKING_UPSTAIRS, 
      - WALKING_DOWNSTAIRS, 
      - SITTING, 
      - STANDING,
      - LAYING
 2. Subject
    - Desctiption: Individual subject id
    - Values: 1 to 30 (numeric)

Names of the features as described in the original "UCI HAR Dataset/features_info.txt"-file was changed in the tidy dataset according to following steps:
 1. "t" and "f" prefixes was changed to "Time" and "Freq" respectively
 2. "-" and "()" was removed from the names of the features
 3. "mean" and "std" was changed to "Mean" and "Std" respectively

There is no additional information on calculating mean value in the column names as all non-grouping variables are presented as mean values.

 
