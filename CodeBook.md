# CodeBook
1. downloading the data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip) if it doesn't exist in the CWD.
2. Reading the dataset:
   1. `features` ==> `features.txt`: a character vector with 561 element (variables' names)
   2. `X_train.txt` ==> `train/X_train.txt` the dataset from the train folder (7,352 record with 561 variable)
   3.  `X_test.txt` ==> `test/X_test.txt` the dataset from the test folder (2,947 record with 561 variable)
   4. `y_train` ==> `train/y_train.txt` activity labels in numbers for the train dataset (7,352 record, 1 variable).
   5. `y_test` ==> `test/y_test.txt` activity labels in numbers for the test dataset (2,947 record, 1 variable).
   6. `subject_train` ==> `train/subject_train.txt` the subjects' number for the train dataset with a value between 1 and 30 for each record (7,352 record, 1 variable).
   7. `subject_test` ==> `test/subject_test.txt` the subjects' number for the test dataset with a value between 1 and 30 for each record (2,947 record, 1 variable).
   8. `activity_labels` ==> `activity_labels.txt` a character vector with 6 elements representing the 6 activities in the dataset.
3. Merge the dataset from the train and test folders.
   1. `X` ==> merging the `x_train` and `x_test` by rows: 10,229 record with 561 variables
   2. `Y` ==> merging the `y_train` and `y_test` by rows: 10,229 label/record, 1 column.
   3. `Subjects` ==> merging the `subject_train` and `subject_test` by rows: 10,229 record, 1 column.
   4. `dataset_labels` ==> `Subjects` and`Y` were mered by column in one dataframe (10,229 record, 2 columns)
4. From the 561 variables of `X`, extracting only the variables of mean or standard deviation (81 variable). The output was named `tidy_data`.
5. `tidy_data` was updated to include the `dataset_labels` as columns.
6. The `Y` labels in `tidy_data` were changed to `activity` using the `activity_labels` vector.
7. Renaming the variable names to include the full word not the abbreviation as described in the `features_info.txt` file.
   1. changed every `Acc` to `Accelerometer`
   2. changed every `Gyro` to `Gyroscope`
   3. reduced every `BodyBody` to `Body`.
   4. changed every `Mag` to `Magnitude`.
   5. changed every `t` at the beginning to `Time` and every `f` a the beginning to `Frquency`.
   6. changed every `tBody` to `TimeBody`.
   7. changed every `-mean()` to `Mean`.
   8. changed every `-std()` to `STD`
   9. changed every `mean` to `Mean`
   10. changed every `Freq()` to `Frequency`
   11. changed every `angle` to `Angle`.
   12. changed every `gravity` to `Gravity`
8. getting the output `tidy_data.txt` by grouping the dataset by the subject and the activity and getting the mean per each category. The result is a new dataframe with 180 records (30 subjects times 6 activities). Saved as tab-delimited file named `tidy_data.txt`.
