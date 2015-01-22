rm(list = ls(all = T))

dir <- "/homelocal/twibawa/coursera/getting_and_cleaning_data/course_project1/UCI HAR Dataset/"
setwd(dir)

#read feaature
ftr <- readLines("features.txt")
#read activity labels
act_label <- readLines("activity_labels.txt")

#directory train data
indir1 <- "/homelocal/twibawa/coursera/getting_and_cleaning_data/course_project1/UCI HAR Dataset/train/"
#directory test data
indir2 <- "/homelocal/twibawa/coursera/getting_and_cleaning_data/course_project1/UCI HAR Dataset/test/"

#read train dataset
train.dat <- read.table(file = paste(indir1, "X_train.txt", sep = ""), header = F)
colnames(train.dat) <- seq(1,561, 1)
train.subject <- read.table(file = paste(indir1, "subject_train.txt", sep = ""), header = F)
colnames(train.subject) <- "subject"
train.act <- read.table(file = paste(indir1, "y_train.txt", sep = ""), header = F)
colnames(train.act) <- "action"
#constructing train dataset
train <- as.data.frame(cbind(train.subject,train.act,train.dat))

#read test dataset
test.dat <- read.table(file = paste(indir2, "X_test.txt", sep = ""), header = F)
colnames(test.dat) <- seq(1,561, 1)
test.subject <- read.table(file = paste(indir2, "subject_test.txt", sep = ""), header = F)
colnames(test.subject) <- "subject"
test.act <- read.table(file = paste(indir2, "y_test.txt", sep = ""), header = F)
colnames(test.act) <- "action"
#constructing train dataset
test <- as.data.frame(cbind(test.dat,test.subject,test.act))

#1. merge training and test data
dat <- rbind(train, test)

#2. extracts only the measurements on the mean and standard deviation for each measurement 
#extract from feature.txt which only contain mean or std
ab <- grepl("\\<mean\\>|\\<std\\>", ftr)
#subset feature
ac <- ftr[ab]
#extract numbers of feature
ad <- c(sapply(strsplit(ac, split = " ", fixed = T), FUN = "[", 1))
#subset data based on subsetted feature
dat2 <- dat[,c("subject", "action", ad)]

#3. Uses descriptive activity names to name the activities in the data set
ca <- c(sapply(strsplit(act_label, split = " ", fixed = T), FUN = "[", 1))
cb <- c(tolower(sapply(strsplit(act_label, split = " ", fixed = T), FUN = "[", 2)))
cc <- data.frame(cbind(ca, cb))
#looping to change value within coloum action, 1 is change to WALKING, etc..
dat3 <- NULL
for (i in unique(cc$ca)){
	cd <- which(dat2$action == i)
		if (length(cd > 0)){
		cdi <- dat2[cd,]
			if (length(cdi > 0)){
			print(cdi[1,])
			cdi$action <- gsub(cdi$action, cc$cb[which(cc$ca==i)], cdi$action)
			print(cc$cb[which(cc$ca==i)])
			dat3 <- rbind(dat3, cdi)
			}
		}
}
#dat3 <- data.frame(dat3)


#4. Appropriately labels the data set with descriptive variable names
#extract from feature
da <- c(sapply(strsplit(ac, split = " ", fixed = T), FUN = "[", 2))
#define header
header <- c("subject", "action", da)
#change colomn names entirely with header
colnames(dat3) <- header

#5. From the data set in step 4, creates a second, independent tidy data set with the 
##  average of each variable for each activity and each subject
library(plyr)
dat4 <- ddply(dat3, .(subject, action), function(x) colMeans(x[,3:ncol(dat3)]))

#write results in a table
write.table(dat4, "av_dat.txt", row.name=FALSE, sep = "\t")
