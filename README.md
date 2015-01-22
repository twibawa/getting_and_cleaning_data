# Getting and Cleaning Data

This README.md describes how the constructed R script (run_analysis.R)
is working to process dataset of Human Activity Recognition Using Smartphones

The first step, the data was downloaded and unzipped within working directory. As a note, those processes were conducted with another R script which is not included within run_analysis.R

Then, how the run_analysis.R works will be explained within the following paragraphs :

After determining working directory, the files which are required within the analysis were read. They are list of all feature (features.txt), information of all the activity name (activity_labels.txt), and both train and test dataset within each it's folder. Each of dataset type contain three files: "X_*.txt", "subject_*.txt" and "y_*.txt".  The subject file indicates examined volunteers (1-30) and y file contains six volunteers activities (walking, walking_upstairs, walking_downstars, sitting, standing and laying) by wearing a smartphone on the waist.  
