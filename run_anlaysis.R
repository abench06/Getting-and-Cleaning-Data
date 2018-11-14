
setwd("C:/Users/aaron.bench1/Documents/AaronBench/R_Files and Data/Coursera/UCI HAR Dataset")

# OVERVIEW
"Using data collected from the Samsung Galaxy S 
 smartphone, create a tidy data frame.  output the
 tidy data to a file named 'tidy_data.txt'.

 See README.md for more information."


library(dplyr)


#----Read data ----


# read in training data

trainingSubjects <- read.table("train/subject_train.txt", sep = "")

trainingValues <- read.table("train/X_train.txt", sep = "")

trainingActivity <- read.table("train/y_train.txt", sep = "")

# read in test data

testSubjects <- read.table("test/subject_test.txt", sep="")

testValues <- read.table("test/X_test.txt", sep="")

testActivity <- read.table("test/y_test.txt", sep = "")


# read  in features, without converting text labels to factors

features <- read.table("features.txt", sep="", as.is = TRUE)


# read in activity labels

activities <- read.table("activity_labels.txt", sep = "")

#create column names for Activities 

colnames(activities) <- c("Activity Id", "Activity Label")


#----Merges the training and the test sets to create one data set----

#Merge the training and the test sets by column to create single data frame 

humanActivity <- rbind(
    cbind(trainingSubjects, trainingValues, trainingActivity),
    cbind(testSubjects, testValues, testActivity))


# Add column names to data frame

colnames(humanActivity) <- c("subject", features[, 2], "activity")

        #come back to this to add in activity name by id


#----Extracts only the measurements on the mean and standard deviation for each measurement---- 

# Condense data frame to only those columns we desire
       

# Identify vectors to keep, i.e. those containing mean and standard deviation in the name

keep_these <- grepl("subject|activity|mean|std", colnames(humanActivity))

#Keep only those columns identified as means and standard deviations 

humanActivity <- humanActivity[, keep_these]



#----Uses descriptive activity names to name the activities in the data set----

#Rename activity id with names

# replace activity ids with activity names in activity column

humanActivity$activity <- factor(humanActivity$activity, 
                                 levels = activities[, 1], labels = activities[, 2])




#----Appropriately labels the data set with descriptive variable names----

# get column names

humanActivityCols <- colnames(humanActivity)

# remove all special characters and replace with spaces

humanActivityCols <- gsub("[\\(\\)-]", "", humanActivityCols)

# properly clean up column names 

humanActivityCols <- gsub("^f", "frequency Domain", humanActivityCols)
humanActivityCols <- gsub("^t", "time Domain", humanActivityCols)
humanActivityCols <- gsub("Acc", "Accelerometer", humanActivityCols)
humanActivityCols <- gsub("Gyro", "Gyroscope", humanActivityCols)
humanActivityCols <- gsub("Mag", "Magnitude", humanActivityCols)
humanActivityCols <- gsub("Freq", "Frequency", humanActivityCols)
humanActivityCols <- gsub("mean", "Average", humanActivityCols)
humanActivityCols <- gsub("std", "Standard Deviation", humanActivityCols)

# correct the typo
humanActivityCols <- gsub("BodyBody", "Body", humanActivityCols)

# use new labels as column names
colnames(humanActivity) <- humanActivityCols


#----From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject----

#Print a data set with only averages

keep_these2 <- grepl("subject|activity|Average", colnames(humanActivity))

#Keep only those columns identified as means and standard deviations 

humanActivityAverage <- humanActivity[, keep_these2]

# print file "tidy_data.csv"
write.table(humanActivityAverage, "tidy_data.csv", sep=",", row.names = FALSE, 
            quote = FALSE)

