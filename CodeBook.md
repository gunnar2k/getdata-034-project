# Introduction

This codebook describes the process used to obtain the new dataset(s).

# Data preperation

This section refers to the actual process used in run_analysis.R to obtain the desired result.

1. Merged the two datasets (X_train.txt and X_test.txt) located in their respective dataset/ directory into a new data frame X_merged
2. Set the column names of the new X_merged data frame using the existing dataset feature file (dataset/features.txt) with their appropriate names.
3. Filter out all non-mean or std related data variables from the X_merged data frame
4. Add two new columns in X_merged for the activity id and name values
5. Add a new column for the subject id
6. Write a new dataset file (output_step4.txt) for step 4
7. Group the data frame by activity and subject and then summarize the columns using the mean function
8. Write a new dataset file (output_step5.txt) for step 5

# Variables

See dataset/README.txt for information about the variables in the dataset.
