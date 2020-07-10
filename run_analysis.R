#setup libraries
library(dplyr)
library(lubridate)
library(reshape2)

# 1. get dataset, read it int the global environment, and save it locally to my machine
rawDir <- "./raw"
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
rawLocal <- "raw.zip"
rawLocalFilepath <- paste0(rawDir, rawLocal)
workingDir <- "./data"

if (!file.exists(rawDir)){
  dir.create(rawDir)
  download.file(url = dataUrl, destfile = rawLocalFilepath)
}

if (!file.exists(workingDir)) {
  dir.create(workingDir)
  unzip(zipfile = rawLocalFilepath, exdir = workingDir)
}

# Load train data
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjects_train <- read.table("./data/UCI HAR Dataset/train/subjects_train.txt")

# Load test data
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Load column headers
set_colheads <- read.table("./data/UCI HAR Dataset/features.txt")

## Merge datasets (   no subjects #s are used in both test and train datasets, checked using: 
##    unique_unique <- c(unique(subject_test),unique(subjects_train))
##     unique_unique   ) 
# Order does not matter, it just needs to be consistent
all_x <- rbind(x_train, x_test)
all_y <- rbind(y_train, y_test)
all_subj <- rbind(subjects_train, subject_test)

# Order here does matter, since it informs columns, also names columns (relevant in next step)
whole_set <- cbind(all_subj, all_y, all_x)
colnames(whole_set) <- c("Subject","Activity", 3:563)


# Find relevant columns and select them from whole_set, then adds two to adjust for the two added in columns
relcols <- grep("-(mean|std)", set_colheads[,2])
relcols <- relcols + 2

colnames(whole_set) <- c("Subject", "Activity Number", set_colheads)




