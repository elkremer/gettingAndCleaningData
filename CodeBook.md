#CodeBook for Getting and Cleaning Data project

##Data Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Column information
The columns originally come from the features.txt file. Features and columns can be used interchangeably for the purpose of this section.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

-nmean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

For clarity, the following changes were made to the column names while processing.
- All "(" and ")" were removed from the feature name
- All "," were changed to "_" in the feature name
- "Mag" was changed to "Magnitude" in the feature name
- "-std" was changed to "StdDev" in the feature name
- "-mean" was changed to "Mean" in the feature name
- All "-" were changed to "_" in the feature name

##Step 1. Merges the training and the test sets to create one data set.
- Read in the Train data set ('UCI HAR Dataset/train/X_train.txt')
- Read in the Test data set ('UCI HAR Dataset/test/X_test.txt')
- Read in the subject_train.txt file and name the column "subject" ('UCI HAR Dataset/train/subject_train.txt')
- Read in the subject_test.txt file and name the column "subject" ('UCI HAR Dataset/test/subject_test.txt')
- Read the column names in from the features.txt file ("UCI HAR Dataset/features.txt")
- Read in the activity lables ("UCI HAR Dataset/activity_labels.txt")
- Read in the activity information and name the column activityId 
    ('UCI HAR Dataset/test/y_test.txt', 'UCI HAR Dataset/train/y_train.txt')
- (Step 4.)set the column names of train and test to features (Note: This was done before 
    merging to make it easier to look at the data)
- Two datasets were then created with cbind. One for the test data and one for the train data.
These were created by the subject, activity and the data set.
- The two dataseets were then merged with rbind

##Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Extracts only the measurements on the mean and standard deviation for each measurement. 
Extracted only column names matching activityId, subject, Mean and StdDev

##Step 3. Uses descriptive activity names to name the activities in the data set.
Changed the value of the activityId column to match the corresponding value from the activitylabels

##Step 4. Appropriately labels the data set with descriptive variable names.
This was done out of order, please see note above in Step 1

##Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The merged data is then grouped by subject and activityId and passed to summarize_each for the mean
