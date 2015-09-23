#Load needed libraries
library(dplyr)
library(reshape2)

#Read in the Train data set
train<-read.table('UCI HAR Dataset/train/X_train.txt', header = FALSE)
#Read in the Test data set
test<-read.table('UCI HAR Dataset/test/X_test.txt', header = FALSE)

#Read in the subject_train.txt file and name the column
subjectTrain<-read.table('UCI HAR Dataset/train/subject_train.txt', header = FALSE)
colnames(subjectTrain)<-"subject"
#Read in the subject_test.txt file and name the column
subjectTest<-read.table('UCI HAR Dataset/test/subject_test.txt', header = FALSE)
colnames(subjectTest)<-"subject"

#Read the column names in from the features.txt file
features<-read.csv("UCI HAR Dataset/features.txt", sep="\t", header = FALSE)
#features<-read.table('UCI HAR Dataset/features.txt',header=FALSE);

#Read in the activity lables
activityLables<-read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Read in the activity information and name the column
activityTest<-read.table('UCI HAR Dataset/test/y_test.txt', header = FALSE)
colnames(activityTest)<-"activityId"
activityTrain<-read.table('UCI HAR Dataset/train/y_train.txt', header = FALSE)
colnames(activityTrain)<-"activityId"

#Remove the numbers and blank space at the beginning,
#change , and - to _
#change Mag to Magnitude
#change -std to StdDev
#change -mean to Mean
ft<-gsub("[()]","",features[,]) %>%
    gsub(",","_", .) %>%
    gsub("^\\d+ ","", .) %>%
    gsub("Mag","Magnitude", .) %>%
    gsub("-std","StdDev", .) %>%
    gsub("-mean", "Mean", .) %>%
    gsub("-", "_", .)

#set the column names of train and test to features
#4. Appropriately labels the data set with descriptive variable names. 
colnames(test)<-ft
colnames(train)<-ft

testData<-cbind(subjectTest,activityTest,test)
trainData<-cbind(subjectTrain,activityTrain,train)

#1. Merges the training and the test sets to create one data set.
mergedData<-rbind(testData,trainData)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
columnsToKeep<-grep("activityId|subject|Mean|StdDev",colnames(mergedData))
finalData<-mergedData[columnsToKeep]

#3. Uses descriptive activity names to name the activities in the data set
fn<-function(x) {
    num<-x$activityId
    finalData$activityId<<-activityLables[num,]$V2}
fn(finalData)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
melted<-melt(finalData, id.vars = c("subject", "activityId"))
tidyData<-group_by(finalData, subject, activityId) %>% summarize_each("mean")

write.table(tidyData,"tidyData.txt", row.names = FALSE)