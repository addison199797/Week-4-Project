---
title: "README"
author: "*Addison Tang*"
date: "*9/17/2020*"
output: html_document
---


## Datasource
The datasource for the script is in "UCI HAR Dataset" folder. 


## How the script works

### Reading in the data
The script first read the train, test, feature, activity label and subject data, which are in seperated files. 

### Combining the data
X is the independent variables and  Y is the dependent variable or "label". 

Since X doesn't come with headers, we need to make the feature as the header for X. 

Then for Y, we only have number as the labels so we joined with activity label and subject to get a more descriptive language.

Finally, X and Y are combined.

### Tidy data
The end product is a combined data set of X and Y.

For this assignment, we have another product called "tidyData" and that is the average of all the variables grouped by the activity label and subject.
