library(data.table)
library(plyr)

# 1. Merges the training and the test sets to create one data set.

feature_names <- as.character(read.table('dataset/features.txt')$V2)

X_train <- fread('dataset/train/X_train.txt')
X_test <- fread('dataset/test/X_test.txt')
X_merged <- rbind(X_train, X_test)
X_merged <- setNames(X_merged, feature_names)

print(names(X_merged))

y_train <- fread('dataset/train/y_train.txt')
y_test <- fread('dataset/test/y_test.txt')
y_merged <- rbind(y_train, y_test)

print(head(y_merged))

subject_train <- fread('dataset/train/subject_train.txt')
subject_test <- fread('dataset/test/subject_test.txt')
subject_merged <- rbind(subject_train, subject_test)

# print(head(X_merged))
# print(head(y_merged))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

print("DONE")
