library(tidyr)
library(readr)

yc <- read_csv("./data/yelp_academic_dataset_checkin.csv")

dim(yc)
str(yc)
head(yc)
names(yc)

## Step 0: Remove unnecessary columns, NAs

yc <- yc[,!(names(yc) %in% c("business_id","type"))]

yc[is.na(yc)] <- 0

str(yc)

## Step 1: Gather the data

yc_gathered <- yc %>%
                    gather(variable, value)

str(yc_gathered)
dim(yc_gathered)

head(yc_gathered)

## Step 2: separate day - hour

yc_gathered <- yc_gathered %>%
                    separate(variable, 
                             c("x","hour-day"), 
                             sep = "\\.")


head(yc_gathered)

yc_gathered <- yc_gathered %>%
                        separate("hour-day", 
                                 c("hour","day"), 
                                 sep = "\\-")

head(yc_gathered)


## Step 3: drop unnecessary column

yc_gathered <- yc_gathered[,-1]

head(yc_gathered)

library(dplyr)
yc_gathered <- yc_gathered %>% 
                    group_by(hour, day) %>% 
                    summarize(value = sum(value))

## Step 4: Create day - hour 2D structure
yc_output <- yc_gathered %>% 
                spread(day, value)

yc_output
