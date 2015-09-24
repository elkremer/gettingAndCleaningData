# gettingAndCleaningData Project
project for Getting and Cleaning Data

##Instructions for Running run_analysis.R
The script requires the libraries dplyr and reshape2. Both will be loaded at the beginning of the script.
However, if you have not installed the libraries, it will not work (install.packages("dplyr") and install.packages("reshape2")).

The data should be downloaded to your working directory. 
The source data for this project can be found here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The data was unzipped in the working directory and should have a base directory called 'UCI HAR Dataset'.
The script will find the files needed using 'UCI HAR Dataset' as the base.

##Summary
 You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Files
Under the 'UCI HAR Dataset' directory will be an activity_labels.txt file and a features.txt file. 
Additionally, there will be a test and a train directory.
Inside the test directory will be three files: subject_text.txt, X_test.txt and y_test.txt
Inside the train directory will be three files: subject_train.txt X_train.txt and y_train.txt

subject_test.txt - contains a list of ids which correspond to the subject being tested. Each line of the file corresponds to a row of data in the X_test.txt file.

y_test.txt - contains a list of ids for the type of activity being measured. Each row corresponds to a row in the X_test.txt file.

X_test.txt - contains the data measured in the study.

subject_train.txt - contains a list of ids which correspond to the subject being tested. Each line of the file corresponds to a row of data in the X_train.txt file.

y_train.txt - contains a list of ids for the type of activity being measured. Each row corresponds to a row in the X_train.txt file

X_train.txt - contains the data measured in the study.

activity_lables.txt - Contains a list of 6 activities. These correspond to the y_test.txt and y_train.txt files.

features.txt - contains a list of all the column names. These correspend to the X_test.txt and X_train.txt files.

##Acknowledgements
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
