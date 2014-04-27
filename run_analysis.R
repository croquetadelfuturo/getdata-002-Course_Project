library(reshape2)
library(data.table)

#Read data sets
teSubjects = fread("test/subject_test.txt")
xTestData <- read.table("test/X_test.txt") #fread doesn't work on this data set
yTestData <- fread("test/y_test.txt")
trSubjects = fread("train/subject_train.txt")
xTrainData <- read.table("train/X_train.txt") #fread doesn't work on this data set
yTrainData <- fread("train/y_train.txt")

#Set variable and column names correctly
aLabels <- fread("activity_labels.txt")
featureNames <- fread("features.txt")
setnames(aLabels, "V2", "Activity")
setnames(featureNames, "V2", "Feature")
setnames(teSubjects, "V1", "Subject")
setnames(trSubjects, "V1", "Subject")
names(xTestData) <- featureNames$Feature
names(xTrainData) <- featureNames$Feature

#Combine into 2 data sets
allTestData = cbind(teSubjects, yTestData, xTestData)
allTrainData = cbind(trSubjects, yTrainData, xTrainData)

#Create single data set
allData <- rbind(allTestData, allTrainData)

#Extract mean and std deviation columns
meanStdGrep <- grep("Subject|V1|mean\\(|std", colnames(allData))
meanStdData <- allData[, meanStdGrep, with=F]
meltData<-melt(meanStdData, id.vars = c("Subject", "V1"))

#Melt and Cast, getting the average for all mean and std variables
castData<- dcast(meltData, Subject + V1 ~ variable, mean)
mergedCastData<-merge(aLabels, castData, by="V1")

#Add clearer names and remove the numeric column for activities
colnames(mergedCastData) <- paste("Avg", colnames(mergedCastData), sep = "_")
DTmergedCastData <- data.table(mergedCastData)
setnames(DTmergedCastData, "Avg_Subject", "Subject")
setnames(DTmergedCastData, "Avg_Activity", "Activity")
DTmergedCastData[,"Avg_V1":=NULL]


