==================================================================
## Getting & Cleaning Data Project
==================================================================
The objective of this project is to prepare a data file with the averages of the mean and standard deviation of the Triaxial acceleration and Triaxial Angular velocity by each volunteer and each activity. 
This project made used of data collected from the accelerometers from the Samsung Galaxy S smartphone. The input data files were obtained from the site below and pls refer to the website for more details on the data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

==================================================================
### This repository includes the following files:
=============================================
- 'README.txt'
- 'run_analysis.R'
- 'CodeBook.txt'

==================================================================
### The run_analysis R script does the following :
1. load the dplyr package which is used to extract the variables we require and perform computations on the datasets
2. read the following 6 files which contains the training and test data with measurements from the accelerometer and gyroscope 
	* 'train/X_train.txt': Training set.
	* 'train/y_train.txt': Training labels.
	* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
	* 'test/X_test.txt': Test set.
	* 'test/y_test.txt': Test labels.
	* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
3. name the columns of subject datasets as 'subject'
4. read 'activity_labels.txt' to append descriptions of the activities in the labels datasets and rename the description columns as 'activity'
5. merge the training and the test sets using dplyr to create one data set 'all' which extracts only the measurements on the mean and standard deviation for the following 3 measurements :
	i. 		Body Acceleration
	ii. 	Gravity Acceleration
	iii.	Angular Velocity
6. create a 'all1' dataset which uses dplyr to rename columns of the 'all' data set with descriptive variable names.
7. create a second, independent tidy data set 'averages' which takes the average of all variables in 'all1' dataset for each activity and each subject.
8. export the 'averages' dataset as "TidyAverages.txt"

==================================================================
### The Code Book describes the variables in the file "TidyAverages.txt".

==================================================================
License:
========
Use of the input files in publications must be acknowledged by referencing the following publication [1] 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

