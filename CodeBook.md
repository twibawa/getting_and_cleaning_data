# Code Book 

The experiment was conducted to measure numerous physiological signals
of people, in this case 30 volunteers, when various sensors were attached 
to their bodies.

Thirty persons as object of experiment, age between 19-48 years, by wearing
a smartphone(Samsung Galaxy S II) on the waist, performed six activities
(walking, walking upstairs, walking downstairs, sitting, standing and 
laying). Their physiological signals were recorded using accelerometer
and  gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ within a 50 Hz 
constant rate. 

The obtained dataset were filtered using very complex and sophiscated
filter method in order to remove the noise, and they were randomly
partitioned into two groups : 70 % as train dataset, and 30 % as test 
dataset. The main variables within the dataset are :

tBodyAcc-XYZ		
tGravityAcc-XYZ	
tBodyAccJerk-XYZ 
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The 'f' in the variable name indicate frequency domain signals, so for
example fBodyAccJerk-bandsEnergy()-9,16, its mean body linear accelaration
measured within 9,16 Hz frequency.

As only mean and standard deviation used within the analysis, those 
names of mentioned variables only followed with mean() and std() which 
indicate the mean and standard deviation of the variable.


