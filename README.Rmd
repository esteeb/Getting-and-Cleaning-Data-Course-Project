---
title: "README"
author: "Erik Rehnberg Steeb"
date: "7/9/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Getting and Cleaning Data Course Project

This is my submission for the course project for Getting and Cleaning Data, the third course in the Data Science specialization offered by Johns Hopkins University on Coursera. 

The run_analysis.R file contains the scripts needed to take the given input and reproduce the dataset contained in the tidydata.txt file. It utilizes the dplyr, stringr, and reshape2 packages.

The tidydata.txt file shows the average measurements by subject and activity for the measurements shown below. "Subject" and "Activity" are identifier columns, all others are averages of the measurements from the original dataset. 

# Identifiers
* Subject - The subject number
* Activity - The activity for which the data was measured

# Measurements
* Subject 
* Activity 
* tBodyAccMeanX 
* tBodyAccMeanY 
* tBodyAccMeanZ 
* tBodyAccStdX 
* tBodyAccStdY 
* tBodyAccStdZ 
* tGravityAccMeanX 
* tGravityAccMeanY 
* tGravityAccMeanZ 
* tGravityAccStdX 
* tGravityAccStdY 
* tGravityAccStdZ
* tBodyAccJerkMeanX 
* tBodyAccJerkMeanY 
* tBodyAccJerkMeanZ 
* tBodyAccJerkStdX 
* tBodyAccJerkStdY 
* tBodyAccJerkStdZ 
* tBodyGyroMeanX 
* tBodyGyroMeanY 
* tBodyGyroMeanZ 
* tBodyGyroStdX 
* tBodyGyroStdY 
* tBodyGyroStdZ 
* tBodyGyroJerkMeanX 
* tBodyGyroJerkMeanY 
* tBodyGyroJerkMeanZ 
* tBodyGyroJerkStdX 
* tBodyGyroJerkStdY 
* tBodyGyroJerkStdZ 
* tBodyAccMagMean 
* tBodyAccMagStd 
* tGravityAccMagMean 
* tGravityAccMagStd 
* tBodyAccJerkMagMean 
* tBodyAccJerkMagStd 
* tBodyGyroMagMean 
* tBodyGyroMagStd 
* tBodyGyroJerkMagMean 
* tBodyGyroJerkMagStd 
* fBodyAccMeanX 
* fBodyAccMeanY 
* fBodyAccMeanZ 
* fBodyAccStdX 
* fBodyAccStdY 
* fBodyAccStdZ 
* fBodyAccMeanFreqX 
* fBodyAccMeanFreqY 
* fBodyAccMeanFreqZ 
* fBodyAccJerkMeanX 
* fBodyAccJerkMeanY 
* fBodyAccJerkMeanZ 
* fBodyAccJerkStdX 
* fBodyAccJerkStdY 
* fBodyAccJerkStdZ 
* fBodyAccJerkMeanFreqX 
* fBodyAccJerkMeanFreqY 
* fBodyAccJerkMeanFreqZ 
* fBodyGyroMeanX 
* fBodyGyroMeanY 
* fBodyGyroMeanZ 
* fBodyGyroStdX 
* fBodyGyroStdY 
* fBodyGyroStdZ 
* fBodyGyroMeanFreqX 
* fBodyGyroMeanFreqY 
* fBodyGyroMeanFreqZ 
* fBodyAccMagMean 
* fBodyAccMagStd 
* fBodyAccMagMeanFreq 
* fBodyBodyAccJerkMagMean 
* fBodyBodyAccJerkMagStd 
* fBodyBodyAccJerkMagMeanFreq 
* fBodyBodyGyroMagMean 
* fBodyBodyGyroMagStd 
* fBodyBodyGyroMagMeanFreq 
* fBodyBodyGyroJerkMagMean 
* fBodyBodyGyroJerkMagStd 
* fBodyBodyGyroJerkMagMeanFreq
## 
