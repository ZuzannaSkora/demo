# Script for my awesome project
#  Master analysis script that creates figures

# NOTES
# In R folder we have all the functions we need to run our code in this script
# Git will only save change once I click "commit"
# "commit" is freezing in time all previous versions
# to send the current version to cloud (github) I have to press "push"
# files in gitignore will not make it past R (so not going to git), 
# you can hide data by adding it to gitignore
# if I have an empty folder it's not gonna be put on github

# run all the files (functions or source scripts) from folder R 
# (for a clean master file)
# R.utils::sourceDirectory("R/")

# make data

apples <- data.frame(apple_id = as.factor(1:1000),
                     weight = rnorm(10000, 5, 1))
write.csv(apples, "data/apples_data.csv", row.names = FALSE)

# read data
apples <- read.csv("data/apples_data.csv")

# process data
apples$log_weight <- log(apples$weight)

head(apples)

# graphing

# set up default as .png
png('figs/hist_apple_weight.png')

# plot
library(ggplot2)

ggplot(apples, aes(weight)) + geom_histogram()

# return to previous default
dev.off()

# if I have a Rmarkdown file I can embed it
