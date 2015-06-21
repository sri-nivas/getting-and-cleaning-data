#
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each 
#variable for each activity and each subject.

Run_Analysis <- function() {
 
  #Files - activity_labels & features     
  featrs <- read.table("UCI HAR Dataset/features.txt") 
  act_lable <- read.table("UCI HAR Dataset/activity_labels.txt") 
   names(act_lable) <- c("Subject","Activity") 
    #print(act_lable)
   
 #Files from category "Train" directory
  Train_X <<- read.table("UCI HAR Dataset/train/X_train.txt") 
  Train_Y <- read.table("UCI HAR Dataset/train/y_train.txt")
  Train_Subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
  
 # print( paste(nrow(Train_X), " -- ", nrow(Train_Y), " -- ", nrow(Train_Subject)) )
  #print( paste(ncol(Train_X), " -- ", ncol(Train_Y), " -- ", ncol(Train_Subject)) )
        
  #Files from category "Test" directory
  Test_X <<- read.table("UCI HAR Dataset/test/X_test.txt") 
  Test_Y <- read.table("UCI HAR Dataset/test/y_test.txt")
  Test_Subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  #print( paste(nrow(Test_X), " -- ", nrow(Test_Y), " -- ", nrow(Test_Subject)) )    
#  print( paste(ncol(Test_X), " -- ", ncol(Test_Y), " -- ", ncol(Test_Subject)) )
  
  
  
  #MERGE "TRAIN" & "TEST" X - files
  
  merge_TT_X <- rbind(Train_X , Test_X)
 # print(nrow(merge_TT_X))
  #print(ncol(merge_TT_X))

  merge_TT_Y <- rbind(Train_Y , Test_Y)
  #print(nrow(merge_TT_Y))
#  print(ncol(merge_TT_Y))
  
  names(merge_TT_Y) <- c("Subject")
  #set column names
  names(merge_TT_X) <- featrs1[,2]
 # print(names(merge_TT_Y))
  
  merge_X <- merge_TT_X[,grep("(mean|std)",names(merge_TT_X))]
  #print(nrow(merge_X))
  #print(ncol(merge_X))
 #names(XTrain1) <- featrs1[,2]
  
 #Actnames <- cbind("actid"=c(1,2,3,4,5,6),"Activity"=ActTrainName)

  Merge_Y_names <- merge(act_lable,merge_TT_Y)
  #print(nrow(Merge_Y_names))
  #print(ncol(Merge_Y_names))
  tidyMeans <- cbind(Merge_Y_names, merge_X)
  write.table(tidyMeans, "tidyMeans.txt", row.names = FALSE)
}
