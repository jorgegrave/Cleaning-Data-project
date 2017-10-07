## CodeBook for the table in 'tidytable.txt'

Here is the description of the variables in 'tidytable.txt':

- subject - identifier of the individual (between 1 and 30)
- activity - type of activity performed by the individual

The data in the next columns show the average (normalized and bounded within [-1,1]) for each activity and each individual of the variables in the corresponding column. These variables are the means (mean) or standard deviations (std) (for each of the 3-axial signals X,Y,Z) of the following :

- body and gravity acceleration signals (tBodyAcc(X|Y|Z)(mean|std) and tGravityAcc(X|Y|Z)(mean|std))
- Jerk signals (tBodyAccJerk(X|Y|Z)(mean|std) and tBodyGyroJerk(X|Y|Z)(mean|std)) and their magnitude (tBodyAccMag(mean|std), tGravityAccMag(mean|std), tBodyAccJerkMag(mean|std), tBodyGyroMag(mean|std), tBodyGyroJerkMag(mean|std))
- Fast Fourier Transform (FFT) producing fBodyAcc(X|Y|Z)(mean|std), fBodyAccJerk(X|Y|Z)(mean|std), fBodyGyro(X|Y|Z)(mean|std), fBodyAccJerkMag(mean|std), fBodyGyroMag(mean|std), fBodyGyroJerkMag(mean|std)
