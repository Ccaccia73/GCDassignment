# Code Book

------------------------

## Data Sources

The script uses the following files of the dataset described in `Readme.md`:

- 'features.txt': List of all features (i.e. the collected measurements).

- 'features_info.txt': Information about the variables used on the feature vector.

- 'activity_labels.txt': Link between the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': identification of the subject performing the activity for each training sample.
 
- 'test/subject_test.txt': identification of the subject performing the activity for each training sample.

## Operations on Data

This script performs the following operations:

1.  it merges the training and the test sets in order to produce a single dataset,
2.	it Extracts only the features concerning mean and standard deviation for a measurement, 
3.	it uses, as class names, the descriptive values found in the _activity_labels_ file,
4.	it changes the names of the feaures according to the names found in the _features_ file, 
5.	it creates a new tidy data set with the average of each variable for each activity and each subject. 

## Output

The script generates two new files:

- `AllData.txt`: which contains the original merged dataset

- `DataGrouped.txt`: which contains the new tidy dataset, with average variables, grouped by activity and subject.
