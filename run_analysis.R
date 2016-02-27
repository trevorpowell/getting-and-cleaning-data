# Download dataset if needed, unzip it, and set the working directory
if (!file.exists("dataset.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
}
unzip("dataset.zip")
setwd("UCI HAR Dataset")

# Combine subject data
train_subject <- read.table("train/subject_train.txt")
test_subject <- read.table("test/subject_test.txt")
subject <- rbind(train_subject, test_subject)

# Combine activity data and use tidy and descriptive activity names
activity_labels <- read.table("activity_labels.txt")
train_activity <- read.table("train/y_train.txt")
test_activity <- read.table("test/y_test.txt")
activity <- rbind(train_activity, test_activity)
activity[, 1] <- as.factor(gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", gsub("_", " ", tolower(activity_labels[match(activity[, 1], activity_labels[, 1]), 2])), perl = TRUE))

# Combine measurement data
train_measurement <- read.table("train/X_train.txt")
test_measurement <- read.table("test/X_test.txt")
measurement <- rbind(train_measurement, test_measurement)

# Read feature names
features <- read.table("features.txt", colClass = "character")

# Combine all data
main <- cbind(subject, activity, measurement)
names(main) <- c("Subject", "Activity", features[, 2])

# Filter necessary columns by column name
main <- main[, (names(main) == "Subject" | names(main) == "Activity" | grepl("mean\\(\\)", names(main)) | grepl("std\\(\\)", names(main)))]

# Make column names more tidy and descriptive
names(main) <- gsub("^t", "Time", names(main))
names(main) <- gsub("^f", "Frequency", names(main))
names(main) <- gsub("-", " ", names(main))
names(main) <- gsub("mean\\(\\)", "Mean", names(main))
names(main) <- gsub("std\\(\\)", "Standard Deviation", names(main))
names(main) <- gsub("Body", " Body", names(main))
names(main) <- gsub("Gyro", " Gyroscope", names(main))
names(main) <- gsub("Acc", " Accelerometer", names(main))
names(main) <- gsub("Mag", " Magnitude", names(main))
names(main) <- gsub("Jerk", " Jerk", names(main))
names(main) <- gsub("Gravity", " Gravity", names(main))
names(main) <- gsub("Body Body", "Body", names(main))

# Create final dataset with mean for each subject and activity
tidy <- aggregate(main[, -(1:2)], by = list(Subject = main$Subject, Activity = main$Activity), FUN = mean)

# Write the final output in initial working directory
setwd("..")
write.table(tidy, "tidy.txt", row.names = FALSE)
