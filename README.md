# My assignement for Getting and Cleaning Data explained

## Content of this repository 

In this repository you'll find 3 files

* `README.md` is this file in which I explain how to replicate my analysis, how to load my data into R and the choices I made to complete the assignement

* `run_analysis.R` is the R script that contains the code used for completing each of the 5 steps

* `my_tidy_data.txt` placed in `data` directory is the tidy dataset requested in step n. 5

## How to replicate my analysis and load my data into R




```R
path <- "your local path" # replace with your local path to downloaded file
Luigi_tidy_data <- read.table(file.path(path, "my_tidy_data.txt"), header = TRUE)
```