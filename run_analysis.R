run_analysis <- function(){
  ## this script will read the "Human Activity Recognition Using 
  ## Smartphones Dataset Version 1.0" and create a summary table with the 
  ## average  by individual and type of trainig from all the variables which correspond to 'means' or 'standard
  ## deviations'
  
  library(dplyr)
  library(data.table)
  ## read the tables with the values for all the variables for the two subsets
  ## ('train' and 'test)
  train <- fread('train/X_train.txt')
  test <- fread('test/X_test.txt')
  
  ## read the tables with the type of activity for each record for the two
  ## subsets
  ytrain <- fread('train/y_train.txt')
  ytest <- fread('test/y_test.txt')
  
  ## read the tables with the subject identifier for each record for the two
  ## subsets
  subjecttest <- fread('test/subject_test.txt')
  subjecttrain <- fread('train/subject_train.txt')
  
  ## read the tables with the variable names and the activity labels
  features <- fread('features.txt')
  activitylabel <- fread('activity_labels.txt')

  ## change the integer in the activity column by the corresponding label
  ytrain$V1 <- as.factor(ytrain$V1)
  ytest$V1 <- as.factor(ytest$V1)
  levels(ytrain$V1) <- activitylabel$V2
  levels(ytest$V1) <- activitylabel$V2
  
  ## assign the names of all the variables in the tables
  colnames(ytrain) <- 'activity'
  colnames(ytest) <- 'activity'
  colnames(subjecttest) <- 'subject'
  colnames(subjecttrain) <- 'subject'
  colnames(train) <- features$V2
  colnames(test) <- features$V2
  
  ## merge the datasets
  complete_train <- cbind(subjecttrain,ytrain,train)
  complete_test <- cbind(subjecttest,ytest,test)
  complete_set <- rbind(complete_train,complete_test)
  
  ## change the name of the variables so that they can be read the functions in R
  valid_column_names <- make.names(names=names(complete_set), unique=TRUE, allow_ = TRUE)
  valid_column_names <- sub("\\.\\.\\.","",valid_column_names)
  valid_column_names <- sub("\\.\\.","",valid_column_names)
  valid_column_names <- sub("\\.","",valid_column_names)
  names(complete_set) <- valid_column_names
  
  ## create a subset with only the variables which correspond to 'means' or 
  ## 'stardard deviations'
  subtable <- select(complete_set, subject,activity, contains("mean"),contains("std"),-contains("meanFreq"),-contains("angle"))
  
  ## create a summary table with the mean of all the variables in the previous 
  ## table by subject and type of activity and write it to a file
  meantable <- aggregate(subtable,list(subtable$subject,subtable$activity),mean)
  meantable <- subset(meantable,select = -c(subject,activity))
  meantable <- rename(meantable, subject  = Group.1, activity = Group.2)
  write.table(meantable,file="tidytable.txt",row.names = FALSE)
  meantable
} 