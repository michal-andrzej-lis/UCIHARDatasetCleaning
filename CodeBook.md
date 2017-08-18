
## UCI_HAR_Tidy_Dataset - CodeBook

Each row of the tidy dataset contains mean value for the given Activity name and subject that was performing this activity calculated on the combined training and test sets from the original data.
No other preprocoessing was done from raw measurements.
Original features descriptions we measured features are described within the features 

In orther to calculate the avarage grouping information was added as separate columns 
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

Original features names described in the original "UCI HAR Dataset/features_info.txt"-file was renamed in the tidy dataset according to following steps:
 1. "t" and "f" prefixes was changed to "Time" and "Freq" respectively
 2. "-" and "()" was removed from the names of the features
 3. "mean" and "std" was changed to "Mean" and "Std" respectively

There is no additional information on the final mean value in the columns names as all non-grouping variables are presented as mean values.
All measurements are presented with no units as they were normalized and bounded within [-1,1]
 
