# My assignement for Getting and Cleaning Data explained


Disclaimer: I'm not a native English speaker and I apologize for any mistake or poor phrase present in the files stored in this repository.


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