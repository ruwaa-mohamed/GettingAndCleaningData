################################################################################
## Loadign required packages
library(dplyr)
################################################################################
## 0. Downloading the dataset
zip.name <- "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(zip.name)){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  zip.name, "curl")
    unzip(zip.name)
}
################################################################################
## Reading the files
## 1. Merges the training and the test sets to create one data set.

features <- read.table("UCI HAR Dataset/features.txt")$V2

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(x_train, x_test)
names(X) <- features

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
Y <- rbind(y_train, y_test)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
Subject <- rbind(subject_train, subject_test)

dataset_labels <- cbind(Subject, Y)
names(dataset_labels) <- c("subject", "label") 
################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for 
## each measurement.

tidy_dataset <- X[,grep("mean|std", names(X))]
tidy_dataset <- cbind(dataset_labels, tidy_dataset)
################################################################################
## 3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")$V2
tidy_dataset$label <- activity_labels[tidy_dataset$label]
################################################################################
## 4. Appropriately labels the data set with descriptive variable names.

names(tidy_dataset)[2] = "activity"
names(tidy_dataset)<-gsub("Acc", "Accelerometer", names(tidy_dataset))
names(tidy_dataset)<-gsub("Gyro", "Gyroscope", names(tidy_dataset))
names(tidy_dataset)<-gsub("BodyBody", "Body", names(tidy_dataset))
names(tidy_dataset)<-gsub("Mag", "Magnitude", names(tidy_dataset))
names(tidy_dataset)<-gsub("^t", "Time", names(tidy_dataset))
names(tidy_dataset)<-gsub("^f", "Frequency", names(tidy_dataset))
names(tidy_dataset)<-gsub("tBody", "TimeBody", names(tidy_dataset))
names(tidy_dataset)<-gsub("-mean\\(\\)", "Mean", names(tidy_dataset))
names(tidy_dataset)<-gsub("-mean", "Mean", names(tidy_dataset))
names(tidy_dataset)<-gsub("-std\\(\\)", "STD", names(tidy_dataset))
names(tidy_dataset)<-gsub("Freq\\(\\)", "Frequency", names(tidy_dataset))
names(tidy_dataset)<-gsub("angle", "Angle", names(tidy_dataset))
names(tidy_dataset)<-gsub("gravity", "Gravity", names(tidy_dataset))
################################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

output_data <- 
    tidy_dataset %>%
    group_by(subject, activity) %>%
    summarize_all(funs(mean))

write.table(output_data, "tidy_data.txt", row.name=FALSE, sep="\t", quote=FALSE)

################################################################################