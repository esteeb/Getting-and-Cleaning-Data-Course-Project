#setup libraries
library(dplyr)
library(stringr)
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

# Order here does matter, since it informs columns, also names columns (data looks worse at this step than at any other)
whole_set <- cbind(all_subj, all_y, all_x)
colnames(whole_set) <- c("Subject", 
                         "Activity", 
                         set_colheads[,2])


## 2. Pull out only mean and std for measurements. Find relevant columns and select them from whole_set. This includes -meanFreq measures that do not have corresponding stds
# Adds 2 to account for the two additional columns at the beginning of the dataset - Subject and Activity
relcols <- (grep("(mean|std)", set_colheads[,2]))+2

relevant_set <- select(whole_set, Subject, Activity, all_of(relcols))

## 3. Rename activities using descriptive activity names, changing all caps to title case while we're at it
act_lables <-  read.table("./data/UCI HAR Dataset/activity_labels.txt")

relevant_set$Activity <- relevant_set$Activity %>%
  factor(levels = act_lables[,1], labels = act_lables[,2])%>%
  str_to_title(locale = "en")

## 4. Appropriately label dataset with descriptive names
# This section cleans up titles, but keeps them all one word using camel case for ease of use for further analysis
dirty_colnames <- colnames(relevant_set)
dirty_colnames <- gsub("-std", "Std", dirty_colnames)
dirty_colnames <- gsub("-mean", "Mean", dirty_colnames)
clean_colnames <- gsub("[-()]", "", dirty_colnames)

colnames(relevant_set) <- clean_colnames

## 5. Create a tidy dataset that lists average for each variable for each subject and activitiy
# Expectation: Up to 6 rows per subject, each row correponds to a different activity

# Melt data so that each row consists of four variables: Subject, Activity, the variable that had previously been in cols 3-81, and the value
melted_data <- melt(relevant_set, id.vars = c("Subject", "Activity"))

# Cast "molten" data frame to a dataframe, taking the mean of each measurement
tidy_data <- dcast(melted_data, Subject + Activity ~ variable, mean)

# Write our new dataset to a .txt file, if one does not already exist in the directory

if (!file.exists("tidydata.txt")) {
  write.table(tidy_data, "./tidydata.txt")
}


## Extra stuff
# Pull out colnames for the README
used_variables <- colnames(tidy_data)
