README
================
Patrick McPherson

# Getting & Cleaning Data Assignment

### Using: Human Activity Recognition Using Smartphones Dataset Version 1.0

#### Data from

-----

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
<activityrecognition@smartlab.ws>  
www.smartlab.ws

-----

### Files Used

  - features\_info.txt
  - features.txt
  - activity\_labels.txt
  - train/X\_train.txt
  - train/y\_train.txt
  - test/X\_test.txt
  - test/y\_test.txt
  - subject\_test.txt
  - subject\_train.txt

### Purpose / Requirements

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.
3.  Uses descriptive activity names to name the activities in the data
    set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.

### Process

1.  Download the zip file from
    <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
2.  Unzip the files and place them in the RStudio project directory
3.  Run run\_analysis.R
      - Load packages
          - dplyr
          - readr
          - reshape2
      - Sets working directory
      - Reads files into data frames
      - Combines all the test data frames into one data frame using
        cbind()
      - Combines all the train data frames into one data frame using
        cbind()
      - Combines both of the above data frames into a single data frame
        using rbind()
      - Adds column names from the features.txt file
      - Determines & removes variables are superfluous(aren’t mean or
        std)
      - Labels the Activity and Subject columns and moves them to Cols 1
        & 2
      - Gives the Activity variable descriptive names using the merge()
        command
      - It then creates a tidy data frame summarizing the mean for
        Activities & Subjects
      - Lastly it creates a CSV file for the tidy data frame
