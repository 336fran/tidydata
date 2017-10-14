# It uses the package data.table to manipulate the data
library(data.table)

## Features. Extract the mean and standard deviation for each measurement
fname<-"./UCI HAR Dataset/features.txt"  
mdf<-read.table(fname, colClasses = "character")
features<-mdf$V2
# ic<-grep("[Mm]ean|[Ss]td",features)
ic<-grep("mean\\(|std",features)
features<-features[ic]
features<-gsub("\\()","",features); # replace all
features<-gsub("-","_",features); # replace all
features<-tolower(features)

## Train. Loads train dataset
# Subject
fname<-"./UCI HAR Dataset/train/subject_train.txt"  
md<-read.table(fname)
md<-as.data.table(md)
md<-md[,.(id=V1)]; # rename
setnames(md,"id","subject"); # rename2
# Set. train or test
md[,set:="train"]
# Activities. descriptive activity names to name the activities in the data set
fname<-"./UCI HAR Dataset/train/y_train.txt"  
mdyt<-read.table(fname)
fa1<-factor(mdyt[,1])
levels(fa1)<-c("walking","upstairs","downstairs","sitting","standing","laying")
md[,activity:=fa1]
# Measurements
fname<-"./UCI HAR Dataset/train/X_train.txt"  
mdx<-read.table(fname)
mdx<-mdx[,ic]
names(mdx)<-features
# Bind. Saves the dataframe
mdtrain<-data.table(md,mdx)

## Test. Loads train dataset
# Subject
fname<-"./UCI HAR Dataset/test/subject_test.txt"  
md<-read.table(fname)
md<-as.data.table(md)
md<-md[,.(id=V1)]; # rename
setnames(md,"id","subject"); # rename2
# Set. Train or Test
md[,set:="test"]
# Activities
fname<-"./UCI HAR Dataset/test/y_test.txt"  
mdyt<-read.table(fname)
fa1<-factor(mdyt[,1])
levels(fa1)<-c("walking","upstairs","downstairs","sitting","standing","laying")
md[,activity:=fa1]
# Measurements
fname<-"./UCI HAR Dataset/test/X_test.txt"  
mdx<-read.table(fname)
mdx<-mdx[,ic]
names(mdx)<-features
# Bind. Saves the dataframe
mdtest<-data.table(md,mdx)

## Merge test and train datasets
md<-rbind(mdtrain,mdtest)
md<-md[order(subject)]

## tidy data set with the average of each variable for each activity and subject
md2<-md[, lapply(.SD,mean), by=.(subject,activity,set)]

## write table
write.table(md2,"./tidydata_c3.txt",row.name=FALSE)

