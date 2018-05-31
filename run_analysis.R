# download file from url
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data.zip", method = "curl")

# unzip file
unzip(zipfile = "./data.zip")

# unzipped files are in folder called UCI HAR Dataset

