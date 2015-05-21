---
title: "README"
output: html_document
---

## Script preparing data from Human Activity Recognition Using Smartphones Dataset
### Script made for the course project of the Getting and Cleaning Data course at Coursera

The script performs the following steps:

1. loads data from files into data frames
2. merges training and testing data sets
3. labels columns and selects relevant columns only i.e. containing means or standard deviations of the measurments
4. adds columns indicating activity and subject for each observation / row
5. replaces activity numbers with their descriptive names
6. creates separate date frame with averages of the variables for each activity and each subjects
7. writes the final data into a file