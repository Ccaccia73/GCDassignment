# packages
#package(data.table)
# read dataset


# directories

data.dir = "./UCI HAR Dataset"

train.dir = "/train"
test.dir = "/test"

# files

X.test.DataFile = "/X_test.txt"
y.test.DataFile = "/y_test.txt"

X.train.DataFile = "/X_train.txt"
y.train.DataFile = "/y_train.txt"

train.SubjectFile = "/subject_train.txt"
test.SubjectFile = "/subject_test.txt"

features.DataFile = "/features.txt"
activity_labels.DataFile = "/activity_labels.txt"

# Part 1

Xtrain<-read.table(paste(c(data.dir, train.dir, X.train.DataFile), collapse=''))
Xtest<-read.table(paste(c(data.dir, test.dir, X.test.DataFile), collapse=''))

Xall<-rbind(Xtrain,Xtest)

Ytrain<-read.table(paste(c(data.dir, train.dir, y.train.DataFile), collapse=''))
Ytest<-read.table(paste(c(data.dir, test.dir, y.test.DataFile), collapse=''))

Activity.ID <- rbind(Ytrain, Ytest)

Subj.train<-read.table(paste(c(data.dir, train.dir, train.SubjectFile), collapse=''))
Subj.test<-read.table(paste(c(data.dir, test.dir, test.SubjectFile), collapse=''))

Subj.all<-rbind(Subj.train,Subj.test)

# Part 2

features.ID <- read.table(paste(c(data.dir, features.DataFile), collapse=''))
meanStd.ID <- subset(features.ID,grepl("mean|std", features.ID[ ,2]))

MeanStd.Data <- Xall[,meanStd.ID[ ,1] ]

Data.all<-cbind(MeanStd.Data,Activity.ID,Subj.all)

# Part 3

activity.labels <- read.table(paste(c(data.dir, activity_labels.DataFile), collapse=''))

Data.all.labels <- factor(Data.all[, 80], levels = activity.labels[,1], labels = activity.labels[,2])

Data.all[, 80]<-Data.all.labels 

# Part 4

names(Data.all) <- c(as.character(meanStd.ID[,2]),"Activity", "Subject")

# Part 5



