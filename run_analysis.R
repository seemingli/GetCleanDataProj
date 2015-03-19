## load dplyr package which will be used to extract reqd data & compute averages
library(dplyr)

## read in training and test datasets
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train<-read.csv("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
subject_train<-read.csv("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test<-read.csv("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
subject_test<-read.csv("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

## name columns of subject datasets
names(subject_train)<-c("subject")
names(subject_test)<-c("subject")

## read activity_labels.txt to name activities in labels datasets - PART 3
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,stringsAsFactor=FALSE)
y_train1<-left_join(y_train,activity_labels)
y_test1<-left_join(y_test,activity_labels)
y_train1<-rename(y_train1,activity=V2)
y_test1<-rename(y_test1,activity=V2)

## combine datasets into all dataset - PART 1
## extract mean & standard deviation for Accelerometer & gyroscope measurements - PART 2
## V1:V6 are for body acceleration measures
## V41:V46 are for gravity acceleration measures
## V121:V126 are for angular velocity measures
train<-bind_cols(subject_train,select(y_train1,activity),select(x_train,V1:V6,V41:V46,V121:V126))
test<-bind_cols(subject_test,select(y_test1,activity),select(x_test,V1:V6,V41:V46,V121:V126))
all<-rbind_list(train,test)

## Label the all dataset with descriptive variable names - PART 4
all1<-rename(all, BodyAccelerationMeanX=V1, BodyAccelerationMeanY=V2, BodyAccelerationMeanZ=V3,
             BodyAccelerationStdDeviationX=V4, BodyAccelerationStdDeviationY=V5, BodyAccelerationStdDeviationZ=V6,
             GravityAccelerationMeanX=V41, GravityAccelerationMeanY=V42,  GravityAccelerationMeanZ=V43,
             GravityAccelerationStdDeviationX=V44, GravityAccelerationStdDeviationY=V45,	GravityAccelerationStdDeviationZ=V46,
             AngularVelocityMeanX=V121,  AngularVelocityMeanY=V122,	AngularVelocityMeanZ=V123,
             AngularVelocityStdDeviationX=V124,	AngularVelocityStdDeviationY=V125,	AngularVelocityStdDeviationZ=V126)

## create tidy dataset with average of each variable for each activity and each subject - PART 5
all1<-rename(all, BodyAccelerationMeanX=V1, BodyAccelerationMeanY=V2, BodyAccelerationMeanZ=V3,
             BodyAccelerationSDX=V4, BodyAccelerationSDY=V5, BodyAccelerationSDZ=V6,
             GravityAccelerationMeanX=V41, GravityAccelerationMeanY=V42,  GravityAccelerationMeanZ=V43,
             GravityAccelerationSDX=V44, GravityAccelerationSDY=V45,	GravityAccelerationSDZ=V46,
             AngularVelocityMeanX=V121,  AngularVelocityMeanY=V122,	AngularVelocityMeanZ=V123,
             AngularVelocitySDX=V124,	AngularVelocitySDY=V125,	AngularVelocitySDZ=V126)

## create tidy dataset with average of each variable for each activity and each subject - PART 5
averages<-summarise(group_by(all1,subject,activity),MeanBodyAccelerationMeanX=mean(BodyAccelerationMeanX,na.rm=TRUE),
                    MeanBodyAccelerationMeanY=mean(BodyAccelerationMeanY,na.rm=TRUE),
                    MeanBodyAccelerationMeanZ=mean(BodyAccelerationMeanZ,na.rm=TRUE),
                    MeanBodyAccelerationSDX=mean(BodyAccelerationSDX,na.rm=TRUE),
                    MeanBodyAccelerationSDY=mean(BodyAccelerationSDY,na.rm=TRUE),
                    MeanBodyAccelerationSDZ=mean(BodyAccelerationSDZ,na.rm=TRUE),
                    MeanGravityAccelerationMeanX=mean(GravityAccelerationMeanX,na.rm=TRUE),
                    MeanGravityAccelerationMeanY=mean(GravityAccelerationMeanY,na.rm=TRUE),
                    MeanGravityAccelerationMeanZ=mean(GravityAccelerationMeanZ,na.rm=TRUE),
                    MeanGravityAccelerationSDX=mean(GravityAccelerationSDX,na.rm=TRUE),
                    MeanGravityAccelerationSDY=mean(GravityAccelerationSDY,na.rm=TRUE),
                    MeanGravityAccelerationSDZ=mean(GravityAccelerationSDZ,na.rm=TRUE),
                    MeanAngularVelocityMeanX=mean(AngularVelocityMeanX,na.rm=TRUE),
                    MeanAngularVelocityMeanY=mean(AngularVelocityMeanY,na.rm=TRUE),
                    MeanAngularVelocityMeanZ=mean(AngularVelocityMeanZ,na.rm=TRUE),
                    MeanAngularVelocitySDX=mean(AngularVelocitySDX,na.rm=TRUE),
                    MeanAngularVelocitySDY=mean(AngularVelocitySDY,na.rm=TRUE),
                    MeanAngularVelocitySDZ=mean(AngularVelocitySDZ,na.rm=TRUE))

## export the tidy averages dataset 
write.table(averages,"./TidyAverages.txt",sep="\t",row.name=FALSE)
