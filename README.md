# Cleaning_Data_Project
This project contains the run_analysis.R and codebook for the Coursera Getting and Cleaning data project due on 27/12/15.

The run_analysis.r file will:

1. Read the lables and the feature information
2. Return only the standard deviation and mean of the features
3. Load the datasets and merge with the lables
4. Turn the activity and subjects into factors
5. Create the tidy dataset and output it to tidy.txt

Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
Loads the activity and subject data for each dataset, and merges those columns with the dataset
Merges the two datasets
Converts the activity and subject columns into factors
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy.txt.
