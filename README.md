# My assignement for Getting and Cleaning Data explained


Disclaimer: I'm not a native English speaker and I apologize for any mistake or poor phrase.


## Content of this repository 

In this repository you'll find 4 files:

* `README.md` is this file in which I explain how to replicate my analysis, how to load my data into R and the choices I made to complete the assignment;

* `CodeBook.md` is the a code book that describes all the object and variables I created or modified;

* `run_analysis.R` is the R script that contains the code used for completing each of the 5 steps;

* `my_tidy_data.txt` placed in `data` directory is the tidy data set requested in step n. 5;


## How to replicate my analysis and load my data into R

If you want to replicate my analysis you can either:

* execute `run_analysis.R` script after replacing `path <- "./data"` with your local path to unzipped "UCI HAR Dataset" directory

* load directly my tidy data set in R using
```R
path <- "your local path" # replace with your local path to downloaded file
Luigi_tidy_data <- read.table(file.path(path, "my_tidy_data.txt"), header = TRUE)
```


## My choices to complete the assignement

For completing the 5 steps I've often used packages in `tidyverse` library, so my data set are mainly tibbles. Details on my choices about required task can be found in `run_analysis.R` and `CodeBook.md`. 

### Step 1: merging training and test data sets
I've loaded 3 files for training data (subject_train.txt, y_train, X_train) and binded them by columns into a single training data set. Then I did the same for test data and finally I merged training and test data into one data set called `my_data` binding rows. Because is a task required in step 4, in this first step named just subject and activity variables leaving other variables with default names assigned by `read_delim()`: X1, X2 and so on.

### Step 2: extracting mean and standard deviation for each measurement
I decided to extract mean and standard deviation computed on these signals, as specified in features_info.txt file:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

These variables are identified by mean() and std() suffix. In total I extracted 66 variables. There are other variables that involve a mean computation but they are used in the angle() variables and so I didn't extract them.

### Step 3: naming the activities in the data set
I named activities converting to factor `activity` variable of `my_data`. I defined levels and labels according to activity_labels.txt file.

### Step 4: labelling data set with descriptive variable names
I labelled `my_data` variables according to features.txt file transforming names to make them a more readable.

### Step 5: creating a second and independent tidy data set with the average of each variable for each activity and each subject
I finally created a second data set called `my_tidy_data.txt` (you can find it in `data` directory). According to [Hadley Wickham's paper on tidy data](http://vita.had.co.nz/papers/tidy-data.pdf) a data set is tidy when:

1. each variable forms a column,
2. each observation forms a row,
3. each type of observational unit forms a table.







