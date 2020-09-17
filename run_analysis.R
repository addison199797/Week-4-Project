library("dplyr")

setwd("C:\\Users\\addison\\Desktop\\R HW\\Getting and Cleaning Data\\Week 4 Project\\UCI HAR Dataset")

##read in data
#load train and test data
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")
y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")
#load subject data
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")
#load feature data
features <- read.table("features.txt")
features <- features[,2]
#load activity labels
activity_labels <- read.table("activity_labels.txt")
#assign feature as header for X
colnames(X_train) <- as.character(features)
colnames(X_test) <- as.character(features)
#extract only means and std frp, X
#find all column names
X_colNames <- names(X_train)
#return vector of columns containing "mean" or "std"
X_selected <- grep("mean|std",X_colNames)
#se;ect only matching columns from X
X_train_selected <- X_train[,X_selected]
X_test_selected <- X_test[,X_selected]
#add activity labels and subject data to Y
#join activity labels based on "V1" 
y_train <- merge(y_train,activity_labels,by.x = "V1",by.y = "V1", all.x = FALSE, all.y = TRUE)
y_test <- merge(y_test,activity_labels,by.x = "V1",by.y = "V1", all.x = FALSE, all.y = TRUE)
#add subject data to train and test
y_train <- cbind(y_train, subject_train)
y_test <- cbind(y_test, subject_test)
#get rid of extra columns
y_train <- y_train[,-1]
y_test <- y_test[,-1]
#change name
colnames(y_train) <- c("activity_label","subject")
colnames(y_test) <- c("activity_label","subject")
#cbind x and y
train <- cbind(X_train_selected,y_train)
test <- cbind(X_test_selected,y_test)

##tidy data set
#combine test and train
data <- rbind(train,test)
#find mean and std for subj and activity labels
analyze <- data %>% 
  group_by(subject, activity_label) %>%
  summarise_all("mean")

#write the tidy data to parent project folder
setwd("..")
write.table(analyze, "tidyData.txt", row.names = FALSE)

  