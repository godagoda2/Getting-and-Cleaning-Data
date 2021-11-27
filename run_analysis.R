run_analysis <- function(){
  
  data_X_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
  data_y_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
  
  data_X_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
  data_y_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
  
  features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
  activity <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
  
  colnames(data_X_train) <- features[,2]
  colnames(data_y_train) <- "feat"
  colnames(data_X_test) <- features[,2]
  colnames(data_y_test) <- "feat"
  colnames(activity) <- c("num","activity_labels")
  
  cols <- grep("mean|std",features$V2)
  cols_sub <- grep("meanFreq",features$V2)
  cols <- setdiff(cols,cols_sub)
  
  data_X_train <- data_X_train[,cols]
  data_X_test <- data_X_test[,cols]
  
  data_y_train_m <- merge(data_y_train,activity,by.x = "feat", by.y = "num")
  data_y_test_m <- merge(data_y_test,activity,by.x = "feat", by.y = "num")
  
  merge_train <- cbind(data_y_train_m,data_X_train)
  merge_test <- cbind(data_y_test_m, data_X_test)
  
  merge_X <- rbind(merge_train,merge_test)
  
  write.table(merge_X,file = "tidy_data.txt",row.names = FALSE)
  
}