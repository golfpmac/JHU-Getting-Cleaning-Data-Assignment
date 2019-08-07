require(dplyr)
library(dplyr)
require(readr)
library(readr)

#read test data
setwd(paste("C:\\Users\\Patrick\\datasciencecoursera\\Course 3\\Week 3\\",
                 "JHU Getting & Cleaning Data Assignment\\Data\\UCI HAR ",
                 "Dataset\\test\\", sep=""))

x_test_df = tbl_df(read.table("X_test.txt"))
y_test_df = tbl_df(read.table("y_test.txt"))

#read train data
setwd(paste("C:\\Users\\Patrick\\datasciencecoursera\\Course 3\\Week 3\\",
            "JHU Getting & Cleaning Data Assignment\\Data\\UCI HAR ",
            "Dataset\\train\\", sep=""))

x_train_df = tbl_df(read.table("X_train.txt"))
y_train_df = tbl_df(read.table("y_train.txt"))

#read features data
setwd(paste("C:\\Users\\Patrick\\datasciencecoursera\\Course 3\\Week 3\\",
            "JHU Getting & Cleaning Data Assignment\\Data\\UCI HAR ",
            "Dataset\\", sep=""))

variables_list = read.table(("features.txt"))

#read activity_labels data
activity_labels = read.table(("activity_labels.txt"))



#combine variables
combined_test = cbind(x_test_df, y_test_df)
combined_train = cbind(x_train_df, y_train_df)

#combine test & train rows
combined = rbind(combined_test, combined_train)

#add variable names to data frame
colnames(combined) = variables_list$V2

#figure out which columns are superfluous and then delete them
cols_to_del = grep("std|mean", variables_list$V2, ignore.case = TRUE, invert = TRUE)
combined <- combined[-cols_to_del]

#Label the activity number column
names(combined)[87] = "Labels"

#Label the Activity DF
names(activity_labels)[2] = "Activity"
names(activity_labels)[1] = "Number"


#convert DF to tibble and move the "Labels" col to the front
combined = tbl_df(combined)
combined = select(combined, Labels, everything())

#remove extra objects
rm(combined_test, combined_train, variables_list, x_test_df, x_train_df,
    y_test_df, y_train_df, cols_to_del)

merged_data = merge(combined, activity_labels, by.x="Labels", by.y = "Number", all = TRUE)


merged_data = tbl_df(merged_data)
merged_data = select(merged_data, Activity, everything()) 




