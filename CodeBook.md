---
title: "CodeBook for Johns Hopkins Coursera 'Getting and Cleaning Data'"
author: "Aaron Bench"
date: "November 14, 2018"
output: html_document
---

This code book refers to the data set 

`tidy_data.csv`.  Please see the `ReadMe.md` file for the raw data from which `tidy_data.csv` was extrapulated.



## Data

The `tidy_data.csv` is a csv file, containing separated values.  The first row has variable names for each vector/column .

## Variables

### Identifier Variables 

There are two identifier variables

-`Subject`

and

-`Activity`

Subject identifies the specific individual tested by a whole number.  Activity details what action the subject performs.

Activities include

-`WALKING`: subject was walking
-`WALKING_UPSTAIRS`: subject was walking upstairs
-`WALKING_DOWNSTAIRS`: subject was walking downstairs
-`SITTING`: subject was sitting
-`STANDING`: subject was standing
-`LAYING`: subject was laying

###Average and Standard Deviation Measurements 

The rest of the measures are means and standard deviations for how long an activity occured and how often the activity occured.

Specific details on these variables are contained in the `ReadMe.md` file 

## Transformations 

Source data information can be found in the `ReadMe.md` file.

The following Transformations were performed with the source data.

1. Three sets of test data and three sets of training data were read in.
2. Training sets were merged by column, test sets were merged by column, and then merged test data was merged with merged training data by rows, creating a single data set.
3. Add Subject and Activity column names to data frame
4. Remove variable names not containing mean and standard deviation
5. Rename the column names with decriptive names 
6. Print a final data set with Means only

