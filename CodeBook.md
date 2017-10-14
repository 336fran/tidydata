# Code Book

## Variables

mdtrain: data.frame with data from the training
mdtest: data.frame with data from the test sets
md: merged data
md2: independent tidy data set with the average of each variable for each activity and each subject

## Description

Each of the data.frames listed above contain the same rows:
* subject: subject id
* set: train or test
* activity: walking, upstairs, downstairs, sitting, standing, laying
* measurements: the mean and the sd for each measurement. The name of the measurements is stored in the character "features".
