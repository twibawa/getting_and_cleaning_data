# Getting and Cleaning Data

This README.md describes how the constructed R script (run_analysis.R)
is working to process dataset of Human Activity Recognition Using Smartphones

The first step, the data was downloaded and unzipped within working directory. As a note, those processes were conducted with another R script which is not included within run_analysis.R

Then, how the run_analysis.R works will be explained within the following paragraphs :

After determining working directory, the files which are required within the analysis were read. They are list of all feature (features.txt), information of all the activity name (activity_labels.txt), and both train and test dataset within each it's folder. Each of dataset type contain three files: "X_*.txt", "subject_*.txt" and "y_*.txt".  The subject file indicates examined volunteers (1-30) and y file contains six volunteers activities (walking, walking_upstairs, walking_downstars, sitting, standing and laying) by wearing a smartphone on the waist. The main files ("X_*.txt") were read using read.table() and their header were named as it's coloumn number. Those file contains 561 coloumns, so the first coloumn was named by 1, scond coloumn by 2, etc... Then, those three files of test dataset were couloumn binded using cbind(), as well as three files of train dataset. Due test and train dataset already had similar header, they were easily to be merged into one dataset using rbind().

The assignment 2 required only dataset which contain mean and standard deviation used within the analysis. So, the feature names which contain those two words were filtered using grepl(). Then, filtered feature were extracted its number, for example "1 tBodyAcc-mean()-X" was splitted to extract value 1. Those number of filtered feature were used to subset dataset based on its coloumn names.

The assignment 3 is related to replace six volunteers activities by its description mentioned within activity labels which was read previously. The file was separated its contains, and a dataframe with two coloumns was constructed. The first coloumn relates to number of activity (1,2,3,4,5,6), and the second was its description. Then a looping was conducted to change activity information within dataset. It's mainly conducted using gsub() function.

The assignment 4 is conducted to replace header name of dataset with variable names. So, as assignment 2, the filtered feature were splitted, and extracted its description, for example "1 tBodyAcc-mean()-X" was splitted to extract tBodyAcc-mean()-X. Then a vector called header, which contains subject(no of volunters), action(activity) and extracted feature names was constructed. As the dataset has the similar coloumn number with the vector, the header names of dataset were easily replaced with the vector by using colnames() function.

The assignement 5 is conducted to calculate mean of each variable for each of activity and volunteer number. A ddply() function from plyr library was employed and the result was written using write.table() function.



