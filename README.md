# Getting and Cleaning Data: Course Project (Coursera)

This repository was created for the course project of "Getting and Cleaning Data" course from Coursera.

## Dataset

from the UC Irvine Machine Learning Repository: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Cleaning the Dataset

The raw data were converted into tidy data using the R script `run_analysis.R`. This script does the following:

1. downloading the data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip) if it doesn't exist in the CWD.
2. Reads the following from the train and test folders, respectively:
   1. The dataset itself from:`X_train.txt` and `X_test.txt`.
   2. Dataset labels from: `y_train` and `y_test`.
   3. Subjects of the dataset: `subject_train` and `subject_test`.
3. Merge the dataset from the train and test folders.
   1. `X` ==> 10,229 record with 561 variables
   2. `Y` ==> 10,229 label/record.
   3. `Subjects` ==> 10,229 record.
4. From the 561 variables of `X`, extracting only the variables of mean or standard deviation (81 variable).
5. Changing the labels of the dataset from `Y` to one of the 6 activities in `activity_labels.txt`.
6. Renaming the variable names to include the full word not the abbreviation as described in the `features_info.txt` file.
7. getting the output `tidy_data.txt` by grouping the dataset by the subject and the activity and getting the mean per each category. The result is a new dataframe with 180 records (30 subjects times 6 activities).

## Important files

1. `UCI HAR Dataset/` ==> the directory that contains the input raw data.
2. `run_analysis.R` ==> The R scripts that runs the analysis (steps described above).
3. `CodeBook.md` ==> the new code book of the tidy data.
4. `README.md` ==> This README file. 
5. `tidy_data.txt` ==> the output tidy data.