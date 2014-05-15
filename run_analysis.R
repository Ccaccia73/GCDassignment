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

Xtrain<-read.table(paste(c(data.dir, train.dir, X.train.DataFile), collapse=''))
Xtest<-read.table(paste(c(data.dir, test.dir, X.test.DataFile), collapse=''))

Xall<-rbind(Xtrain,Xtest)