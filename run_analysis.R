# download file from url
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data.zip", method = "curl")

# unzip file
unzip(zipfile = "./data.zip")

# unzipped files are in folder called UCI HAR Dataset

# list all files
files <- list.files(path = "/Users/msdoyino/Documents/Coursera/DataScience/Course 3/UCI HAR Dataset/git_project/UCI HAR Dataset", recursive = TRUE)

files

# Read test and train dataset
xtest <- read.table("test/X_test.txt", header = FALSE)
ytest <- read.table("test/y_test.txt", header = FALSE)
subtest <- read.table("test/subject_test.txt", header = FALSE)

xtrain <- read.table("train/X_train.txt", header = FALSE)
ytrain <- read.table("train/y_train.txt", header = FALSE)
subtrain <- read.table("train/subject_train.txt", header = FALSE)

# Read features data (columns names of the X test and train data)
features <- read.table("features.txt", header = FALSE)

# Read activity labels data (identifies activity of the Y test and train data)
activitylabels <- read.table("activity_labels.txt", header = FALSE)

# Assign column names(variables) to the X test and train data using features file
colnames(xtest) <- features[, 2]
colnames(xtrain) <- features[, 2]

# Assign column names to Y test and train data using activity_lables files. Call variable Activity
colnames(ytest) <- "Activity"
colnames(ytrain) <- "Activity"

# Assign column names to subject who performed activity
colnames(subtest) <- "Subject"
colnames(subtrain) <- "Subject"

# Merge test and train data individually
Alltestdata <- cbind(xtest, subtest, ytest)
Alltraindata <- cbind(xtrain, subtrain, ytrain)

# Merges the training and the test sets to create one data set
Alldata <- rbind(Alltestdata, Alltraindata)

# Assign variable to column names of Alldata
column_names <- colnames(Alldata)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
        # Extract mean and std variables from features.txt; also Subject and Activty variables
mean_and_std <- (grepl("mean..", column_names) | grepl("std..", column_names) | grepl("Subject", column_names) | grepl("Activity", column_names))

# Subset mean, std, Subject, Activity variables from Alldata
subset_mean_and_std <- Alldata[, mean_and_std == TRUE]

# Uses descriptive activity names to name the activities in the data set
subset_mean_and_std$Activity <- factor(subset_mean_and_std$Activity, labels = as.character(activitylabels$V2))
DescriptiveActivityNames <- subset_mean_and_std$Activity

# Appropriately labels the data set with descriptive variable names.
names(subset_mean_and_std) <- gsub("Acc", "Acceleration", names(subset_mean_and_std))
names(subset_mean_and_std) <- gsub("Gyro", "Gyroscope", names(subset_mean_and_std))
names(subset_mean_and_std) <- gsub("Mag", "Magnitude", names(subset_mean_and_std))
names(subset_mean_and_std) <- gsub("Freq", "Frequency", names(subset_mean_and_std))
names(subset_mean_and_std) <- gsub("^t", "time", names(subset_mean_and_std))
names(subset_mean_and_std) <- gsub("^f", "frequency", names(subset_mean_and_std))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyDataset <- aggregate(. ~Subject + Activity, subset_mean_and_std, mean)

# Transform tidy data set into table (.txt) format
write.table(tidyDataset, file = "tidyDataset.txt", row.names = FALSE)