run_analysis <- function(){
  
  data_X_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
  data_X_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
  
  features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
  
  merge_X <- rbind(data_X_train,data_X_test)
  
  colnames(merge_X) <- features[,2]
  
  cols <- grep("mean|std",features[,2])
  cols_sub <- grep("meanFreq",features[,2])
  cols <- setdiff(cols,cols_sub)
  
  data_out <- merge_X[,cols]
  
  write.table(data_out,file = "data.txt",row.names = FALSE)
  
}