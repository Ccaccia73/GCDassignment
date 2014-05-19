This script does the following
1.  Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names. 
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

How it works:
In the beginning of the script we have a function named "Inicio" with a variable "WorkDirStr" where you must add your working dyrectory. It is supposed that you had downloaded the files from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and extracted the files onto your working dyrectory cited above.
In this case, my working diretroy is "D:/A Data Science/Getting and Cleaning Data/Peer Assessment".
The script begins reading the test data set, in a folder with name "/test", and all the files with names "test" on it. After that, we read training data sets, in a folder with name "/train", and all the files with names "train".
These two inicial actions may take some time to execute!
Next, the script resolves the first activity that is "1" Merging the training and test sets to create one data set.
After that, we resolve item "3."(Uses descriptive activity names to name the activities in the data set) and "4" (appropriately labels the data set with descriptive activity names. In sequence we combine training+test data sets and add "activity" label as another column.
Finaly, the script creates a second, independent tidy data set with the average of each variable. Next consolidates the dataset.
The name of the tidy dataset generated is "jpa_tidy_data.txt" on your working dyrectory.
