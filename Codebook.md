This Codebook explains all variables of the Coursera Getting and Cleaning Data Project

*** Read the file README.md first. ***

Once all file was downloaded, the folder was unzipped. 

The R Script (run_analysis.R) shows the steps taken to answer the following questions from the Project:
        You should create one R script called run_analysis.R that does the following.

        1. Merges the training and the test sets to create one data set.
                a. Reads all test and train tables for x, y and subject. "xtest, ytest, subtest, xtrain, ytrain & subtrain"
                b. Reads the features and activity labels table - "features & activitylabels"
                c. Assign columns names to six test and train files in 1a above based on features file. 
                d. Merges test and train data. First column binds the x, y and sub data of both test and train individually leading to "Alltestdata & Alltraindata"; then row binds the two merged test and train data giving "Alldata"
        
        2. Extracts only the measurements on the mean and standard deviation for each measurement.
                a. Use colnames function to extract only mean and std data
                b. Creates a subset from "Alldata" for only the mean and std data called "subset_mean_and_std"
                
        3. Uses descriptive activity names to name the activities in the data set
                a. Uses activitylabels.txt file to change the change from integer to factors describing the activities
                
        4. Appropriately labels the data set with descriptive variable names.
                a. chnages the variables in dataset from abbreviations to full names. e.g. Acc becomes Accelerations
        
        5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
                a. creates an average of each activty type by subject - "tidyDataset"
                b. Tranforms tidyDataset into a table