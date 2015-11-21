# Getting started

* First clone the project: `git clone https://github.com/gunnar2k/getdata-034-project.git`
* Set your working directory using `setwd()` to your cloned getdata-034-project folder.
* In R, run the main script: `source("run_analysis.R")`
* Look for the outputted output_step4.txt and output_step5.txt files

# Data preperation process

This section refers to the actual process used in run_analysis.R to obtain the desired result:

1. Merges the two datasets (X_train.txt and X_test.txt) located in their respective dataset/ directory into a new data frame X_merged
2. Sets the column names of the new X_merged data frame using the existing dataset feature file (dataset/features.txt)
3. Filteres out all non-mean or non-std related data variables from the new X_merged data frame
4. Adds two new columns in X_merged for the activity related fields (id and label).
5. Merges the activity label into X_merged as a new column
6. Merged the subject id into X_merged as a new column using the subject_*.txt file
7. Outputs X_merged to a new dataset file called output_step4.txt using write.table
8. Groups the X_merged data frame by activity and subject and then summarize the columns using the mean function
9. Outputs X_merged to a new dataset file called output_step5.txt using write.table
