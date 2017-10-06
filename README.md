# Cleaning-Data-project

This is a project that creates a summary table with the averages by subject and type of activity from the data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0", for all the variables corresponding to 'means' or ' standard deviations'

## Files in the repository

In this repository, you will find 4 files:

- README.md - this file
- run_analysis.R - the script used to obtain the summary table from the raw dataset
- tidytable.txt - the summary table
- CodeBook.md - description of the variables and the data in "tidytable.txt"

## Description of the script "run_analysis.R"

Here are the steps that were followed in the script:

1 - read the tables with the values for all the variables for the two subsets ('train' and 'test)
2 - read the tables with the type of activity for each record for the two subsets
3 - read the tables with the subject identifier for each record for the two subsets
4 - read the tables with the variable names and the activity labels
5 - change the integer in the activity column by the corresponding label  
6 - assign the names of all the variables in the tables
7 - merge the datasets
8 - change the name of the variables so that they can be read the functions in R
9 - create a subset with only the variables which correspond to 'means' or 'stardard deviations'
10 - create a summary table with the mean of all the variables in the previous table by subject and type of activity and write it to the file 'tidytable.txt'
