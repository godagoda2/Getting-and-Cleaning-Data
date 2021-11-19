run_analysis <- function(){
  
  data_X_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
  data_y_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
  
  data_X_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
  data_y_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
  
  features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
  
  merge_train <- cbind(data_y_train,data_X_train)
  merge_test <- cbind(data_y_test, data_X_test)
  merge_X <- rbind(merge_train,merge_test)
  
  colnames(merge_X) <- features[,2]
  
  cols <- grep("mean|std",features[,2])
  cols_sub <- grep("meanFreq",features[,2])
  cols <- setdiff(cols,cols_sub)
  
  data_out <- merge_X[,cols]
  
  write.table(data_out,file = "data.txt",row.names = FALSE)
  
}