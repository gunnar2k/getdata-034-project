require(data.table)
require(dplyr)

# Merges the training and the test sets to create a new data set
X_train <- fread('dataset/train/X_train.txt')
X_test <- fread('dataset/test/X_test.txt')
X_merged <- rbind(X_train, X_test)

# Appropriately labels the data set with descriptive variable names.
feature_names <- as.character(read.table('dataset/features.txt')$V2)
X_merged <- setNames(X_merged, feature_names)

# Extracts only the measurements on the mean and standard deviation for each measurement.
X_merged <- select(X_merged, matches("mean|std"))

# Add activity id and name to the new data set
y_train <- fread('dataset/train/y_train.txt')
y_test <- fread('dataset/test/y_test.txt')
y_merged <- rbind(y_train, y_test)
activity_labels <- read.table('dataset/activity_labels.txt', col.names=c("id", "activity"))
X_merged <- mutate(X_merged, activityId = y_merged)
X_merged <- merge(X_merged, activity_labels, by.x="activityId", by.y="id")

# Add subject id information to the new data set
subject_train <- fread('dataset/train/subject_train.txt')
subject_test <- fread('dataset/test/subject_test.txt')
subject_merged <- rbind(subject_train, subject_test)
X_merged <- mutate(X_merged, subjectId=subject_merged$V1)

# Write new data set for step 4 to file
write.table(X_merged, file="output_step4.txt")

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
newSet <- X_merged %>%
  group_by(activity, subjectId) %>%
  summarize_each(funs(mean))

# Write the new data set for step 5 to file
write.table(newSet, file="output_step5.txt", row.name=FALSE)
