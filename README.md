This script was created for the Course Project on "Getting and Cleaning Data" offered by Johns Hopkins on Coursera: https://class.coursera.org/getdata-002
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The instructions are as follows: 
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

My script does the following: 
1. Loads all the data from the data sets into variables. 
2. It then uses the activity and features data sets to create column names. 
3. It then matches activity (e.g. Walking) to the proper numbers in the data set. 

Once all that is down, it combines all the above data into a single large data set. 
After that the script creates a new data set that only includes the data for subject, activity, and any variables with mean or standard deviation. Variables with MeanFreq() are excluded as per supplementary instructions provided on the coure forums. 

Now comes the fun part! The script melts down the new filtered data set and recasts it into a tidy data set that shows an entry for each subject and activity (180 rows total) and along with the averages across the mean and standard deviation numbers. 

Thank you for you peer assessment. 