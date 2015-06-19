# GettingCleaningDataCourseProject

The run_analysis.R script takes smartphone accelerometer and gyroscope signal data on 30 volunteer subjects performing 6 activities -- walking, walking upstairs, walking downstairs, sitting, standing, and laying -- and returns averages of the mean and standard deviation measurements for each subject and activity.  As the original data is divided into test and training sets, the script combines the data into a single data set and adds descriptive labels.

The script will run as long as the current working directory contains the following data and label files:
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The script performs these steps:
1. Read measurement labels from `features.txt`.
2. Read test data (subject, signal, activity) from `subject_test.txt`, `X_test.txt`, `y_test.txt`, adding measurement labels to the signal data.
3. Read training data (subject, signal, activity) from `subject_train.txt`, `X_train.txt`, `y_train.txt`, adding measurement labels to the signal data.
4. Combine test data sets and training data sets.
5. Extract only mean and standard deviation measurements from the signal data by column name.
6. Clean up column names of the signal data by removing multiple periods.
7. Combine subject, activity, and signal data sets in a single combined data set.
8. Read descriptive activity labels from `activity_labels.txt`.
9. Merge descriptive activity labels with combined data set.
10. Calculate mean of each measurement, grouped by subject and activity.  Create tidy data set called `tidy`.
11. Write `tidy` to `tidy.txt` without row labels.
