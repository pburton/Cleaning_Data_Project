library(reshape2)
setwd ('C:\\Users\\Peter\\Documents\\R')


alables <- read.table("UCI HAR Dataset/activity_labels.txt")
alables[,2] <- as.character(alables[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])


featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)



train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWanted]
tactivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
tsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(tsubjects, tactivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)


FullData <- rbind(train, test)
colnames(FullData) <- c("subject", "activity", featuresWanted.names)


FullData$activity <- factor(FullData$activity, levels = alables[,1], labels = alables[,2])
FullData$subject <- as.factor(FullData$subject)

FullData.melted <- melt(FullData, id = c("subject", "activity"))
FullData.mean <- dcast(FullData.melted, subject + activity ~ variable, mean)

write.table(FullData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
