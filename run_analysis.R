run_analysis <- function() {
    
    library(dplyr)
    
    ## Read measurement labels
    variable_names <<- read.table('features.txt')
    
    ## Read test data
    subject_test <- read.table('./test/subject_test.txt', col.names = 'Subject')
    set_test <- read.table('./test/X_test.txt', col.names = variable_names[, 2])
    activity_test <- read.table('./test/y_test.txt', col.names = 'Activity.code')
    
    ## Read training data
    subject_train <- read.table('./train/subject_train.txt', col.names = 'Subject')
    set_train <- read.table('./train/X_train.txt', col.names = variable_names[, 2])
    activity_train <- read.table('./train/y_train.txt', col.names = 'Activity.code')
    
    ## Combine test and training data
    subject <- rbind(subject_test, subject_train)
    set <- rbind(set_test, set_train)
    activity <- rbind(activity_test, activity_train)
    
    ## Extract only mean and standard deviation measurements
    set <- set[, c(grep('mean..', colnames(set), fixed = TRUE),
                   grep('std..', colnames(set), fixed = TRUE))]
    colnames(set) <- gsub('\\.\\.', '', colnames(set))

    ## Create single data set
    combined <- cbind(subject, activity, set)
    
    ## Add descriptive activity names
    activity_labels <- read.table('activity_labels.txt',
                                  col.names = c('Activity.code', 'Activity'))
    combined <- merge(activity_labels, combined)
    
    ## Calculate mean for each measurement
    tidy <<- combined %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
    
    write.table(tidy, 'tidy.txt', row.names = FALSE)

}