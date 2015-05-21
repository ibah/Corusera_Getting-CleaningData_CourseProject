# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation
#    for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.

rm(list=ls(all=TRUE))

fdtrain <- "./UCI HAR Dataset/train/X_train.txt"
fdtest <- "./UCI HAR Dataset/test/X_test.txt"
fltrain <- "./UCI HAR Dataset/train/y_train.txt"
fltest <- "./UCI HAR Dataset/test/y_test.txt"
fstrain <- "./UCI HAR Dataset/train/subject_train.txt"
fstest <- "./UCI HAR Dataset/test/subject_test.txt"
ffeatures <- "./UCI HAR Dataset/features.txt"
factivities <- "./UCI HAR Dataset/activity_labels.txt"
dtrain <- read.table(fdtrain)
dtest <- read.table(fdtest)
ltrain <- read.table(fltrain)
ltest <- read.table(fltest)
strain <- read.table(fstrain)
stest <- read.table(fstest)
features <- read.table(ffeatures, stringsAsFactors=FALSE)
activities <- read.table(factivities, stringsAsFactors=FALSE)

# initial review of the data
dim(dtrain)
dim(dtest)
dim(ltrain)
dim(ltest)
dim(strain)
dim(stest)
table(ltrain)
table(ltest)
dim(features)
head(features)
dim(activities)
activities

# merging training and testing data
data1 <- rbind(dtrain, dtest)
labels <- rbind(ltrain, ltest)
subjects <- rbind(strain, stest)

# labelling columns
colnames(data1) <- features[[2]]
# [[]] to get the column as a vector
# you can use make.names() to get rid of the special characters

# selecting columns containing means and standard deviations only
# colnames(data1[,grep("mean|std",colnames(data1))]) # checking the reg. expr.
data2 <- data1[,grep("mean|std",colnames(data1))]

# adding activity identifiers of subject and activities to the data
colnames(labels) <- "LabelIndex"
colnames(subjects) <- "Subject"
data3 <- cbind(labels, subjects, data2)

# adding descriptive activity names
colnames(activities) <- c("LabelIndex", "Activity")
data4 <- merge(activities, data3)
data4$LabelIndex <- NULL

# checking the data
dim(data4)
head(colnames(data4))
tail(colnames(data4))
sum(is.na(data4))

# creating the second data set
library(dplyr)
data4 %>%
    group_by(Activity, Subject) %>%
    summarise_each(funs(mean)) %>%
    write.table("data_step5.txt", row.names=FALSE)
