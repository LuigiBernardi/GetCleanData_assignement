## INTRO ----

library(tidyverse) # required because i used dplyr verbs for completing the assignement

path <- "./data" # replace with your local path to unzipped "UCI HAR Dataset" directory before running or sourcing
                 # the script to replicate my analysis


## STEP 1 ----
## Merges training and test sets to create one data set

# reading train data and binding columns in a sigle traning dataset
# data from X.train will be labbeled in step 4

subject_train <- read_delim(file.path(path, "UCI HAR Dataset/train/subject_train.txt"),
                            delim = " ",
                            col_names = "subject",
                            col_types = "c")

y_train <- read_delim(file.path(path, "UCI HAR Dataset/train/y_train.txt"),
                      delim = " ",
                      col_names = "activity",
                      col_types = "c")

X_train <- read_delim(file.path(path, "UCI HAR Dataset/train/X_train.txt"),
                      delim = " ",
                      col_names= FALSE,
                      col_types = cols(.default = "n"))

train_data <- bind_cols(subject_train, y_train, X_train)
rm(subject_train, y_train, X_train)

# reading test data and binding columns in a sigle test dataset
# data from X.test will be labbeled in step 4

subject_test <- read_delim(file.path(path, "UCI HAR Dataset/test/subject_test.txt"),
                           delim = " ",
                           col_names = "subject",
                           col_types = "c")

y_test <- read_delim(file.path(path, "UCI HAR Dataset/test/y_test.txt"),
                     delim = " ",
                     col_names = "activity",
                     col_types = "c")

X_test <- read_delim(file.path(path, "UCI HAR Dataset/test/X_test.txt"),
                     delim = " ",
                     col_names= FALSE,
                     col_types = cols(.default = "n"))

test_data <- bind_cols(subject_test, y_test, X_test)
rm(subject_test, y_test, X_test)

# merging train and test data

my_data <- bind_rows(train_data, test_data)
rm(train_data, test_data)


## STEP 2 ----
## Extracts only the measurements on the mean and standard deviation for each measurement
##
## I decided to extract just mean value and standard deviation value for each signal, as specified in
## feature_info.txt these measurements are labelled by mean() o std() suffix

# reading feature codes and labels

features <- read_delim(file.path(path, "UCI HAR Dataset/features.txt"),
                       delim = " ",
                       col_names = c("feature_code", "feature_label"),
                       col_types = "cc")

# selecting features with mean() and std() suffix

mean_sd_features <- filter(features, str_detect(feature_label, "mean\\(\\)") | str_detect(feature_label, "std\\(\\)"))

# creating a vector with column's index to extract from my_data dataset

index_to_extract <- c(1, 2, as.numeric(mean_sd_features$feature_code) + 2)

# extracting columns corresponding to mean and standard deviation

my_data <- select(my_data, index_to_extract)


## STEP 3 ----
## Uses descriptive activity names to name the activities in the data set

# reading and sorting activity_labels.txt

activity_labels <- read_delim(file.path(path, "UCI HAR Dataset/activity_labels.txt"),
                              delim = " ",
                              col_names = c("activity_code", "activity_label"),
                              col_types = "cc")

activity_labels <- arrange(activity_labels, activity_code)

# converting activity variable in my_data to factor with appropriate levels and labels

my_data <- my_data %>%
      mutate(activity = factor(activity,
                               levels = activity_labels$activity_code,
                               labels = str_to_lower(str_replace(activity_labels$activity_label, "_", " "))))


## STEP 4 ----
## Appropriately labels the data set with descriptive variable names

# creating a label's vector with more readable names than the original

var_names <- mean_sd_features$feature_label
var_names <- str_replace(var_names, "-mean\\(\\)-", "_mean_")
var_names <- str_replace(var_names, "-mean\\(\\)", "_mean")
var_names <- str_replace(var_names, "-std\\(\\)-", "_sd_")
var_names <- str_replace(var_names, "-std\\(\\)", "_sd")

# labelling variables

names(my_data)[-(1:2)] <- var_names


## STEP 5 ----
## From the data set in step 4, creates a second, independent tidy data set with the average
## of each variable for each activity and each subject
##
## I decided to tidy data considering each measurement as variable and leaving them in colums
## Rows are 180 resulting from each possible combination of the 30 subjects and the 6 activities


# creating tidy dataset

my_tidy_data <- my_data %>% 
      group_by(subject, activity) %>% 
      summarise_at(vars(-group_cols()), mean, na.rm = TRUE) %>% 
      ungroup()

# renaming variables adding "_average" suffix

names(my_tidy_data)[-(1:2)] <- paste(names(my_tidy_data)[-(1:2)], "_average", sep = "")

# exporting data for upload

write.table(my_tidy_data, file = file.path(path, "my_tidy_data.txt"), row.name = FALSE)
