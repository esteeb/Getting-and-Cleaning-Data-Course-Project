---
title: "README"
author: "Erik Rehnberg Steeb"
date: "7/9/2020"
output: html_document
---


## Getting and Cleaning Data Course Project

This is my submission for the course project for Getting and Cleaning Data, the third course in the Data Science specialization offered by Johns Hopkins University on Coursera. 

The run_analysis.R file contains the scripts needed to take the given input (which the first chunks of the script will pull for you) and reproduce the dataset contained in the tidydata.txt file. It utilizes the dplyr, stringr, and reshape2 packages.

The step-by-step scripts aggregate the test and train datasets, label axes appropirately, make the column names a bit more readable (while preserving camelCase in order to ensure a user's ability to easily perform future analysis). The dataset is then "melted" and recast using reshape2 in order to show the average of each measurement by subject and activity.

The tidydata.txt file shows the average measurements by subject and activity for the measurements shown in the CodeBook.md file. "Subject" and "Activity" are identifier columns, all others are averages of the measurements from the original dataset. 
