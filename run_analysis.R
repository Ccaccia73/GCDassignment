# libraries
library(reshape2)

# read dataset

# directories and filenames
# the dataset is supposed to be extracted in the file directory
# i.e. it is contained in the "UCI HAR Dataset" subdirectory

data.dir <- "./UCI HAR Dataset"

train.dir <- "/train"
test.dir <- "/test"

# files

X.test.dataFile <- "/X_test.txt"
y.test.dataFile = "/y_test.txt"



X.train.dataFile = "/X_train.txt"
y.train.dataFile = "/y_train.txt"

train.subjectFile = "/subject_train.txt"
test.subjectFile = "/subject_test.txt"

features.dataFile = "/features.txt"
activity.labels.dataFile = "/activity_labels.txt"

## Part 1
# a) Extract train and test Features (X)
# b) Extract train and test activity IDs (y)
# c) merge train and test X and y
# d) extract subject data and merge toghether

# a)
X.train<-read.table(paste(c(data.dir, train.dir, X.train.dataFile), collapse=''))
X.test<-read.table(paste(c(data.dir, test.dir, X.test.dataFile), collapse=''))

# b)
y.train<-read.table(paste(c(data.dir, train.dir, y.train.dataFile), collapse=''))
y.test<-read.table(paste(c(data.dir, test.dir, y.test.dataFile), collapse=''))

# c)
X.all<-rbind(X.train,X.test)
activity.id <- rbind(y.train, y.test)

#d)
subject.train<-read.table(paste(c(data.dir, train.dir, train.subjectFile), collapse=''))
subject.test<-read.table(paste(c(data.dir, test.dir, test.subjectFile), collapse=''))

subject.all<-rbind(subject.train,subject.test)

## Part 2
# a) read feature names and extract only the ones concerning means and standard deviations
# b) finally merge the whole dataset (data.all)

# a)
features.id <- read.table(paste(c(data.dir, features.dataFile), collapse=''))
mean.std.id <- subset(features.id,grepl("mean|std", features.id[ ,2]))

mean.std.data <- X.all[,mean.std.id[ ,1] ]

# b)
data.all<-cbind(mean.std.data,activity.id,subject.all)


## Part 3
# a) read activity labels
# b) rename activities in the dataset

# a)
activity.labels <- read.table(paste(c(data.dir, activity.labels.dataFile), collapse=''))

# b)
data.all.labels <- factor(data.all[, 80], levels = activity.labels[,1], labels = activity.labels[,2])
data.all[, 80]<-data.all.labels 

## Part 4
# change names according to variable names

names(data.all) <- c(as.character(mean.std.id[,2]),"Activity", "Subject")

## Part 5
# a) reshape the data and create a new dataframe with means
#    grouped by activity and subject
# b) name variables of averaged dataset
# c) output tidy dataset and dataset with averages

# a)
all.data.melt<-melt(data.all,id=c("Activity","Subject"))
all.data.avg<-dcast(all.data.melt,Activity+Subject~variable,mean)

# b)
col.names.upd<-lapply(names(all.data.avg)[-(1:2)], function(name) paste(c("mean(", name, ")"), collapse='') )
names(all.data.avg)<-c("Activity", "Subject", col.names.upd)

# c)
write.table(data.all,file="AllData.txt",sep=" ",append=FALSE)
write.table(all.data.avg,file="DataGrouped.txt",sep=" ",append=FALSE)
