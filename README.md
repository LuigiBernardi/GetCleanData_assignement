# My assignement for Getting and Cleaning Data explained


Disclaimer: I'm not a native English speaker and I apologize for any mistake or poor phrase.


## Content of this repository 

In this repository you'll find 4 files:

* `README.md` is this file in which I explain how to replicate my analysis, how to load my data into R and the choices I made to complete the assignement;

* `CodeBook.md` is th a code book that describes all the object and variables I created, along with units, and any other relevant information;

* `run_analysis.R` is the R script that contains the code used for completing each of the 5 steps;

* `my_tidy_data.txt` placed in `data` directory is the tidy dataset requested in step n. 5;


## How to replicate my analysis and load my data into R

If you want to replicate my analisys you can either:

* execute `run_analysis.R` script after replacing `path <- "./data"` with your local path to unzipped "UCI HAR Dataset" directory

* load directly my tidy dataset in R using
```R
path <- "your local path" # replace with your local path to downloaded file
Luigi_tidy_data <- read.table(file.path(path, "my_tidy_data.txt"), header = TRUE)
```


## My choices to complete the assignement

For completing the 5 steps I've often used packages in `tidyverse` library, so my dataset are mainly tibbles. Details on my choices about required task can be found in `run_analysis.R` and `CodeBook.md`. 

# Step 1: merging training and test datasets
I've loaded 3 files for training data (subject_train.txt, y_train, X_train) and binded them by columns into a sigle traning dataset. Then I did the same for test data and finally I merged training and test data into one dataset called `my_data` binding rows. Because is a task required in step 4, in this first step named just subject and activity variables leaving other variables with default names assigned by `read_delim()`: X1, X2 and so on.

# Step 2: 